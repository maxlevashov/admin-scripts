Bash-скрипт для выполнения дампа всех баз данных MySQL, используемых на сервере.

1- Для запуска скрипта необходимо дать права на исполнение скрипту командой chmod +x dump_all_databases.sh.
2- Запустить скрипт выполнив одну из следующих команд:
./dump_all_databases.sh
sh dump_all_databases.sh
bash dump_all_databases.sh

3- Дождататься, когда выполниться процесс. Дампы будут сохранены в формате YYYYMMDD.name_db.sql.

#!/usr/bin/env bash

databases=`mysql -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
if [­[ "$db" != "information_schema" ]] && [­[ "$db" != "performance_schema" ]] && [­[ "$db" != "mysql" ]] && [­[ "$db" != _* ]] ; then
echo "Dumping database: $db"
mysqldump —databases $db > `date +%Y%m%d`.$db.sql
# gzip $OUTPUT/`date +%Y%m%d`.$db.sql
fi
done
