#!/bin/bash

echo "# events called" >> $2

cat $1 | grep calls | wc -l
cat $1 | grep calls | cut -d ' ' -f 2,3 | sort >> $2

echo -e "\n\n# events submitted" >> $2
cat $1 | grep submitted | wc -l
cat $1 | grep submitted | cut -d ' ' -f 2,3 | sort >> $2

echo -e "\n\n# events lost" >> $2
cat $1 | grep lost | wc -l
cat $1 | grep lost | cut -d ' ' -f 2,3 | sort >> $2
