program fixed_point_iteration
    implicit none
    real:: a=1.0, b=2.0,c,e=10**(-4)
    integer:: step=1,N=10
    c=(a+b)/2.0
    do while(abs(f(c))>e)
        c=g(c)
        if (step>N)then
            exit
            else
                step=step+1
        end if


    end do
    print*, c
    contains
    function f(x)
        implicit none
        real::f,g,x
        f= x**3+4.0*x**2-10.0
        return
        end function
        function g(x)
        implicit none
        real::g,x
        g=x-((x**3+4.0*x**2-10.0)/(3.0*x**2+8.0*x))
        return
        end function
end program

