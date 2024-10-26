


def gcd_by_euclidean_algorithm(a,b):

    def max(a, b):
        if a > b:
            return a
        else:
            return b

    def min(a, b):
        if a < b:
            return a
        else:
            return b
    n1=max(a,b)
    n2=min(a,b)
    r=n1%n2
    while r!=0:
        n1=n2
        n2=r
        r=n1%n2
    return n2

x=gcd_by_euclidean_algorithm(561,171)

print(x)




