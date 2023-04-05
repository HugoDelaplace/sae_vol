// Création des noeuds AEROPORT
CREATE (:AEROPORT {codeAero: 1, nomAero: 'Charles de Gaulle', villeAero: 'Paris', paysAero: 'France'});
CREATE (:AEROPORT {codeAero: 3, nomAero: 'Aéroport de Montréal', villeAero: 'Montréal', paysAero: 'Canada'});
CREATE (:AEROPORT {codeAero: 4, nomAero: 'Aéroport de Québec', villeAero: 'Québec', paysAero: 'Canada'});
CREATE (:AEROPORT {codeAero: 5, nomAero: 'Aéroport d’Alger', villeAero: 'Alger', paysAero: 'Algérie'});
CREATE (:AEROPORT {codeAero: 6, nomAero: 'Aéroport de Tamanrasset', villeAero: 'Tamanrasset', paysAero: 'Algérie'});

// Création des noeuds COMPAGNIE
CREATE (:COMPAGNIE {idComp: 1, siegeComp: 'Air France', caComp: 1000, fidelite: 'Oui'});
CREATE (:COMPAGNIE {idComp: 2, siegeComp: 'Air Canada', caComp: 2000, fidelite: 'Oui'});
CREATE (:COMPAGNIE {idComp: 3, siegeComp: 'Air Algérie', caComp: 3000, fidelite: 'Oui'});

// Création des noeuds EQUIPAGE
CREATE (:EQUIPAGE {nomE: 'Jean', fonctionE: 'Pilote'});
CREATE (:EQUIPAGE {nomE: 'Pierre', fonctionE: 'Copilote'});

// Création des noeuds INDICE_QUALITE
CREATE (:INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 5.0, poidsIndice: 1.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 1.0, poidsIndice: 1.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 3.0, poidsIndice: 2.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 5.0, poidsIndice: 4.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 2.0, poidsIndice: 1.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 5.0, poidsIndice: 1.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 4.0, poidsIndice: 2.0});
CREATE (:INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 4.0, poidsIndice: 3.0});

// Création des noeuds VOL
CREATE (:VOL {idVol: 1, idComp: 1, dateHeureVol: '2019-01-01T10:00:00', codeAeroDep: 1, codeAeroArr: 5, terminalArr: 'A', terminalDep: 'B', dateHeureArr: '2019-01-01T12:00:00', equipage: EQUIPAGE {nomE: 'Jean', fonctionE: 'Pilote'}}, INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 5.0, poidsIndice: 1.0}, INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 1.0, poidsIndice: 1.0});
CREATE (:VOL {idVol: 2, idComp: 1, dateHeureVol: '2019-01-01T10:00:00', codeAeroDep: 1, codeAeroArr: 6, terminalArr: 'A', terminalDep: 'B', dateHeureArr: '2019-01-01T12:00:00', equipage: EQUIPAGE {nomE: 'Pierre', fonctionE: 'Copilote'}}, INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 3.0, poidsIndice: 2.0}, INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 5.0, poidsIndice: 4.0});
CREATE (:VOL {idVol: 3, idComp: 2, dateHeureVol: '2019-01-01T10:00:00', codeAeroDep: 3, codeAeroArr: 4, terminalArr: 'A', terminalDep: 'B', dateHeureArr: '2019-01-01T12:00:00', equipage: EQUIPAGE {nomE: 'Jean', fonctionE: 'Pilote'}}, INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 2.0, poidsIndice: 1.0}, INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 5.0, poidsIndice: 1.0});
CREATE (:VOL {idVol: 4, idComp: 2, dateHeureVol: '2019-01-01T10:00:00', codeAeroDep: 3, codeAeroArr: 5, terminalArr: 'A', terminalDep: 'B', dateHeureArr: '2019-01-01T12:00:00', equipage: EQUIPAGE {nomE: 'Pierre', fonctionE: 'Copilote'}}, INDICE_QUALITE {nomIndice: 'Sièges', valeurIndice: 4.0, poidsIndice: 2.0}, INDICE_QUALITE {nomIndice: 'Climatisation', valeurIndice: 4.0, poidsIndice: 3.0});
