/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  12/20/2023 8:17:45 PM                    */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_INSCRIPT_PEUT_INSC_ETUDIANT') then
    alter table INSCRIPTIONMASTER
       delete foreign key FK_INSCRIPT_PEUT_INSC_ETUDIANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PEUT_AVO_PEUT_AVOI_ETUDIANT') then
    alter table PEUT_AVOIR
       delete foreign key FK_PEUT_AVO_PEUT_AVOI_ETUDIANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PEUT_AVO_PEUT_AVOI_CURSUSUN') then
    alter table PEUT_AVOIR
       delete foreign key FK_PEUT_AVO_PEUT_AVOI_CURSUSUN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PEUT_FAI_PEUT_FAIR_PARCOURS') then
    alter table PEUT_FAIRE
       delete foreign key FK_PEUT_FAI_PEUT_FAIR_PARCOURS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PEUT_FAI_PEUT_FAIR_ETUDIANT') then
    alter table PEUT_FAIRE
       delete foreign key FK_PEUT_FAI_PEUT_FAIR_ETUDIANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROMOTIO_APPARTIEN_ETUDIANT') then
    alter table PROMOTION
       delete foreign key FK_PROMOTIO_APPARTIEN_ETUDIANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SANCTION_SANCTIONN_DIPLOME') then
    alter table SANCTIONNER
       delete foreign key FK_SANCTION_SANCTIONN_DIPLOME
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SANCTION_SANCTIONN_ETUDIANT') then
    alter table SANCTIONNER
       delete foreign key FK_SANCTION_SANCTIONN_ETUDIANT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='CURSUSUNIV'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table CURSUSUNIV
end if;

if exists(
   select 1 from sys.systable 
   where table_name='DIPLOME'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table DIPLOME
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ETUDIANT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ETUDIANT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='INSCRIPTIONMASTER'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table INSCRIPTIONMASTER
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PARCOURSPROFESSIONNELS'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PARCOURSPROFESSIONNELS
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PEUT_AVOIR'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PEUT_AVOIR
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PEUT_FAIRE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PEUT_FAIRE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PROMOTION'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PROMOTION
end if;

if exists(
   select 1 from sys.systable 
   where table_name='SANCTIONNER'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table SANCTIONNER
end if;

/*==============================================================*/
/* Table : CURSUSUNIV                                           */
/*==============================================================*/
create table CURSUSUNIV 
(
   IDCURSUS             char(10)                       not null,
   NOMCURSUS            char(50)                       null,
   ETABLISSMT           char(100)                      null,
   constraint PK_CURSUSUNIV primary key (IDCURSUS)
);

/*==============================================================*/
/* Table : DIPLOME                                              */
/*==============================================================*/
create table DIPLOME 
(
   IDDIPLOME            char(50)                       not null,
   NOMDIPLOME           char(50)                       null,
   ETABLISSEMT          char(50)                       null,
   constraint PK_DIPLOME primary key (IDDIPLOME)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT 
(
   CODEPERM             char(20)                       not null,
   PRENOM               char(50)                       null,
   NOM                  char(50)                       null,
   DATENAISS            date                           null,
   ADRESSE              char(100)                      null,
   TEL                  char(100)                      null,
   EMAIL                char(200)                      null,
   constraint PK_ETUDIANT primary key (CODEPERM)
);

/*==============================================================*/
/* Table : INSCRIPTIONMASTER                                    */
/*==============================================================*/
create table INSCRIPTIONMASTER 
(
   IDINSCRIPMAST        char(50)                       not null,
   CODEPERM             char(20)                       not null,
   NIVEAUMASTER         char(20)                       null,
   UNIVERSITE           char(50)                       null,
   constraint PK_INSCRIPTIONMASTER primary key (IDINSCRIPMAST)
);

/*==============================================================*/
/* Table : PARCOURSPROFESSIONNELS                               */
/*==============================================================*/
create table PARCOURSPROFESSIONNELS 
(
   IDPARCOURSPROF       char(50)                       not null,
   DATEDEBUT            date                           null,
   DATEFIN              date                           null,
   POSTEOCUPE           char(100)                      null,
   TYPECONTRAT          char(10)                       null,
   ENTREPRISE           char(100)                      null,
   constraint PK_PARCOURSPROFESSIONNELS primary key (IDPARCOURSPROF)
);

/*==============================================================*/
/* Table : PEUT_AVOIR                                           */
/*==============================================================*/
create table PEUT_AVOIR 
(
   IDCURSUS             char(10)                       not null,
   CODEPERM             char(20)                       not null,
   constraint PK_PEUT_AVOIR primary key (IDCURSUS, CODEPERM)
);

/*==============================================================*/
/* Table : PEUT_FAIRE                                           */
/*==============================================================*/
create table PEUT_FAIRE 
(
   CODEPERM             char(20)                       not null,
   IDPARCOURSPROF       char(50)                       not null,
   constraint PK_PEUT_FAIRE primary key (CODEPERM, IDPARCOURSPROF)
);

/*==============================================================*/
/* Table : PROMOTION                                            */
/*==============================================================*/
create table PROMOTION 
(
   IDPROMO              char(20)                       not null,
   CODEPERM             char(20)                       not null,
   ANNDEBUT             date                           null,
   ANNFIN               date                           null,
   constraint PK_PROMOTION primary key (IDPROMO)
);

/*==============================================================*/
/* Table : SANCTIONNER                                          */
/*==============================================================*/
create table SANCTIONNER 
(
   CODEPERM             char(20)                       not null,
   IDDIPLOME            char(50)                       not null,
   constraint PK_SANCTIONNER primary key (CODEPERM, IDDIPLOME)
);

alter table INSCRIPTIONMASTER
   add constraint FK_INSCRIPT_PEUT_INSC_ETUDIANT foreign key (CODEPERM)
      references ETUDIANT (CODEPERM)
      on update restrict
      on delete restrict;

alter table PEUT_AVOIR
   add constraint FK_PEUT_AVO_PEUT_AVOI_ETUDIANT foreign key (CODEPERM)
      references ETUDIANT (CODEPERM)
      on update restrict
      on delete restrict;

alter table PEUT_AVOIR
   add constraint FK_PEUT_AVO_PEUT_AVOI_CURSUSUN foreign key (IDCURSUS)
      references CURSUSUNIV (IDCURSUS)
      on update restrict
      on delete restrict;

alter table PEUT_FAIRE
   add constraint FK_PEUT_FAI_PEUT_FAIR_PARCOURS foreign key (IDPARCOURSPROF)
      references PARCOURSPROFESSIONNELS (IDPARCOURSPROF)
      on update restrict
      on delete restrict;

alter table PEUT_FAIRE
   add constraint FK_PEUT_FAI_PEUT_FAIR_ETUDIANT foreign key (CODEPERM)
      references ETUDIANT (CODEPERM)
      on update restrict
      on delete restrict;

alter table PROMOTION
   add constraint FK_PROMOTIO_APPARTIEN_ETUDIANT foreign key (CODEPERM)
      references ETUDIANT (CODEPERM)
      on update restrict
      on delete restrict;

alter table SANCTIONNER
   add constraint FK_SANCTION_SANCTIONN_DIPLOME foreign key (IDDIPLOME)
      references DIPLOME (IDDIPLOME)
      on update restrict
      on delete restrict;

alter table SANCTIONNER
   add constraint FK_SANCTION_SANCTIONN_ETUDIANT foreign key (CODEPERM)
      references ETUDIANT (CODEPERM)
      on update restrict
      on delete restrict;

