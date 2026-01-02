from __future__ import annotations

from typing import TYPE_CHECKING

from sqlalchemy import UUID, Double, ForeignKey, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin

if TYPE_CHECKING:
    from .category import Category
    from .product_image import ProductImage


class Product(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "products"

    name: Mapped[str] = mapped_column(String(255), nullable=False)
    description: Mapped[str] = mapped_column(Text(), nullable=False)
    price: Mapped[float] = mapped_column(Double(), nullable=False)

    category_id: Mapped[UUID] = mapped_column(ForeignKey("categories.id"), nullable=False)

    image: Mapped["ProductImage"] = relationship(
        "ProductImage", back_populates="product", uselist=False, cascade="all, delete-orphan"
    )
    category: Mapped["Category"] = relationship("Category", back_populates="products")
