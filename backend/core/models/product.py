from uuid import uuid4

from pygments.token import String
from sqlalchemy import UUID
from sqlalchemy.orm import Mapped, mapped_column

from core.database import Base


class Product(Base):
    __tablename__ = "products"

    id: Mapped[UUID] = mapped_column(UUID(as_uuid=True),
                                     primary_key=True,
                                     default=uuid4
                                     )
    name: Mapped[str] = mapped_column(String(255), nullable=False)