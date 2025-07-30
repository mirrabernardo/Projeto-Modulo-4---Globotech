# APLICAÇÃO PARA RETORNAR AS CONSULTAS EM SQL SOLICITADAS NO PROJETO
from conexao_bd import conectar_mysql #importa a função do conexao_bd.py

conexao, cursor = conectar_mysql() # conecta ao banco

# Arquivos com consultas SQL a serem realizadas
arquivos_sql = [
    'sql/consulta_1.sql',
    'sql/consulta_2.sql',
    'sql/consulta_3.sql'
]

# For para executar cada arquivo de consulta SQL
for arquivo in arquivos_sql:
    with open(arquivo, 'r', encoding='utf-8') as f:
        sql = f.read()

    cursor.execute(sql)
    resultados = cursor.fetchall()

    colunas = [desc[0] for desc in cursor.description] if cursor.description else []

    print(f'\n--- Resultado de {arquivo} ---')
    print(f'{colunas}')
    for linha in resultados: # retorno de resultado (cada linha da consulta)
        print(linha)

# Fechar conexão
cursor.close()
conexao.close()
