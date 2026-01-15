! Always call/run the specific number's answer in program call_subroutine
! 1(i)
subroutine bisection
    implicit none
    real:: x0=-5.0,x1=5.0 ,y1,y0,x2,tol=0.001,y2
    y0=f(x0) !rough
    y1=f(x1) !rough
    if (y0*y1<0.0) then
    x2=(x0+x1)/2.0
    y2=f(x2)
    DO WHILE (abs(y2)>tol)
        IF (y2*y0 <0.0) THEN
            x1=x2
            x2=(x0+x1)/2.0
    y2=f(x2)
            else
                x0=x2
                x2=(x0+x1)/2.0
    y2=f(x2)


        END IF

    END DO
    write(*,*) x2

    elseif(y0*y1>0.0) then
        write(*,*) 'No solution exists'
        elseif (y0*y1==0.0) then
            write(*,*) y0,y1

    end if

    contains
    function f(x)
        implicit none
        real:: f, x
        f=(x**3.0)-2.0*x-5.0
    end function


end subroutine
!1.(ii)
subroutine false_position
    implicit none
    real:: tol=0.001,x0,x1,x2
    integer:: i,maxiter=10
    x0=2.0
    x1=3.0
    if ((f(x0)*f(x1))<0) then
    do i=1,maxiter

        x2=x0-((f(x0)*(x1-x0))/(f(x1)-f(x0)))
        if (abs(f(x2))<tol) exit
        if ((f(x2)*f(x0))<0) then
        x1=x2
        else
            x0=x2
        end if



    end do
    print*, x2, i
    else
        print*, 'no solution exists'

    end if

    contains
    function f(x)
        implicit none
        real:: f,x
        f=(x**3.0)-2.0*x-5.0
    end function

end subroutine


!1.(iii)
subroutine secant_method
    implicit none
    real:: x,tol=0.001,x0,x1,x2
    integer:: i,maxiter=10
    x0=2.0
    x1=3.0
    do i=1,maxiter
        x2=x0-((f(x0)*(x1-x0))/(f(x1)-f(x0)))
        if (abs(x2-x1)<tol) exit
        x0=x1
        x1=x2
    end do
    print*, x2,i
    contains
    function f(x)
        implicit none
        real:: f,x
        f=(x**3.0)-2.0*x-5.0
    end function

end subroutine

! 2.
!NOTE: ONLY SECOND FUNCTION (PHI 2) WILL CONVERGE OR SOLUTION EXIST, SO ONLY PHI 2 HAVE SOLUTION
subroutine fixed_point
    implicit none
    real::  x=2,y, tol=0.001
    integer:: i, Max_iter=100
    do i=1, Max_iter
        y=phi2(x)
        if (abs(y-x)<tol) exit
        x=y
    end do
    write(*,*) y, i
    contains
    function phi1(x)
        implicit none
        real:: phi1,x
        phi1=((x**3.0)-5.0)/2.0
    end function
    function phi2(x)
        implicit none
        real:: phi2,x
        phi2=(2.0*x+5.0)**(1.0/3.0)
    end function

    function phi3(x)
        implicit none
        real:: phi3,x
        phi3=(2.0*x+5.0)/x**2.0
    end function



end subroutine
subroutine chebychev
    implicit none
    real:: x=2,y,tol=0.001
    integer:: i,Maxiter=200
    do i=1, Maxiter
        y=f(x)
        if (abs(y-x)<tol) exit
        x=y
    end do

    print*, y,i

    contains
    function f(x)
    implicit none
    real:: f,x
    f=x-(((x**3.0)-2.0*x-5.0)/((3.0*x**2.0)-2.0))-(1.0/2.0)*((((x**3.0-2.0*x-5.0)**2.0 )*6.0*x)/(3.0*x**2-2.0)**3.0)
    end function

end subroutine


subroutine newton_raphson_i
    implicit none
    real:: x=2,y,tol=0.001
    integer:: i,Maxiter=200
    do i=1, Maxiter
        y=f(x)
        if (abs(y-x)<tol) exit
        x=y
    end do

    print*, y,i

    contains
    function f(x)
    implicit none
    real:: f,x,a=5.0
    f=(1.0/2.0)*(x+(a/x))
    end function
end subroutine
subroutine newton_raphson_ii
    implicit none
    real:: x=2,y,tol=0.001
    integer:: i,Maxiter=200
    do i=1, Maxiter
        y=f(x)
        if (abs(y-x)<tol) exit
        x=y
    end do

    print*, y,i

    contains
    function f(x)
    implicit none
    real:: f,x,a=5.0
    f=(1.0/3.0)*((2.0*x)+(a/(x**2.0)))
    end function
end subroutine
subroutine newton_raphson_iii
    implicit none
    real:: x=0.2,y,tol=0.001
    integer:: i,Maxiter=200
    do i=1, Maxiter
        y=f(x)
        if (abs(y-x)<tol) exit
        x=y
    end do

    print*, y,i

    contains
    function f(x)
    implicit none
    real:: f,x,a=5.0
    f=x*(2.0-a*x)
    end function
end subroutine
program call_subroutine
    implicit none
    call chebychev
end program















