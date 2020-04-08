echo > temp.txt #创建一个只有空行的文件
cat list_KW.txt temp.txt list_ID.txt > ShieldWords.bak #连接
sed -i ":a;N;s/\n/\"},{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"/g;ta" ShieldWords.bak #替换换行符
sed -i '/./{s/^/[\{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"&/;s/$/&\"\}]/}' ShieldWords.bak #补齐前后
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":0\}/}' list_KW.txt > temp1.txt
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":1\}/}' list_ID.txt > temp2.txt
cat temp1.txt temp.txt temp2.txt temp.txt > ShieldWords.share_backup
rm temp.txt temp1.txt temp2.txt