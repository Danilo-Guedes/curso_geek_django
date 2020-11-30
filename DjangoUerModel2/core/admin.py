from django.contrib import admin
from .models import Post
# Register your models here.


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('titulo', '_autor')
    exclude = ('autor',)

    def _autor(self, instance): # instance é uma palavra usada por convenção, mas poderia ser qualquer outra
        return f'{instance.autor.get_full_name()}'

    def get_queryset(self, request): #filtranso para que o usuario so possa ver seus proprios posts
        qs = super(PostAdmin, self).get_queryset(request)
        return qs.filter(autor=request.user)

    def save_model(self, request, obj, form, change):
        obj.autor = request.user
        super().save_model(request, obj, form, change)