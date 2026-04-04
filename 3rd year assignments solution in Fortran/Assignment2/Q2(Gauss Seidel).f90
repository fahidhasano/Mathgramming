                                                                                                                                                                                            ! Q(2) Gauss seidel
! we have to manually adjust rows for diagonally dominant matrix
program gauss_seidel
    implicit none
    integer::  n=3,i,j,k, Max_it=100
    real:: A(3,4), tol=0.00000001, x_old=1.5, y_old=1.5,z_old=-0.5, x_new, y_new, z_new
    open(unit=1, file="D:\bro code\Mathgramming\3rd year assignments solution in Fortran\Assignment2\matrix.txt")
    do i= 1,n
        read(1,*) (A(i,j),j=1,n+1)
    end do
    do i= 1,n
        write(*,*) (A(i,j),j=1,n+1)
    end do
    do k=1, Max_it
        x_new=(11.0+3.0*y_old-2.0*z_old)/8.0
        y_new=(14.0-6.0*x_new-3.0*z_old)/5.0
        z_new=(21.0-10.0*x_new+7.0*y_new)/(-8.0)
        if (max(abs(x_new-x_old),abs(y_new-y_old),abs(z_new-z_old))<tol) goto 2
        x_old=x_new
        y_old=y_new
        z_old=z_new
    end do
    2 write(*,*) x_new, y_new,z_new , "iterations:",k
end program
