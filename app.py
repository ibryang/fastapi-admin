import fastapi
from fastapi import FastAPI, routing

from application.router import register_exception, register_middleware, register_router

import uvicorn
from fastapi.staticfiles import StaticFiles
from utils.routing import APIRouter as MyAPIRouter

fastapi.APIRouter = routing.APIRouter = MyAPIRouter
app = FastAPI(docs_url="/docs", redoc_url=None)

# 注册全局路由
register_router(app)

# 注册异常
register_exception(app)

# 注册中间件
register_middleware(app)

# 对静态文件放行
app.mount("/static", StaticFiles(directory="static"), name="static")

if __name__ == '__main__':
    uvicorn.run("app:app", host='127.0.0.1', port=8888, reload=True)
