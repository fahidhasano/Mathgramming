program factorial
    implicit none
    integer::i,j,n
    print*,"Enter n-th number:"
    read(*,*) n
    j=1
    i=1
    10 j=j*i
    i=i+1
    if (i<=n) goto 10

    write(*,*) "factorial of ",n,"is",j
end program

