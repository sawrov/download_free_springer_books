#!/bin/bash

cat pdf-text\(copy\ paste\) | grep -P -o '(http).*([^\s])' | sort -u > links_to_books.txt
final_number=$(wc -l links_to_books.txt | grep -o '^\w*')
echo "links_to_books.txt created with $final_number entries"
echo -e "Extracting download link from the springer page \n"

count=1
echo -e "Downloading pdf links in file pdf_download_links.txt \n"
head links_to_books.txt| sort -u | while read line; do { wget -qO- $line |  grep "Download this book in PDF format" | grep -o -P '(?<=href=").*(title)' | grep -o '^\S*' | sort -u | tee -a  pdf_download_links.txt; echo "$count of $final_number ";count=$(( count+1 )); };done
to_be_downloaded=$(sort -u pdf_download_links.txt| wc -l | grep -o '^\w*')
read -p "Press Enter if you want to download $to_be_downloaded files" ok
count2=0
cat pdf_download_links.txt | sed 's/^/https\:\/\/link.springer.com/' | sort -u | while read line; do echo -e "Downloading $count2 of $to_be_downloaded \n"; count2=$((count2+1)); wget -nc $line; done;
