COMPAGNIE(idComp, siegeComp, caComp, fidelite)

AEROPORT(codeAero, nomAero, villeAero, paysAero)

VOL(idVol, idComp, dateHeureVol, codeAeroDep, codeAeroArr, terminalArr, terminalDep, dateHeureArr)

Vol(terminalDep, terminalArr, dateHeureArr) <- Vol(idVol, dateHeureVol),COMPAGNIE(idComp),AEROPORT(codeAero)


COMPAGNIE(1,'Air France',1000,'Oui')
COMPAGNIE(2,'Air Canada',2000,'Oui')
COMPAGNIE(3,'Air Algérie',3000,'Oui')

AEROPORT (1,'Charles de Gaulle','Paris','France')
AEROPORT (2,'Orly','Paris','France')
AEROPORT (3,'Aéroport de Montréal','Montréal','Canada')
AEROPORT (4,'Aéroport de Québec','Québec','Canada')
AEROPORT (5,'Aéroport d’Alger','Alger','Algérie')
AEROPORT (6,'Aéroport de Tamanrasset','Tamanrasset','Algérie')

VOL (1,1,'2019-01-01 10:00:00',1,5,'A','B','2019-01-01 11:00:00')
VOL (2,3,'2019-01-01 11:10:00',5,6,'B','A','2019-01-01 12:00:00')
VOL (3,3,'2019-01-01 10:00:00',5,6,'A','B','2019-01-01 11:00:00')
VOL (4,2,'2019-01-01 13:00:00',3,1,'B','A','2019-01-01 14:00:00')
VOL (5,1,'2019-01-01 14:00:00',1,4,'A','B','2019-01-01 15:00:00')
VOL (6,2,'2019-01-01 15:00:00',4,1,'B','A','2019-01-01 16:00:00')
VOL (7,1,'2019-01-01 16:00:00',1,6,'A','B','2019-01-01 17:00:00')
VOL (8,3,'2019-01-01 11:00:00',6,5,'B','A','2019-01-01 12:00:00')




-- 3.2

connecte(X, Y, dateHeureVol, dateHeureArr) <- vol(_, _, dateHeureVol, X, Y, _, _, dateHeureArr).
    
connecte(X, Z, dateHeureVol, dateHeureArr) <- vol(_, _, dateHeureVol, X, Y, _, _, dateHeureArr2), connecte(Y, Z, dateHeureArr2, dateHeureArr).

villeConnecte(X, Y, dateHeureVol, dateHeureArr) <- aeroprt(_, _, X, _), aeroprt(_, _, Y, _), connecte(X, Y, dateHeureVol, dateHeureArr).

villeConnecte(X, Z, dateHeureVol, dateHeureArr) <- aeroprt(_, _, X, _), aeroprt(_, _, Z, _), connecte(X, Y, dateHeureVol, dateHeureArr2), villeConnecte(Y, Z, dateHeureArr2, dateHeureArr).

res(Ville1, Ville2, dateHeureVol, dateHeureArr) <- villeConnecte(Ville1, Ville2, dateHeureVol, dateHeureArr).

-- 3.3

connexion(X, Y, dateHeureVol, dateHeureArr) <- vol(_, _, dateHeureVol, X, Y, _, _, dateHeureArr).

connexion(X, Z, dateHeureVol, dateHeureArr) <- vol(_, _, dateHeureVol, X, Y, _, _, dateHeureArr2), connexion(Y, Z, dateHeureArr2, dateHeureArr).

nbConnexion(X, Y, N) <- connexion(X, Y, _, _), N = 1.

nbConnexion(X, Z, N) <- connexion(X, Y, _, _), nbConnexion(Y, Z, M), N = M + 1.

connexionImpaire(X, Y, dateHeureVol, dateHeureArr) <- aeroprt(_, _, X, _), aeroprt(_, _, Y, _), nbConnexion(X, Y, N), N%2 = 1, connexion(X, Y, dateHeureVol, dateHeureArr).

res(Ville1, Ville2, dateHeureVol, dateHeureArr) <- connexionImpaire(City1, City2, dateHeureVol, dateHeureArr).
