# '数据库类型+数据库驱动名称://用户名:数据库密码@数据库连接地址:端口号/数据库名'
# 数据库连接, 多个数据库可用元组
DB_CONN_URI = "mysql+pymysql://root:admin123@localhost:3306/fastapi_admin?charset=utf8mb4"

# redis连接
REDIS_HOST = "127.0.0.1"
REDIS_PORT = 6379
REDIS_DB = 10
REDIS_TIME_OUT = 5 * 60 * 60  # 缓存时间默认三小时

# 是否记录操作日志
OPEN_OPERATION_LOG = True
# 是否记录查询操作日志
OPEN_QUERY_OPERATION_LOG = False
# 操作日志查询
LOG_QUERY = "query"
# 操作日志保存
LOG_SAVE = "save"
# 操作日志删除
LOG_DELETE = "delete"

# 当前登录系统的用户
CURR_SYS_USER = 'CURR_SYS_USER'

# 跨域白名单
ALLOW_ORIGINS = ['*']

# 默认文件存放根目录文件
STATIC_DIR = 'static'

# 返回结果代码
HTTP_200 = 200  # 请求正常
HTTP_400 = 400  # 登录报错
HTTP_403 = 403  # token失效，强制退出登录
HTTP_404 = 404  # 系统报错

# 系统设置
NAME = 'ibry后台管理系统'
LOGO = 'http://127.0.0.1:8888/static/logo/logo.png'
HEADER_IMG = 'http://127.0.0.1:8888/static/logo/header.jpg'

'''token验证'''
SECRET_KEY = "09d25e094faa6ca2556c818166b7a9563b93f7099f6f0f4caa6cf63b88e8d3e7"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60 * 12  # 过期时间分钟, 默认30分钟*24小时

'''md5加密'''
MD5_SECRET_KEY = "c818166b7a9563"


class SysState:
    """
    0 表示删除
    1 表示正常
    2 表示锁定
    """
    delete = 0
    normal = 1
    locking = 2
