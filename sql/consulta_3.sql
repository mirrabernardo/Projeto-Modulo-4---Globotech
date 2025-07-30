-- Conteúdos mais comentados

SELECT 
    c.nome_conteudo,
    COUNT(*) AS total_comentarios
FROM
    interacao i
JOIN 
    tipointeracao t ON i.id_tipo_interacao = t.id_tipo_interacao
JOIN
    conteudo c ON i.id_conteudo = c.id_conteudo
WHERE 
    t.nome_tipo_interacao = 'comment'
GROUP BY 
    c.nome_conteudo
ORDER BY 
    total_comentarios DESC
