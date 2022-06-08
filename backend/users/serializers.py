from rest_framework import serializers
from .models import User


class UserSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    userId = serializers.IntegerField()
    passwordMd5hash = serializers.CharField(max_length=300)
    name = serializers.CharField(max_length=100)
    phoneNumber = serializers.IntegerField()
    email = serializers.CharField(max_length=200)
    age = serializers.IntegerField()
    deliveryRate = serializers.DecimalField(decimal_places=1, max_digits=1000)
    createdOrdersHistoryIds = serializers.JSONField()
    deliveredOrdersHistoryIds = serializers.JSONField()

    def create(self, validated_data):
        """
        Create and return a new `Snippet` instance, given the validated data.
        """
        return User.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.userId = validated_data.get('userId', instance.userId)
        instance.passwordMd5hash = validated_data.get('passwordMd5hash', instance.passwordMd5hash)
        instance.name = validated_data.get('name', instance.name)
        instance.phoneNumber = validated_data.get('phoneNumber', instance.phoneNumber)
        instance.email = validated_data.get('email', instance.email)
        instance.age = validated_data.get('age', instance.age)
        instance.deliveryRate = validated_data.get('deliveryRate', instance.deliveryRate)
        instance.createdOrdersHistoryIds = validated_data.get('createdOrdersHistoryIds',
                                                              instance.createdOrdersHistoryIds)
        instance.deliveredOrdersHistoryIds = validated_data.get('deliveredOrdersHistoryIds',
                                                                instance.deliveredOrdersHistoryIds)
        instance.save()
        return instance
