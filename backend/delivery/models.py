from django.db import models


# Create your models here.
class Delivery(models.Model):
    customerId = models.IntegerField(null=False, blank=False)
    angelId = models.IntegerField(null=False, blank=False)
    orderId = models.IntegerField(null=False, blank=False)
    estimatedTime = models.TimeField(null=False, blank=False)
    customerConfirmation = models.BooleanField(null=False, blank=False)
    angelConfirmation = models.BooleanField(null=False, blank=False)
