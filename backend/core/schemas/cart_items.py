from uuid import UUID

from pydantic import BaseModel, ConfigDict


class CartItemCreate(BaseModel):
    product_id: UUID
    quantity: int = 1


class CartItemRead(BaseModel):
    id: UUID
    cart_id: UUID
    product_id: UUID
    quantity: int

    model_config = ConfigDict(from_attributes=True)
