from django.db import models

# Create your models here.
class Course(models.Model):
	c_no = models.IntegerField()
	c_name = models.CharField(max_length=100,null=True)

	def __str__(self):
		return str(self.c_no)+" "+self.c_name

class Employee(models.Model):
	studCourse = models.ForeignKey(Course,on_delete=models.SET_NULL,null=True)
	name= models.CharField(max_length=100,null = True)
	password = models.CharField(max_length = 100,null = True)