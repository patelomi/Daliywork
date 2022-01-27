#Question 1:
#Use Recursion technique to reverse linked list.

class node:
    def __init__(self,val):
        self.val=val 
        self.next=None

class linkedList:
    def __init__(self):
        self.head=None
 
    def reverse(self,current,previous):
        if current.next is None:
            self.head=current
            current.next=previous
            return
        next=current.next
        current.next=previous
        self.reverse(next,current)

    def reverseList(self):
        if self.head is None:
            return
        self.reverse(self.head,None)
 
    def push(self,newVal):
        newNode=node(newVal)
        newNode.next=self.head
        self.head=newNode

    def printList(self):
        temp=self.head
        while(temp):
            print(temp.val,end=" ")
            temp=temp.next

vList=linkedList()
vList.push(5)
vList.push(4)
vList.push(3)
vList.push(2)
vList.push(1)
print("Added Linked List")
vList.printList() 
vList.reverseList()
print("\nReverse Linked List")
vList.printList()


