program summation
    implicit none
    integer::i,j,n,r
    print*,"Enter the n-th number:"
    read(*,*) n
    r=1
    10 j=0

    do i=1,r
        if(mod(r,i)==0) j=j+1
    end do
    if(j==2) then
        write(*,*) r

    end if
    r=r+1
    if(r<=n) goto 10

end program


