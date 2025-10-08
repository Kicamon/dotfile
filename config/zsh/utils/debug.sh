fn=${1}
fne=${fn#*.}
rfn=${fn%.*}

if [[ "$fne" == "c" ]]; then
	gcc -g "$fn" -o "$rfn" && gdb "$rfn"
elif [[ "$fne" == "cc" || "$fne" == "cpp" ]]; then
	g++ -g "$fn" -o "$rfn" && gdb "$rfn"
fi

rm "$rfn"
