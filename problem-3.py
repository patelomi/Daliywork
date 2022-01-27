#Question 3:
#Return the sum of left leaves using search algorithm.

class node:
    def __init__(self,val):
        self.val=val
        self.left=None
        self.right=None
 
def leftLeaveSumRec(root,isLeft,sumVal):
    if root is None:
        return
    if (root.left is None) and (root.right is None) and (isLeft==True):
        sumVal[0]+=root.val
    leftLeaveSumRec(root.left,1,sumVal)
    leftLeaveSumRec(root.right,0,sumVal)

def leftLeaveSum(root):
    sumVal=[0]
    leftLeaveSumRec(root,0,sumVal)
    return sumVal[0]

root=node(3);
root.left=node(9);
root.right=node(20);
root.right.left=node(15);
root.right.right=node(7);
print("Sum of Left Leaves is:",leftLeaveSum(root))