program prime_or_not
    implicit none
    integer::i,j,n
    print*,"Enter the number:"
    read(*,*) n
    j=0
    do i=1,n
        if(mod(n,i)==0) j=j+1
    end do
    if (j==2) then
        print*,"",n,"is prime"
        else
            print*,"",n,"is not prime"
    end if
end program

