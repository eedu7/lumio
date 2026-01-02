from typing import Annotated

from fastapi import Depends

from services.supabase_service import SupabaseService, get_supabase_service

SupabaseDep = Annotated[SupabaseService, Depends(get_supabase_service)]
