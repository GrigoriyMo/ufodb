CREATE PROCEDURE "user".create_user(phone text, email text, name text) LANGUAGE SQL AS $$
INSERT INTO "user"."user" ("phone", "email", "name") values (phone, email, name); $$; call "user".create_user('+79111111116', 'hell4o@email.ru', 'DedInsider');

CREATE or replace function "notification".get_timer_by_notification_type_id(notification_type_id integer) returns int AS $get_timer_by_notification_type_id$
begin 
	return (
SELECT  "notification".timer.value
FROM "notification".timer , "notification".type 
WHERE "notification".type .id = notification_type_id
AND "notification".type.timer_id = "notification".timer.id 
);
end;
$get_timer_by_notification_type_id$ LANGUAGE plpgsql;


CREATE PROCEDURE "user".create_sms_confirmation(user_id integer, contact text,code text) 
LANGUAGE SQL AS $$
INSERT INTO "user"."confirmations" ("user_id" , "sms_code", "type", "status", "contact") 
values (user_id, code, 0,0, contact); 
$$; 



CREATE PROCEDURE "user".create_email_confirmation(user_id integer, contact text,code text) 
LANGUAGE SQL AS $$
INSERT INTO "user"."confirmations" ("user_id" , "email_hash", "type", "status", "contact") 
values (user_id, code, 1,0, contact); 
$$;

CREATE PROCEDURE "user".validate_sms_confirmation(confirmation_id integer) 
LANGUAGE SQL AS $$
UPDATE  "user"."confirmations" SET status = 1 where id = confirmation_id; 
$$;

CREATE PROCEDURE "user".validate_email_confirmation(confirmation_id integer) 
LANGUAGE SQL AS $$
UPDATE  "user"."confirmations" SET status = 1 where id = confirmation_id; 
$$;
