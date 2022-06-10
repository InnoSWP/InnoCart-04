from django.db import models


# Create your models here.

class User(models.Model):
    userId = models.IntegerField(null=False, blank=False)
    passwordMd5hash = models.CharField(max_length=300, null=True, blank=True)
    name = models.CharField(max_length=100, null=False, blank=False)
    phoneNumber = models.CharField(max_length=20, null=False, blank=False)
    email = models.CharField(max_length=200, null=False, blank=False)
    age = models.IntegerField(null=False, blank=False)
    deliveryRate = models.DecimalField(decimal_places=1, max_digits=1000, null=False, blank=False, default=0)
    createdOrdersHistoryIds = models.JSONField(null=True, blank=True)
    deliveredOrdersHistoryIds = models.JSONField(null=True, blank=True)
