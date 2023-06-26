from django.db import models

# Create your models here.

class exam_entry_table(models.Model):
    #考点信息表
    # exam_id = models.CharField(verbose_name="考试编号",max_length=10)
    # exam_type = models.CharField(verbose_name="考试类别",max_length=128)
    exam_point = models.CharField(verbose_name="考点",max_length=128)
    exam_time = models.CharField(verbose_name="考试时间",max_length=128)
    number = models.IntegerField(verbose_name="容量")
    entry_number = models.IntegerField(verbose_name="已报名数量",default=0)

    def __str__(self):
        return str(self.id)

    class Meta:
        # ordering = ['c_time']
        verbose_name = '考点'
        verbose_name_plural = '考点信息表'


class user_entry_table(models.Model):
    # 用户考试信息表
    email = models.EmailField(verbose_name="邮箱")
    ID_card = models.CharField(verbose_name="身份证号", max_length=18, default=' ')
    # exam_id = models.CharField(verbose_name="考试编号",max_length=10)
    exam_time = models.CharField(verbose_name="考试时间",max_length=128, default=' ')
    exam_point = models.CharField(verbose_name="考点",max_length=128)
    writing = models.IntegerField(verbose_name="写作",default=0)
    listening = models.IntegerField(verbose_name="听力", default=0)
    reading = models.IntegerField(verbose_name="阅读", default=0)
    total = models.IntegerField(verbose_name="总分", default=0)

    def __str__(self):
        return self.email

    class Meta:
        # ordering = ['c_time']
        verbose_name = '用户考试信息'
        verbose_name_plural = '用户考试信息表'


class user_data(models.Model):
    # 用户信息表
    pass_flag = (
        ('fail', '未通过'),
        ('pass', '通过'),
    )
    user_name = models.CharField(verbose_name="用户名", max_length=128, unique=True)
    user_true_name = models.CharField(verbose_name="真实姓名", max_length=128, null=True)
    user_id = models.CharField(verbose_name="身份证号", max_length=18, null=True)
    # user_type = models.CharField(verbose_name="用户类型",max_length=128,null=True)
    # user_img =
    user_school = models.CharField(verbose_name="在读学校", max_length=128)
    user_f_score = models.CharField(verbose_name="四级成绩", max_length=32, choices=pass_flag, default="未通过")
    # user_s_score = models.IntegerField(verbose_name="六级成绩", default=0)

    def __str__(self):
        return self.user_name

    class Meta:
        # ordering = ['c_time']
        verbose_name = '用户名'
        verbose_name_plural = '用户信息表'


class single_choose(models.Model):
    type = (
        ('listening', '听力'),
        ('reading', '阅读'),
    )
    test_id = models.IntegerField(verbose_name="试卷编号", max_length=11, default=0)
    qu_type = models.CharField(verbose_name="题目类型", max_length=32, choices=type, default="听力")
    qu = models.CharField(max_length=255, null=True)
    A = models.CharField(max_length=255, default=" ")
    B = models.CharField(max_length=255, default=" ")
    C = models.CharField(max_length=255, default=" ")
    D = models.CharField(max_length=255, default=" ")
    ans = models.CharField(max_length=2, default="A")


class paper_text(models.Model):
    reading = models.TextField(verbose_name="阅读文章")
    writing = models.TextField(verbose_name="作文题目")
    translation = models.TextField(verbose_name="翻译文本")
