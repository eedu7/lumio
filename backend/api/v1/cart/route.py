from fastapi import APIRouter, Depends, Request

from core.dependencies import SessionDep
from core.dependencies.authentication import get_current_user

router = APIRouter(dependencies=[Depends(get_current_user)])


@router.get("/")
async def get_user_cart(request: Request, session: SessionDep):
    print("UserID", request.state.user.id)
    return {"success": True}
