error_print() {
	echo -e "\033[31m ${1} \033[0m" # 修正颜色代码
	exit 1
}

sort="name"
name="*"
type="f"
prefix=""
suffix=""

para=("$@") # 加上引号
for ((i = 0; i < $#; i++)); do
	case "${para[$i]}" in
	"-prefix")
		((i++)) # 使用算术递增
		if [[ $i -ge $# || "${para[$i]:0:1}" == '-' ]]; then
			error_print "-prefix参数错误"
		fi
		prefix="${para[$i]}"
		;;
	"-suffix")
		((i++))
		if [[ $i -ge $# || "${para[$i]:0:1}" == '-' ]]; then
			error_print "-suffix参数错误"
		fi
		suffix="${para[$i]}"
		;;
	"-sort")
		((i++))
		if [[ $i -ge $# || "${para[$i]:0:1}" == '-' ]]; then
			error_print "-sort参数错误"
		fi
		sort="${para[$i]}"
		;;
	"-name")
		((i++))
		if [[ $i -ge $# || "${para[$i]:0:1}" == '-' ]]; then
			error_print "-name参数错误"
		fi
		name="${para[$i]}"
		;;
	"-type")
		((i++))
		if [[ $i -ge $# || "${para[$i]:0:1}" == '-' ]]; then
			error_print "-type参数错误"
		fi
		type="${para[$i]}"
		;;
	*)
		error_print "没有${para[$i]}参数"
		;;
	esac
done

# 修正排序映射
declare -A sort_map
sort_map["name"]=""            # 按名称排序
sort_map["time"]="-tr"          # 按时间排序（最新在前）
sort_map["rtime"]="-t" # 按时间反向排序（最旧在前）

mkdir -p temp

# 获取文件列表并排序
if [[ -n "${sort_map[$sort]}" ]]; then
	# 使用ls进行排序
	files=($(find . -maxdepth 1 -type "$type" -name "$name" -print0 | xargs -0 ls ${sort_map[$sort]} 2>/dev/null))
else
	# 默认按名称排序
	files=($(find . -maxdepth 1 -type "$type" -name "$name" -print0 | xargs -0 ls 2>/dev/null))
fi

total_files=${#files[@]}
num_digits=${#total_files}

counter=1
for file in "${files[@]}"; do
	# 处理文件名（去掉前面的./）
	file="${file#./}"

	# 获取文件扩展名
	if [[ "$file" == *.* ]]; then
		extension="${file##*.}"
		# 如果扩展名包含路径分隔符，说明没有真正的扩展名
		if [[ "$extension" == *"/"* ]]; then
			extension=""
		fi
	else
		extension=""
	fi

	# 构建新文件名
	if [[ -n "$extension" ]]; then
		new_name=$(printf "%s%0${num_digits}d%s.%s" "$prefix" "$counter" "$suffix" "$extension")
	else
		new_name=$(printf "%s%0${num_digits}d%s" "$prefix" "$counter" "$suffix")
	fi

	# 移动文件
	mv "$file" "temp/$new_name"
	((counter++))
done

# 移动文件回原位置
if [[ "$(ls -A temp 2>/dev/null)" ]]; then
	mv temp/* ./
fi

rm -rf temp
