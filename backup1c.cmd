SET PGDATABASE=1c
SET PGHOST=localhost
SET PGPORT=5432
SET PGUSER=postgres
SET PGPASSWORD=Qbitech3286011
set PATH=%PATH%;"%ProgramFiles%\PostgresPro 1C\9.4\bin";%ProgramFiles%\7-Zip
set DAT=%date:~6,4%%date:~3,2%%date:~0,2%
set B="e:\Backup\sql_1cdoc"
rem cd C:\backup
"%ProgramW6432%\PostgresPro 1C\9.4\bin\pg_dump.exe" --host localhost --port 5432 --username "postgres" --role "postgres" --no-password  --format custom --blobs --compress 5 --encoding UTF8 --verbose --file e:\Backup\sql_1cdoc\%DAT%-1cdoc.pgsql.backup "et"
rem Удаление бэкапов старше 7 дней.
forfiles.exe -p %B%\ -s -m *.* -d -7 -c "cmd /c del /Q @FILE"
echo Перед восстановлением базы обязательно создайте новую! Не только с помощью PostgreSQL, но и из консоли администрирования сервера 1с
echo "C:\Program Files\PostgresPro 1C\9.4\bin\psql.exe" -U postgres -c "drop database test_base"
echo "C:\Program Files\PostgresPro 1C\9.4\bin\createdb.exe" -h localhost -E UTF8 -U postgres test_base
echo "C:\Program Files\PostgresPro 1C\9.4\bin\pg_restore.exe" --host localhost --port 5432 --username "postgres" --dbname "test_base" --role "postgres" --no-password  --verbose "D:\backup\sql_1cdoc\20160428-1cdoc.pgsql.backup
exit 