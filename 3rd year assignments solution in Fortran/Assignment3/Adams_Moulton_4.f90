program Adams_Moulton_4
    implicit none
    real:: a=0.0,b=2.0,t(100),y(100),h=0.25,k1,k2,k3,k4
    integer:: i,N
    N=nint((b-a)/h)
    t(1)=a
    y(1)=0.5
    do i=1,3
        k1=h*f(t(i),y(i))
        k2=h*f(t(i)+(h/2.0),y(i)+(k1/2.0))
        k3=h*f(t(i)+(h/2.0),y(i)+(k2/2.0))
        k4=h*f(t(i)+h,y(i)+k3)
        y(i+1)=y(i)+((k1+2.0*(k2+k3)+k4)/6.0)
        t(i+1)=t(i)+h



    end do
    do i=4,N
        t(i+1)=t(i)+h
        y(i+1)=y(i)+(h/720.0)*(251.0*(-((t(i+1)**2.0))+1.0)+646.0*f(t(i),y(i))&
        -264.0*f(t(i-1),y(i-1))+106.0*f(t(i-2),y(i-2))-19.0*f(t(i-3),y(i-3)))
        y(i+1)=(y(i+1)/(1.0-((251.0*h)/720.0)))

    end do
    print*, "t                        y(t)"
    do i=1,N+1
        print*, t(i),y(i)

    end do

    contains
    function f(t,y)
        implicit none
        real:: t,y,f
        f=y-(t**2.0)+1.0

    end function


end program
