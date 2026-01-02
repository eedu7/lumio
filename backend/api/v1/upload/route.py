from typing import Annotated

from fastapi import APIRouter, HTTPException, Query, UploadFile, status
from fastapi.concurrency import run_in_threadpool

from core.dependencies import SessionDep, SupabaseDep
from core.models import ProductImage
from services.supabase_service import SupabaseService

router = APIRouter()
supabase_service = SupabaseService()


@router.post("/", status_code=status.HTTP_200_OK)
async def upload_file(
    file: UploadFile,
    session: SessionDep,
    supabase_service: SupabaseDep,
    product_id: Annotated[str | None, Query()] = None,
):
    if not file.filename:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="No file uploaded")
    file_name = f"{product_id}/{file.filename}"
    file_bytes = await file.read()

    try:
        file_url = await run_in_threadpool(supabase_service.upload_image, file_bytes, file_name)
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))

    new_product_image = ProductImage(image_url=file_url, product_id=product_id)

    session.add(new_product_image)
    await session.commit()
    await session.refresh(new_product_image)

    return {
        "id": new_product_image.id,
        "image_url": new_product_image.image_url,
        "product_id": product_id,
    }
