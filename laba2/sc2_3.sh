while read line; do
	if echo "$line" | grep -q -w "bin"; then
		echo "$line"
	fi
done
	
