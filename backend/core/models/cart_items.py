from __future__ import annotations

from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin

if TYPE_CHECKING:
    from .cart import Cart
    from .product import Product


class CartItem(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "cart_item"

    quantity: Mapped[int] = mapped_column(default=1)

    cart_id: Mapped[UUID] = mapped_column(ForeignKey("cart.id"), nullable=False)
    product_id: Mapped[UUID] = mapped_column(ForeignKey("products.id"), nullable=False)

    # Relationships
    cart: Mapped["Cart"] = relationship("Cart", back_populates="items")
    product: Mapped["Product"] = relationship("Product", back_populates="cart_items")
