#!/bin/bash
echo "ͳ�Ʒ�����Դ����TOP 100�ͷֱ��Ӧ���ֵ��ܴ���:"
sed -e '1d' web_log.tsv|awk -F '\t' '{a[$1]++} END {for(i in a) {print i,a[i]}}'|sort -nr -k2|head -n 100
echo ""
echo "ͳ�Ʒ�����Դ����TOP 100 IP�ͷֱ��Ӧ���ֵ��ܴ���"
sed -e '1d' web_log.tsv|awk -F '\t' '{if($1~/^(([0-2]*[0-9]+[0-9]+)\.([0-2]*[0-9]+[0-9]+)\.([0-2]*[0-9]+[0-9]+)\.([0-2]*[0-9]+[0-9]+))$/) print $1}'|awk '{a[$1]++} END {for(i in a){print i,a[i]}}'|sort -nr -k2|head -n 100
echo ""
echo "ͳ����Ƶ�������ʵ�URL TOP 100"
sed -e '1d' web_log.tsv | awk -F '\t' '{a[$5]++} END {for(i in a){print i,a[i] }}' |  sort -nr -k2 | head -n 100
echo ""
echo "ͳ�Ʋ�ͬ��Ӧ״̬��ĳ��ִ����Ͷ�Ӧ�ٷֱ�"
sed -e '1d' web_log.tsv | awk -F '\t' '{a[$6]++} END {for(i in a){print i,a[i] }}' |  sort -nr -k2 | head -n 100
echo ""
echo "�ֱ�ͳ�Ʋ�ͬ4XX״̬���Ӧ��TOP 10 URL�Ͷ�Ӧ���ֵ��ܴ���"
sed -e '1d' web_log.tsv | awk -F '\t' '{a[$6]++} END {for(i in a){print i,a[i] }}' |  sort -nr -k2 | awk '{arr[$1]=$2;sums+=$2} END {for (k in arr) print k,arr[k]/sums*100,"%"}'
echo ""
echo "����URL���TOP 100������Դ����"
sed -e '1d' web_log.tsv|awk -F '\t' '{if($5=="'$1'") a[$1]++} END {for(i in a){print i,a[i]}}'|sort -nr -k2|head -n 10
echo ""
echo ""
sed -e '1d' web_log.tsv | awk -F '\t' ' {if($6~/^403/) {a[$6":"$1]++}} END {for(i in a){print i,a[i] }}' | sort -nr -k2 | head -n 10
echo ""
echo ""
sed -e '1d' web_log.tsv | awk -F '\t' ' {if($6~/^404/) {a[$6":"$1]++}} END {for(i in a){print i,a[i] }}' | sort -nr -k2 | head -n 10
