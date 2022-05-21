CREATE OR REPLACE FUNCTION "user".create_user_settings()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

		DECLARE lastuserid int;
	
	BEGIN
		SELECT 
		  DISTINCT max(id) AS user_id 
		FROM 
		  "user"."user" INTO lastuserid;
		 
		 	 INSERT INTO "user"."settings" 
	 (user_id, notification_type_id, status, options)
	 values 
	 (lastuserid, 1, 1,
		'{"subscribe_to_email_news": true}'
	 
	);
		 return null;
	END;

$function$;

create trigger user_settings after
insert
    on
    "user"."user" for each row execute function "user".create_user_settings()