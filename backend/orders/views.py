#from django.shortcuts import render

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Order
from .serializers import OrderSerializer


@api_view(['GET', 'POST'])
def order_list(request, format=None):
    """
    List all code orders, filter orders, or create a new order.
    """
    token = request.GET.get('token')
    if token is None or token == '':
        return Response(status=status.HTTP_400_BAD_REQUEST)
    weightMin_query = request.GET.get('weightMin')
    weightMax_query = request.GET.get('weightMax')
    costMin_query = request.GET.get('costMin')
    costMax_query = request.GET.get('costMax')
    status_query = request.GET.get('status')
    if weightMax_query == '' or weightMin_query == '' or costMax_query == '' \
            or costMin_query == '' or status_query == '':
        return Response(status=status.HTTP_400_BAD_REQUEST)

    if request.method == 'GET':
        orders = Order.objects.all()
        if status_query is not None:
            orders = orders.filter(status=status_query)
        if weightMax_query is not None:
            orders = orders.filter(weight__lte=weightMax_query)
        if weightMin_query is not None:
            orders = orders.filter(weight__gte=weightMin_query)
        if costMax_query is not None:
            orders = orders.filter(cost__lte=costMax_query)
        if costMin_query is not None:
            orders = orders.filter(cost__gte=costMin_query)
        serializer = OrderSerializer(orders, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = OrderSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT'])
def order_detail(request, pk, format=None):
    """
    Retrieve or update an order.
    """
    token = request.GET.get('token')
    if token is None or token == '':
        return Response(status=status.HTTP_400_BAD_REQUEST)

    try:
        order = Order.objects.get(pk=pk)
    except Order.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = OrderSerializer(order)
        return Response(serializer.data)

# TODO
    elif request.method == 'PUT':
        # request.data['status'] = status.id
        serializer = OrderSerializer(order, data=request.data)
        if serializer.is_valid():
            serializer.save()
            instance = serializer.data
            instance['status'] = '1'
            return Response(instance, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
