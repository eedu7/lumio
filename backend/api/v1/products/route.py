from fastapi import APIRouter
from pydantic import BaseModel

from core.dependencies import SessionDep
from core.models import Product

router = APIRouter()

class CreateProduct(BaseModel):
    name: str
    price: float


@router.post("/")
async def create_product(product: CreateProduct, session: SessionDep):
    new_product = Product(name=product.name)
    session.add(new_product)
    await session.commit()

