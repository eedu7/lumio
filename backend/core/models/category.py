from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column

from core.database import Base
from core.database.mixins import PrimaryKeyMixin, TimestampMixin


class Category(Base, PrimaryKeyMixin, TimestampMixin):
    __tablename__ = "categories"

    name: Mapped[str] = mapped_column(String(100), unique=True, nullable=False)
    icon: Mapped[str] = mapped_column(String(100), nullable=False)
