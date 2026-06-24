program predictor_corrector
    implicit none
    real::t(100),y(100),h=0.2,a=0.0,b=2.0,k1,k2,k3,k4
    integer:: i,n,j
    n=nint((b-a)/h)
    t(1)=a
    y(1)=0.5
    do i=1,3
        k1=h*f(t(i),y(i))
        k2=h*f(t(i)+(h/2.0),y(i)+k1/2.0)
        k3=h*f(t(i)+h/2.0,y(i)+k2/2.0)
        k4=h*f(t(i)+h,y(i)+k3)
        y(i+1)=y(i)+(k1+2.0*k2+2.0*k3+k4)/6.0
        t(i+1)=t(i)+h
    end do
    do i=4,n
        t(i+1)=t(i)+h
        !predictor
        y(i+1)=y(i)+(h/24.0)*(55.0*f(t(i),y(i))-59.0*f(t(i-1),y(i-1))+37.0*f(t(i-2),y(i-2))-9*f(t(i-3),y(i-3)))
        !corrector
        y(i+1)=y(i)+(h/24.0)*(9.0*f(t(i+1),y(i+1))+19.0*f(t(i),y(i))-5.0*f(t(i-1),y(i-1))+f(t(i-2),y(i-2)))
    end do
    print*, "t             y"
    do i=1,n+1
        print*, t(i),y(i)

    end do

    contains
    function f(t,y)
        implicit none
        real:: t,y,f
        f=y-t**2.0+1.0
    end function



end program
