class RootedTree:
    def __init__(self,data):
        self.data=data
        self.left=None
        self.right=None
root=RootedTree('R')
nodeA=RootedTree('A')
nodeB=RootedTree('B')
nodeC=RootedTree('C')
nodeD=RootedTree('D')
nodeE=RootedTree('E')
nodeF=RootedTree('F')   
nodeG=RootedTree('G') 
root.left=nodeA
root.right=nodeB
nodeA.left=nodeC
nodeA.right=nodeD
nodeB.right=nodeF
nodeB.left=nodeE
nodeF.left=nodeG

print(nodeE.left.data)
