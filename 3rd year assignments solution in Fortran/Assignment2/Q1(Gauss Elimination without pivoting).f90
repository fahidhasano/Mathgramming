program Gaussian_Elimination
    implicit none
    real::n=3,A(3,4),i,j,r,c,d,k,l,m,q,s
    open(unit=1, file="D:\bro code\Mathgramming\3rd year assignments solution in Fortran\Assignment2\matrix2.txt")
    do i = 1, n
       read(1,*) (A(i,j), j=1,n+1)
    end do
    do i = 1, n
       write(*,*) (A(i,j), j=1,n+1)
    end do
! forward elimination
do k = 1,n-1
    do r = k+1, n
        c= A(r,k)/A(k,k)
        A(r,:)=A(r,:)-(c*A(k,:))
    end do

end do
! backward elimination
do q= n,n-1,-1
    do s= q-1,1,-1
        d=A(s,q)/A(q,q)
        A(s,:)=A(s,:)-d*A(q,:)
    end do
end do


write(*,*) "The eliminated matrix is: "
do l = 1, n
    ! making every leading diagonal 1
    A(l,:)=A(l,:)/A(l,l)
        write(*,*) (A(l,m), m=1,n+1)
    end do


end program
