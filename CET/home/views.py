from django.shortcuts import render, redirect
from . import models
from .forms import user_entry, user_datas, user_answers, exam_entry, user_scores, user_query
from django.http import HttpResponse,HttpResponseRedirect
# from django.contrib.auth.models import User
from login.models import User

# Create your views here.


def test(request):
    pass
    return render(request, 'home/test.html')


def score(request):
    paper_id = request.GET['id']
    answer_score = models.user_entry_table.objects.get(id=paper_id)
    return render(request, 'home/query_score.html', {'score': answer_score})


def grading(request):
    # answer_sheet = models.user_entry_table.objects.all()
    if request.method == "GET":
        paper_id = request.GET['id']
        # print(paper_id)
        # 根据试卷编号获取答案
        answer_sheet = models.user_entry_table.objects.get(id=paper_id)
        return render(request, 'home/grading.html', {"id": paper_id, "answer_sheet": answer_sheet})
    elif request.method == "POST":
        scores = user_scores(request.POST)
        if scores.is_valid():
            u_score = scores.cleaned_data
            answer_score = models.user_entry_table.objects.get(id=u_score['id'])
            writing = int(u_score['writing_score']) + int(u_score['translation_score'])
            answer_score.writing = writing
            answer_score.total = writing + answer_score.reading + answer_score.listening
            answer_score.status = '已出分'
            answer_score.save()
            # print(answer_sheet.writing)
        return redirect('/index_teacher/')


def grading_choose(request):
    papers = models.user_entry_table.objects.filter(status='待批改')
    # papers = models.user_entry_table.objects.filter(status='待批改')
    return render(request, 'home/grading_choose.html', {"papers": papers})


def online_test(request):
    username = request.session.get('user_name', None)
    user_da = models.user_data.objects.filter(user_name=username)
    if user_da:  # 判断是否完善了信息
        ID = user_da[0].user_id
        user_en = models.user_entry_table.objects.filter(ID_card=ID, status='待考试')
        if user_en:  # 判断是否已考试
            exam_entry = models.exam_entry_table.objects.get(exam_point=user_en[0].exam_point)
        else:
            message = "没有可以参加的考试！"
            return render(request, 'login/index.html', locals())
    else:
        message = "请先完善个人信息并完成报名！"
        return render(request, 'login/index.html', locals())
    return render(request, 'home/online_test.html', {"user": user_da[0], "exam_entry": exam_entry})


def answer(request):
    username = request.session.get('user_name', None)
    user = models.user_data.objects.get(user_name=username)  # 获取用户个人信息
    user_en = models.user_entry_table.objects.get(ID_card=user.user_id,status='待考试')
    paper = models.paper_text.objects.get(id=1)
    listenings = models.single_choose.objects.filter(qu_type="listening")
    readings = models.single_choose.objects.filter(qu_type="reading")

    if request.method == "POST":
        # print("提交了答案")
        userans = user_answers(request.POST)
        if userans.is_valid():
            user_ans = userans.cleaned_data
            answer_list = models.single_choose.objects.filter(test_id=1)  # 单选题答案列表
            lis_score = 0
            read_score = 0
            # 自动批改选择题
            for i in range(1,10):
                temp = 'Q' + str(i)
                if user_ans[temp] == answer_list[i-1].ans:
                    print("%s correct" % temp)
                    # 计算听力选择题得分
                    if answer_list[i-1].qu_type == "listening":
                        lis_score += 10
                    # 计算阅读选择题得分
                    else:
                        read_score += 10
            # 存储作文和翻译答案，以便老师批改
            user_en.listening = lis_score
            user_en.reading = read_score
            user_en.tran_ans = user_ans['translation_ans']
            user_en.wri_ans = user_ans['writing_ans']
            user_en.status = '待批改'
            user_en.save()  # 保存相应数据
        return redirect('/index/')
    return render(request, 'home/answer.html', {"paper": paper, "listenings": listenings, "readings": readings})


# 我的信息
def mydate(request):
    username = request.session.get('user_name', None)
    account = User.objects.get(name=username)  # 用户登录注册表
    user = models.user_data.objects.get(user_name= username)
    type = User.type
    return  render(request, "home/myself.html", {"user": user, "account": account, "type": type})


# 修改我的信息
def updata(request):
    username = request.session.get('user_name', None)
    # print("-----------------------")
    # print(username)
    # print("-----------------------")
    user_da = models.user_data.objects.get(user_name=username)
    user = User.objects.get(name=username)  # login_user表
    if request.method == "POST":
        userdata = user_datas(request.POST)
        # print(userdata)
        if userdata.is_valid():
            user_das = userdata.cleaned_data
            # user.user_name = user_da['user_name'] #用户无法修改用户名
            user.email = user_das['email']
            user_da.user_true_name = user_das['user_true_name']
            user_da.user_id = user_das['user_id']
            user_da.user_school = user_das['user_school']
            user_da.save()
            user.save()
            # 四六级成绩无法修改
            # user_datas.user_f_score = user_da['user_f_score']
            # user_datas.user_s_score = user_da['user_s_score']
            return redirect('/homepage/my_data/')
    else:
        userdata = user_datas(initial={"email":user.email,"user_name":user_da.user_name,"user_true_name":user_da.user_true_name,"user_id":user_da.user_id,"user_school":user_da.user_school})
        return render(request, 'home/change_mydata.html', {"userdata":userdata})


# 查询考试信息
def query(request):
    username = request.session.get('user_name',None)
    user = User.objects.get(name=username)
    # 用于判断用户是否报名
    user_en = models.user_entry_table.objects.filter(email=user.email)
    if request.method == "POST":
        user_qu = user_query(request.POST)
        if user_qu.is_valid():
            u_query = user_qu.cleaned_data
            test_id = u_query['test_id']
            user_entry = models.user_entry_table.objects.get(id=test_id)
            user_entry.status = '待考试'
            user_entry.save()
            # print(u_query['test_status'])
    if user_en:
        # print(len(user_en))
        # if len(user_en)==1:
        user_entry = models.user_entry_table.objects.filter(email=user.email)
        return render(request, 'home/query1.html', {"user_entry": user_entry})
    else:
        message = "你还未报名！请先报名之后再来查看！"
        return render(request, 'login/index.html', locals())


# 六级报名：
def cet_6(request):
    username = request.session.get('user_name', None)
    # 用户信息表,用户表，获取信息判断资格
    user_da = models.user_data.objects.get(user_name=username)
    user = User.objects.get(name=username)
    if request.method == "POST":
        cet6_form = user_entry(request.POST)
        if cet6_form.is_valid():
            # 只需要获取报考考点信息即可
            # email = cet4_form.cleaned_data['email']
            # exam_id = '1'
            exam_point = cet6_form.cleaned_data['exam_point']
            exam_time = cet6_form.cleaned_data['exam_time']
            f_score = user_da.user_f_score
            ID = user_da.user_id
            # 用与下面的考点判断
            point = models.exam_entry_table.objects.filter(exam_point=exam_point)
            time = models.exam_entry_table.objects.filter(exam_time=exam_time)
            # 用与下面的是否重复报名判断
            entryer = models.user_entry_table.objects.filter(email=user.email)
            # 判断个人信息是否完善
            if user_da.user_true_name=='无'or user_da.user_id=='无':
                message="请先完善个人真实信息之后再来报名！"
                return render(request, 'home/cet_6.html', locals())
            # 判断考点是否存在
            elif point:
                # 考点存在
                if time:
                    # 考试时间正确
                    if entryer:
                        # print("判断是否重复报名")
                        flag = 0
                        for i in entryer:
                            if i.status != '已出分':
                                flag = 1
                                break
                            if i.exam_time == exam_time:
                                flag = 1
                                break
                        if flag:
                            message = "请勿重复报名！"
                            return render(request, 'home/cet_6.html', locals())
                    # 判断四级成绩是否合格
                    if f_score == "通过":
                        # print("报名成功！请按时参加考试！")
                        # 创建一条数据
                        message = "报名成功！请按时参加考试！"
                        new_user = models.user_entry_table.objects.create()
                        new_user.email = user.email
                        # new_user.exam_id = exam_id
                        new_user.exam_point = exam_point
                        new_user.exam_time = exam_time
                        new_user.ID_card = ID
                        new_user.save()
                        # 考点容量减1,报考人数加1
                        exam_entry = models.exam_entry_table.objects.get(exam_point=exam_point)
                        exam_entry.number -= 1
                        exam_entry.entry_number += 1
                        exam_entry.save()
                        return render(request, 'home/cet_6.html', locals())
                    else:
                        message = "通过四级才能报名六级考试！"
                        return render(request, 'home/cet_6.html', locals())
                else:
                    message = "该时间段没有符合条件的考试场次！详情请咨询学校相关部门！"
                    return render(request, 'home/cet_6.html', locals())
            else:
                message = "该学校还未开放报名！详情请咨询学校相关部门！"
                return render(request, 'home/cet_6.html', locals())

    cet6_form = user_entry(
        initial={"email": user.email, "user_name": user_da.user_name, "user_true_name": user_da.user_true_name,
                 "user_id": user_da.user_id})
    return render(request, 'home/cet_6.html', locals())


# 安排考试点信息
def arrange(request):
    if request.method == "POST":
        exam_form = exam_entry(request.POST)
        if exam_form.is_valid():
            exam_point = exam_form.cleaned_data['exam_point']
            # print(exam_point)
            exam_time = exam_form.cleaned_data['exam_time']
            print(exam_point)
            print(exam_time)
            # print(exam_time)
            number_temp = exam_form.cleaned_data['number']
            # print(number)
            point = models.exam_entry_table.objects.filter(exam_point=exam_point, exam_time=exam_time) #判断考点是否存在
            # time = models.exam_entry_table.objects.filter(exam_time=exam_time)
            if point: #考点存在
                message = "该考点已设置！请勿重复添加！"
                # return HttpResponse("该考点已设置！请勿重复添加！")
                return render(request, 'home/arrange_exam.html', {"exam_entry": exam_entry,"message": message})
            else:
                # 创建一条数据
                message = "考点添加成功！"

                new_exam = models.exam_entry_table.objects.create(number=number_temp)
                new_exam.exam_point = exam_point
                new_exam.exam_time = exam_time
                # new_exam.number = number_temp
                # 报考人数初始为0
                new_exam.entry_number = 0
                new_exam.save()
                # return HttpResponse("添加成功！")
                return render(request, 'home/arrange_exam.html', {"exam_entry": exam_entry,"message": message})
        return HttpResponse("error！")
    return render(request, 'home/arrange_exam.html', {"exam_entry": exam_entry})