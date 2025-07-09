program function_test
    implicit none
    real::result,x
    print*,"Enter value of x:"
    read(*,*) x
    result=f(x)
    write(*,*) "f(",x,")=",result
contains

function f(x)
    implicit none
    real::f,x
    f=x**2+2*x+3
    return
end function

end program

