from datetime import datetime

from fastapi import Request, Depends
from sqlalchemy.orm import Session

from application.response import success, error
from models.system import SysPost
from form.system import UserInfo, PostForm
from utils.data_utils import orm_all_to_dict, orm_one_to_dict
from utils.jwt_token import get_current_user
from utils.routing import APIRouter

router = APIRouter(tags=['岗位'])


@router.get('/post-list/')
async def get_post_list(request: Request, post_name: str = None, status: str = None, page: int = 1, page_size: int = 10):
    start = (page - 1) * page_size
    db: Session = request.state.db
    db_query = db.query(SysPost)
    if status:
        db_query = db_query.filter(SysPost.status == status)
    if post_name:
        db_query = db_query.filter(SysPost.post_name.like('%' + post_name + '%'))
    db_query = db_query.filter(SysPost.status.in_((1, 2))).order_by(SysPost.sort).limit(page_size).offset(start)
    total = db_query.count()
    db_query_list = db_query.all()
    data_list = orm_all_to_dict(db_query_list)
    return success(data={'list': data_list, 'total': total})


@router.get('/post/{post_id}')
async def get_post_by_id(request: Request, post_id: int):
    db: Session = request.state.db
    db_query = db.query(SysPost).filter(SysPost.post_id == post_id).first()
    if db_query is None:
        return error(message='部门不存在')
    return success(data=orm_one_to_dict(db_query))


@router.put("/post/")
async def update_post(request: Request, form: PostForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if db.query(SysPost).filter(SysPost.post_id == form.post_id).first() is None:
        return error(message="部门不存在")
    data = form.dict(exclude_none=True)
    data['update_by'] = user_info.user_id
    data['updated_at'] = datetime.now()
    db.query(SysPost).filter(SysPost.post_id == form.post_id).update(data)
    db.commit()
    return success(message='修改成功')


@router.post("/post/")
async def add_post(request: Request, form: PostForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    data = form.dict(exclude_none=True, exclude={"post_id"})
    data['create_by'] = user_info.user_id
    data['created_at'] = datetime.now()
    sys_post = SysPost(**data)
    db.add(sys_post)
    db.commit()
    return success(message='添加成功')


@router.delete("/post/{post_ids}")
async def delete_post(request: Request, post_ids: str, user_info: UserInfo = Depends(get_current_user)):
    post_ids = post_ids.split(',')
    db: Session = request.state.db
    data = {'status': 0, 'deleted_at': datetime.now(), 'update_by': user_info.user_id}
    db.query(SysPost).filter(SysPost.post_id.in_(post_ids)).update(data, synchronize_session=False)
    db.commit()
    return success(message='success')
