from typing import List

from fastapi import Response, Request, HTTPException
from sqlalchemy.orm import Session

from application.logger import logger
from application.response import error
from models.base import SessionLocal
from models.system import SysMenu, SysRoleMenu
from utils.jwt_token import get_current_user

router_write_list = ['/login', '/settings', '/index']


def permission_verify(request: Request) -> bool:
    if request.scope['path'] not in router_write_list:
        token = request.headers.get("Authorization")
        print(token)
        if request.method.lower() == 'options':
            return True
        if token:
            token = token[7:]
            res = get_current_user(token=token)
            print(res)
            if res.username == 'admin':
                return True
            if res.user_id:
                db: Session = request.state.db
                db_menu_permission: List[SysMenu] = db.query(SysMenu.path, SysMenu.action).join(SysRoleMenu, SysMenu.menu_id == SysRoleMenu.menu_id).filter(
                    SysRoleMenu.role_id == res.role_id, SysMenu.menu_type == "A").all()
                for menu_perm in db_menu_permission:
                    print(menu_perm.action, menu_perm.path, "|", request.scope['path'], request.method)
                    if menu_perm.path == request.scope['path'] and menu_perm.action.lower() == request.method.lower():
                        print('权限通过')
                        return True
                else:
                    return False
            return False
        return False
    return True


async def session_middleware(request: Request, call_next) -> Response:
    response = Response(content='请求页面不存在...', status_code=404)
    try:
        request.state.db = SessionLocal()
        # result = permission_verify(request)
        response = await call_next(request)
    finally:
        request.state.db.close()
    ip = request.client.host
    port = request.client.port
    path = request.scope['path']
    method = request.method
    params = request.query_params
    logger.info(f"[{ip}:{port}|{path}|{method}|{params if params else None}|{response.status_code}]")
    return response
