sed  -i '/^$/d' list_KW.txt list_ID.txt #删掉文件中的空行,防止出现屏蔽词为空白的情况
sort  -u list_KW.txt -o list_KW.txt; sort  -u list_ID.txt  -o list_ID.txt #对关键词文件进行排序，并删去重复词
cat list_KW.txt list_ID.txt > ShieldWords.bak #连接
sort  -u ShieldWords.bak -o ShieldWords.bak #排序并删去关键词与账户名间的重复词
sed -i ":a;N;s/\n/\"},{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"/g;ta" ShieldWords.bak #替换换行符
sed -i '/./{s/^/[\{\"inHome\":true,\"inHot\":true,\"inStatusComment\":true,\"word\":\"&/;s/$/&\"\}]/}' ShieldWords.bak #补齐前后
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":0\}/}' list_KW.txt > temp1.txt
sed '/./{s/^/\{\"b\":\"&/;s/$/&\",\"g\":1\}/}' list_ID.txt > temp2.txt
cat temp1.txt temp2.txt > ShieldWords.share_backup
rm temp1.txt temp2.txt
