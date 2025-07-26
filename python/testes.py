# ARQUIVO DE TESTES
from conexao_bd import conectar_mysql #importa a função do conexao_bd.py
conexao, cursor = conectar_mysql() # conecta ao banco

# MODELO DE RETORNO (`NOME DA COLUNA`, `TIPO DE DADO`, `ACEITA NULO?`, `CHAVE`, `VALOR PADRÃO`, `INFORMAÇÕES EXTRAS`)
cursor.execute("""
                SELECT c.nome_conteudo,
                TIME_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(i.watch_duration))), '%H:%i:%s') AS tempo_consumo
                FROM interacao i
                JOIN conteudo c ON i.id_conteudo = c.id_conteudo
                GROUP BY c.nome_conteudo
                ORDER BY tempo_consumo DESC;
               """)
for linha in cursor.fetchall():
    print(linha)

