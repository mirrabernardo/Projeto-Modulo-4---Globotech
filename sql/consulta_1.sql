-- Ranking de conteúdos mais consumidos (ordenados por tempo total de consumo)

SELECT c.nome_conteudo,
       TIME_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(i.watch_duration))), '%H:%i:%s') AS tempo_consumo
FROM interacao i
JOIN conteudo c ON i.id_conteudo = c.id_conteudo
GROUP BY c.nome_conteudo
ORDER BY tempo_consumo DESC;