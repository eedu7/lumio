from typing import Annotated

from fastapi import APIRouter, Query, status

from core.dependencies import SessionDep
from core.models import ProductImage

router = APIRouter()


@router.post("/", status_code=status.HTTP_200_OK)
async def upload_file(
    session: SessionDep,
    product_id: Annotated[str | None, Query()] = None,
):
    # TODO: Create image url

    # TODO: Save image in supabase bucket
    new_product_image = ProductImage(image_url="")

    session.add(new_product_image)
    await session.commit()
