! Algorithm based on Burden's Numerical analysis book 9th edition page 681

program shooting_method
    implicit none
    integer,parameter :: N=10

real,dimension(0:N) :: X,U,V,Y

call first_de

call second_de

call shooting

contains


    function f1(x,u1,u2)
        implicit none
        real::x,u1,u2,f1
        f1=u2

    end function
    function f2(x,u1,u2)
        implicit none
        real:: x,u1,u2,f2
        f2=u2*(-2.0/x)+(2.0/(x**2.0))*u1+(sin(log(x))/(x**2.0))

    end function

    function g1(x,v1,v2)
        implicit none
        real::x,v1,v2,g1
        g1=v2

    end function
    function g2(x,v1,v2)
        implicit none
        real:: x,v1,v2,g2
        g2=v2*(-2.0/x)+(2.0/(x**2.0))*v1

    end function




subroutine first_de
    implicit none
    integer:: m=2,i,j
    real:: a=1.0,b=2.0,h,xx
    real,dimension(2)::w,alpha,k1,k2,k3,k4
    alpha(1)=1.0
    alpha(2)=0.0

    h=(b-a)/N
    xx=a
    do j=1,m
        w(j)=alpha(j)
    end do
    X(0)=a
U(0)=w(1)


    do i=1,N
        k1(1)=h*f1(xx,w(1),w(2))
        k1(2)=h*f2(xx,w(1),w(2))
        k2(1)=h*f1(xx+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0)
        k2(2)=h*f2(xx+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0)
        k3(1)=h*f1(xx+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0)
        k3(2)=h*f2(xx+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0)
        k4(1)=h*f1(xx+h,w(1)+k3(1),w(2)+k3(2))
        k4(2)=h*f2(xx+h,w(1)+k3(1),w(2)+k3(2))
        do j=1,m
            w(j)=w(j)+(k1(j)+2.0*k2(j)+2.0*k3(j)+k4(j))/6.0


        end do
        xx=a+real(i)*h
        X(i)=xx
U(i)=w(1)




    end do








end subroutine

subroutine second_de
    implicit none
    integer:: m=2,i,j
    real:: a=1.0,b=2.0,h,xx
    real,dimension(2)::w,alpha,k1,k2,k3,k4
    alpha(1)=0.0
    alpha(2)=1.0

    h=(b-a)/N
    xx=a
    do j=1,m
        w(j)=alpha(j)
    end do
    V(0)=w(1)

    do i=1,N
        k1(1)=h*g1(xx,w(1),w(2))
        k1(2)=h*g2(xx,w(1),w(2))
        k2(1)=h*g1(xx+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0)
        k2(2)=h*g2(xx+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0)
        k3(1)=h*g1(xx+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0)
        k3(2)=h*g2(xx+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0)
        k4(1)=h*g1(xx+h,w(1)+k3(1),w(2)+k3(2))
        k4(2)=h*g2(xx+h,w(1)+k3(1),w(2)+k3(2))
        do j=1,m
            w(j)=w(j)+(k1(j)+2.0*k2(j)+2.0*k3(j)+k4(j))/6.0


        end do
        xx=a+real(i)*h
        V(i)=w(1)



    end do








end subroutine
subroutine shooting

implicit none

integer :: i
real :: c,exact,error

c=(2.0-U(N))/V(N)


print*,"         x                  u1(x)                v1(x)          y(x)"

do i=0,N

    Y(i)=U(i)+c*V(i)
exact = 1.1392070132*X(i)-0.03920701320*(1.0/(X(i)**2.0))&
-(3.0/10.0)*sin(log(X(i)))-(1.0/10.0)*cos(log(X(i)))

    error = abs(exact-Y(i))

    print *,X(i),U(i),V(i),Y(i),exact,error



end do

end subroutine





end program






