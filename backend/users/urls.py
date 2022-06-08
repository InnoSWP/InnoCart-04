from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from views import user_detail, register

urlpatterns = [
    path(r'^users/<int:pk>$', user_detail, name='user by id'),
    path(r'^register/', register, name='register'),
]

urlpatterns = format_suffix_patterns(urlpatterns)
