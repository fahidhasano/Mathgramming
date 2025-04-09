def ispalindromic(x):
    y = list(str(x))
    s = []
    i = len(y)
    while i >= 1:
        s.append(y[i - 1])
        i -= 1
    if y==s:
        return True
    return False

print(ispalindromic(505))
