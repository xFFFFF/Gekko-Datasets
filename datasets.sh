# Dir names of Gekko copies
array=(binance-usdt binance-btc binance-bnb binance-eth poloniex-usdt poloniex-xmr)
# Patch to parrent dir of above directories
path='/root/gekko'

for i in ${array[@]}
do
cd $path/$i
# Run Gekko-BacktestTool in update candles mode
perl $path/$i/backtest.pl -i -p `echo $i | cut -d'-' -f1`:`echo $i | rev | cut -d'-' -f1 | rev | awk '{print toupper($0)}'`:ALL -f last -t now
# Run script which generate file with statistics for candles
cd history
fname="`echo $i | cut -d'-' -f1`_0.1.db"
echo "DB filename: $fname" > $i.info
echo "Size: `ls -hl $fname | awk '{print $5}'` (`ls -l $fname | awk '{print $5}'` bytes)
 " >> $i.info
perl $path/datasets_info.pl $path/$i/history/`echo $i | cut -d'-' -f1`_0.1.db >> $i.info
# Delete old Google Drive file, and upload new in defined directory
gdrive delete `gdrive list | grep $i.info | awk '{print $1}'`
gdrive upload -p 1cdaEPTA2Z_DJWCkbfidlSJVg8gJinK78 $i.info
rm $i.info
# Prepare and upload Gekko's database
[ -f $i.zip ] && rm $i.zip
zip -9 $i.zip `echo $i | cut -d'-' -f1`_0.1.db
gdrive delete `gdrive list | grep $i.zip | awk '{print $1}'`
gdrive upload -p 1cdaEPTA2Z_DJWCkbfidlSJVg8gJinK78 $i.zip
done
