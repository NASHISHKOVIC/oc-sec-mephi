res=0
res=$(awk -v a="$1" -v b="$2" -v c="$3" 'BEGIN{
    p = (a+b+c)/2
    s = p*(p-a)*(p-b)*(p-c)
    if (s < 0) s = 0
    printf "%.2f\n", sqrt(s)
}')
echo "$res"

flag=1
if (($1+$2<=$3)); then
	flag=0
fi
if (($1+$3<=$2)); then
	flag=0
fi
if (($3+$2<=$1)); then
	flag=0
fi
if ((flag == 1)); then
	echo "Такой треугольник существует, его площадь $res"
else
	echo "Такого треугольника не существует"
fi
