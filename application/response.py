from fastapi.responses import JSONResponse


def success(code: int = 200, message: str = "success", **kwargs) -> JSONResponse:
    # 成功状态
    data = {
        'code': code,
        'message': message,
        **kwargs
    }
    return JSONResponse(data)


def error(code: int = 400, message: str = '接口请求异常', **kwargs) -> JSONResponse:
    # 失败状态
    data = {
        'code': code,
        'message': message,
        **kwargs
    }
    return JSONResponse(data)
