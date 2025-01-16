program summation
    implicit none
    integer::i,j,n
    print*,"Enter n-th number:"
    read(*,*) n
    j=0
    i=1
    10 j=j+i
    i=i+1
    if (i<=n) goto 10

    write(*,*) "The summation of first",n,"-th number is:",j
end program
