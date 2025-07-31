USE globotech;

-- Total de interações por conteúdo
CREATE VIEW interacao_por_conteudo AS
SELECT 
    c.nome_conteudo,
    COUNT(
        CASE WHEN i.id_tipo_interacao = 4 THEN 1 END) 
    AS curtidas,
    COUNT(
        CASE WHEN i.id_tipo_interacao = 2 THEN 1 END) 
    AS comentarios,
    COUNT(
        CASE WHEN i.id_tipo_interacao = 3 THEN 1 END) 
    AS compartilhamentos,
    COUNT(
        CASE WHEN i.id_tipo_interacao = 1 THEN 1 END) 
    AS visualizacoes
FROM 
    globotech.interacao i
JOIN 
    globotech.conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY 
    c.nome_conteudo;

-- Contagem por tipo de interação por conteúdo
CREATE VIEW total_interacoes_por_conteudo AS
SELECT 
    c.nome_conteudo,
    COUNT(*) 
    AS total_interacao
FROM 
    globotech.interacao i
JOIN 
    globotech.conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY 
    c.nome_conteudo;

-- Tempo total de consumo por conteúdo
CREATE VIEW consumo_por_conteudo AS
SELECT 
    c.nome_conteudo,
    TIME_FORMAT(
        SEC_TO_TIME(
            SUM(TIME_TO_SEC(i.watch_duration))), 
            '%H:%i:%s'
        ) AS tempo_consumo
FROM 
    interacao i
JOIN 
    conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY 
    c.nome_conteudo;

-- Média de tempo de consumo por conteúdo
CREATE VIEW media_tempo_consumo AS 
SELECT 
    c.nome_conteudo,
    TIME_FORMAT(
        SEC_TO_TIME(
            AVG(TIME_TO_SEC(i.watch_duration))
        ),
        '%H:%i:%s'
    ) AS media_tempo_consumo
FROM 
    interacao i
JOIN 
    conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY 
    c.nome_conteudo;

-- Listar comentários por conteúdo
CREATE VIEW comentarios_por_conteudo AS
SELECT 
    c.nome_conteudo,
    i.comment_text
FROM 
    interacao i
JOIN 
    conteudo c ON i.id_conteudo = c.id_conteudo
WHERE 
    i.id_tipo_interacao = 2
ORDER BY
	nome_conteudo;

-- Top-5 conteúdos por interações
CREATE VIEW top5_conteudos_por_interacao AS
SELECT 
    c.nome_conteudo,
    COUNT(*) AS total_interacoes
FROM 
    interacao i
JOIN 
    conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY 
    c.nome_conteudo
ORDER BY 
    total_interacoes DESC
LIMIT 5;

-- Ranking de conteúdos mais consumidos
CREATE VIEW conteudos_mais_consumidos AS
SELECT 
    c.nome_conteudo, 
    COUNT(id_interacao) AS qt_interacoes
FROM 
    conteudo c
JOIN 
    interacao i ON c.id_conteudo = i.id_conteudo
GROUP BY 
	c.nome_conteudo
ORDER BY
	qt_interacoes DESC;

-- Usuários por tempo total de consumo
CREATE VIEW tempo_por_usuario AS
SELECT 
    id_usuario,
    TIME_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(watch_duration))), '%H:%i:%s') AS tempo_consumo
FROM
    interacao
WHERE
    watch_duration IS NOT NULL
GROUP BY
    id_usuario
ORDER BY
    tempo_consumo DESC;

-- Plataformas por engajamento
CREATE VIEW engajamentos_por_plataforma AS
SELECT
	p.nome_plataforma,
    COUNT(i.id_tipo_interacao) as engajamentos
FROM
	interacao i
JOIN
	plataforma p ON p.id_plataforma = i.id_plataforma
WHERE 
	i.id_tipo_interacao != 1
GROUP BY 
	p.nome_plataforma
ORDER BY 
	engajamentos DESC;

-- Conteúdos mais comentados
CREATE VIEW conteudos_mais_comentados AS
SELECT
	c.nome_conteudo,
    COUNT(i.id_tipo_interacao) AS qt_comentarios
FROM
	interacao i
JOIN
	conteudo c ON i.id_conteudo = c.id_conteudo
WHERE
	i.comment_text IS NOT NULL 
GROUP BY 
	c.nome_conteudo
ORDER BY
	qt_comentarios DESC;

-- Tempo médio de consumo por plataforma
CREATE VIEW media_tempo_plataforma AS
SELECT 
    p.nome_plataforma,
    TIME_FORMAT(
        SEC_TO_TIME(
            AVG(TIME_TO_SEC(i.watch_duration))
        ),
        '%H:%i:%s'
    ) AS media_tempo_consumo
FROM 
    interacao i
JOIN 
    plataforma p ON i.id_plataforma = p.id_plataforma
GROUP BY 
    p.nome_plataforma;
