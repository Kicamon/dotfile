file_name=$1

if [ "$2" == "--to-clip" ]; then
	silicon -f 'Maple Mono;Source Han Sans SC;Segoe UI Symbol' ${file_name} --to-clipboard
else
	silicon -f 'Maple Mono;Source Han Sans SC;Segoe UI Symbol' ${file_name} -o ${file_name}.png
fi
