from fastapi import APIRouter

from core.dependencies import SessionDep

router = APIRouter()


@router.post("/")
async def upload_file(session: SessionDep): ...
