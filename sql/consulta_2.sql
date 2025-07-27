-- Plataforma com maior engajamento (total de interações like, share, comment)

SELECT 
    p.nome_plataforma,
    COUNT(*) AS total_engajamento
FROM interacao i
JOIN tipointeracao t ON i.id_tipo_interacao = t.id_tipo_interacao
JOIN plataforma p ON i.id_plataforma = p.id_plataforma
WHERE t.nome_tipo_interacao IN ('like', 'share', 'comment')
GROUP BY p.nome_plataforma
ORDER BY total_engajamento DESC
LIMIT 1;
