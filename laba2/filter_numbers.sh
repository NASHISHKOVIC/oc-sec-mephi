count=0
> even.txt
> odd.txt
for i in "$@"; do
    if (( i % 3 != 0 )); then
        if (( i % 2 == 0 )); then
            echo "$i" >> even.txt
            ((count++))
        else
            echo "$i" >> odd.txt
            ((count++))
        fi
    fi
done

echo "Count: $count"
