# What is this?
Ready to use Gekko's SQLite dumps files. Just copy the file to the history directory and you have: full history of Binance Exchange for example.

# Download
Dumps are shared on Google Drive, detailed information on candles can be found in .info files. Link: https://drive.google.com/drive/folders/1cdaEPTA2Z_DJWCkbfidlSJVg8gJinK78

# Local datasets update
I recommend Gekko-BacktestTool app for self-updating. With one command you can import all new candles. For example, for dataset binance-usdt, use the command:
`./backtest.pl -i -p binance: USDT: ALL -f last -t now`
The rest is done automatically.

# Do you want to make a mirror?
Feel free if you want to process / modify the data contained in this repository. For those interested, I provide scripts whose task is to update datasets. The datasets.sh and datasets_info.pl files are located in the /root/ gekko directory, and my separate copies for each datasets in the following subdirectories: binance-usdt, binance-btc, binance-bnb, binance-eth, poloniex-usdt, poloniex-xmr. Add the datasets.sh file to cron, and the rest happens by itself.

# Soon
- all possible pairs from Poloniex from July 1, 2017
- all possible pairs from Bitfinex (USD will be available first)
