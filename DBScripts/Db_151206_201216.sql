-- Author [ent1]
create table "APP"."AUTHOR" (
   "AID"  integer  not null,
   "ADDRESS"  varchar(255),
   "EMAIL"  varchar(255),
   "ATTRIBUTE4"  varchar(255),
   "TELEPHONE_NUMBER"  varchar(255),
  primary key ("AID")
);


-- Message [ent2]
create table "APP"."MESSAGE" (
   "OID"  integer  not null,
   "MESSAGE"  varchar(255),
   "TIMESTAMP"  timestamp,
   "AID"  integer,
  primary key ("OID")
);


-- Author_User [rel1]
alter table "APP"."USER"  add column  "AUTHOR_AID"  integer;
alter table "APP"."USER"   add constraint FK_USER_AUTHOR foreign key ("AUTHOR_AID") references "APP"."AUTHOR" ("AID");


-- Message_Author [rel2]
create view "APP"."MESSAGETOAUTHOR_VIEW" as
select AL1."OID" as "S_OID", AL2."AID" as "T_AID"
from  "APP"."MESSAGE" AL1 ,
         "APP"."AUTHOR" AL2 
where AL1."AID" = AL2."AID";


