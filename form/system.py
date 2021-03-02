from typing import List

from pydantic import BaseModel


class LoginForm(BaseModel):
    username: str
    password: str


class UserInfo(BaseModel):
    user_id: int = None
    username: str = None
    nickname: str = None
    role_id: str = None
    token: str = None


class UserForm(BaseModel):
    user_id: int = None
    username: str = None
    nick_name: str = None
    password: str = None
    phone: str = None
    role_id: int = None
    sex: int = None
    email: str = None
    dept_id: int = None
    post_id: int = None
    remark: str = None
    status: str = None


class MenuForm(BaseModel):
    menu_id: int = None
    menu_name: str = None
    title: str = None
    icon: str = None
    path: str = None
    paths: str = None
    menu_type: str = None
    action: str = None
    permission: str = None
    parent_id: int = None
    no_cache: int = None
    breadcrumb: str = None
    component: str = None
    sort: int = None
    visible: str = None
    is_frame: str = None


class RoleForm(BaseModel):
    role_id: int = None
    role_name: str = None
    status: str = None
    role_key: str = None
    role_sort: int = None
    flag: str = None
    remark: str = None
    admin: int = None
    data_scope: str = None


class DeptForm(BaseModel):
    dept_id: int = None
    parent_id: int = None
    dept_path: str = None
    dept_name: str = None
    sort: int = None
    leader: str = None
    phone: str = None
    email: str = None
    status: str = None


class PostForm(BaseModel):
    post_id: int = None
    post_name: str = None
    post_code: str = None
    sort: int = None
    status: str = None
    remark: str = None


class RoleDeptMenuForm(BaseModel):
    role: RoleForm = None
    role_id: int = None
    status: str = None
    menu_ids: List[int] = []
    dept_ids: List[int] = []


class PasswordForm(BaseModel):
    new_password1: str
    new_password2: str
    old_password: str
