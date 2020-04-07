echo -n \| > temp.txt 
cat list_KW.txt temp.txt list_ID.txt > ShieldWords.bak #两个列表间用|连接
rm temp.txt
sed -i "s/|/\"},{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"/g" ShieldWords.bak #替换|
sed -i '/./{s/^/[\{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"&/;s/$/&\"\}]/}' ShieldWords.bak #补齐前后
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":0\}\n/}' list_KW.txt > temp1.txt
sed -i "s/|/\",\"g\":0}\n{\"b\":\"/g" temp1.txt 
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":1\}\n/}' list_ID.txt > temp2.txt
sed -i "s/|/\",\"g\":1}\n{\"b\":\"/g" temp2.txt 
cat temp1.txt temp2.txt > ShieldWords.share_backup
rm temp1.txt temp2.txt