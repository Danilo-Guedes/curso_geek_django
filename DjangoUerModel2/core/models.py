from django.db import models

# Create your models here.

"""
FORMA 1 => fazendo Herança do User Models padrão do Django

from django.contrib.auth.models import User

class Post(models.Model):
    autor = models.ForeignKey(User,verbose_name='Autor', on_delete=models.CASCADE)
    titulo = models.CharField('Título', max_length=100)
    texto = models.TextField('Texto', max_length=400)

    def __str__(self):
        return self.titulo
"""
"""

FORMA 2 => fazendo seu proprio modelo de Usuário e relacionando ele através do settings

from django.contrib.auth.models import User
from django.conf import settings

class Post(models.Model):
    autor = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name='Autor', on_delete=models.CASCADE)
    titulo = models.CharField('Título', max_length=100)
    texto = models.TextField('Texto', max_length=400)

    def __str__(self):
        return self.titulo
"""


# FORMA 3 => ## RECOMENDADA ## => Usando a função get_user_model()


from django.contrib.auth import get_user_model

class Post(models.Model):
    autor = models.ForeignKey(get_user_model(), verbose_name='Autor', on_delete=models.CASCADE)
    titulo = models.CharField('Título', max_length=100)
    texto = models.TextField('Texto', max_length=400)

    def __str__(self):
        return self.titulo

