import datetime

from sqlalchemy import create_engine, Column, BigInteger, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session, Session

from application import config
from schemas.system import UserInfo

engine = create_engine(config.DB_CONN_URI, pool_pre_ping=True)
# 创建连接工厂，关闭自动提交和自动刷新， 工厂（给它传值，它会返回一个结果给你）
session_factory = sessionmaker(bind=engine)
# 类似单例模式，线程安全
SessionLocal = scoped_session(session_factory)

Base = declarative_base()


class BaseModel(Base):
    __abstract__ = True

    create_by = Column(BigInteger, nullable=True, index=True, comment="'创建者'")
    update_by = Column(BigInteger, nullable=True, index=True, comment="'更新者'")
    created_at = Column(DateTime, nullable=True, comment="'创建时间'")
    updated_at = Column(DateTime, nullable=True, comment="'最后更新时间'")
    deleted_at = Column(DateTime, nullable=True, comment="'删除时间'")
