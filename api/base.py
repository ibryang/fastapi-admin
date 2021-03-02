from application import config
from application.response import success
from utils.routing import APIRouter

router = APIRouter()


@router.get("/index/", exclude_dependencies=True)
async def index():
    return success()


@router.get('/api/setting/', name="获取系统设置", exclude_dependencies=True)
async def get_setting():
    info = {'name': config.NAME, 'logo': config.LOGO, 'header_img': config.HEADER_IMG}
    return success(data=info)
