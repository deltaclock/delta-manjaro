write_curr_dir() {
	while sleep 1
	do
		id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $5}' | tr -d ,)
		echo $(xprop -id $id | awk '/WM_NAME\(STRING\)/{print $NF}' | tr -d \") > /tmp/dir
	done
}

change_dir() {
	if [[ ! -f /tmp/dir ]]
	then
		return 1
	fi
	dir=$(cat /tmp/dir)
	if [[ $dir =~ "~" ]]
       	then
		eval "cd $dir"
	else
		cd $dir
	fi
}
