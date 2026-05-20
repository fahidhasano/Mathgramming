program runge_kutta
    implicit none
    real:: a=1.0,b=2.0,t(100),y(100),h=0.2,k1,k2,k3,k4
    integer:: i,n,j
    t(1)=a
    y(1)=0.5
    n=(b-a)/(1.0*h)
    do i=1,n
        t(i+1)=t(i)+h
        k1=h*f(t(i),y(i))
        k2=h*f(t(i)+(h/2.0),y(i)+(k1/2.0))
        k3=h*f(t(i)+(h/2.0),y(i)+(k2/2.0))
        k4=h*f(t(i+1),y(i)+k3)
        y(i+1)=y(i)+(1.0/6.0)*(k1+2.0*k2+2.0*k3+k4)
    end do
    print*,"t                  f(t)"

    do j=1,n+1
        write(*,*) t(j),y(j)
    end do

    contains
    function f(t,y)
        implicit none
        real:: t, y,f
        f=t**2.0-t*y+y**2.0

    end function

end program

