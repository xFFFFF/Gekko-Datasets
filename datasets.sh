#!/usr/local/bin/bash
export PATH="/usr/local/bin:/usr/bin:/bin"


# Patch to parrent dir of above directories
path='/root/gekko'
all=0

# Dir names of Gekko copies
readarray array < $path/pairs.conf

echo "This is Gekko Trading Bot datasets for backtests. Webpage with always actually information: https://github.com/xFFFFF/Gekko-Datasets

UNCOMPRESSED FILES SIZE" > $path/README.TXT

function drive () {
    gdrive delete `gdrive list -m 1000 | grep $1 | cut -d ' ' -f1 | head -1`
    gdrive upload -p 1cdaEPTA2Z_DJWCkbfidlSJVg8gJinK78 $1
}

for i in ${array[@]}
do
cd $path/$i

# Run Gekko-BacktestTool in update candles mode
if [[ $i == gdax* ]] || [[ $i == poloniex* ]]; then
perl $path/$i/backtest.pl -i -f last -t now 
else
perl $path/$i/backtest.pl -i -p `echo $i | cut -d'-' -f1`:`echo $i | cut -d'-' -f2 | awk '{print toupper($0)}'`:ALL -f last -t now
fi

# Run script which generate file with statistics for candles
cd history
fname="`echo $i | cut -d'-' -f1`_0.1.db"
echo "DB filename: $fname" > $i.info
echo "Size: `ls -hl $fname | awk '{print $5}'` (`ls -l $fname | awk '{print $5}'` bytes)
 " >> $i.info
perl $path/datasets_info.pl $path/$i/history/`echo $i | cut -d'-' -f1`_0.1.db >> $i.info
size=`ls -l $fname | awk '{print $5}'`
((sizeh=$size / 1024 / 1024))
echo "$i: $sizeh MB" >> $path/README.TXT
((all=all+size))

# Delete old Google Drive file, and upload new in defined directory
drive $i.info
rm $i.info

# Prepare and upload Gekko's database
[ -f $i.zip ] && rm $i.zip
zip -9 $i.zip `echo $i | cut -d'-' -f1`_0.1.db
drive $i.zip

done

# Last data for readme
((allh=$all / 1024 / 1024))
echo "SUM: $allh MB" >> $path/README.TXT
drive "$path/README.TXT"
