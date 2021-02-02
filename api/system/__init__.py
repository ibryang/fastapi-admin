from api.system import sys_user, sys_menu, sys_dept, sys_role, sys_post, sys_logger
from utils.routing import APIRouter

router = APIRouter(prefix="/api")
router.include_router(sys_user.router)
router.include_router(sys_menu.router)
router.include_router(sys_dept.router)
router.include_router(sys_role.router)
router.include_router(sys_post.router)
router.include_router(sys_logger.router)
