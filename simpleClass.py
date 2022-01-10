class Student:
	def check_marks(self):
		if self.marks>=40:
			return True
		else:
			return False

student1=Student()
student1.name="Omi"
student1.marks=84

check_marks=student1.check_marks()
print(check_marks)