alter table "public"."todo" alter column "description" set not null;

alter table "public"."todo" alter column "done" set default false;

alter table "public"."todo" alter column "done" set not null;


