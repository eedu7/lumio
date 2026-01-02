from uuid import UUID

from pydantic import BaseModel, ConfigDict


class ProductImageBase(BaseModel):
    id: UUID
    product_id: UUID
    image_url: str


class ProductImageRead(BaseModel):
    image_url: str

    model_config = ConfigDict(from_attributes=True)
