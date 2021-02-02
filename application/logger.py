import os
from loguru import logger

basedir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))

# 定位到log日志文件
log_path = os.path.join(basedir, 'logs')

if not os.path.exists(log_path):
    os.mkdir(log_path)

log_path_error = os.path.join(log_path, 'all.log')

# 具体其他配置 可自行参考
logger.add(log_path_error, rotation="00:00", retention="7 days", enqueue=True)
