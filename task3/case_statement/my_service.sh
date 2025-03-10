#!/bin/bash

PID=$(pgrep -f "my_service.sh")
echo "PID of process is $PID"
case $1 in
	start)
		echo "Service started"
		sleep 999s &
		;;
	
	stop)
		kill $PID
		echo "Service stopped"
		;;

	restart)
		./my_service.sh &
		echo "Service restarted"
		;;
	help)
		echo "usage: my_service.sh [start|stop|restart]"
		;;
esac
