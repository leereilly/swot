#!/bin/bash
host $1 > /dev/null
if [ $? -gt 0 ]
then
  echo $1
fi
