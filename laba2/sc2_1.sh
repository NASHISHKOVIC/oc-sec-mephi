date1=$(date)
cd /
echo "$date1" >> /tmp/run.log
echo "Hello, world!"

wc -l < /tmp/run.log >&2


