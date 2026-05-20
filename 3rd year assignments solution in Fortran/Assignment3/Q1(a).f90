program eulers_method
    implicit none
    real:: a=1.0,b=2.0,t(100),y(100),h=0.2
    integer:: i,n,j
    t(1)=a
    y(1)=0.5
    n=(b-a)/(1.0*h)
    do i=1,n
        t(i+1)=t(i)+h
        y(i+1)=y(i)+h*f(t(i),y(i))
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
