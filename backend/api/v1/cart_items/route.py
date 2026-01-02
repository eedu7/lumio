from fastapi import APIRouter, Depends, Request, status
from sqlalchemy import select

from core.dependencies import SessionDep
from core.dependencies.authentication import get_current_user
from core.models import Cart, CartItem
from core.schemas.cart_items import CartItemCreate

router = APIRouter(dependencies=[Depends(get_current_user)])


@router.post("/", status_code=status.HTTP_201_CREATED)
async def add_cart_item(cart_item_data: CartItemCreate, request: Request, session: SessionDep):
    user_id = request.state.user.id

    # User cart
    result = await session.execute(
        select(Cart).where(Cart.user_id == user_id, Cart.is_active == True)
    )
    cart = result.scalars().first()

    if not cart:
        cart = Cart(user_id=user_id)
        session.add(cart)
        await session.commit()
        await session.refresh(cart)

    cart_item = CartItem(
        cart_id=cart.id, product_id=cart_item_data.product_id, quantity=cart_item_data.quantity
    )

    session.add(cart_item)
    await session.commit()
    await session.refresh(cart_item)
    return cart_item
