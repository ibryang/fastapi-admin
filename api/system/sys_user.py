from datetime import datetime
from typing import List

from fastapi import Depends, Request
from sqlalchemy.orm import Session

from application.response import success, error
from models.system import SysUser, SysDept, SysRole, SysPost, SysMenu, SysRoleMenu
from schemas.system import UserInfo, UserForm
from utils.data_utils import orm_all_to_dict, orm_one_to_dict
from utils.jwt_token import get_current_user
from utils.routing import APIRouter

router = APIRouter(tags=["用户"])


@router.get("/getinfo")
async def get_info(request: Request, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    db_user: SysUser = db.query(SysUser.avatar, SysUser.dept_id, SysUser.nick_name,
                                SysUser.remark, SysUser.role_id, SysUser.user_id, SysUser.username,
                                SysRole.role_key).join(
        SysRole, SysRole.role_id == SysUser.role_id).filter(
        SysUser.user_id == user_info.user_id).first()
    if db_user is None:
        return error(message='用户不存在')
    if user_info.username == 'admin':
        permission = ["*:*:*"]
    else:
        db_menu_permission: List[SysMenu] = db.query(SysMenu.permission).join(SysRoleMenu, SysMenu.menu_id == SysRoleMenu.menu_id).filter(
            SysRoleMenu.role_id == db_user.role_id, SysMenu.menu_type == "F").all()
        permission = [i.permission for i in db_menu_permission]
    data = {
        "avatar": db_user.avatar,
        "buttons": ["*:*:*"],
        "dept_id": db_user.dept_id,
        "introduction": db_user.remark,
        "name": db_user.username,
        "permissions": permission,
        "roles": [db_user.role_key],
        "user_id": db_user.user_id,
        "username": db_user.nick_name,
    }
    return {"code": 200, "message": "", "data": data}


#
#
# def get_child_dept(db, dept_id):
#     """
#     递归获取所有子部门的id
#     """
#     dept_ids = [dept_id]
#     db_depts = db.query(SysDept.id).filter(SysDept.state == SysState.normal, SysDept.parent_id == dept_id).all()
#     if db_depts:
#         dept_ids.extend([x[0] for x in db_depts])
#         for db_dept in db_depts:
#             get_child_dept(db, db_dept[0])
#     return tuple(dept_ids)


@router.get("/sysUserList")
async def get_user_list(request: Request, username: str = None, dept_id: int = None, phone: str = None, page: int = 1, page_size: int = 10):
    """
    获取用户列表≤
    """
    start = (page - 1) * page_size
    db: Session = request.state.db
    # 获取用户
    db_user = db.query(SysUser.username, SysUser.user_id, SysUser.dept_id, SysUser.role_id, SysUser.nick_name, SysUser.status, SysUser.avatar,
                       SysUser.phone, SysUser.created_at, SysUser.email,
                       SysDept.dept_name).join(SysDept, SysUser.dept_id == SysDept.dept_id).filter(SysUser.status.in_((1, 2)))
    if dept_id:
        # 递归获取部门下面的所有子部门信息
        db_user = db_user.filter(SysUser.dept_id == dept_id)
    if phone:
        db_user = db_user.filter(SysUser.phone.like('%' + phone + '%'))
    if username:
        db_user = db_user.filter(SysUser.username.like('%' + username + '%'))
    total = db_user.count()
    db_user_list = db_user.limit(page_size).offset(start).all()
    user_list = orm_all_to_dict(db_user_list)
    return success(data={'list': user_list, 'total': total})


@router.get("/sysUser")
async def get_post_role(request: Request):
    db: Session = request.state.db
    db_post_list = db.query(SysPost).filter(SysPost.status == 2).all()
    db_role_list = db.query(SysRole).filter(SysRole.status == 2).all()
    return success(data={"roles": orm_all_to_dict(db_role_list), "posts": orm_all_to_dict(db_post_list)})


@router.get("/sysUser/{user_id}")
async def get_user_by_id(request: Request, user_id: int):
    db: Session = request.state.db
    db_user = db.query(SysUser.username, SysUser.user_id, SysUser.dept_id, SysUser.post_id, SysUser.sex, SysUser.role_id, SysUser.nick_name, SysUser.status,
                       SysUser.avatar, SysUser.remark,
                       SysUser.phone, SysUser.created_at, SysUser.email,
                       SysDept.dept_name, SysPost.post_name, SysRole.role_name).filter(SysUser.user_id == user_id).first()
    if db_user is None:
        return error(message=f'User({user_id}) Not Found')
    db_post_list = db.query(SysPost).filter(SysPost.status == 2).all()
    db_role_list = db.query(SysRole).filter(SysRole.status == 2).all()
    return success(data=orm_one_to_dict(db_user), roles=orm_all_to_dict(db_role_list), posts=orm_all_to_dict(db_post_list))


@router.put("/sysUser")
async def update_user(request: Request, form: UserForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    res = db.query(SysUser.user_id).filter_by(user_id=form.user_id).first()
    if res is None:
        return error(message=f"未找到此用户")
    if form.username:
        data = form.dict(exclude_none=True, exclude={'username', 'password'})
    elif form.password == 'reset_user_pwd':
        data = {'password': '123456'}
    data['updated_at'] = datetime.now()
    data['update_by'] = user_info.user_id
    db.query(SysUser.user_id).filter_by(user_id=form.user_id).update(data)
    db.commit()
    return success(message='更新成功')


@router.post("/sysUser")
async def add_user(request: Request, form: UserForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if db.query(SysUser).filter_by(username=form.username).first():
        return error(message=f"用户已存在")
    data = form.dict(exclude_none=True, exclude={'user_id', 'password'})
    data['password'] = '123456'
    data['created_at'] = datetime.now()
    data['create_by'] = user_info.user_id
    user = SysUser(**data)
    db.add(user)
    db.commit()
    return success(message='创建成功')


@router.delete("/sysUser/{user_ids}")
async def delete_user(request: Request, user_ids: str, user_info: UserInfo = Depends(get_current_user)):
    user_ids = user_ids.split(",")
    db: Session = request.state.db
    db.query(SysUser).filter(SysUser.user_id.in_(user_ids)).update({"status": 0, "deleted_at": datetime.now(), "update_by": user_info.user_id},
                                                                   synchronize_session=False)
    db.commit()
    return success(message='success')
