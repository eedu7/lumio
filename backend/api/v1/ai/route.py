from fastapi import APIRouter, Depends, File, HTTPException, UploadFile, status
from sqlalchemy import select
from sqlalchemy.orm import selectinload

from core.dependencies import SessionDep
from core.models import Product
from services import HuggingFaceService, get_hugging_face_service

router = APIRouter()


@router.post("/")
async def get_product_based_on_user_age(
    session: SessionDep,
    hf_service: HuggingFaceService = Depends(get_hugging_face_service),
    image: UploadFile = File(),
):
    try:
        image_bytes = await image.read()

        result = hf_service.scan(image_bytes=image_bytes, content_type=str(image.content_type))
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))

    age_bracket, score = result["result"][0]["label"], result["result"][0]["score"]

    category_ids = ["0b8a2352-7da2-4c48-95b5-dac3eeab8203", "e14da48f-bbc5-4ee4-93c3-204812cc6d8e"]
    stmt = (
        select(Product)
        .where(Product.category_id.in_(category_ids))
        .options(selectinload(Product.image))
        .limit(5)
    )
    result = await session.execute(stmt)
    products = result.scalars().all()
    return {"age_bracket": age_bracket, "products": products, "score": score}
