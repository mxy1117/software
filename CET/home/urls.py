from django.contrib import admin
from django.urls import path,include
from home import views
# import home
urlpatterns = [
    # path('',include(login.urls)),
    path('test/', views.test),
    path('my_data/', views.mydate),  # 我的信息
    path('query_results/', views.query),  # 查询报告信息
    path('query_score/', views.score),  # 查询成绩信息
    path('online_test/', views.online_test),  # 进入考试界面
    path('answer/', views.answer),  # 答题界面
    path('grading_choose/', views.grading_choose),  # 进入改卷界面
    path('grading/', views.grading),  # 改卷界面
    # path('cet_4/',views.cet_4),#四级报名
    path('cet_6/', views.cet_6),  # 六级报名
    path('change_my_data/', views.updata),
    path('arrange_exam/', views.arrange),#六级考试安排
]