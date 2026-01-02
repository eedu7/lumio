from fastapi import APIRouter

from .category import category_router
from .products import product_router
from .upload import upload_router

router = APIRouter()

router.include_router(upload_router, prefix="/upload", tags=["Upload"])
router.include_router(product_router, prefix="/product", tags=["Products"])
router.include_router(category_router, prefix="/category", tags=["Categories"])
