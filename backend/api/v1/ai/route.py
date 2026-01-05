from fastapi import APIRouter, File, HTTPException, UploadFile, status

from core.dependencies import SessionDep
from services import HuggingFaceService, get_hugging_face_service

router = APIRouter()

hf_service: HuggingFaceService = get_hugging_face_service()


@router.post("/")
async def get_product_based_on_user_age(
    session: SessionDep,
    image: UploadFile = File(),
):
    # if not image.content_type or not image.content_type.startswith("image/"):
    #     raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid image file")

    try:
        image_bytes = await image.read()

        result = hf_service.scan(image_bytes=image_bytes, content_type=image.content_type)

        return result
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=str(e))
