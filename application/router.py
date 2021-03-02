from fastapi import FastAPI, HTTPException, Request, Depends
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from starlette.middleware.cors import CORSMiddleware

from api import base, system, user
from application.logger import logger
from application.response import error

from middleware.http_middleware import session_middleware
from middleware.server_middleware import MyServerErrorMiddleware
from utils.jwt_token import get_current_user
from utils.routing import APIRouter


def register_router(app: FastAPI):
    # 注册路由
    router = APIRouter(dependencies=[Depends(get_current_user)])

    router.include_router(base.router)
    router.include_router(system.router)
    router.include_router(user.router)

    app.include_router(router)


def register_exception(app: FastAPI):
    # 注册异常

    # 自定义http异常
    @app.exception_handler(HTTPException)
    async def unicorn_exception_handler(request: Request, exc: HTTPException):
        return error(code=exc.status_code, message=exc.detail)

    # 自定义请求体验证错误
    @app.exception_handler(RequestValidationError)
    async def validation_exception_handler(request: Request, exc: RequestValidationError):
        logger.debug(exc.errors())
        return JSONResponse({'code': 404, 'message': exc.errors()})


def register_middleware(app: FastAPI):
    # 注册中间件

    # 允许CORS 跨域
    app.add_middleware(CORSMiddleware,
                       allow_credentials=True,
                       allow_origins=["*"],
                       allow_methods=["*"],
                       allow_headers=["*"])

    app.middleware('http')(session_middleware)

    app.add_middleware(MyServerErrorMiddleware)
