from django.contrib import admin

from .models import TiposEmbalagem, TiposPicole


@admin.register(TiposEmbalagem)
class TiposEmbalagemAdmin(admin.ModelAdmin):
    list_display = ('nome',)


@admin.register(TiposPicole)
class TiposPicoleAdmin(admin.ModelAdmin):
    list_display = ('nome',)

