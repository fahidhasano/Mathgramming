import math

n=int(input("Enter a number:"))


s=[]
l=0
i=1
while i<=n:
    if n%i==0:
        s.append(i)

    i+=1
print("Divisors of ",n,"is",s)
print("Tao of",n,"is",len(s) )

for i in s:
    l=l+i

print("Sigma of",n,"is",l)
o=int(input("Enter sigma power k:"))
for i in s:
    l=l+pow(i,o)
print("Sigma",o,"of",n,"is",l)

def coprime(a,b):
    if math.gcd(a,b)==1:
        return True
    return False
t=[]
for i in range(1,n):
    if coprime(n,i)==True:
        t.append(i)

print("Numbers less than and coprime with",n,"are",t,"\nEuler phi of",n,"is",len(t))




