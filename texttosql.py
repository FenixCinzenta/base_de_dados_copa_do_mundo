import warnings
warnings.filterwarnings("ignore")

from langchain_community.llms import Ollama
from langchain_community.utilities import SQLDatabase
from langchain_core.prompts import PromptTemplate, FewShotPromptTemplate, ChatPromptTemplate
from langchain_community.tools.sql_database.tool import QuerySQLDataBaseTool
import langchain
from langchain_core.output_parsers import StrOutputParser, JsonOutputParser
from langchain_community.embeddings import OllamaEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_core.example_selectors import SemanticSimilarityExampleSelector
from langchain_core.messages import AIMessage
from langchain_core.runnables import RunnablePassthrough
from pprint import pprint
import psutil
from enum import IntEnum
import psycopg2
import getpass
import os
import requests
import json
from dotenv import load_dotenv
# from langchain_community.chat_models import ChatOllama  # deprecated
import re

# referencia: https://github.com/M-Nkirote/Simple-Text-to-SQL-Solution/blob/main/src/text_to_sql/main.py

def format_as_table(columns, rows):
    if not columns or not rows:
        return ""
    
    # Convert all cells to string and compute column widths
    str_rows = [[str(cell) for cell in row] for row in rows]
    col_widths = [len(col) for col in columns]
    for row in str_rows:
        for i, cell in enumerate(row):
            col_widths[i] = max(col_widths[i], len(cell))
    
    # Create separator line
    sep = "+" + "+".join("-" * (w + 2) for w in col_widths) + "+"
    
    # Create header line
    header = "|" + "|".join(f" {columns[i].center(col_widths[i])} " for i in range(len(columns))) + "|"
    
    # Create row lines
    row_lines = []
    for row in str_rows:
        row_line = "|" + "|".join(f" {row[i].ljust(col_widths[i])} " for i in range(len(row))) + "|"
        row_lines.append(row_line)
    
    # Combine everything
    table = "\n".join([sep, header, sep] + row_lines + [sep])
    return table

def connect_to_db():

    # ler parametros do teclado para logar na base de dados
    host = input("Host da base de dados (default: localhost): ") or "localhost"
    db_name = input("Nome da base de dados (default: album_copa): ") or "album_copa"
    user = input("Usuario (default: postgres): ") or "postgres"

    password = getpass.getpass("Senha: ")

    try:
        # tentativa de conexao com as credenciais fornecidas
        connection = psycopg2.connect(
            host = host,
            database = db_name,
            user = user,
            password = password
        )

        db_uri = f"postgresql+psycopg2://{user}:{password}@{host}:5432/{db_name}"
        db = SQLDatabase.from_uri(db_uri)

        if connection.closed == 0:
            print("\nConexao bem-sucedida a base de dados!")

            # inicializar llm para consultas em linguagem natural (qwen2.5-coder:1.5b)
            llm = Ollama(model="qwen2.5-coder:1.5b", num_thread=(psutil.cpu_count() - 1), keep_alive=-1, temperature=0, num_ctx=4098)

            def get_schema(_):
                return db.get_table_info()

            def run_query(query):
                # print("\n ************ executando query ****: ", query, "******")
                try:
                    res = db.run(query)
                    if not res:
                        return "A consulta foi executada, mas nao retornou resultado."
                    
                    try:
                        cursor = connection.cursor()
                        cursor.execute(query)
                        if cursor.description:
                            columns = [desc[0] for desc in cursor.description]
                            rows = cursor.fetchall()
                            cursor.close()
                            
                            table = format_as_table(columns, rows)
                            if table:
                                return f"{res}\n\nVisualização Estruturada:\n{table}"
                        else:
                            cursor.close()
                    except Exception:
                        pass
                    
                    return res
                except Exception as e:
                    return f"[Erro de sql: {str(e)}]"

            def exibir_menu():
                print("Sistema de consultas - Copa do Mundo FIFA")
                print("Consultas pre-definidas:")
                print("1.  Listar todas as edicoes da Copa do Mundo")
                print("2.  Listar selecoes participantes de uma edicao")
                print("3.  Listar grupos e selecoes de uma edicao")
                print("4.  Exibir tabela de classificacao de um grupo")
                print("5.  Listar todas as partidas de uma edicao")
                print("6.  Exibir caminho do mata-mata de uma edicao")
                print("7.  Listar elenco convocado de uma selecao")
                print("8.  Listar eventos de uma partida")
                print("9.  Consultar artilheiros de uma edicao")
                print("10. Consultar historico de uma selecao")
                print("\nConsulta personalizada:")
                print("11. Consulta em linguagem natural (via ia)")
                print("\n0.  Sair")

            def executar_consulta_1():
                # 1. listar todas as edicoes da copa do mundo, com ano, pais-sede e campeao
                query = """
                SELECT
                  ec.ano,
                  STRING_AGG(DISTINCT p.nome, ', ' ORDER BY p.nome) AS paises_sede,
                  s_campeao.nome AS campeao,
                  s_vice.nome AS vice,
                  s_terceiro.nome AS terceiro
                FROM EdicoesCopa ec
                LEFT JOIN SedesEdicao se ON se.id_edicao = ec.id
                LEFT JOIN Paises p ON p.id = se.id_pais
                LEFT JOIN Selecoes s_campeao ON s_campeao.id = ec.id_selecao_campea
                LEFT JOIN Selecoes s_vice ON s_vice.id = ec.id_selecao_vice
                LEFT JOIN Selecoes s_terceiro ON s_terceiro.id = ec.id_selecao_terceiro
                GROUP BY ec.ano, s_campeao.nome, s_vice.nome, s_terceiro.nome
                ORDER BY ec.ano
                """
                resultado = run_query(query)
                print("\n--- Edicoes da Copa do Mundo ---")
                print(resultado)

            def executar_consulta_2():
                # 2. listar as selecoes participantes de uma dada edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT DISTINCT s.nome
                FROM Selecoes s
                JOIN Partidas p ON p.id_selecao_a = s.id OR p.id_selecao_b = s.id
                JOIN EdicoesCopa ec ON ec.id = p.id_edicao
                WHERE ec.ano = {ano}
                ORDER BY s.nome
                """
                resultado = run_query(query)
                print(f"\n--- Selecoes participantes da Copa {ano} ---")
                print(resultado)

            def executar_consulta_3():
                # 3. listar os grupos de uma edicao e as selecoes de cada grupo
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT g.letra AS grupo, s.nome AS selecao
                FROM Grupos g
                JOIN ParticipacaoGrupo pg ON pg.id_grupo = g.id
                JOIN Selecoes s ON s.id = pg.id_selecao
                JOIN EdicoesCopa ec ON ec.id = g.id_edicao
                WHERE ec.ano = {ano}
                ORDER BY g.letra, s.nome
                """
                resultado = run_query(query)
                print(f"\n--- Grupos da Copa {ano} ---")
                print(resultado)

            def executar_consulta_4():
                # 4. exibir a tabela de classificacao de um grupo
                ano = input("\nDigite o ano da edicao: ")
                grupo = input("Digite a letra do grupo: ").upper()
                query = f"""
                SELECT s.nome,
                       pg.pontos,
                       pg.jogos,
                       pg.vitorias,
                       pg.empates,
                       pg.derrotas,
                       pg.gols_pro,
                       pg.gols_contra,
                       pg.saldo_gols
                FROM ParticipacaoGrupo pg
                JOIN Grupos g ON g.id = pg.id_grupo
                JOIN Selecoes s ON s.id = pg.id_selecao
                JOIN EdicoesCopa ec ON ec.id = g.id_edicao
                WHERE ec.ano = {ano} AND g.letra = '{grupo}'
                ORDER BY pg.pontos DESC, pg.saldo_gols DESC, pg.gols_pro DESC
                """
                resultado = run_query(query)
                print(f"\n--- Classificacao do grupo {grupo} - Copa {ano} ---")
                print(resultado)

            def executar_consulta_5():
                # 5. listar todas as partidas de uma edicao, com fase, data, estadio e placar
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT f.nome AS fase,
                       p.data_hora,
                       e.nome AS estadio,
                       c.nome AS cidade,
                       sa.nome AS selecao_a,
                       p.gols_a,
                       sb.nome AS selecao_b,
                       p.gols_b
                FROM Partidas p
                JOIN Fases f ON f.id = p.id_fase
                JOIN Estadios e ON e.id = p.id_estadio
                JOIN CidadesSede c ON c.id = e.id_cidade
                JOIN Selecoes sa ON sa.id = p.id_selecao_a
                JOIN Selecoes sb ON sb.id = p.id_selecao_b
                JOIN EdicoesCopa ec ON ec.id = p.id_edicao
                WHERE ec.ano = {ano}
                ORDER BY p.data_hora
                """
                resultado = run_query(query)
                print(f"\n--- Partidas da Copa {ano} ---")
                print(resultado)

            def executar_consulta_6():
                # 6. exibir o caminho do mata-mata de uma edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT f.nome AS fase,
                       sa.nome AS selecao_a,
                       p.gols_a,
                       sb.nome AS selecao_b,
                       p.gols_b,
                       sv.nome AS classificado
                FROM Partidas p
                JOIN Fases f ON f.id = p.id_fase
                JOIN Selecoes sa ON sa.id = p.id_selecao_a
                JOIN Selecoes sb ON sb.id = p.id_selecao_b
                LEFT JOIN Selecoes sv ON sv.id = p.id_selecao_vencedora
                JOIN EdicoesCopa ec ON ec.id = p.id_edicao
                WHERE ec.ano = {ano}
                  AND f.eliminatoria = TRUE
                ORDER BY f.ordem, p.data_hora
                """
                resultado = run_query(query)
                print(f"\n--- Mata-mata da Copa {ano} ---")
                print(resultado)

            def executar_consulta_7():
                # 7. listar o elenco convocado de uma selecao em uma dada edicao
                ano = input("\nDigite o ano da edicao: ")
                selecao = input("Digite o nome da selecao: ")
                query = f"""
                SELECT j.nome,
                       j.posicao,
                       c.numero_camisa
                FROM Jogadores j
                JOIN Convocacoes c ON c.id_jogador = j.id
                JOIN Selecoes s ON s.id = c.id_selecao
                JOIN EdicoesCopa ec ON ec.id = c.id_edicao
                WHERE ec.ano = {ano} AND unaccent(s.nome) ILIKE unaccent('{selecao}')
                ORDER BY c.numero_camisa
                """
                resultado = run_query(query)
                print(f"\n--- Elenco de {selecao} - Copa {ano} ---")
                print(resultado)

            def executar_consulta_8():
                # 8. listar os eventos de uma partida
                print("\nInforme os dados da partida:")
                ano = input("Ano da edicao: ")
                selecao1 = input("Primeira selecao: ")
                selecao2 = input("Segunda selecao: ")
                query = f"""
                SELECT ev.minuto,
                       ev.tipo,
                       j.nome AS jogador
                FROM EventosJogo ev
                LEFT JOIN Jogadores j ON j.id = ev.id_jogador
                JOIN Partidas p ON p.id = ev.id_partida
                JOIN Selecoes sa ON sa.id = p.id_selecao_a
                JOIN Selecoes sb ON sb.id = p.id_selecao_b
                JOIN EdicoesCopa ec ON ec.id = p.id_edicao
                WHERE ec.ano = {ano}
                  AND (
                    (unaccent(sa.nome) ILIKE unaccent('{selecao1}') AND unaccent(sb.nome) ILIKE unaccent('{selecao2}'))
                    OR
                    (unaccent(sa.nome) ILIKE unaccent('{selecao2}') AND unaccent(sb.nome) ILIKE unaccent('{selecao1}'))
                  )
                ORDER BY ev.minuto
                """
                resultado = run_query(query)
                print(f"\n--- Eventos da partida {selecao1} x {selecao2} - Copa {ano} ---")
                print(resultado)

            def executar_consulta_9():
                # 9. consultar artilheiros de uma edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT j.nome AS jogador,
                       s.nome AS selecao,
                       COUNT(*) AS total_gols
                FROM EventosJogo ev
                JOIN Jogadores j ON j.id = ev.id_jogador
                JOIN Partidas p ON p.id = ev.id_partida
                JOIN EdicoesCopa ec ON ec.id = p.id_edicao
                JOIN Convocacoes c ON c.id_jogador = j.id AND c.id_edicao = ec.id
                JOIN Selecoes s ON s.id = c.id_selecao
                WHERE ev.tipo IN ('gol', 'penalti_convertido') AND ec.ano = {ano}
                GROUP BY j.nome, s.nome
                ORDER BY total_gols DESC, j.nome
                """
                resultado = run_query(query)
                print(f"\n--- Artilheiros da Copa {ano} ---")
                print(resultado)

            def executar_consulta_10():
                # 10. consultar historico de uma selecao
                selecao = input("\nDigite o nome da selecao: ")
                query = f"""
                SELECT ec.ano,
                       CASE
                         WHEN ec.id_selecao_campea = s.id THEN '1o - campeao'
                         WHEN ec.id_selecao_vice = s.id THEN '2o - vice'
                         WHEN ec.id_selecao_terceiro = s.id THEN '3o lugar'
                         ELSE 'participacao'
                       END AS posicao_final,
                       COUNT(CASE WHEN (p.id_selecao_a = s.id OR p.id_selecao_b = s.id) AND p.status = 'encerrada' THEN 1 END) AS jogos,
                       COUNT(CASE WHEN ((p.id_selecao_a = s.id AND p.gols_a > p.gols_b)
                                    OR (p.id_selecao_b = s.id AND p.gols_b > p.gols_a)) AND p.status = 'encerrada'
                                  THEN 1 END) AS vitorias,
                       COUNT(CASE WHEN p.gols_a = p.gols_b AND p.status = 'encerrada' THEN 1 END) AS empates,
                       COUNT(CASE WHEN ((p.id_selecao_a = s.id AND p.gols_a < p.gols_b)
                                    OR (p.id_selecao_b = s.id AND p.gols_b < p.gols_a)) AND p.status = 'encerrada'
                                  THEN 1 END) AS derrotas
                FROM Selecoes s
                JOIN ParticipacaoGrupo pg ON pg.id_selecao = s.id
                JOIN Grupos g ON g.id = pg.id_grupo
                JOIN EdicoesCopa ec ON ec.id = g.id_edicao
                LEFT JOIN Partidas p ON (p.id_selecao_a = s.id OR p.id_selecao_b = s.id)
                  AND p.id_edicao = ec.id
                WHERE unaccent(s.nome) ILIKE unaccent('{selecao}')
                GROUP BY ec.ano, ec.id_selecao_campea, ec.id_selecao_vice, ec.id_selecao_terceiro, s.id
                ORDER BY ec.ano DESC
                """
                resultado = run_query(query)
                print(f"\n--- Historico de {selecao} ---")
                print(resultado)

            def executar_consulta_natural(user_question):
                # consulta em linguagem natural usando ia
                generate_sql_query_prompt_template = """
                Com base no esquema de tabelas abaixo, escreva a consulta SQL correspondente à pergunta do usuário.

                {schema}

                Diretrizes de SQL importantes:
                1. A seleção campeã de uma edição de copa está em `EdicoesCopa.id_selecao_campea`. Exemplo para obter o campeão de uma edição:
                   `SELECT s.nome FROM EdicoesCopa ec JOIN Selecoes s ON s.id = ec.id_selecao_campea WHERE ec.ano = 2018;`
                2. A seleção vice-campeã está em `EdicoesCopa.id_selecao_vice`. A terceira colocada está em `EdicoesCopa.id_selecao_terceiro`.
                3. NÃO existe a coluna `id_selecao` na tabela `EdicoesCopa` ou na tabela `Partidas`. A tabela `Partidas` relaciona-se com as seleções através das chaves estrangeiras `id_selecao_a` e `id_selecao_b`.
                4. Para lidar com acentuação e letras maiúsculas/minúsculas de forma robusta ao comparar nomes, utilize sempre a função `unaccent` e `ILIKE`. Exemplo: `unaccent(s.nome) ILIKE unaccent('Franca')`.

                Escreva APENAS o código SQL válido dentro de um bloco de código ```sql ... ```.

                Question: {question}

                SQL Query:
                """

                generate_sql_query_prompt = ChatPromptTemplate.from_template(generate_sql_query_prompt_template)

                sql_chain = (
                RunnablePassthrough.assign(schema=get_schema)
                | generate_sql_query_prompt
                | llm
                | StrOutputParser()
                )

                sql_chain_query = sql_chain.invoke({"question": user_question})

                # extrair o 'sql' da resposta do sql_chain
                match = re.search(r'```sql(.*?)```', sql_chain_query, re.DOTALL)

                # protecao no regex
                if match:
                    extracted_sql = match.group(1).strip()
                else:
                    extracted_sql = sql_chain_query.replace('```', '').strip()
                sql_response = run_query(extracted_sql)
                print("\nPergunta: ", user_question)
                print("\nSQL gerado: ", extracted_sql)
                print("\nResultado do Banco de Dados:")
                print(sql_response)

            # loop principal
            while True:
                exibir_menu()

                try:
                    opcao = input("\nEscolha uma opcao: ")

                    if opcao == '0' or opcao.lower() == 'sair':
                        print("\nEncerrando o sistema...")
                        break
                    elif opcao == '1':
                        executar_consulta_1()
                    elif opcao == '2':
                        executar_consulta_2()
                    elif opcao == '3':
                        executar_consulta_3()
                    elif opcao == '4':
                        executar_consulta_4()
                    elif opcao == '5':
                        executar_consulta_5()
                    elif opcao == '6':
                        executar_consulta_6()
                    elif opcao == '7':
                        executar_consulta_7()
                    elif opcao == '8':
                        executar_consulta_8()
                    elif opcao == '9':
                        executar_consulta_9()
                    elif opcao == '10':
                        executar_consulta_10()
                    elif opcao == '11':
                        user_question = input("\nFaca uma pergunta sobre a base de dados: ")
                        executar_consulta_natural(user_question)
                    else:
                        print("\nOpcao invalida! Escolha um numero entre 0 e 11.")

                    input("\nPressione enter para continuar...")

                except Exception as e:
                    print(f"\nErro ao executar consulta: {e}")
                    input("\nPressione enter para continuar...")

    except Exception as e:
        print(f"\nErro ao conectar a base de dados: {e}")

connect_to_db()