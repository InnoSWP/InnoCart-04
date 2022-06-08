from rest_framework import serializers
from .models import Order


class OrderSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    orderId = serializers.IntegerField()
    customerId = serializers.IntegerField()
    description = serializers.CharField()
    expectedDeliveryTime = serializers.DateField()
    status = serializers.CharField(max_length=1)
    weight = serializers.DecimalField(decimal_places=2, max_digits=1000)
    cost = serializers.IntegerField()
    fee = serializers.IntegerField()
    address = serializers.CharField(max_length=200)
    possibleAngelsIds = serializers.JSONField()
    picture = serializers.URLField()

    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return Order.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.orderId = validated_data.get('orderId', instance.orderId)
        instance.customerId = validated_data.get('customerId', instance.customerId)
        instance.description = validated_data.get('description', instance.description)
        instance.expectedDeliveryTime = validated_data.get('expectedDeliveryTime', instance.expectedDeliveryTime)
        instance.status = validated_data.get('status', instance.status)
        instance.weight = validated_data.get('weight', instance.weight)
        instance.cost = validated_data.get('cost', instance.cost)
        instance.fee = validated_data.get('fee', instance.fee)
        instance.address = validated_data.get('address', instance.address)
        instance.possibleAngelsIds = validated_data.get('possibleAngelsIds', instance.possibleAngelsIds)
        instance.picture = validated_data.get('picture', instance.picture)
        instance.save()
        return instance
