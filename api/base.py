from application.response import success
from utils.routing import APIRouter

router = APIRouter()


@router.get("/index", exclude_dependencies=True)
async def index():
    return success()
