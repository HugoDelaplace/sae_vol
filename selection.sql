--Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris');

--En considerant les horaires des vols, 
--veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant UNE correspondance. 
--L’objectif est de permettre aux passagers de realiser leur correspondance en prenant en compte la date et l'heure de départ et la date et heure d'arrivée.

WITH villes_accessibles(codeAero, villeAero, niveau, dateHeureVol) AS (
  SELECT A.codeAero, A.villeAero, 0, NULL
  FROM AEROPORT A
  WHERE A.villeAero = 'Paris'
  UNION ALL
  SELECT V.codeAeroArr, A.villeAero, VA.niveau + 1, V.dateHeureVol
  FROM VOL V
  JOIN AEROPORT A ON V.codeAeroDep = A.codeAero
  JOIN villes_accessibles VA ON V.codeAeroArr = VA.codeAero
  AND VA.dateHeureVol - V.dateHeureVol > 0
)
SELECT DISTINCT villeAero, niveau, dateHeureVol
FROM villes_accessibles
WHERE villeAero != 'Paris'
ORDER BY villeAero;


select dateHeureVol from VOL;


--En considerant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant DEUX correspondances
-- Il faut que la date du vol de correspondance soit superieure a la date du vol de depart


WITH RECURSIVE villes_accessibles2(codeAero, villeAero, niveau, trajet) AS (
  SELECT A.codeAero, A.villeAero, 0, CAST(A.villeAero AS VARCHAR(100))
  FROM AEROPORT A
  WHERE A.villeAero = 'Paris'
  UNION ALL
  SELECT V.codeAeroArr, A.villeAero, VA.niveau + 1, CAST(VA.trajet || ' -> ' || A.villeAero AS VARCHAR(100))
  FROM VOL V
  JOIN AEROPORT A ON V.codeAeroDep = A.codeAero
  JOIN villes_accessibles2 VA ON V.codeAeroArr = VA.codeAero
  AND V.dateHeureVol > VA.dateHeureVol
)
SELECT DISTINCT trajet
FROM villes_accessibles2
WHERE villeAero != 'Paris'
AND niveau = 2
ORDER BY trajet;


-- Veuillez fournir la liste des villes accessibles depuis Paris, en tenant compte des
-- horaires de vol, avec des vols directs ou un nombre quelconque de correspondances

WITH RECURSIVE destinations AS (
  -- Sélectionner les destinations directes depuis Paris
  SELECT
    v.codeAeroArr,
    v.dateHeureArr
  FROM VOL v
  JOIN AEROPORT a ON v.codeAeroArr = a.codeAero
  WHERE v.codeAeroDep = (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris')
  AND v.dateHeureArr > SYSDATE
  UNION ALL
  -- Sélectionner les destinations avec une correspondance
  SELECT
    v.codeAeroArr,
    v.dateHeureArr
  FROM VOL v
  JOIN destinations d ON v.codeAeroDep = d.codeAeroArr
  JOIN AEROPORT a ON v.codeAeroArr = a.codeAero
  WHERE v.codeAeroDep != (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris')
  AND v.dateHeureArr > d.dateHeureArr
)
-- Sélectionner les villes des destinations accessibles
SELECT DISTINCT
  a.villeAero
FROM destinations d
JOIN AEROPORT a ON d.codeAeroArr = a.codeAero
WHERE a.villeAero != 'Paris';