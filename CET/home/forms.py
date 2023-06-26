from django import forms
from captcha.fields import CaptchaField


class user_entry(forms.Form):
    user_name = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    user_true_name = forms.CharField(label="真实姓名", max_length=128,widget=forms.TextInput(attrs={'class': 'form-control'}))
    user_id = forms.CharField(label="身份证号", max_length=18, widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="邮箱地址", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    exam_point = forms.CharField(label="考点", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    exam_time = forms.CharField(label="考试时间", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))

class user_datas(forms.Form):
    email = forms.EmailField(label="邮箱地址", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    user_name = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    user_true_name = forms.CharField(label="真实姓名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    user_id = forms.CharField(label="身份证号", max_length=18, widget=forms.TextInput(attrs={'class': 'form-control'}))
    # user_img =
    user_school = forms.CharField(label="所在学校", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    # user_f_score = forms.CharField(label="四级成绩", max_length=10, widget=forms.TextInput(attrs={'class': 'form-control'}))
    # user_s_score = forms.CharField(label="六级成绩", max_length=10, widget=forms.TextInput(attrs={'class': 'form-control'}))


class user_answers(forms.Form):
    Q1 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q2 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q3 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q4 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q5 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q6 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q7 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q8 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    Q9 = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    writing_ans = forms.CharField(label="作文答案", widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)
    translation_ans = forms.CharField(label="翻译答案", widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)


class user_scores(forms.Form):
    writing_score = forms.CharField(label="作文分数", widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)
    translation_score = forms.CharField(label="翻译分数", widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)
    id = forms.CharField(label="试卷编号", widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)


class exam_entry(forms.Form):
    exam_point = forms.CharField(label="考点", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    exam_time = forms.DateField(label="考试时间", widget=forms.TextInput(attrs={'class': 'form-control'}))
    number = forms.IntegerField(label="容量", widget=forms.TextInput(attrs={'class': 'form-control'}))


class user_query(forms.Form):
    test_id = forms.CharField(label="考试编号", max_length=128,widget=forms.Textarea(attrs={'class': 'form-control'}))
