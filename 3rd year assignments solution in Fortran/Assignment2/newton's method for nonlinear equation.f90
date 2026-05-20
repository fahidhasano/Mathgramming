program newtons_method
    implicit none
    real(8), allocatable:: x(:),f(:),J(:,:),delx(:),fx(:),b(:),A(:,:)
    integer::n=3,i,k,maxit=100,l,m
    real(8):: tol=1.0d-6,norm
    allocate(x(n),J(n,n),f(n),delx(n),fx(n),A(n,n+1))
    allocate(b(n))
    !initial guess
    x=(/0.1d0,0.1d0,-0.1d0/)
    do k=1,maxit
    call jacobian(n,x,J)
    call Fsystem(n,x,f)
    b=-f
    A(:,1:n)=J
    A(:,n+1)=b
    !solve
    call gaussian_elimination(n,A,delx)
    x=x+delx
    norm=sqrt(sum(delx**2.0))
    print*,k,x
    if (norm<tol) then
        print*, "converge"
        print*, x
        exit
    end if


    end do



    contains

    subroutine Fsystem(n,x,f)
        implicit none
        integer,intent(in):: n
        real(8), intent(in):: x(n)
        real(8), intent(out):: f(n)
        real(8)::pi
        pi=acos(-1.0d0)
        f(1)=3.0d0*x(1)-cos(x(2)*x(3))-0.5d0
        f(2)=(x(1)**2.0)-81.0d0*(x(2)+0.1d0)**2.0+sin(x(3))+1.06d0
        f(3)=exp(-x(1)*x(2))+20.0d0*x(3)+((10.0d0*pi-3.0d0)/3.0d0)
    end subroutine
    subroutine jacobian(n,x,J)
        implicit none
        real(8), intent(in)::x(n)
        integer, intent(in):: n
        real(8):: h=1.0d-6
        integer:: k,i
        real(8),intent(out):: J(n,n)
        real(8), allocatable :: xh(:), f1(:), f2(:)
        allocate(xh(n), f1(n), f2(n))
        call Fsystem(n,x,f1)
        do k= 1,n
            xh=x
            xh(k)=xh(k)+h
            call Fsystem(n,xh,f2)
            do i=1,n
                J(i,k)= (f2(i)-f1(i))/h
            end do
        end do

    deallocate(xh, f1, f2)

    end subroutine
    subroutine gaussian_elimination(n,A,x)
        implicit none
        integer::n,k,i
        real(8), intent(inout):: A(n,n+1)
        real(8), intent(out):: x(n)
        real(8):: coeff
        !forward elimination
        do k=1,n-1
            do i=k+1,n
                coeff=A(i,k)/A(k,k)
                A(i,:)=A(i,:)-coeff*A(k,:)

            end do

        end do
        !backward elimination
        do k=n,2,-1
            do i=k-1,1,-1
                coeff=A(i,k)/A(k,k)
                A(i,:)=A(i,:)-coeff*A(k,:)
            end do

        end do
        do i=1,n
                A(i,:)=A(i,:)/A(i,i)
                x(i)=A(i,n+1)
        end do
    end subroutine

end program
