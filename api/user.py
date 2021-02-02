from fastapi import Request, Depends
from sqlalchemy.orm import Session

from application.response import error, success

from models.system import SysUser, SysLoginLog, SysDept, SysPost, SysRole
from schemas.system import UserInfo, PasswordForm

from utils.data_utils import orm_one_to_dict
from utils.jwt_token import create_token, get_current_user
from fastapi.security import HTTPBasic, OAuth2PasswordRequestForm

from utils.routing import APIRouter

router = APIRouter()

security = HTTPBasic()


@router.post('/login', exclude_dependencies=True)
def login(request: Request, form: OAuth2PasswordRequestForm = Depends()):
    """登录"""
    db: Session = request.state.db
    # 获取登陆用户
    user: SysUser = db.query(SysUser.user_id, SysUser.username, SysUser.role_id, SysUser.avatar, SysUser.status).filter(
        SysUser.username == form.username, SysUser.password == form.password, SysUser.status.in_((1, 2))).first()
    if user is None:
        return error(message='账号或密码错误')
    if user.status == '1':
        return error(message='用户已被锁定, 无法登陆')
    dict_user = orm_one_to_dict(user)

    token = create_token(dict_user)
    return success(access_token=token, user=dict_user)


@router.post("/api/logout")
def logout(user_info: UserInfo = Depends(get_current_user)):
    # TODO 做redis清除token操作
    token = user_info.token
    return success(message='退出成功')


@router.get("/api/user/profile")
async def get_user_profile(request: Request, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    db_user = db.query(SysUser.username, SysUser.user_id, SysUser.dept_id, SysUser.post_id, SysUser.sex, SysUser.role_id, SysUser.nick_name, SysUser.status,
                       SysUser.avatar, SysUser.remark,
                       SysUser.phone, SysUser.created_at, SysUser.email,
                       SysDept.dept_name, SysPost.post_name, SysRole.role_name).filter(SysUser.user_id == user_info.user_id).first()
    if db_user is None:
        return error(message=f'用户id为空')
    return success(data=orm_one_to_dict(db_user))


@router.put("/api/user/pwd")
async def update_user_password(request: Request, form: PasswordForm, user_info: UserInfo = Depends(get_current_user)):
    db: Session = request.state.db
    if form.new_password1 != form.new_password2:
        return error(message='两次输入的密码不一致')
    db_user = db.query(SysUser).filter(SysUser.user_id == user_info.user_id).first()
    if db_user.password != form.old_password:
        return error(message="原密码不匹配")
    if db_user.password == form.new_password1:
        return error(message='密码不能相同')
    db_user.password = form.new_password1
    db.commit()
    return success(message="修改成功")
