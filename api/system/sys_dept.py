from datetime import datetime

from fastapi import Request, Depends
from sqlalchemy.orm import Session

from application.response import success, error
from models.system import SysDept
from form.system import UserInfo, DeptForm
from utils.data_utils import orm_all_to_dict, get_tree_data, get_tree_data_list, orm_one_to_dict
from utils.jwt_token import get_current_user
from utils.routing import APIRouter

router = APIRouter(tags=['部门'])


@router.get('/dept-tree/')
async def get_dept_tree(request: Request):
    """
    获取部门列表
    """
    db: Session = request.state.db
    dept_tuple_list = db.query(SysDept).all()
    dept_list = orm_all_to_dict(dept_tuple_list)
    tree_dept_list = get_tree_data_list(dept_list, str_id='dept_id')
    return success(data=tree_dept_list)


@router.get('/dept-tree-select/')
async def get_dept_tree_select(request: Request):
    db: Session = request.state.db
    db_dept_list = db.query(SysDept.dept_id.label("id"), SysDept.dept_name.label("label"), SysDept.parent_id).all()
    dept_tree_data = get_tree_data_list(orm_all_to_dict(db_dept_list))
    return success(depts=dept_tree_data)


@router.get("/dept-list/")
async def get_dept_list(request: Request, dept_name: str = None, status: str = None):
    db: Session = request.state.db
    db_query = db.query(SysDept)
    if dept_name:
        db_query = db_query.filter(SysDept.dept_name.like(f"%{dept_name}%"))
    if status:
        db_query = db_query.filter(SysDept.status == status)
    db_dept_list = db_query.filter(SysDept.status.in_(("1", '2'))).order_by(SysDept.sort).all()
    data_list = orm_all_to_dict(db_dept_list)
    if dept_name or status:
        return success(data=data_list)
    dept_tree_data = get_tree_data_list(data_list, str_id='dept_id')
    return success(data=dept_tree_data)


@router.get('/dept/{dept_id}')
async def get_dept_by_id(request: Request, dept_id: int):
    db: Session = request.state.db
    db_dept = db.query(SysDept).filter(SysDept.dept_id == dept_id).first()
    if db_dept is None:
        return error(message='部门不存在')
    return success(data=orm_one_to_dict(db_dept))


@router.put("/dept/")
async def update_dept(request: Request, form: DeptForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if db.query(SysDept).filter(SysDept.dept_id == form.dept_id).first() is None:
        return error(message="部门不存在")
    data = form.dict(exclude_none=True)
    data['update_by'] = user_info.user_id
    data['updated_at'] = datetime.now()
    db.query(SysDept).filter(SysDept.dept_id == form.dept_id).update(data)
    db.commit()
    return success(message='修改成功')


@router.post("/dept/")
async def add_dept(request: Request, form: DeptForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    data = form.dict(exclude_none=True, exclude={"dept_id"})
    data['create_by'] = user_info.user_id
    data['created_at'] = datetime.now()
    sys_dept = SysDept(**data)
    db.add(sys_dept)
    db.commit()
    return success(message='添加成功')


@router.delete("/dept/{dept_ids}")
async def delete_dept(request: Request, dept_ids: str, user_info: UserInfo = Depends(get_current_user)):
    dept_ids = dept_ids.split(',')
    db: Session = request.state.db
    data = {'status': 0, 'deleted_at': datetime.now(), 'update_by': user_info.user_id}
    db.query(SysDept).filter(SysDept.dept_id.in_(dept_ids)).update(data, synchronize_session=False)
    db.commit()
    return success(message='success')
