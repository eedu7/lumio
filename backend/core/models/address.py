from __future__ import annotations

from typing import TYPE_CHECKING

from sqlalchemy import UUID, Boolean, String
from sqlalchemy.orm import Mapped, mapped_column

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin

if TYPE_CHECKING:
    pass


class Address(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "addresses"

    full_name: Mapped[str] = mapped_column(String(255), nullable=False)
    phone: Mapped[str] = mapped_column(String(20), nullable=False)
    address_line: Mapped[str] = mapped_column(String(255), nullable=False)
    city: Mapped[str] = mapped_column(String(100), nullable=False)
    state: Mapped[str] = mapped_column(String(100), nullable=True)

    address_type: Mapped[str] = mapped_column(String(20), default="shipping")

    is_default: Mapped[bool] = mapped_column(Boolean, default=False)
    user_id: Mapped[UUID] = mapped_column(UUID(as_uuid=True), nullable=False)
