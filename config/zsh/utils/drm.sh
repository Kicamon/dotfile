file=($(find . -type f -name "*."$1))
for fl in ${file[@]}; do
  rm $fl
done
