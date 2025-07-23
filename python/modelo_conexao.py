import os
from dotenv import load_dotenv
import mysql.connector
import pandas as pd

# Carrega as variáveis do arquivo .env
load_dotenv()

# Configurações de conexão com o banco de dados MySQL
config = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'user': os.getenv('DB_USER', 'root'),
    'password': os.getenv('DB_PASSWORD', ''),
    'database': os.getenv('DB_NAME', '')
}

# Estabelecendo conexão
try:
    conexao = mysql.connector.connect(**config)
    print("Conexão com o banco de dados estabelecida com sucesso!")

except mysql.connector.Error as erro:
    print(f"Erro ao conectar ao banco de dados: {erro}")

finally:
    if 'conexao' in locals() and conexao.is_connected():
        conexao.close()
        print("Conexão encerrada.")
