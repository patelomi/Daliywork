class node:
	
	def __init__(self,listD):
		self.listD=listD
		self.next=None

class linkedList:

	def __init__(self):
		self.head=None

	def printList(self):
		temp=self.head
		while (temp):
			print(temp.listD)
			temp=temp.next

if __name__=='__main__':

	list1=linkedList()

	list1.head=node(1)
	second=node(2)
	third=node(3)

	list1.head.next=second;
	second.next=third;

	list1.printList()
