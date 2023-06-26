# Generated by Django 3.0.8 on 2023-06-01 09:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0006_auto_20230601_1418'),
    ]

    operations = [
        migrations.CreateModel(
            name='paper_text',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reading', models.TextField(verbose_name='阅读文章')),
                ('writing', models.TextField(verbose_name='作文题目')),
                ('translation', models.TextField(verbose_name='翻译文本')),
            ],
        ),
        migrations.CreateModel(
            name='single_choose',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('test_id', models.IntegerField(default=0, max_length=11, verbose_name='试卷编号')),
                ('qu_type', models.CharField(choices=[('listening', '听力'), ('reading', '阅读')], default='听力', max_length=32, verbose_name='题目类型')),
                ('qu', models.CharField(max_length=255, null=True)),
                ('A', models.CharField(default=' ', max_length=255)),
                ('B', models.CharField(default=' ', max_length=255)),
                ('C', models.CharField(default=' ', max_length=255)),
                ('D', models.CharField(default=' ', max_length=255)),
                ('ans', models.CharField(default='A', max_length=2)),
            ],
        ),
    ]