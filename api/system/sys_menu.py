from datetime import datetime
from typing import List

from fastapi import Request, Depends
from sqlalchemy.orm import Session

from application.response import success, error
from models.system import SysMenu, SysRoleMenu
from schemas.system import UserInfo, MenuForm
from utils.data_utils import orm_all_to_dict, get_tree_data_list, orm_one_to_dict
from utils.jwt_token import get_current_user
from utils.routing import APIRouter

router = APIRouter(tags=['菜单'])


@router.get("/menurole")
async def get_user_menu(request: Request, user: UserInfo = Depends(get_current_user)):
    """获取用户菜单权限"""
    db: Session = request.state.db
    if user.username == "admin":
        all_menu_list: List[SysMenu] = db.query(SysMenu).filter(SysMenu.menu_type.in_(('M', 'C'))).all()
    else:
        all_menu_list: List[SysMenu] = db.query(SysMenu).join(SysRoleMenu, SysMenu.menu_id == SysRoleMenu.menu_id).filter(
            SysRoleMenu.role_id == user.role_id, SysMenu.menu_type.in_(('M', 'C'))).all()
    menu_list = orm_all_to_dict(all_menu_list)
    tree_menu_list = get_tree_data_list(result_list=menu_list, str_id='menu_id')
    return success(data=tree_menu_list)


@router.get("/menulist")
async def get_menu_list(request: Request, title: str = None, visible: str = None):
    """
    获取用户菜单权限
    """
    # 用户所属的角色
    db: Session = request.state.db
    db_query = db.query(SysMenu)
    if title:
        db_query = db_query.filter(SysMenu.title.like(f"%{title}%"))
    if visible:
        db_query = db_query.filter(SysMenu.visible == visible)
    all_menu_list: List[SysMenu] = db_query.order_by(SysMenu.sort).all()
    menu_list = orm_all_to_dict(all_menu_list)
    # 使用程序处理树形结构, 使用程序会比访问数据快
    tree_menu_list = get_tree_data_list(result_list=menu_list, str_id='menu_id')
    return success(data=tree_menu_list)


@router.get('/menu/{menu_id}')
async def get_menu(request: Request, menu_id: int):
    db: Session = request.state.db
    db_menu = db.query(SysMenu).filter(SysMenu.menu_id == menu_id).first()
    if not db_menu:
        return error(message='没有找到该菜单信息！')
    menu_info = orm_one_to_dict(db_menu)
    return success(data=menu_info)


@router.put("/menu")
async def update_menu(request: Request, form: MenuForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if db.query(SysMenu).filter(SysMenu.menu_id == form.menu_id).first() is None:
        return error(message="菜单不存在")
    data = form.dict(exclude_none=True)
    data['update_by'] = user_info.user_id
    data['updated_at'] = datetime.now()
    db.query(SysMenu).filter(SysMenu.menu_id == form.menu_id).update(data)
    db.commit()
    return success(message='修改成功')


@router.post("/menu")
async def update_menu(request: Request, form: MenuForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    data = form.dict(exclude_none=True, exclude={'menu_id'})
    data['create_by'] = user_info.user_id
    data['created_at'] = datetime.now()
    menu = SysMenu(**data)
    db.add(menu)
    db.commit()
    return success(message='创建成功')


@router.delete("/menu/{menu_id}")
async def delete_menu(request: Request, menu_id: str):
    db: Session = request.state.db
    db.query(SysMenu).filter(SysMenu.menu_id == menu_id).delete(synchronize_session=False)
    db.commit()
    return success(message='success')


@router.get("/menuTreeselect")
async def get_menu_treeselect(request: Request):
    db: Session = request.state.db
    db_menu_list = db.query(SysMenu.menu_id.label("id"), SysMenu.title.label('label'), SysMenu.parent_id).all()
    menu_tree_data = get_tree_data_list(orm_all_to_dict(db_menu_list))
    return success(menus=menu_tree_data)
