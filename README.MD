# What is it?
Ready to use [Gekko trading bot](https://github.com/askmike/gekko) SQLite dumps files. Just copy the file to the Gekko's history directory and you have: full history of Binance exchange for example. The files are updated daily after 23:15 GMT.

Currently available datasets:
- **Binance** - *BTC*, *BNB*, *ETH*, *USDT* (full history)
- **Bitfinex** - *EUR*, *GBP*, *JPY* (full history) 
- **Poloniex** - *USDT*, *XMR* (from 2017-07-01)
- **Kraken** - *XBT* (from 2017-07-01), *USD* (from 2017-10-01 - in progress)

Let me know if any dataset is broken - has missed candles, pairs or something.

# Download
Dumps are compressed by zip and stored on Google Drive, detailed information about candles are in .info files. 

Link: [drive.google.com](https://drive.google.com/drive/folders/1cdaEPTA2Z_DJWCkbfidlSJVg8gJinK78)

# Local datasets update
I recommend [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) app for self-updating via exchange API import. With one command you can import all new candles. For example, for dataset binance-usdt, use the command:
`./backtest.pl -i -p binance:USDT:ALL -f last -t now`
The rest is done automatically.

# Do you want to make a mirror?
Feel free if you want to process / modify the data contained in this repository. For those interested, I provide scripts whose task is to update datasets from last value to current time and share dumps on Google Drive. The [datasets.sh](datasets.sh) (main script) and [datasets_info.pl](datasets_info.pl) (generating detailed information about candles) files are located in the /root/gekko directory, and my separate copies for each datasets in the following subdirectories: binance-usdt, binance-btc, binance-bnb, binance-eth, poloniex-usdt, poloniex-xmr. Add the [datasets.sh](datasets.sh) file to cron, and the rest happens by itself. Scripts require: [Gekko](https://github.com/askmike/gekko), [Gekko-BacktestTool](https://github.com/xFFFFF/Gekko-BacktestTool) and [Gdrive](https://github.com/prasmussen/gdrive).

# Soon
- all possible pairs from Poloniex from July 1, 2017. ETH will be available first. BTC pairs are next.
- all possible pairs from Bitfinex from July 1, 2017. USD will be available first. BTC are next.
- all possible pairs from Kraken from July 1, 2017. USD will be available first. ETH are next.
- all possible pairs from Gdax from July 1, 2017. EUR will be available first. USD are next.

Can be more if someone tell me how import candles from other exchanges.
