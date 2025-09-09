program Bisection
    implicit none
    real::a=1.0,b=2.0,c, tol=10.0**(-4)

    if ((f(a)*f(b))>0) then
        print*,"no solution"
        elseif((f(a)*f(b))<0) then
            c=(a+b)/2.0
            do while(abs(f(c))>tol)
                if ((f(a)*f(c))<0) then
                    b=c
                    else
                        a=c
                end if
                c=(a+b)/2.0

            end do


    end if
    write(*,*) "Solution is: " , c

    contains
    function f(x)
        implicit none
        real::f,x
        f=x**3+4.0*x**2-10.0
        return
        end function

end program
