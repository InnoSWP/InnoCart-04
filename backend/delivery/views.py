from django.shortcuts import render

# Create your views here.

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Delivery
from .serializers import DeliverySerializer


@api_view(['GET', 'POST'])
def delivery_list(request, format=None):
    if request.method == 'GET':
        token = request.GET.get('token')
        if token is None or token == '':
            return Response(status=status.HTTP_400_BAD_REQUEST)
        customerId_query = request.GET.get('customerId')
        angelId_query = request.GET.get('angelId')
        if customerId_query == '' or angelId_query == '':
            return Response(status=status.HTTP_400_BAD_REQUEST)
        deliveries = Delivery.objects.all()
        if customerId_query is not None:
            deliveries = deliveries.filter(customerId=customerId_query)
        if angelId_query is not None:
            deliveries = deliveries.filter(angelId=angelId_query)
        serializer = DeliverySerializer(deliveries, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = DeliverySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def delivery_detail(request, pk, format=None):
    token = request.GET.get('token')
    if token is None or token == '':
        return Response(status=status.HTTP_400_BAD_REQUEST)

    try:
        delivery = Delivery.objects.get(pk=pk)
    except Delivery.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = DeliverySerializer(delivery)
        return Response(serializer.data)