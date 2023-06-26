# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Score(models.Model):
    user = models.OneToOneField('User', models.DO_NOTHING, db_column='user_ID', primary_key=True)  # Field name made lowercase.
    test = models.ForeignKey('Test', models.DO_NOTHING, db_column='test_ID')  # Field name made lowercase.
    total = models.IntegerField()
    listening = models.IntegerField()
    reading = models.IntegerField()
    writing = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'score'
        unique_together = (('user', 'test'),)


class Test(models.Model):
    test_id = models.IntegerField(db_column='test_ID', primary_key=True)  # Field name made lowercase.
    test_time = models.DateTimeField()
    test_addr = models.CharField(max_length=255)

    class Meta:
        managed = True
        db_table = 'test'


class User(models.Model):
    user_id = models.CharField(db_column='user_ID', primary_key=True, max_length=18)  # Field name made lowercase.
    user_pwd = models.CharField(max_length=255)
    user_type = models.CharField(max_length=255)
    user_org = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'user'

# Create your models here.
