--Donner les villes que nous pouvons atteindre par vols directs qui partent de Paris

SELECT DISTINCT a.villeAero FROM VOL v JOIN AEROPORT a ON v.codeAeroArr = a.codeAero WHERE v.codeAeroDep IN 
    (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris');

--En considerant les horaires des vols, 
--veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant UNE correspondance. 
--L’objectif est de permettre aux passagers de realiser leur correspondance en prenant en compte la date et heure de départ et la date et heure d'arrivée.

SELECT DISTINCT a3.villeAero
FROM VOL v1
JOIN VOL v2 ON v1.codeAeroArr = v2.codeAeroDep AND v1.dateHeureArr < v2.dateHeureVol
JOIN AEROPORT a1 ON v1.codeAeroDep = a1.codeAero AND a1.villeAero = 'Paris'
JOIN AEROPORT a2 ON v1.codeAeroArr = a2.codeAero
JOIN AEROPORT a3 ON v2.codeAeroArr = a3.codeAero
WHERE v1.codeAeroDep != v2.codeAeroArr;


--En considerant les horaires des vols, veuillez fournir la liste des villes accessibles depuis Paris avec un vol comprenant DEUX correspondances
-- Il faut que la date du vol de correspondance soit superieure a la date du vol de depart


SELECT DISTINCT a3.villeAero
FROM VOL v1
INNER JOIN VOL v2 ON v1.codeAeroArr = v2.codeAeroDep AND v1.dateHeureArr < v2.dateHeureVol
INNER JOIN AEROPORT a2 ON v1.codeAeroArr = a2.codeAero
INNER JOIN AEROPORT a3 ON v2.codeAeroArr = a3.codeAero
WHERE v1.codeAeroDep = (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris');



-- Veuillez fournir la liste des villes accessibles depuis Paris, en tenant compte des
-- horaires de vol, avec des vols directs ou un nombre quelconque de correspondances

WITH vols_paris AS (
    SELECT DISTINCT a.villeAero, v.dateHeureVol
    FROM VOL v
    JOIN AEROPORT a ON v.codeAeroArr = a.codeAero
    WHERE v.codeAeroDep IN (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris')
    UNION
    SELECT DISTINCT a3.villeAero, v2.dateHeureVol
    FROM VOL v1
    JOIN VOL v2 ON v1.codeAeroArr = v2.codeAeroDep AND v1.dateHeureArr < v2.dateHeureVol
    JOIN AEROPORT a1 ON v1.codeAeroDep = a1.codeAero AND a1.villeAero = 'Paris'
    JOIN AEROPORT a2 ON v1.codeAeroArr = a2.codeAero
    JOIN AEROPORT a3 ON v2.codeAeroArr = a3.codeAero
    WHERE v1.codeAeroDep != v2.codeAeroArr
    UNION
    SELECT DISTINCT a3.villeAero, v2.dateHeureVol
    FROM VOL v1
    INNER JOIN VOL v2 ON v1.codeAeroArr = v2.codeAeroDep AND v1.dateHeureArr < v2.dateHeureVol
    INNER JOIN AEROPORT a2 ON v1.codeAeroArr = a2.codeAero
    INNER JOIN AEROPORT a3 ON v2.codeAeroArr = a3.codeAero
    WHERE v1.codeAeroDep = (SELECT codeAero FROM AEROPORT WHERE villeAero = 'Paris')
)
SELECT *
FROM vols_paris
ORDER BY dateHeureVol;


-- Pour chaque vol, donner le nombre de personnes de l’ ́equipage, par fonction

SELECT v.idVol, e.fonctionE, COUNT(*) as nombre
FROM VOL v, TABLE(v.equipage) e
GROUP BY v.idVol, e.fonctionE ORDER BY v.idVol;


-- Pour chaque pilote, indiquer combien des vols lui sont associes

SELECT e.nomE, COUNT(*) as nombre FROM VOL v, TABLE(v.equipage) e WHERE e.fonctionE = 'Pilote' GROUP BY e.nomE;

-- récupérer l'impact des indices de qualite de chaque vol

SELECT v.idVol, iq.nomIndice, iq.valeurIndice, iq.poidsIndice, iq.impact()
FROM VOL v, TABLE(v.indices_qualite) iq;

-- Pour chaque indice de qualit ́e, calculer son impact moyen

SELECT iq.nomIndice, AVG(iq.impact()) as impact_moyen
FROM VOL v, TABLE(v.indices_qualite) iq
GROUP BY iq.nomIndice;






