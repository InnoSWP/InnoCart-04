from rest_framework import serializers
from orders.models import Order


class OrderSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    customer = serializers.IntegerField()
    description = serializers.CharField(max_length=100, default='')
    status = serializers.BooleanField(default=False)
    acceptedDelivery = serializers.BooleanField(default=False)
    deliveryMan = serializers.IntegerField()

    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return Order.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.customer = validated_data.get('customer', instance.customer)
        instance.description = validated_data.get('description', instance.description)
        instance.status = validated_data.get('status', instance.status)
        instance.acceptedDelivery = validated_data.get('acceptedDelivery', instance.acceptedDelivery)
        instance.deliveryMan = validated_data.get('deliveryMan', instance.deliveryMan)
        instance.save()
        return instance