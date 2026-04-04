! Q(2) Gauss seidel
program gauss_seldel
    implicit none
    integer::  n=3,i,j,k, Max_it=100
    real:: A(3,4), tol=0.00000001, x_old=0.0, y_old=0.0,z_old=0.0, x_new, y_new, z_new
    open(unit=1, file="D:\bro code\Mathgramming\3rd year assignments solution in Fortran\Assignment2\matrix.txt")
    do i= 1,n
        read(1,*) (A(i,j),j=1,n+1)
    end do
    do i= 1,n
        write(*,*) (A(i,j),j=1,n+1)
    end do

end program
