from django.db import models

# Create your models here.

class Order(models.Model):
    customer = models.IntegerField()
    description = models.CharField(max_length=100, blank=True, default='')
    status = models.BooleanField(default=False)
    acceptedDelivery = models.BooleanField(default=False)
    deliveryMan = models.IntegerField()