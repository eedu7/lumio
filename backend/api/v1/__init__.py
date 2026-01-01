from fastapi import APIRouter

from api.v1.category import category_router

from .products import product_router

router = APIRouter()

router.include_router(product_router, prefix="/product", tags=["Products"])
router.include_router(category_router, prefix="/category", tags=["Categories"])
