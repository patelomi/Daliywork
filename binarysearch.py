def Search(list1, x):
   low = 0
   high = len(list1) - 1
   mid = 0
   index=-1
 
   while low <= high:
 
      mid = (high + low) // 2

      if list1[mid] < x:
         low = mid + 1

      elif list1[mid] > x:
         high = mid - 1

      else:
         return mid

   return -1
  
list1 = []
n = int(input("Enter the list size: "))

for i in range(0, n):
    print("Enter number at index:", i)
    item = int(input())
    list1.append(item)
print("User list is:", list1)
val=int(input("Enter Search Value:")) 
   
outPut = Search(list1, val)   

if outPut != -1:   
   print(str(outPut))  
else:   
   print("[-1,-1]")  