from __future__ import annotations

from typing import TYPE_CHECKING

from sqlalchemy import UUID, ForeignKey, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin

if TYPE_CHECKING:
    from .product import Product


class ProductImage(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "product_image"

    image_url: Mapped[str] = mapped_column(Text(), nullable=False)
    product_id: Mapped[UUID] = mapped_column(ForeignKey("products.id"), nullable=False)

    product: Mapped["Product"] = relationship("Product", back_populates="image")
