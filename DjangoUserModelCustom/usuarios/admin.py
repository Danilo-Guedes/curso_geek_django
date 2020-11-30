from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .forms import CustomUsuarioCreateForm, CustomUsuarioChangeForm
from .models import CustomUsuario

# Register your models here.

@admin.register(CustomUsuario)
class CustomUsuarioAdmin(UserAdmin):
    add_form = CustomUsuarioCreateForm 
    form = CustomUsuarioChangeForm
    model = CustomUsuario
    list_display = ('first_name', 'last_name', 'email', 'fone', 'is_staff')
    fieldsets = (     # recebe: uma tupla com uma lista de tuplas onde o seg param é um dicionário com uma tupla dentro 
        (None, {'fields' : ('email', 'password')}),
        ('Informações Pessoais', {'fields' : ('first_name', 'last_name', 'fone')}),
        ('Permissões', {'fields' : ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permitions')}),
        ('Datas Importantes', {'fields' : ('last_login', 'date_joined')}),
    )


admin.site.site_header = 'Bem vindo Mestre'
admin.site.site_title = 'Criando Custom Usuário no Curso de Django do Mestre'
admin.site.index_title = 'Criando Custom Usuário no Curso de Django do Mestre'