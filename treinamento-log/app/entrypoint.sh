#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=6; $WAIT/1000" | bc)
   I=$(shuf -i 1-6 -n 1)
   D=`date -Iseconds`
   case "$I" in
      "1") echo '{"timestamp":"'${D}'","log_level":"ERROR","status_code":"429","version":"v1", "message":"An error is usually an exception that has been caught and not handled."}'
      ;;
      "2") echo '{"timestamp":"'${D}'","log_level":"INFO","status_code":"200","version":"v1", "message":"This is less important than debug log and is often used to provide context in the current task."}'
      ;;
      "3") echo '{"timestamp":"'${D}'","log_level":"WARN","status_code":"400","version":"v1", "A warning that should be ignored is usually at this level and should be actionable."}'
      ;;
      "4") echo '{"timestamp":"'${D}'","log_level":"DEBUG","status_code":"200","version":"v1", "message":"This is a debug log that shows a log that can be ignored."}'
      ;;
      "5") echo '{"timestamp":"'${D}'","log_level":"INFO","status_code":"200","path":"/v1/get/user","version":"v1", "message":"Usuario requisitado com sucesso"}'
      ;;
      "6") echo '{"timestamp":"'${D}'","log_level":"ERROR,"status_code":"500","path":"/v1/get/user/list","version":"v1", "message":"Internal Server Error"}'
      ;;
   esac
   c=$(( c+1 ))
done