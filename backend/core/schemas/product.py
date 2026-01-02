from uuid import UUID

from pydantic import BaseModel, ConfigDict

from core.schemas.product_image import ProductImageRead


class ProductCreate(BaseModel):
    name: str
    description: str
    price: float
    category_id: UUID


class ProductRead(BaseModel):
    id: UUID
    name: str
    description: str
    price: float
    category_id: UUID
    image: ProductImageRead | None = None

    model_config = ConfigDict(from_attributes=True)


class ProductCreateRead(BaseModel):
    id: UUID
    name: str
    description: str
    price: float
    category_id: UUID

    model_config = ConfigDict(from_attributes=True)
