drop table VOL;
drop table COMPAGNIE;
drop table AEROPORT;

create table VOL(
    idVol int,
    idComp int,
    dateHeureVol date,
    codeAeroDep int,
    codeAeroArr int,
    terminalArr varchar(10),
    terminalDep varchar(10),
    dateHeureArr date
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

alter SESSION set NLS_DATE_FORMAT = 'yyyy/dd/mm HH24:MI:SS'

insert into COMPAGNIE values (1,'Air France',1000,'Oui');
insert into COMPAGNIE values (2,'Air Canada',2000,'Oui');
insert into COMPAGNIE values (3,'Air Algérie',3000,'Oui');

insert into AEROPORT values (1,'Charles de Gaulle','Paris','France');
insert into AEROPORT values (2,'Orly','Paris','France');
insert into AEROPORT values (3,'Aéroport de Montréal','Montréal','Canada');
insert into AEROPORT values (4,'Aéroport de Québec','Québec','Canada');
insert into AEROPORT values (5,'Aéroport d’Alger','Alger','Algérie');
insert into AEROPORT values (6,'Aéroport de Tamanrasset','Tamanrasset','Algérie');

insert into VOL values (1,1,to_date('2019-01-01 10:00:00', 'yyyy/mm/dd hh24:mi:ss'),1,5,'A','B',to_date('2019-01-01 11:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (2,3,to_date('2019-01-01 11:10:00', 'yyyy/mm/dd hh24:mi:ss'),5,6,'B','A',to_date('2019-01-01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (3,3,to_date('2019-01-01 10:00:00', 'yyyy/mm/dd hh24:mi:ss'),5,6,'A','B',to_date('2019-01-01 11:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (4,2,to_date('2019-01-01 13:00:00', 'yyyy/mm/dd hh24:mi:ss'),3,1,'B','A',to_date('2019-01-01 14:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (5,1,to_date('2019-01-01 14:00:00', 'yyyy/mm/dd hh24:mi:ss'),1,4,'A','B',to_date('2019-01-01 15:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (6,2,to_date('2019-01-01 15:00:00', 'yyyy/mm/dd hh24:mi:ss'),4,1,'B','A',to_date('2019-01-01 16:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (7,1,to_date('2019-01-01 16:00:00', 'yyyy/mm/dd hh24:mi:ss'),1,6,'A','B',to_date('2019-01-01 17:00:00', 'yyyy/mm/dd hh24:mi:ss'));
insert into VOL values (8,3,to_date('2019-01-01 11:00:00', 'yyyy/mm/dd hh24:mi:ss'),6,5,'B','A',to_date('2019-01-01 12:00:00', 'yyyy/mm/dd hh24:mi:ss'));
