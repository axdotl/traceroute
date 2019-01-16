#!/bin/sh

if [ -n "${TO_FILE}" ]; then
  file_name=$(date -u +"%Y-%m-%dT%H:%M:%SZ").txt
  traceroute ${1} >> /data/$file_name

  echo $file_name >> /data/full-log.txt
  cat /data/$file_name >> /data/full-log.txt
  echo $file_name >> /data/max-values.txt
  grep -v "traceroute" < /data/$file_name | awk -F' ' '{print $4} {print $6} {print $8}' | sort -nr | head -n1 >> /data/max-values.txt
else
  traceroute ${1}
fi
