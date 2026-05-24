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
from dotenv import load_dotenv
from langchain_community.chat_models import ChatOllama
import re

# referencia: https://github.com/M-Nkirote/Simple-Text-to-SQL-Solution/blob/main/src/text_to_sql/main.py 

def connect_to_db():
    
    # ler parametros do teclado para logar na base de dados
    host = input("Host da base de dados (ex: localhost ou ip): ")
    db_name = input("Nome da base de dados: ")
    user = input("Usuario: ")
    
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
            
            # inicializar llm para consultas em linguagem natural
            # https://ollama.com/anindya/prem1b-sql-ollama-fp116: 1b de parametros
            llm = Ollama(model="anindya/prem1b-sql-ollama-fp116", num_thread=(psutil.cpu_count() - 1), keep_alive=-1, temperature=0, num_ctx=4098)

            def get_schema(_):
                return db.get_table_info()

            def run_query(query):
                # print("\n ************ executando query ****: ", query, "******")
                try:
                    res = db.run(query)
                    if not res:
                        return "A consulta foi executada, mas nao retornou resultado."
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
                SELECT ano, pais_sede, campeao 
                FROM edicoes_copa 
                ORDER BY ano
                """
                resultado = run_query(query)
                print("\n--- Edicoes da Copa do Mundo ---")
                print(resultado)
            
            def executar_consulta_2():
                # 2. listar as selecoes participantes de uma dada edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT s.nome 
                FROM selecoes s
                JOIN participacoes p ON s.id = p.selecao_id
                JOIN edicoes_copa e ON p.edicao_id = e.id
                WHERE e.ano = {ano}
                ORDER BY s.nome
                """
                resultado = run_query(query)
                print(f"\n--- Selecoes participantes da Copa {ano} ---")
                print(resultado)
            
            def executar_consulta_3():
                # 3. listar os grupos de uma edicao e as selecoes de cada grupo
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT g.letra as grupo, s.nome as selecao
                FROM grupos g
                JOIN selecoes_grupos sg ON g.id = sg.grupo_id
                JOIN selecoes s ON sg.selecao_id = s.id
                JOIN edicoes_copa e ON g.edicao_id = e.id
                WHERE e.ano = {ano}
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
                       c.pontos, 
                       c.vitorias, 
                       c.empates, 
                       c.derrotas,
                       c.gols_marcados,
                       c.gols_sofridos,
                       (c.gols_marcados - c.gols_sofridos) as saldo_gols
                FROM classificacao c
                JOIN selecoes s ON c.selecao_id = s.id
                JOIN grupos g ON c.grupo_id = g.id
                JOIN edicoes_copa e ON g.edicao_id = e.id
                WHERE e.ano = {ano} AND g.letra = '{grupo}'
                ORDER BY c.pontos DESC, (c.gols_marcados - c.gols_sofridos) DESC, c.gols_marcados DESC
                """
                resultado = run_query(query)
                print(f"\n--- Classificacao do grupo {grupo} - Copa {ano} ---")
                print(resultado)
            
            def executar_consulta_5():
                # 5. listar todas as partidas de uma edicao, com fase, data, estadio e placar
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT f.nome as fase,
                       p.data,
                       e.nome as estadio,
                       s1.nome as selecao1,
                       p.gols_selecao1,
                       s2.nome as selecao2,
                       p.gols_selecao2
                FROM partidas p
                JOIN fases f ON p.fase_id = f.id
                JOIN estadios e ON p.estadio_id = e.id
                JOIN selecoes s1 ON p.selecao1_id = s1.id
                JOIN selecoes s2 ON p.selecao2_id = s2.id
                JOIN edicoes_copa ec ON f.edicao_id = ec.id
                WHERE ec.ano = {ano}
                ORDER BY p.data
                """
                resultado = run_query(query)
                print(f"\n--- Partidas da Copa {ano} ---")
                print(resultado)
            
            def executar_consulta_6():
                # 6. exibir o caminho do mata-mata de uma edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT f.nome as fase,
                       s1.nome as selecao1,
                       p.gols_selecao1,
                       s2.nome as selecao2,
                       p.gols_selecao2,
                       sc.nome as classificado
                FROM partidas p
                JOIN fases f ON p.fase_id = f.id
                JOIN selecoes s1 ON p.selecao1_id = s1.id
                JOIN selecoes s2 ON p.selecao2_id = s2.id
                LEFT JOIN selecoes sc ON p.classificado_id = sc.id
                JOIN edicoes_copa e ON f.edicao_id = e.id
                WHERE e.ano = {ano} 
                  AND f.nome IN ('oitavas de final', 'quartas de final', 'semifinal', 'final', 'disputa de terceiro')
                ORDER BY 
                  CASE f.nome
                    WHEN 'oitavas de final' THEN 1
                    WHEN 'quartas de final' THEN 2
                    WHEN 'semifinal' THEN 3
                    WHEN 'disputa de terceiro' THEN 4
                    WHEN 'final' THEN 5
                  END,
                  p.data
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
                       j.numero_camisa
                FROM jogadores j
                JOIN convocacoes c ON j.id = c.jogador_id
                JOIN selecoes s ON c.selecao_id = s.id
                JOIN edicoes_copa e ON c.edicao_id = e.id
                WHERE e.ano = {ano} AND s.nome = '{selecao}'
                ORDER BY j.numero_camisa
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
                       j.nome as jogador
                FROM eventos_jogo ev
                LEFT JOIN jogadores j ON ev.jogador_id = j.id
                JOIN partidas p ON ev.partida_id = p.id
                JOIN selecoes s1 ON p.selecao1_id = s1.id
                JOIN selecoes s2 ON p.selecao2_id = s2.id
                JOIN fases f ON p.fase_id = f.id
                JOIN edicoes_copa e ON f.edicao_id = e.id
                WHERE e.ano = {ano} 
                  AND s1.nome = '{selecao1}' 
                  AND s2.nome = '{selecao2}'
                ORDER BY ev.minuto
                """
                resultado = run_query(query)
                print(f"\n--- Eventos da partida {selecao1} x {selecao2} - Copa {ano} ---")
                print(resultado)
            
            def executar_consulta_9():
                # 9. consultar artilheiros de uma edicao
                ano = input("\nDigite o ano da edicao: ")
                query = f"""
                SELECT j.nome as jogador,
                       s.nome as selecao,
                       COUNT(*) as total_gols
                FROM eventos_jogo ev
                JOIN jogadores j ON ev.jogador_id = j.id
                JOIN partidas p ON ev.partida_id = p.id
                JOIN fases f ON p.fase_id = f.id
                JOIN edicoes_copa e ON f.edicao_id = e.id
                JOIN convocacoes c ON j.id = c.jogador_id AND e.id = c.edicao_id
                JOIN selecoes s ON c.selecao_id = s.id
                WHERE ev.tipo = 'gol' AND e.ano = {ano}
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
                SELECT e.ano,
                       CASE 
                         WHEN e.campeao = s.nome THEN '1o - campeao'
                         WHEN e.vice = s.nome THEN '2o - vice'
                         WHEN e.terceiro = s.nome THEN '3o lugar'
                         ELSE 'participacao'
                       END as posicao_final,
                       COUNT(CASE WHEN p.selecao1_id = s.id OR p.selecao2_id = s.id THEN 1 END) as jogos,
                       COUNT(CASE WHEN (p.selecao1_id = s.id AND p.gols_selecao1 > p.gols_selecao2) 
                                    OR (p.selecao2_id = s.id AND p.gols_selecao2 > p.gols_selecao1) 
                                  THEN 1 END) as vitorias,
                       COUNT(CASE WHEN p.gols_selecao1 = p.gols_selecao2 THEN 1 END) as empates,
                       COUNT(CASE WHEN (p.selecao1_id = s.id AND p.gols_selecao1 < p.gols_selecao2) 
                                    OR (p.selecao2_id = s.id AND p.gols_selecao2 < p.gols_selecao1) 
                                  THEN 1 END) as derrotas
                FROM selecoes s
                JOIN participacoes part ON s.id = part.selecao_id
                JOIN edicoes_copa e ON part.edicao_id = e.id
                LEFT JOIN partidas p ON (p.selecao1_id = s.id OR p.selecao2_id = s.id)
                  AND p.fase_id IN (SELECT id FROM fases WHERE edicao_id = e.id)
                WHERE s.nome = '{selecao}'
                GROUP BY e.ano, e.campeao, e.vice, e.terceiro, s.nome
                ORDER BY e.ano DESC
                """
                resultado = run_query(query)
                print(f"\n--- Historico de {selecao} ---")
                print(resultado)
            
            def executar_consulta_natural(user_question):
                # consulta em linguagem natural usando ia
                generate_sql_query_prompt_template = """ 
                
                Com base no esquema abaixo, escreva a consulta sql que responderia sua pergunta: 
                
                {schema}

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

                # gerar resposta usando o llm
                template = """
                Com base no esquema de tabelas abaixo, na pergunta, consulta sql, e resposta sql, escreva uma resposta em linguagem natural:
                {schema}

                Pergunta: {question}
                Consulta SQL: {query}
                Resposta SQL: {response}

                Nao inclua frases como "Aqui esta uma resposta em linguagem natural:" na resposta
                """

                prompt = ChatPromptTemplate.from_template(template)

                full_chain = (
                        RunnablePassthrough.assign(query=sql_chain).assign(
                            schema=get_schema,
                            response=lambda variables: run_query(extracted_sql)
                        )
                        | prompt
                        | llm
                )

                full_chain_answer = full_chain.invoke({"question": user_question})

                print("\nPergunta: ", user_question, "\n")
                print("Resposta: ", full_chain_answer)
                print("\nSQL executado: ", extracted_sql)
            
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