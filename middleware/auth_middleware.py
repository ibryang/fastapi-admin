from fastapi import Response, Request
from application.logger import logger


class MyServerErrorMiddleware(HTTPMiddleware):
    def error_response(self, request: Request, exc: Exception):
        logger.error(traceback.format_exc(limit=-1))
        return PlainTextResponse(status_code=500, content=f'系统错误: {exc.args[0]}')
