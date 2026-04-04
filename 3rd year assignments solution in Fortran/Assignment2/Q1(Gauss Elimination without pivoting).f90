program Gaussian_Elimination
    implicit none
    real::n=3,A(3,4),i,j,r,c,k,l,m
    open(unit=1, file="D:\bro code\Mathgramming\3rd year assignments solution in Fortran\Assignment2\matrix2.txt")
    do i = 1, n
       read(1,*) (A(i,j), j=1,n+1)
    end do
    do i = 1, n
       write(*,*) (A(i,j), j=1,n+1)
    end do

do k = 1,n-1
    do r = k+1, n
        c= A(r,k)/A(k,k)
        A(r,:)=A(r,:)-(c*A(k,:))
    end do

end do
write(*,*) "The eliminated matrix is: "
do l = 1, n
        write(*,*) (A(l,m), m=1,n+1)
    end do


end program
