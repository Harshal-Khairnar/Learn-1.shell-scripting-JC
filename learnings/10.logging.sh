#! /bin/bash

# Logger utility is used to logged important messages
# linux uses sylog standard for logging
#
# facilities : kern, mail, user, local0, local7
# severities : emerg, alert, crit, err, warning, notice, info, debug
#
# locations: /var/log/syslog
#
# logger -p facility.levelOfSeverities 'message'
#
logger -i -s -t $0  -p local0.info 'Testing logger utility' 
