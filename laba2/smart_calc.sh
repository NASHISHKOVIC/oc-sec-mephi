v_flag=0
operation=""
filename=""

while getopts "z:hvo:" i; do
	case $i in
		z) operation=$OPTARG ;;
		h) echo "принимает опции:
		-z - операция математическая(+-/*^)
		-h — выводит справку.
		-v — включает подробный вывод.
		-o <file> — указывает файл для вывода.
		Pосле опций обрабатывает оставшиеся параметры как числа для
		вычисления;
		выполняет операции сложения, умножения, вычитания, возведения в
		степень, деления в зависимости от опции;
		выводит результат." ;;
		v) echo "Подробный вывод включен" ; ((v_flag++)) ;;
		o) filename=$OPTARG ;;
		
	esac
done
shift $((OPTIND - 1))

result="$1"
shift

for num in "$@"; do
    case $operation in
        +) result=$(( result + num )) ;;
        -) result=$(( result - num )) ;;
        '*') result=$(( result * num )) ;;
        /)
            if [ "$num" -eq 0 ]; then
                echo "Деление на ноль" >&2
                exit 1
            fi ; result=$(( result / num ));;
        '^') result=$(( result ** num )) ;;
    esac
    if ((v_flag>0)) then
        echo "После $operation $num результат: $result"
    fi
done	

if [ -n "$filename" ]; then
    echo "$result" >> "$filename"
fi
		
		
