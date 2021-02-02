from fastapi import Request
from sqlalchemy.orm import Session

from application.response import success
from models.system import SysLoginLog, SysOperaLog
from utils.data_utils import orm_all_to_dict
from utils.routing import APIRouter

router = APIRouter()


@router.get('/sys-login-log')
async def get_login_log_list(request: Request, username: str = None, ipaddr: str = None, page: int = 1, page_size: int = 10):
    start = (page - 1) * page_size
    db: Session = request.state.db
    db_query = db.query(SysLoginLog)
    if ipaddr:
        db_query = db_query.filter(SysLoginLog.ipaddr == ipaddr)
    if username:
        db_query = db_query.filter(SysLoginLog.username.like('%' + username + '%'))
    total = db_query.count()
    db_query_list = db_query.limit(page_size).offset(start).all()
    data_list = orm_all_to_dict(db_query_list)
    return success(data={'list': data_list, 'total': total})


@router.get('/sys-opera-log')
async def get_opera_log_list(request: Request, title: str = None, page: int = 1, page_size: int = 10):
    start = (page - 1) * page_size
    db: Session = request.state.db
    db_query = db.query(SysOperaLog)
    if title:
        db_query = db_query.filter(SysOperaLog.title.like('%' + title + '%'))
    total = db_query.count()
    db_query_list = db_query.limit(page_size).offset(start).all()
    data_list = orm_all_to_dict(db_query_list)
    return success(data={'list': data_list, 'total': total})
