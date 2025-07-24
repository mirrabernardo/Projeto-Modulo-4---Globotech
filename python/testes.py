# ARQUIVO DE TESTES
from conexao_bd import conectar_mysql #importa a função do conexao_bd.py
conexao, cursor = conectar_mysql() # conecta ao banco

# MODELO DE RETORNO (`NOME DA COLUNA`, `TIPO DE DADO`, `ACEITA NULO?`, `CHAVE`, `VALOR PADRÃO`, `INFORMAÇÕES EXTRAS`)
cursor.execute("""
               select * from globotech.tipointeracao
               """)
for linha in cursor.fetchall():
    print(linha)

