format="txt"
gen_sql=0
while getopts "f:g" opt; do
    case $opt in
        f) format="$OPTARG" ;;
        g) gen_sql=1 ;;
        \?) exit 1 ;;
    esac
done
shift $((OPTIND - 1))

filename="$1"

read sum mid max < <(
    awk -F, 'NR==1 {next}{
        s = $2 * $3
        total += s
        count++
        if (s > mx) mx = s
    } END{
        if (count == 0) { print "0 0 0"; exit 1 }
        printf "%.2f %.2f %.2f\n", total, total/count, mx
    }' "$filename"
)

if [ "$format" = "csv" ]; then
    {
        echo "sum,$sum"
        echo "mid,$mid"
        echo "max,$max"
    } | tee sales_report.csv
else
    {
        echo "Summ: $sum"
        echo "Mid: $mid"
        echo "Max: $max"
    } | tee sales_report.txt
fi


if [ "$gen_sql" -eq 1 ]; then
    {
        echo "CREATE TABLE IF NOT EXISTS sales_report ("
        echo "    metric TEXT PRIMARY KEY,"
        echo "    value  NUMERIC"
        echo ");"
        echo "COPY sales_report(metric, value) FROM STDIN WITH (FORMAT csv, HEADER true);"
        echo "sum,$sum"
        echo "mid,$mid"
        echo "max,$max"
        echo "\\."
    } > sales_report.sql
fi

