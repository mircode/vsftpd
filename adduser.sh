
if [ ‘$#’=='3' ]
then
	echo $1 >> password;
        echo $2 >> password;
fi
db_load -T -t hash -f password password.db
