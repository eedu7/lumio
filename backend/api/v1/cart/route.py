from fastapi import APIRouter, Depends, Request
from sqlalchemy import select
from sqlalchemy.orm import selectinload

from core.dependencies import SessionDep
from core.dependencies.authentication import get_current_user
from core.models import Cart
from core.schemas.cart import CartRead

router = APIRouter(dependencies=[Depends(get_current_user)])


@router.get("/", response_model=CartRead)
async def get_user_cart(request: Request, session: SessionDep):
    user_id = request.state.user.id

    result = await session.execute(
        select(Cart)
        .where(Cart.user_id == user_id, Cart.is_active == True)
        .options(selectinload(Cart.items))
    )
    cart = result.scalars().first()

    if not cart:
        cart = Cart(user_id=user_id)
        session.add(cart)
        await session.commit()
        await session.refresh(cart)

    return cart
