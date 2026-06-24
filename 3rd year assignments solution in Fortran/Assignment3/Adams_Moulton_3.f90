program adams_moulton_3_step
    implicit none
    real:: y(100),t(100),h=0.2,a=0.0,b=2.0,k1,k2,k3,k4
    integer::n,i
    n=nint((b-a)/(1.0*h))
    y(1)=0.5
    t(1)=a
    do i=1,2

        k1=h*f(t(i),y(i))
        k2=h*f(t(i)+(h/2.0),y(i)+(k1/2.0))
        k3=h*f(t(i)+(h/2.0),y(i)+(k2/2.0))
        k4=h*f(t(i)+h,y(i)+k3)
        y(i+1)=y(i)+(k1+2.0*k2+2.0*k3+k4)/6.0
        t(i+1)=t(i)+h


    end do
    do i=3,n
        y(i+1)= y(i)+((h/24.0)*(9.0*f(t(i+1),y(i+1))+19.0*f(t(i),y(i))-5.0*f(t(i-1),y(i-1))+f(t(i-2),y(i-2))))
        t(i+1)=t(i)+h

    end do
    print*, "t              y"
    do i=1,n+1
        print*, t(i),y(i)

    end do

    contains
    function f(t,y)
        implicit none
        real::f, t,y
        f=(y-(t**2.0)+1.0)
    end function
end program



