from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from views import user_detail, sign_up, sign_in

urlpatterns = [
    path(r'^users/<int:pk>$', user_detail, name='user by id'),
    path(r'^sign_up/', sign_up, name='register'),
    path(r'^sign_in/', sign_in, name='register'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
