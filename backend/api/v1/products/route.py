from typing import Annotated, List
from uuid import UUID

from fastapi import APIRouter, Query
from sqlalchemy import select
from sqlalchemy.orm import selectinload

from core.dependencies import SessionDep
from core.models import Product
from core.schemas.product import ProductCreate, ProductCreateRead, ProductRead

router = APIRouter()


@router.get("/", response_model=List[ProductRead])
async def get_products(
    session: SessionDep,
    skip: Annotated[int, Query(ge=0)] = 0,
    limit: Annotated[int, Query(ge=0)] = 20,
):
    stmt = select(Product).options(selectinload(Product.image)).offset(skip).limit(limit)
    result = await session.execute(stmt)

    products = result.scalars().all()

    return products


@router.get("/{product_id}", response_model=ProductRead)
async def get_product(
    product_id: UUID,
    session: SessionDep,
):
    stmt = select(Product).options(selectinload(Product.image)).where(Product.id == product_id)
    result = await session.execute(stmt)

    product = result.scalar_one()

    return product


@router.get("/category/", response_model=List[ProductRead])
async def get_products_by_category(
    category_id: Annotated[UUID, Query()],
    session: SessionDep,
    skip: Annotated[int, Query(ge=0)] = 0,
    limit: Annotated[int, Query(ge=0)] = 20,
):
    stmt = (
        select(Product)
        .where(Product.category_id == category_id)
        .options(selectinload(Product.image))
        .offset(skip)
        .limit(limit)
    )
    result = await session.execute(stmt)

    products = result.scalars().all()

    return products


@router.post("/", response_model=ProductCreateRead)
async def create_product(product: ProductCreate, session: SessionDep):
    new_product = Product(**product.model_dump())
    session.add(new_product)
    await session.commit()
    await session.refresh(new_product)
    return new_product


@router.post(
    "/search",
)
async def search_products(product_name: str, session: SessionDep, skip: int = 0, limit: int = 20):
    stmt = (
        select(Product)
        .where(Product.name.like(f"%{product_name}"))
        .options(selectinload(Product.image))
        .offset(skip)
        .limit(limit)
    )
    result = await session.execute(stmt)
    return result.scalars().all()
