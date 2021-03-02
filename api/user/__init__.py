from api.user import profile
from utils.routing import APIRouter

router = APIRouter(prefix="/api")
router.include_router(profile.router)
