/******* Troubleshotting PG cron **************/
-- View existing cron jobs
SELECT * 
FROM cron.job;

-- To delete (un-schedule) a job by its ID. 
SELECT cron.unschedule(2);


-- Installed Extensions
SELECT 
    e.extname AS "Name", 
    e.extversion AS "Version", 
    n.nspname AS "Schema", 
    c.description AS "Description" 
FROM pg_catalog.pg_extension e 
LEFT JOIN pg_catalog.pg_namespace n 
	ON n.oid = e.extnamespace 
LEFT JOIN pg_catalog.pg_description c 
	ON c.objoid = e.oid 
  AND c.classoid = 'pg_catalog.pg_extension'::pg_catalog.regclass 
ORDER BY 1;
