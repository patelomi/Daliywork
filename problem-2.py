#Question 2:
#Use Recursion technique to merge two sorted lists. Merge 
#the two lists in a one sorted list. The list should be 
#made by splicing together the nodes of the first two 
#lists.


class node:
    def __init__(self,val):
        self.val=val
        self.next=None

class linkedList:
    def __init__(self):
        self.head=None

    def printList(self):
        temp=self.head
        while temp:
            print(temp.val,end=",")
            temp=temp.next

    def append(self,newVal):
        newNode=node(newVal)         
        if self.head is None:
            self.head=newNode
            return
        lastAt=self.head
        while lastAt.next:
            lastAt=lastAt.next
        lastAt.next=newNode

def mergeList(lHead1,lHead2):
    temp=None
    if lHead1 is None:
        return lHead2

    if lHead2 is None:
        return lHead1

    if lHead1.val<=lHead2.val:
        temp=lHead1
        temp.next=mergeList(lHead1.next,lHead2)
         
    else:
        temp=lHead2
        temp.next=mergeList(lHead1,lHead2.next)
    return temp

if __name__=='__main__':
    list1=linkedList()
    list1.append(1)
    list1.append(2)
    list1.append(4)

    list2=linkedList()
    list2.append(1)
    list2.append(3)
    list2.append(4)

    finalList=linkedList()
    finalList.head=mergeList(list1.head,list2.head)
    print("Merged Linked List is : ", end="")
    finalList.printList()

