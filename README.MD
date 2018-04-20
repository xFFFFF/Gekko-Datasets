# What is it?
Ready to use [Gekko trading bot](https://github.com/askmike/gekko) SQLite dump files with history use to do backtests. Just copy downloaded file to the Gekko's *history* directory and you get for example: full history of Binance BTC pairs.

The data is systematized in two ways: in order to improve Gekko's performance, full history data is divided into separate files sorted by exchange and currency pairs. Each database file contains all possible assets from a given exchange-currency.  
Second option: data for the last days (7, 14, 30, 60) have all possible currencies and assets from a given exchange in one db file.

The files are updated every day with new data after 23:15 GMT.

Currently available datasets 
- **[Binance](https://www.binance.com/?ref=17905068)** - *BTC*, *BNB*, *ETH*, *USDT* (full history)
- **Bitfinex** - *BTC*, *ETH* (from 2017-07-01), *USD* (from 2014-06-01), *EUR*, *GBP*, *JPY* (full history) 
- **Poloniex** - *BTC* (from 2017-01-01), *ETH*, *USDT*, *XMR* (from 2017-07-01)
- **GDAX** - *USD*, *BTC*, *EUR*, *GBP* (full history)
- **Kraken** - *XBT*, *ETH*, *USD*, *EUR*, *CAD*, *GBP*, *JPY* (full history)

Available soon / currently import
- **Bitfinex** - *USD* (from 2013-10-01)
- **Poloniex** - *BTC* (from 2016-01-01)
- **GDAX** - *USD* (from 2015-01-01)

# Download
Dumps are compressed by zip and stored on Google Drive, detailed information about candles are in .info files. 

Last 7, 14, 30, 60 days: [drive.google.com](https://goo.gl/dzKLmz)   
Full history: [drive.google.com](https://goo.gl/KVpVVR)

The current size of all uncompressed full period databases is about 16 GB.

# Install
1. Go to Google Drive [here](https://goo.gl/dzKLmz) or [here](https://goo.gl/KVpVVR)
2. Select the dataset that interests you, click with the right mouse button and select Download   
![Download](https://i.imgur.com/bg7Nrzt.jpg)
3. Go to Your gekko's main directory
4. Create a *history* folder in the main folder gecko if it does not exist   
![History folder](https://i.imgur.com/Ct6fnvn.jpg)
5. Uncompress downloaded file, and copy db file (for eg binance_0.1.db) to *history* folder
6. Restart Gekko

# Local datasets update
I recommend [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) app for self-updating via exchange API import. With one command you can import all new candles. For example, for dataset binance-usdt, use the command:
`./backtest.pl -i -p binance:USDT:ALL -f last -t now`
The rest is done automatically.

# Do you want to make a mirror?
Feel free if you want to process / modify the data contained in this repository. For those interested, I provide scripts whose task is to update datasets from last value to current time and share dumps on Google Drive. The [datasets.sh](datasets.sh) (main script) and [datasets_info.pl](datasets_info.pl) (generating detailed information about candles) files are located in the /root/gekko directory, and my separate copies for each datasets in the following subdirectories: binance-usdt, binance-btc, binance-bnb, binance-eth, poloniex-usdt, poloniex-xmr. Add the [datasets.sh](datasets.sh) file to cron, and the rest happens by itself. Scripts require: [Gekko](https://github.com/askmike/gekko), [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) and [Gdrive](https://github.com/prasmussen/gdrive).

# See also
- [Free strategies for Gekko](https://github.com/xFFFFF/Gekko-Strategies)
- [Gekko's BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool)

# Donate
If you liked my work, you can buy me coffee.

BTC: `32G2cYTNFJ8heKUbALWSgGvYQikyJ9dHZp`   
BCH: `qrnp70u37r96ddun2guwrg6gnq45yrxuwu3gyewsgq`   
ETH: `0x50b7611b6dC8a4073cB4eF12A6b045f644c3a3Aa`   
LTC: `M9xT3mcxskjbvowoFa15hbKXShLNTuwr6n`   
