#!/bin/bash
CURDATE=`date --rfc-3339=date`
for i in `cat l1`; do ./host.test.sh $i >> list_of_presumbaly_dead_domains_$CURDATE; done 
