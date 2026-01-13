clip=""
filename=""
filetype=""
para=("$@")
for ((i = 0; i < $#; i++)); do
	if [[ "${para[$i]}" == "-tc" ]]; then
		clip="${clip}t"
	elif [[ "${para[$i]}" == "-fc" ]]; then
		clip="f${clip}"
	elif [[ "${para[$i]}" == "-ftc" ]]; then
		clip="ft"
	elif [[ "${para[$i]}" == "-f" ]]; then
		((i++))
		filetype="${para[$i]}"
	else
		filename="${para[$i]}"
	fi
done

p=""
case "$clip" in
"ft")
	p=" --from-clipboard -l ${filetype} --to-clipboard"
	;;
"f")
	p=" --from-clipboard -l ${filetype} -o ${filename}.png"
	;;
"t")
	p=" ${filename} --to-clipboard"
	;;
*)
	p=" ${filename} -o ${filename}.png"
	;;
esac

silicon -f 'Maple Mono;Source Han Sans SC;Segoe UI Symbol' $p
