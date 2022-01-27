from django.shortcuts import render
from django.http import HttpResponse
from app1.models import *
from django.http import JsonResponse

# Create your views here.

def login(request):
	return render(request,"login.html")

def loginData(request):
	username=request.GET["usrnm"]
	passwd=request.GET["pass"]
	flg=False

	emp=Employee.objects.all()
	for singleUser in emp:
		if(singleUser.name==username and singleUser.password==passwd):
			flg=True

	if(flg==True):
		return render(request,"Display.html")
	else:
		return HttpResponse("<h2>Signin Failed..!!</h2>")	

def Register(request):
	cou=Course.objects.all()
	dictCourse={"data":cou}
	#print(dictCourse)
	return render(request,"Register.html",dictCourse)

def RegisterData(request):
	usnm=request.GET["unm"]
	passwd=request.GET["pass"]
	courseID=request.GET["id"]

	flag=False

	emps=Employee.objects.create()
	emps.name=usnm
	emps.password=passwd
	emps.studCourse=Course.objects.get(c_no=courseID)#1
	flag=True
	emps.save()

	if(flag==True):
		return render(request,"Login.html")
	else:
		return HttpResponse("<h2>Signin Failed..!!</h2>")	

def Display(request):
	empo = Employee.objects.all()
	dictData={"data":empo}
	return render(request,"Display.html",dictData)

def deleteData(request):

	unum = request.GET["del"]#ved
	Employee.objects.filter(name=unum).delete()#name=ved
	return HttpResponse("<h2>Delete successfull..!!</h2>")

def updateData(request):
	# updt=request.GET["upd"]
	# EName=request.GET["nm"]
	
	# flg=False

	# update=Employee.objects.get(name=updt)#name=ved
	# update.name=EName
	# flg=True
	# update.save()
	
	# if(flg==True):
	# 	return HttpResponse("<h2>update successfull....</h2>")

	lstStud=Employee.objects.all()
	lstJson=[]

	for singleStu in lstStud:
		dictData={"Name":singleStu.name,"password":singleStu.password}
		lstJson.append(dictData)

	return JsonResponse(lstJson,safe=False)

def search(request):
	return render(request,"search.html")

def SearchData(request):
	usr=request.GET["usrnm"]
	search=Employee.objects.filter(name=usr)
	return render(request,"searchResult.html",{"data":search})

def SearchResult(request):
	return render(request,"searchResult.html")	

