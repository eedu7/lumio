from core.schemas.product import ProductRead
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class CartItemCreate(BaseModel):
    product_id: UUID
    quantity: int = 1


class CartItemRead(BaseModel):
    id: UUID
    quantity: int
    product: ProductRead

    model_config = ConfigDict(from_attributes=True)
