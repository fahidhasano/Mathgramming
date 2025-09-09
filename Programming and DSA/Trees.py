class BinaryTrees:
    def __init__ (self, data):
        self.data=data
        self.left=None
        self.right=None
root=BinaryTrees("R")
nodeA=BinaryTrees("A")
nodeB=BinaryTrees("B")
nodeC=BinaryTrees("C")
nodeD=BinaryTrees("D")
nodeE=BinaryTrees("E")
nodeF=BinaryTrees("F")
nodeG=BinaryTrees("G")

root.left=nodeA
root.right=nodeB
nodeA.left=nodeC
nodeA.right=nodeD
nodeB.left=nodeE
nodeB.right=nodeF
nodeF.left=nodeG

print(root.left.data)