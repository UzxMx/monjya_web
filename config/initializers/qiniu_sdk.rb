logger = Logger.new(Rails.root.join("log", "qiniu.log"))
logger.formatter = Logger::Formatter.new
logger.datetime_format = "%Y-%m-%d %H:%M:%S"
Qiniu::Log.logger = logger
Qiniu.establish_connection! access_key: '6jKARJCUgfq2gjaDzOAC8oYe6h92G_iy4BvmREaZ', secret_key: '4Wv5Rp6PLsKVHE2IDMMc4wNfHV0NQ_zhH3fmGNZ3'
QINIU_CALLBACK_URL = 'http://121.42.248.212/api/qiniu/callback'