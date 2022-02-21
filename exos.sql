-- comment faire pour récupérer un package et d'avoir 2 colonnes supplémentaires
-- avec le nom de l'expéditeur et le nom du destinataire

SELECT package.*, p1.name AS expediteur, p2.name AS destinataire FROM package 
JOIN place AS p1 ON package.sender_id = sender_id 
JOIN place AS p2 ON package.recipient_id = recipient_id
WHERE package.id = 1;

-- autre possibilité
SELECT *, (
    SELECT name AS expediteur FROM place WHERE package.sender_id = place_id
),
(
    SELECT name AS destinataire FROM place WHERE package.recipient_id = place_id 
) 
FROM package
WHERE id = 1;