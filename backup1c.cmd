SET PGDATABASE=1c
SET PGHOST=localhost
SET PGPORT=5432
SET PGUSER=postgres
SET PGPASSWORD=_______________
set PATH=%PATH%;"%ProgramFiles%\PostgresPro 1C\9.4\bin";%ProgramFiles%\7-Zip
set DAT=%date:~6,4%%date:~3,2%%date:~0,2%
set B="e:\Backup\sql_1cdoc"
rem cd C:\backup
"%ProgramW6432%\PostgresPro 1C\9.4\bin\pg_dump.exe" --host localhost --port 5432 --username "postgres" --role "postgres" --no-password  --format custom --blobs --compress 5 --encoding UTF8 --verbose --file e:\Backup\sql_1cdoc\%DAT%-1cdoc.pgsql.backup "et"
rem Óäàëåíèå áýêàïîâ ñòàðøå 7 äíåé.
forfiles.exe -p %B%\ -s -m *.* -d -7 -c "cmd /c del /Q @FILE"
echo Ïåðåä âîññòàíîâëåíèåì áàçû îáÿçàòåëüíî ñîçäàéòå íîâóþ! Íå òîëüêî ñ ïîìîùüþ PostgreSQL, íî è èç êîíñîëè àäìèíèñòðèðîâàíèÿ ñåðâåðà 1ñ
echo "C:\Program Files\PostgresPro 1C\9.4\bin\psql.exe" -U postgres -c "drop database test_base"
echo "C:\Program Files\PostgresPro 1C\9.4\bin\createdb.exe" -h localhost -E UTF8 -U postgres test_base
echo "C:\Program Files\PostgresPro 1C\9.4\bin\pg_restore.exe" --host localhost --port 5432 --username "postgres" --dbname "test_base" --role "postgres" --no-password  --verbose "D:\backup\sql_1cdoc\20160428-1cdoc.pgsql.backup
exit 
