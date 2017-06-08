# nagios-slack.sh
simple bash script for send nagios notifications to slack using curl


You need config a contact and command in your nagios: 

```
define contact {
       contact_name                     slack
       alias                            slack
       service_notification_period      24x7
       host_notification_period         24x7
       service_notification_options     u,c,r
       host_notification_options        d,r
       service_notification_commands    notify-service-by-slack
       host_notification_commands       notify-host-by-slack
       }
```

```
define command {
       command_name     notify-service-by-slack
       command_line     /bin/bash /opt/nagios/share/plugins/slack_nagios.sh "$HOSTNAME$" \
          "$NOTIFICATIONTYPE$" \
          "$SERVICEDESC$" \
          "$SERVICESTATE$" \
          "$SERVICEOUTPUT$" \
          "$HOSTADDRESS$" \
          "$LONGDATETIME$" \ > /tmp/slack.log 2>&1
       }

define command {
       command_name     notify-host-by-slack
       command_line     /bin/bash /opt/nagios/share/plugins/slack_nagios.sh "$HOSTNAME$" \
          "$NOTIFICATIONTYPE$" \
          "$SERVICEDESC$" \
          "$HOSTSTATE$" \
          "$HOSTOUTPUT$" \
          "$HOSTADDRESS$" \
          "$LONGDATETIME$" \ > /tmp/slack.log 2>&1
       }
       
```
