!algorithm based on burden's book chapter 9 page 578
program power_method
    implicit none
    integer:: n, maxit=100, i,j,k,p,small_p
    real:: mu,tol=1.0e-5,error
    real,allocatable:: A(:,:)
    real,allocatable:: x(:,:)
    real,allocatable:: y(:,:)
    print*, "enter the dimension:"
    read(*,*) n
    allocate(A(n,n))
    allocate(x(n,1))
    allocate(y(n,1))
    open(unit=1,file="D:\bro code\Mathgramming\3rd year assignments solution in Fortran\Assignment4\matrix2.txt")
    do i=1,n
        read(1,*) (A(i,j),j=1,n)
    end do
    do i=1,n
        write(*,*) (A(i,j),j=1,n)
    end do
    x=1.0
    k=1
    small_p=1
    do i=2,n
        if (abs(x(small_p,1))<abs(x(i,1))) then
            small_p=i
        end if

    end do
    p=small_p
    x=x/x(p,1)

    do while(k<=maxit)
        y=0.0
        do i=1,n
            do j=1,n
                y(i,1)=y(i,1)+(A(i,j)*x(j,1))

            end do

        end do
        mu=y(p,1)
    small_p=1
    do i=2,n
        if (abs(y(small_p,1))<abs(y(i,1))) then
            small_p=i
        end if

    end do
    p=small_p
    if (abs(y(p,1))<1.0e-7 )then
        print*, "eigenvectors"
        do i=1,n
            write(*,*) x(i,1)
        end do
        print*, "eigenvalues are 0"
        stop
    end if
    error=0.0
    do i=1,n
        if(abs(x(i,1)-(y(i,1)/y(p,1)))>error)then
            error=abs(x(i,1)-(y(i,1)/y(p,1)))
        end if
        x(i,1)=(y(i,1)/y(p,1))

    end do

    if (error<tol)then
        write(*,*) "eigenvalues", mu
        print*, "iterations:",k
        print*, "eigenvectors:"
        do i=1,n
            write(*,*) x(i,1)
        end do
        stop
    end if


       k=k+1
    end do

end program
