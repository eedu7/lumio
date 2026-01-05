from fastapi import APIRouter

from .address import address_router
from .cart import cart_router
from .cart_items import cart_item_router
from .category import category_router
from .ai import hf_router
from .products import product_router
from .upload import upload_router

router = APIRouter()

router.include_router(upload_router, prefix="/upload", tags=["Upload"])
router.include_router(product_router, prefix="/product", tags=["Products"])
router.include_router(category_router, prefix="/category", tags=["Categories"])
router.include_router(cart_router, prefix="/cart", tags=["Cart"])
router.include_router(cart_item_router, prefix="/cart-item", tags=["Cart Items"])
router.include_router(address_router, prefix="/address", tags=["Address"])
router.include_router(hf_router, prefix="/ai", tags=["AI"])
