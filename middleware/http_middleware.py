from fastapi import Request
from starlette.responses import JSONResponse

from application.logger import logger
from models.base import SessionLocal


async def session_middleware(request: Request, call_next) -> JSONResponse:
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    ip = request.client.host
    port = request.client.port
    path = request.scope['path']
    method = request.method
    params = request.query_params
    logger.info(f"[{ip}:{port}|{path}|{method}|{params if params else None}|{response.status_code}]")
    return response
