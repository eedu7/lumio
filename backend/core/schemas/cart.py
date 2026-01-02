from typing import List
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from core.schemas.cart_items import CartItemRead


class CartRead(BaseModel):
    id: UUID
    items: List[CartItemRead] = []

    model_config = ConfigDict(from_attributes=True)
