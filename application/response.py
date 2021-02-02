from fastapi.responses import ORJSONResponse


def success(code: int = 200, message: str = "success", **kwargs) -> ORJSONResponse:
    data = {
        'code': code,
        'message': message,
        **kwargs
    }
    return ORJSONResponse(data)


def error(code: int = 400, message: str = '接口请求异常', **kwargs) -> ORJSONResponse:
    data = {
        'code': code,
        'message': message,
        **kwargs
    }
    return ORJSONResponse(data)
