from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin


class Product(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "products"

    name: Mapped[str] = mapped_column(String(255), nullable=False)
