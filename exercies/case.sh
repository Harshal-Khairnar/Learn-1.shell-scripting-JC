#! /bin/bash

read -p "Enter start | stop : " ANSWER

case "$ANSWER" in
        start)
            /tmp/sleep-walking-server.sh &
        ;;
        stop)
            kill $( cat /tmp/sleep­walking­server.pid )  && echo "service stopped"
        ;;
        *)
            echo "Usage sleep-walking start|stop "
        ;;
esac        
