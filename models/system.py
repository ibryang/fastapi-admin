from sqlalchemy import BigInteger, Column, String, Integer, DateTime, SmallInteger, text
from sqlalchemy.dialects.mysql import TINYINT

from models.base import BaseModel, Base


class SysUser(BaseModel):
    __tablename__ = 'sys_user'

    user_id = Column(BigInteger, primary_key=True)
    username = Column(String(64), nullable=False)
    password = Column(String(128), nullable=False)
    nick_name = Column(String(128), nullable=True)
    phone = Column(String(11), nullable=True)
    role_id = Column(BigInteger, nullable=False)
    salt = Column(String(255), nullable=True)
    avatar = Column(String(255), nullable=True)
    sex = Column(String(255), nullable=True)
    email = Column(String(128), nullable=True)
    dept_id = Column(BigInteger, nullable=True)
    post_id = Column(BigInteger, nullable=True)
    remark = Column(String(255), nullable=True)
    status = Column(String(4), nullable=True)


class SysRole(BaseModel):
    __tablename__ = 'sys_role'

    role_id = Column(BigInteger, primary_key=True)
    role_name = Column(String(128))
    status = Column(String(4), nullable=True)
    role_key = Column(String(128), nullable=True)
    role_sort = Column(BigInteger, nullable=True)
    flag = Column(String(128), nullable=True)
    remark = Column(String(255), nullable=True)
    admin = Column(TINYINT(1), nullable=True)
    data_scope = Column(String(128), nullable=True)


class SysMenu(BaseModel):
    __tablename__ = 'sys_menu'

    menu_id = Column(BigInteger, primary_key=True)
    menu_name = Column(String(128))
    title = Column(String(128), nullable=True)
    icon = Column(String(128), nullable=True)
    path = Column(String(128), nullable=True)
    paths = Column(String(128), nullable=True)
    menu_type = Column(String(1), nullable=True)
    action = Column(String(16), nullable=True)
    permission = Column(String(255), nullable=True)
    parent_id = Column(SmallInteger, nullable=True)
    no_cache = Column(TINYINT(1), nullable=True)
    breadcrumb = Column(String(255), nullable=True)
    component = Column(String(255), nullable=True)
    sort = Column(TINYINT, nullable=True)
    visible = Column(String(1), nullable=True)
    is_frame = Column(String(1), server_default=text("'0'"), nullable=True)


class SysDept(BaseModel):
    __tablename__ = 'sys_dept'

    dept_id = Column(BigInteger, primary_key=True)
    parent_id = Column(BigInteger)
    dept_path = Column(String(255))
    dept_name = Column(String(128))
    sort = Column(BigInteger, nullable=True)
    leader = Column(String(128), nullable=True)
    phone = Column(String(11), nullable=True)
    email = Column(String(64), nullable=True)
    status = Column(String(4), nullable=True)


class SysOperaLog(BaseModel):
    __tablename__ = 'sys_opera_log'

    id = Column(BigInteger, primary_key=True)
    title = Column(String(255), comment='操作模块')
    business_type = Column(String(128), comment='操作类型')
    business_types = Column(String(128), comment='BusinessTypes')
    method = Column(String(128), comment='函数')
    request_method = Column(String(128), comment='请求方式')
    operator_type = Column(String(128), comment='操作类型')
    oper_name = Column(String(128), comment='操作者')
    dept_name = Column(String(128), comment='部门名称')
    oper_url = Column(String(255), comment='访问地址')
    oper_ip = Column(String(128), comment='客户端ip')
    oper_location = Column(String(128), comment='访问位置')
    oper_param = Column(String(255), comment='请求参数')
    status = Column(String(4), comment='操作状态')
    oper_time = Column(DateTime, comment='操作时间')
    json_result = Column(String(255), comment='返回数据')
    remark = Column(String(255), comment='备注')
    latency_time = Column(String(128), comment='耗时')
    user_agent = Column(String(255), comment='ua')


class SysPost(BaseModel):
    __tablename__ = 'sys_post'

    post_id = Column(BigInteger, primary_key=True)
    post_name = Column(String(128))
    post_code = Column(String(128), nullable=True)
    sort = Column(BigInteger, nullable=True)
    status = Column(String(4), nullable=True)
    remark = Column(String(255), nullable=True)


class SysRoleDept(Base):
    __tablename__ = 'sys_role_dept'
    id = Column(BigInteger, primary_key=True)
    role_id = Column(BigInteger)
    dept_id = Column(BigInteger)


class SysRoleMenu(Base):
    __tablename__ = 'sys_role_menu'
    id = Column(BigInteger, primary_key=True)
    role_id = Column(BigInteger)
    menu_id = Column(BigInteger)
    role_name = Column(String(256))
    create_by = Column(BigInteger, nullable=True, index=True, comment="'创建者'")
    update_by = Column(BigInteger, nullable=True, index=True, comment="'更新者'")


class SysSetting(BaseModel):
    __tablename__ = 'sys_setting'

    settings_id = Column(BigInteger, primary_key=True)
    name = Column(String(256), nullable=True)
    logo = Column(String(256), nullable=True)


class SysFileDir(BaseModel):
    __tablename__ = 'sys_file_dir'

    id = Column(BigInteger, primary_key=True)
    label = Column(String(255), comment='目录名称', nullable=True)
    p_id = Column(Integer, comment='上级目录', nullable=True)
    sort = Column(BigInteger, comment='排序', nullable=True)
    path = Column(String(255), comment='路径', nullable=True)


class SysFileInfo(BaseModel):
    __tablename__ = 'sys_file_info'

    id = Column(BigInteger, primary_key=True)
    type = Column(String(255), comment='类型')
    name = Column(String(255), comment='名称')
    size = Column(Integer, comment='大小', nullable=True)
    p_id = Column(Integer, comment='上级目录', nullable=True)
    source = Column(String(255), comment='来源', nullable=True)
    url = Column(String(255), comment='地址', nullable=True)
    full_url = Column(String(255), comment='全地址', nullable=True)


class SysLoginLog(BaseModel):
    __tablename__ = 'sys_login_log'

    id = Column(BigInteger, primary_key=True)
    username = Column(String(128), comment='用户名', nullable=True)
    status = Column(String(4), comment='状态', nullable=True)
    ipaddr = Column(String(255), comment='ip地址', nullable=True)
    login_location = Column(String(255), comment='归属地', nullable=True)
    browser = Column(String(255), comment='浏览器', nullable=True)
    os = Column(String(255), comment='系统', nullable=True)
    platform = Column(String(255), comment='固件', nullable=True)
    login_time = Column(DateTime, comment='登录时间', nullable=True)
    remark = Column(String(255), comment='备注', nullable=True)
    msg = Column(String(255), comment='信息', nullable=True)
