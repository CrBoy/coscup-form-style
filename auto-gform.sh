#!/bin/sh

ORIG_CSS="/static/spreadsheets/client/css/779923916-published_form_compiled.css"
CSS="http://crboy.github.com/coscup-form-style/coscup-style.css"

ORIG_FAVICON="//ssl.gstatic.com/docs/spreadsheets/forms/favicon_jfk.png"
FAVICON="http://crboy.github.com/coscup-form-style/favicon.ico"

function help {
	echo "Usage: $0 \"<form_link>\" <filename>\n"
	echo "The <form_link> is the form link provided by Google Docs Form."
	echo "\tEx: https://docs.google.com/spreadsheet/viewform?formkey=dEdxelFvSzhLQnpCSkdudEtpUjRFQUE6MQ#gid=0"
	echo "Don't forget the double quote!\n"
	echo "The <filename> is the file you want to save as."
	echo "\tEx: recruit.html"
}

if [ $# -lt 2 ]; then
	help
	exit
fi

if [ `uname` = "Linux" ]; then
	wget --no-check-certificate -q -O - $1 | sed "1,20s;$ORIG_CSS;$CSS;" | sed "1,5s;$ORIG_FAVICON;$FAVICON;" > $2
elif [ `uname` = "Darwin" ]; then 
	curl -k -s -o - $1 | sed "1,20s;$ORIG_CSS;$CSS;" | sed "1,5s;$ORIG_FAVICON;$FAVICON;" > $2
fi 

