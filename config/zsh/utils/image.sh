file=$1
width=$2
file_es=${file##*.}
file_name=$(basename $file "."$file_es)

convert $file -bordercolor white -border $(convert $file -format "%[fx:min(w,h)*${width}]" info:) ${file_name}_Border.${file_es}
