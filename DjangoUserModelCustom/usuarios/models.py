from django.db import models

# from django.contrib.auth.models import AbstractBaseUser => Base para Usuario Básico, sem várias funcionálidades 
from django.contrib.auth.models import AbstractUser # Usuario Abstrato mais completo com todas funcionalidades principais
from django.contrib.auth.models import BaseUserManager # Gerenciados de Usuario

# Create your models here.

class UsuarioManager(BaseUserManager): #responsável por criar e salvar o usuario comun e tbm o admin

    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError('O e-mail é obrigatório')
        email = self.normalize_email(email)
        user = self.model(email=email, username=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        # extra_fields.setdefault('is_staff', True) => o ideal seria confirmar o e-mail e depois setar como staff
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, password, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)

        if extra_fields.get('is_superuser') is not True:
            raise ValueError('SuperUser precisa ter is_superuser=True')

        if extra_fields.get('is_staff') is not True:
            raise ValueError('SuperUser precisa ter is_staff=True')

        return self._create_user(email, password, **extra_fields)


class CustomUsuario(AbstractUser):
    email = models.EmailField('E-mail', unique=True)
    fone = models.CharField('Telefone', max_length=15)
    is_staff = models.BooleanField('Membro da Equipe', default=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name','last_name', 'fone']

    def __str__(self):
        return self.email

    objects = UsuarioManager() # IMPORTANTE -> se não setar essa relação o django vai usar o User padrão

    #AGORA CRIAR FORMS.PY NA APLICACAO usuarios