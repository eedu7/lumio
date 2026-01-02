from fastapi import APIRouter, Depends

from core.dependencies.authentication import get_current_user

router = APIRouter(dependencies=[Depends(get_current_user)])
