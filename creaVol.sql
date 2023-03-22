drop table VOL;
drop table COMPAGNIE;
drop table AEROPORT;

create table VOL(
    idVol int,
    idComp int,
    dateVol date,
    codeAeroDep int,
    codeAeroArr int,
    terminalArr varchar(10),
    terminalDep varchar(10),
    dateArr date
);

create table COMPAGNIE(
    idComp int,
    siegeComp varchar(50),
    caComp int,
    fidelite varchar(50)
);

create table AEROPORT(
    codeAero int,
    nomAero varchar(50),
    villeAero varchar(50),
    paysAero varchar(50)
);



alter table VOL add constraint PK_VOL primary key (idVol,dateVol);
alter table COMPAGNIE add constraint PK_COMPAGNIE primary key (idComp);
alter table AEROPORT add constraint PK_AEROPORT primary key (codeAero);

alter table VOL add constraint FK_VOL_COMPAGNIE foreign key (idComp) references COMPAGNIE(idComp);
alter table VOL add constraint FK_VOL_AEROPORT foreign key (codeAeroDep) references AEROPORT(codeAero);
alter table VOL add constraint FK_VOL_AEROPORT2 foreign key (codeAeroArr) references AEROPORT(codeAero);

insert into COMPAGNIE values (1,'Air France',1000,'Oui');
insert into COMPAGNIE values (2,'Air Canada',2000,'Oui');
insert into COMPAGNIE values (3,'Air Algérie',3000,'Oui');

insert into AEROPORT values (1,'Charles de Gaulle','Paris','France');
insert into AEROPORT values (2,'Orly','Paris','France');
insert into AEROPORT values (3,'Aéroport de Montréal','Montréal','Canada');
insert into AEROPORT values (4,'Aéroport de Québec','Québec','Canada');
insert into AEROPORT values (5,'Aéroport d’Alger','Alger','Algérie');
insert into AEROPORT values (6,'Aéroport de Tamanrasset','Tamanrasset','Algérie');

insert into VOL values (1,1, date '2018-01-01',1,5,'A','B', date '2018-01-01');
insert into VOL values (2,1, date '2018-01-02',1,3,'A','B', date '2018-01-02');
insert into VOL values (3,1, date '2018-01-03',1,4,'A','B', date '2018-01-03');
insert into VOL values (4,1, date '2018-01-04',2,2,'A','B', date '2018-01-04');
insert into VOL values (5,1, date '2018-01-05',3,2,'A','B', date '2018-01-05');
insert into VOL values (6,1, date '2018-01-06',3,4,'A','B', date '2018-01-06');
insert into VOL values (7,1, date '2018-01-07',6,5,'A','B', date '2018-01-07');
insert into VOL values (8,1, date '2018-01-08',5,6,'A','B', date '2018-01-08');
insert into VOL values (9,1, date '2018-01-09',1,6,'A','B', date '2018-01-09');
