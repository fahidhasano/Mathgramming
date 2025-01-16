program divisors
    implicit none
    integer::i,j,n,l
    print*,"Enter n-th number:"
    read(*,*) n
    j=0
    do i=1,n

        if(mod(n,i)==0) then
            write(*,*) "The",j+1,"th number of divisor is:",i
            j=j+1
        end if
    end do


    write(*,*) "The divisors of",n,"are",j,"numbers:"
end program

