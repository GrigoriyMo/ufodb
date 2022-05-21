CREATE PROCEDURE "user".create_user(phone text, email text, name text)
LANGUAGE SQL
AS $$
insert into "user"."user"
("phone", "email","name")
values 
(phone,email,name);
$$;

call "user".create_user('+79111111116','hell4o@email.ru','DedInsider');


CREATE PROCEDURE "user".create_confimation(phone text, email text, name text)
LANGUAGE SQL
AS $$
insert into "user"."user"
("phone", "email","name")
values 
(phone,email,name);
$$;