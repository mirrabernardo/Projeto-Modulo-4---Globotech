# APLICAÇÃO PARA POPULAR O BANCO DE DADOS
import pandas as pd
from conexao_bd import conectar_mysql  # Função que retorna conexão e cursor MySQL

# Conecta ao banco
conexao, cursor = conectar_mysql()

# Carrega CSV
df = pd.read_csv('docs//interacoes_globo.csv')

# Função para inserir plataformas (nome único)
def inserir_plataformas():
    plataformas = df['plataforma'].unique()
    for p in plataformas:
        try:
            sql = "INSERT IGNORE INTO globotech.plataforma (nome_plataforma) VALUES (%s)"
            cursor.execute(sql, (p,))
        except Exception as e:
            print(f"Erro ao inserir plataforma {p}: {e}")

# Função para inserir tipos de interação (nome único)
def inserir_tipos_interacao():
    tipos = df['tipo_interacao'].unique()
    for t in tipos:
        try:
            sql = "INSERT IGNORE INTO globotech.tipointeracao (nome_tipo_interacao) VALUES (%s)"
            cursor.execute(sql, (t,))
        except Exception as e:
            print(f"Erro ao inserir tipo de interação {t}: {e}")

# Inserir conteúdos (id_conteudo e nome_conteudo)
def inserir_conteudos():
    conteudos_unicos = df[['id_conteudo', 'nome_conteudo']].drop_duplicates()
    for _, row in conteudos_unicos.iterrows():
        try:
            sql = """
            INSERT IGNORE INTO globotech.conteudo (id_conteudo, nome_conteudo) VALUES (%s, %s)
            """
            cursor.execute(sql, (int(row['id_conteudo']), row['nome_conteudo']))
        except Exception as e:
            print(f"Erro ao inserir conteúdo {row['nome_conteudo']}: {e}")

# Inserir usuários (id_usuario)
def inserir_usuarios():
    usuarios_unicos = df['id_usuario'].unique()
    for u in usuarios_unicos:
        try:
            sql = "INSERT IGNORE INTO globotech.usuario (id_usuario) VALUES (%s)"
            cursor.execute(sql, (int(u),))
        except Exception as e:
            print(f"Erro ao inserir usuário {u}: {e}")

# Criar mapas nome -> id para plataforma e tipo_interacao
def criar_mapas():
    cursor.execute("SELECT id_plataforma, nome_plataforma FROM globotech.plataforma")
    mapa_plataforma = {nome: id_ for id_, nome in cursor.fetchall()}

    cursor.execute("SELECT id_tipo_interacao, nome_tipo_interacao FROM globotech.tipointeracao")
    mapa_tipo = {nome: id_ for id_, nome in cursor.fetchall()}

    return mapa_plataforma, mapa_tipo

# Função para converter segundos para TIME MySQL (HH:MM:SS)
def segundos_para_time(segundos):
    if pd.isna(segundos):
        return None
    segundos = int(segundos)
    h = segundos // 3600
    m = (segundos % 3600) // 60
    s = segundos % 60
    return f"{h:02d}:{m:02d}:{s:02d}"

# Inserir interações
def inserir_interacoes(mapa_plataforma, mapa_tipo):
    for _, row in df.iterrows():
        try:
            watch_duration = segundos_para_time(row['watch_duration_seconds'])
            sql = """
            INSERT INTO globotech.interacao
            (timestamp_interacao, watch_duration, comment_text, id_tipo_interacao, id_usuario, id_conteudo, id_plataforma)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql, (
                row['timestamp_interacao'],
                watch_duration,
                row['comment_text'] if pd.notna(row['comment_text']) else None,
                mapa_tipo[row['tipo_interacao']],
                int(row['id_usuario']),
                int(row['id_conteudo']),
                mapa_plataforma[row['plataforma']]
            ))
        except Exception as e:
            print(f"Erro ao inserir interação: {e}")

# Execução
inserir_plataformas()
inserir_tipos_interacao()
inserir_conteudos()
inserir_usuarios()
conexao.commit()

mapa_plataforma, mapa_tipo = criar_mapas()
inserir_interacoes(mapa_plataforma, mapa_tipo)

conexao.commit()
cursor.close()
conexao.close()
