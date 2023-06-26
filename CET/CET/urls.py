"""CET URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from login import views

urlpatterns = [
    path('', views.index),              #修改端口默认主页
    path('admin/', admin.site.urls),    #管理员端

    #登录注册
    path('index/', views.index),
    path('index_teacher/', views.index_teacher),
    path('index_admin/', views.index_admin),
    path('check/', views.check),
    path('login/', views.login),
    path('register/', views.register),
    path('logout/', views.logout),
    path('introduction/', views.introduction),
    path('commonproblem/', views.commonproblem),
    path('grades/', views.grades),
    path('notice/', views.notice),
    path('testdate/', views.testdate),
    path('registerflow/', views.registerflow),

    #使用验证码
    path('captcha', include('captcha.urls')),

    #报名app路由
    path('homepage/',include('home.urls')),
]
