find ~ -type f -name "*.txt" -exec md5sum {} + | sort | uniq -w32 -d
find ~ -type f -name "*.txt" -exec md5sum {} + | sort | uniq -w32 -d | wc -l

