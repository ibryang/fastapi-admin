from datetime import timedelta, datetime

import jwt
from fastapi import HTTPException, Depends, Request
from fastapi.security import OAuth2PasswordBearer
from jwt import ExpiredSignatureError
from sqlalchemy.orm import Session

from application import logger
from application.config import SECRET_KEY, ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES
from form.system import UserInfo
from models.base import SessionLocal
from models.system import SysMenu, SysRoleMenu

write = ['/api/system/auth/user-menu', '/api/system/auth/user-info']

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")


def permission_verify(request, user_info: UserInfo) -> bool:
    """校验接口权限"""
    if request.method.lower() == 'options':
        return True
    path = request.scope['path']
    if user_info.username == 'admin':
        return True
    db: Session = SessionLocal()
    if path.endswith("/") is False:
        index = path.rfind('/')
        path = path[:index + 1]
    db_menu_permission: SysMenu = db.query(SysMenu.menu_id).join(SysRoleMenu, SysMenu.menu_id == SysRoleMenu.menu_id).filter(
        SysRoleMenu.role_id == user_info.role_id, SysMenu.menu_type == "A", SysMenu.path.like("%" + path + "%"),
        SysMenu.action == request.method).first()
    db.close()
    if db_menu_permission:
        return True
    else:
        return False


def get_current_user(request: Request, token: str = Depends(oauth2_scheme)) -> UserInfo:
    """获取当前用户, 并判断是否具有接口权限"""

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
    except ExpiredSignatureError:
        raise HTTPException(status_code=401, detail='token 过期请重新登陆')
    except Exception as e:
        logger.logger.error(e)
        raise HTTPException(status_code=401, detail='token 验证失败')

    user_info = UserInfo(**payload)
    user_info.token = token
    result = permission_verify(request, user_info)
    if result:
        return user_info
    else:
        raise HTTPException(status_code=402, detail="无权限操作")


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
