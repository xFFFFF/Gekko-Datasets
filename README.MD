# What is it?
Ready to use [Gekko trading bot](https://github.com/askmike/gekko) SQLite dump files with history use to do backtests. Just copy downloaded file to the Gekko's *history* directory and you get for example: full history of Binance BTC pairs.

In order to improve Gekko's performance, data is divided into separate files sorted by exchange and currency pairs. Each database file contains all possible assets from a given exchange-currency.

The files are updated every day with new data after 23:15 GMT.

Currently available datasets 
- **Binance** - *BTC*, *BNB*, *ETH*, *USDT* (full history)
- **Bitfinex** - *BTC*, *ETH* (from 2017-07-01), *EUR*, *GBP*, *JPY* (full history) 
- **Poloniex** - *BTC* (from 2017-11-01) *ETH*, *USDT*, *XMR* (from 2017-07-01)
- **GDAX** - *BTC*, *EUR*, *GBP* (from 2017-07-01)
- **Kraken** - *XBT*, *ETH*, *USD*, *EUR*, *CAD*, *GBP*, *JPY* (full history)

Available soon / currently import
- **Bitfinex** - *USD* (from 2017-07-01)
- **Poloniex** - *BTC* (from 2017-07-01)
- **GDAX** - *USD* (from 2017-07-01), *EUR* (from 2017-01-01)
- **Abucoins** - BTC, PLN, EUR, USD (from 2017-07-01)

# Download
Dumps are compressed by zip and stored on Google Drive, detailed information about candles are in .info files. 

Link: [drive.google.com](https://goo.gl/KVpVVR)

The current size of all uncompressed databases is about 11 GB.

# Local datasets update
I recommend [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) app for self-updating via exchange API import. With one command you can import all new candles. For example, for dataset binance-usdt, use the command:
`./backtest.pl -i -p binance:USDT:ALL -f last -t now`
The rest is done automatically.

# Do you want to make a mirror?
Feel free if you want to process / modify the data contained in this repository. For those interested, I provide scripts whose task is to update datasets from last value to current time and share dumps on Google Drive. The [datasets.sh](datasets.sh) (main script) and [datasets_info.pl](datasets_info.pl) (generating detailed information about candles) files are located in the /root/gekko directory, and my separate copies for each datasets in the following subdirectories: binance-usdt, binance-btc, binance-bnb, binance-eth, poloniex-usdt, poloniex-xmr. Add the [datasets.sh](datasets.sh) file to cron, and the rest happens by itself. Scripts require: [Gekko](https://github.com/askmike/gekko), [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) and [Gdrive](https://github.com/prasmussen/gdrive).

# I wish you excellent results in backtests!
