from django.shortcuts import render, redirect
from . import models
from .forms import UserForm,RegisterForm
from home.models import user_data
# Create your views here.
def introduction(request):
    pass
    return render(request, 'login/introduction.html')

def commonproblem(request):
    pass
    return render(request, 'login/commonproblem.html')

def grades(request):
    pass
    return render(request, 'login/grades.html')

def notice(request):
    pass
    return render(request, 'login/notice.html')

def testdate(request):
    pass
    return render(request, 'login/testdate.html')

def registerflow(request):
    pass
    return render(request, 'login/registerflow.html')

def check(request):
    pass
    return render(request, 'login/hello.html')

def index(request):
    pass
    return render(request, 'login/index.html')

def index_teacher(request):
    pass
    return render(request, 'login/index_teacher.html')


def index_admin(request):
    pass
    return render(request, 'login/index_admin.html')

#加入sesson
def login(request):
    #不允许重复登录
    if request.session.get('is_login', None):
        return redirect('/index')

    if request.method == "POST":
        login_form = UserForm(request.POST)
        message = "请检查填写的内容！"
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            try:
                user = models.User.objects.get(name=username)
                if user.password == password:
                    #往session字典内写入用户状态和数据
                    request.session['is_login'] = True
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.name
                    request.session['user_type'] = user.type
                    if user.type == "student":
                        print("---------进入学生界面---------")
                        return redirect('/index/')
                    elif user.type == "teacher":
                        print("---------进入教师界面---------")
                        return redirect('/index_teacher/')
                    elif user.type == "manager":
                        print("---------进入管理员界面---------")
                        return redirect('/index_admin/')
                else:
                    message = "密码不正确！"
            except:
                message = "用户不存在！"
        return render(request, 'login/login.html', locals())

    login_form = UserForm()
    return render(request, 'login/login.html', locals())


def logout(request):
    if not request.session.get('is_login', None):
        # 如果本来就未登录，也就没有登出一说
        return redirect("/index/")
    request.session.flush()
    # 或者使用下面的方法
    # del request.session['is_login']
    # del request.session['user_id']
    # del request.session['user_name']
    return redirect("/index/")



def register(request):
    if request.session.get('is_login', None):
        # 登录状态不允许注册。
        return redirect("/index/")
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = "请检查填写的内容！"
        if register_form.is_valid():  # 获取数据
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            sex = register_form.cleaned_data['sex']
            type = register_form.cleaned_data['type']
            if password1 != password2:  # 判断两次密码是否相同
                message = "两次输入的密码不同！"
                return render(request, 'login/register.html', locals())
            else:
                same_name_user = models.User.objects.filter(name=username)
                if same_name_user:  # 用户名唯一
                    message = '用户已经存在，请重新选择用户名！'
                    return render(request, 'login/register.html', locals())
                same_email_user = models.User.objects.filter(email=email)
                if same_email_user:  # 邮箱地址唯一
                    message = '该邮箱地址已被注册，请使用别的邮箱！'
                    return render(request, 'login/register.html', locals())
                message = "注册成功！"
                # 当一切都OK的情况下，创建新用户
                # 创建用户信息//有问题：放在创建用户表后面会出现DJANGO pymysql.err.IntegrityError:
                # (1062, "Duplicate entry '' for key 'user_name'")
                new_user_data = user_data.objects.create()
                new_user_data.user_name = username
                new_user_data.user_true_name = '无'
                new_user_data.user_id = '无'
                new_user_data.user_school = '无'
                new_user_data.user_f_score = '未通过'
                # new_user_data.user_f_score = 425
                # new_user_data.user_s_score = 0
                new_user_data.save()

                #创建用户表
                new_user = models.User.objects.create()
                new_user.name = username
                new_user.password = password1
                new_user.email = email
                new_user.sex = sex
                new_user.type = type
                new_user.save()

                return redirect('/login/')  # 自动跳转到登录页面
    register_form = RegisterForm()
    return render(request, 'login/register.html', locals())