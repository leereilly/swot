if grep -i -w -q $1 $2; then
	echo $2
fi
