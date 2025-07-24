# ARQUIVO PARA ARMAZENAR A FUNÇÃO DE CONEXÃO COM O MYSQL
# Importação de módulos
import os
from dotenv import load_dotenv
import mysql.connector

# Carrega variáveis do .env
load_dotenv()

def conectar_mysql():
    """
    Cria e retorna uma conexão MySQL usando variáveis de ambiente.
    
    Returns:
        conexao (mysql.connector.connection_cext.CMySQLConnection): conexão ativa com o banco.
        cursor (mysql.connector.cursor_cext.CMySQLCursor): cursor para executar comandos SQL.
    """
    config = {
        'host': os.getenv('DB_HOST', 'localhost'),
        'user': os.getenv('DB_USER', 'root'),
        'password': os.getenv('DB_PASSWORD', ''),
        'database': os.getenv('DB_NAME', 'globotech')
    }

    conexao = mysql.connector.connect(**config)
    cursor = conexao.cursor()
    return conexao, cursor
