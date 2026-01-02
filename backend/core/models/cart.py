from __future__ import annotations

from typing import TYPE_CHECKING, List

from sqlalchemy import UUID, Boolean
from sqlalchemy.orm import Mapped, mapped_column, relationship

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin

if TYPE_CHECKING:
    from .cart_items import CartItem


class Cart(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "cart"

    is_active: Mapped[bool] = mapped_column(Boolean, default=True)
    user_id: Mapped[UUID] = mapped_column(UUID(as_uuid=True), nullable=False)

    # Relationship to CartItem
    items: Mapped[List["CartItem"]] = relationship(
        "CartItem",
        back_populates="cart",
        cascade="all, delete-orphan",
        lazy="selectin",  # optional, improves query performance
    )
