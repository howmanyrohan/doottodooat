alter table public.todos
  add column position double precision not null default extract(epoch from now());

update public.todos set position = id;
