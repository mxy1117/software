from django.shortcuts import render
from django.http import HttpResponse
from CET6.models import User
# Create your views here.


def index(request):
    answer = User.objects.all().values('user_id')
    print(type(answer))
    return HttpResponse(answer)


# answer = User.objects.all().values('user_id')
# print(answer)
