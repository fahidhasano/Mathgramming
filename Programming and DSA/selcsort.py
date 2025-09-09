n=int(input("Enter length of array:"))
print("Enter Entries of the array:")
a=[int(input()) for i in range(n)]
for i in range(len(a)):
    minind=i
    for j in range(i+1,len(a)):
        if (a[minind]>a[j]):
            minind=j
    a[i],a[minind]=a[minind],a[i]       

print(a)
