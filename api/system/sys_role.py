from datetime import datetime

from fastapi import Request, Depends
from sqlalchemy.orm import Session

from application.response import success, error
from models.system import SysRole, SysRoleMenu, SysRoleDept
from schemas.system import UserInfo, RoleDeptMenuForm
from utils.data_utils import orm_all_to_dict, orm_one_to_dict
from utils.jwt_token import get_current_user
from utils.routing import APIRouter

router = APIRouter()


@router.get("/rolelist")
async def get_role_list(request: Request, page: int = 1, page_size: int = 10, role_name: str = None, role_key: str = None, status: str = None):
    """
    获取用户列表≤
    """
    start = (page - 1) * page_size
    db: Session = request.state.db
    # 获取用户
    db_query = db.query(SysRole).filter(SysRole.status.in_(('1', '2')))
    if role_name:
        db_query = db_query.filter(SysRole.role_name.like('%' + role_name + '%'))
    if role_key:
        db_query = db_query.filter(SysRole.role_key.like('%' + role_key + '%'))
    if status:
        db_query = db_query.filter(SysRole.status == status)
    db_query = db_query.filter(SysRole.status.in_((1, 2))).order_by(SysRole.role_sort).limit(page_size).offset(start)
    total = db_query.count()
    db_role_list = db_query.all()
    role_list = orm_all_to_dict(db_role_list)
    return success(data={'list': role_list, 'total': total})


@router.get('/role/{role_id}')
async def get_role_by_id(request: Request, role_id: int):
    db: Session = request.state.db
    db_role = db.query(SysRole).filter(SysRole.role_id == role_id).first()
    if db_role is None:
        return error(message='角色不存在')
    db_menu_list = db.query(SysRoleMenu.menu_id).filter(SysRoleMenu.role_id == role_id).all()
    role_menu_ids = [k[0] for k in db_menu_list]
    db_dept_list = db.query(SysRoleDept.dept_id).filter(SysRoleDept.role_id == role_id).all()
    role_dept_ids = [k[0] for k in db_dept_list]
    return success(role=orm_one_to_dict(db_role), menus=role_menu_ids, depts=role_dept_ids)


@router.put("/role")
async def save_role_menu(request: Request, form: RoleDeptMenuForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if form.role:
        if form.role.role_id is None:
            return error(message='角色不能为空')
        if db.query(SysRole).filter(SysRole.role_id == form.role.role_id).first() is None:
            return error(message='角色不存在')
        data = form.role.dict(exclude_none=True)
        data['update_by'] = user_info.user_id
        data['updated_at'] = datetime.now()
        db.query(SysRole).filter(SysRole.role_id == form.role.role_id).update(data)
        # 菜单权限设置
        db_role_menu = db.query(SysRoleMenu.menu_id).filter(SysRoleMenu.role_id == form.role.role_id).all()
        role_menu_list = [x[0] for x in db_role_menu]
        add_menu_ids = list(set(form.menu_ids).difference(set(role_menu_list)))
        del_menu_ids = list(set(role_menu_list).difference(set(form.menu_ids)))
        db.query(SysRoleMenu).filter(SysRoleMenu.role_id == form.role.role_id, SysRoleMenu.menu_id.in_(del_menu_ids)).delete(synchronize_session=False)
        add_role_menu_list = []
        for menu_id in add_menu_ids:
            new_role_menu = SysRoleMenu(menu_id=menu_id, role_id=form.role.role_id, create_by=user_info.user_id, role_name=form.role.role_name)
            add_role_menu_list.append(new_role_menu)
        db.add_all(add_role_menu_list)
        if form.role_id and form.status:
            data = {'updated_at': datetime.now(), 'update_by': user_info.user_id, 'status': form.status}
        db.query(SysRole).filter(SysRole.role_id == form.role_id).update(data, synchronize_session=False)
        db.commit()
    return success(message='修改成功')


@router.put('/roledatascope')
async def update_role_data(request: Request, form: RoleDeptMenuForm, user_info: UserInfo = Depends(get_current_user)):
    if form.role.role_id is None:
        return error(message='角色不能为空')
    db: Session = request.state.db
    if db.query(SysRole).filter(SysRole.role_id == form.role.role_id).first() is None:
        return error(message='角色不存在')
    db_role_dept = db.query(SysRoleDept.dept_id).filter(SysRoleDept.role_id == form.role.role_id).all()
    role_dept_list = [x[0] for x in db_role_dept]
    add_dept_ids = list(set(form.dept_ids).difference(set(role_dept_list)))
    del_dept_ids = list(set(role_dept_list).difference(set(form.dept_ids)))
    db.query(SysRoleDept).filter(SysRoleDept.role_id == form.role.role_id, SysRoleDept.dept_id.in_(del_dept_ids)).delete(synchronize_session=False)
    add_role_dept_list = []
    for dept_id in add_dept_ids:
        new_role_dept = SysRoleDept(dept_id=dept_id, role_id=form.role.role_id)
        add_role_dept_list.append(new_role_dept)
    data = {'update_by': user_info.user_id, 'updated_at': datetime.now(), 'data_scope': form.role.data_scope}
    db.query(SysRole).filter(SysRole.role_id == form.role.role_id).update(data)
    db.add_all(add_role_dept_list)
    db.commit()
    return success(message='修改成功')


@router.post("/role")
async def add_role(request: Request, form: RoleDeptMenuForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    role = form.role.dict(exclude_none=True, exclude={'role_id'})
    sys_role = SysRole(create_by=user_info.user_id, created_at=datetime.now(), **role)
    db.add(sys_role)
    db.flush()
    add_role_dept_list = []
    for menu_ids in form.menu_ids:
        new_role_dept = SysRoleMenu(menu_id=menu_ids, role_name=form.role.role_name, role_id=sys_role.role_id, create_by=user_info.user_id)
        add_role_dept_list.append(new_role_dept)
    db.add_all(add_role_dept_list)
    db.commit()
    return success(message='新增成功')


@router.delete("/role/{role_ids}")
async def add_role(request: Request, role_ids: str, user_info: UserInfo = Depends(get_current_user)):
    role_ids = role_ids.split(',')
    db: Session = request.state.db
    data = {'status': 0, 'deleted_at': datetime.now(), 'update_by': user_info.user_id}
    db.query(SysRole).filter(SysRole.role_id.in_(role_ids)).update(data, synchronize_session=False)
    db.commit()
    return success(message='新增成功')
