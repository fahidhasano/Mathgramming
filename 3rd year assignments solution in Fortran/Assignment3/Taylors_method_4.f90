program taylors_method_4
    implicit none
    real::h=0.2,a=1.0,b=2.0,t(0:100),y(0:100)
    integer:: n,i
    n=nint((b-a)/h)
    t(0)=a
    y(0)=0.5

    do i = 0,n-1
        write(*,*) t(i),y(i)
        y(i+1)=y(i)+h*(f(t(i),y(i))+(h/2.0)*df(t(i),y(i))+((h**2.0)/6.0)*d2f(t(i),y(i))+((h**3.0)/24.0)*d3f(t(i),y(i)))
        t(i+1)=t(i)+h

    end do

    write(*,*) t(n),y(n)
    contains
    function f(t,y)
        implicit none
        real::f, t,y
        f=t**2.0-t*y+y**2.0
    end function
    function df(t,y)
     implicit none
        real::df, t,y
        df=2.0*t-t*f(t,y)-y+2.0*y*f(t,y)
    end function
    function d2f(t,y)
         implicit none
        real:: d2f,t,y
        d2f=2.0-(t*df(t,y)+f(t,y))-f(t,y)+2.0*(f(t,y)*f(t,y)+y*df(t,y))
    end function
    function d3f(t,y)
         implicit none
        real:: d3f,t,y
        d3f=-t*d2f(t,y)-3.0*df(t,y)-2.0*df(t,y)*f(t,y)+4.0*df(t,y)*f(t,y)+y*d2f(t,y)
    end function





end program

