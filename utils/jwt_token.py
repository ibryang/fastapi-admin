from datetime import timedelta, datetime

import jwt
from fastapi import HTTPException, Depends
from fastapi.security import OAuth2PasswordBearer
from jwt import ExpiredSignatureError

from application import logger
from application.config import SECRET_KEY, ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES, SysState
from schemas.system import UserInfo

write = ['/api/system/auth/get-user-menu', '/api/system/auth/get-user-info']

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")


def get_current_user(token: str = Depends(oauth2_scheme)) -> UserInfo:
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    except ExpiredSignatureError:
        raise HTTPException(status_code=401, detail='token 过期请重新登陆')
    except Exception as e:
        logger.logger.error(e)
        raise HTTPException(status_code=401, detail='token 验证失败')
    user_info = UserInfo(**payload)
    user_info.token = token
    return user_info


def create_token(data: dict, expires_time: int = ACCESS_TOKEN_EXPIRE_MINUTES) -> str:
    """
    生成jwt token
    :param data: 数据
    :param expires_time: 过期时间，分钟
    :return: token
    """
    to_encode = data.copy()
    token_expires = timedelta(minutes=expires_time)
    expire = datetime.utcnow() + token_expires
    to_encode.update({"exp": expire})
    token = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM).decode()
    return token
