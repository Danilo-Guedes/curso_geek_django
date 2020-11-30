from django.urls import path

from .views import IndexView, DadosJSONView


urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('dados/', DadosJSONView.as_view(), name='dados'),
]
