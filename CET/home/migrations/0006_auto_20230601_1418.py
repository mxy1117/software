# Generated by Django 3.0.8 on 2023-06-01 06:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0005_auto_20230601_1251'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='exam_entry_table',
            name='exam_id',
        ),
        migrations.RemoveField(
            model_name='user_entry_table',
            name='exam_id',
        ),
    ]
