from typing import List

from fastapi import APIRouter, status
from sqlalchemy import select

from core.dependencies import SessionDep
from core.models.category import Category
from core.schemas.category import CategoryCreate, CategoryRead

router = APIRouter()


@router.get("/", status_code=status.HTTP_200_OK, response_model=List[CategoryRead])
async def get_categories(session: SessionDep):
    stmt = select(Category)
    result = await session.execute(stmt)
    categories = result.scalars().all()
    return categories


@router.post("/", status_code=status.HTTP_201_CREATED, response_model=CategoryRead)
async def create_category(category: CategoryCreate, session: SessionDep):
    new_category: Category = Category(**category.model_dump())

    session.add(new_category)
    await session.commit()
    await session.refresh(new_category)
    return new_category
