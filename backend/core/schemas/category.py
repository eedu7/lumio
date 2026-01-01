from uuid import UUID

from pydantic import BaseModel, Field


class CategoryCreate(BaseModel):
    name: str = Field(
        ..., max_length=100, description="Name of the category", examples=["Footwear"]
    )
    icon: str = Field(
        ..., max_length=100, description="Name of the category icon", examples=["footwear"]
    )


class CategoryRead(BaseModel):
    id: UUID
    name: str
    icon: str
