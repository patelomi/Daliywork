def Short(arry, low, high):
    i = (low-1)         
    piv = arry[high]    
 
    for j in range(low, high):
 
        if arry[j] <= piv:
 
            i = i+1
            arry[i], arry[j] = arry[j], arry[i]
 
    arry[i+1], arry[high] = arry[high], arry[i+1]
    return (i+1)

def quickSort(arry, low, high):
    if len(arry) == 1:
        return arry
    if low < high:

        pi = Short(arry, low, high)

        quickSort(arry, low, pi-1)
        quickSort(arry, pi+1, high)

arry = []
n = int(input("Enter the list size: "))

for i in range(0, n):
    print("Enter number at index:", i)
    item = int(input())
    arry.append(item)
print("User list is:", arry)


n = len(arry)
quickSort(arry, 0, n-1)
print("Sorted array is:")
for i in range(n):
    print("%d" % arry[i])