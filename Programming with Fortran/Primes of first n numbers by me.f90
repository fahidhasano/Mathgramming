program prime
    implicit none
    integer:: n,i,r,j
    write(*,*) "Enter nth number:"
    read(*,*) n
    do r=1,n
        j=0
        do i=1,r
            if (mod(r,i)==0) j=j+1
        end do
        if(j==2) print*,r
    end do

end program
