total_files=$(find . -maxdepth 1 -type f | wc -l)
num_digits=${#total_files}
prefix=${1}

mkdir -p temp
counter=1

for file in *; do
	if [[ -f "$file" ]]; then
		extension="${file##*.}"
		new_name=$(printf "${prefix}%0${num_digits}d.%s" "$counter" "$extension")
		mv "$file" "temp/$new_name"
		((counter++))
	fi
done

mv temp/* ./
rm -rf temp

echo "重命名完成"
