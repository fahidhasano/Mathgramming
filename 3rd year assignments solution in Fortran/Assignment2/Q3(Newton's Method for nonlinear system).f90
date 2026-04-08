program Newtons_Method
    implicit none
    ! in the question, (2,2) initial point is absurd as ln(2-2^2) is Nan
    real:: x_old=2.0,y_old=1.0, x_new, y_new, J(2,2), F(2), tol= 0.00001,det
    integer::i
    write(*,*) "Iteration number   x new          y new"
    do i=1,100
        ! Declaring systems of non linear equations
        F(1)=log(x_old-(y_old**2.0))-sin(x_old*y_old)
        F(2)=exp(x_old*y_old)+cos(x_old-y_old)-2.0
        ! Creating Jacobian matrix
        J(1,1)=(1.0/(x_old-(y_old)**2.0))-y_old*cos(x_old*y_old)
        J(1,2)=((-2.0*y_old)/(x_old-(y_old)**2.0))-x_old*cos(x_old*y_old)
        J(2,1)=exp(x_old*y_old)*y_old-sin(x_old-y_old)
        J(2,2)=exp(x_old*y_old)*x_old+sin(x_old-y_old)
        ! determinant
        det= J(1,1)*J(2,2)-J(1,2)*J(2,1)
        if (abs(det) < 1.0e-12) then
            print*, "No solution exists"
            exit
        end if
        !By applying Cramer's rule to solve -F(x0,y0)=J*(delx0,dely0) to find delx0,dely0
        x_new= x_old+((-((F(1)*J(2,2))-F(2)*J(1,2)))/det)
        y_new= y_old+((-((F(2)*J(1,1))-F(1)*J(2,1)))/det)
        write(*,*) i, x_new , y_new
        if (abs(x_old-x_new)<tol .and. abs(y_old-y_new)<tol) then
            exit
        end if
        x_old=x_new
        y_old=y_new
    end do
    print*, "Solution:"
    WRITE(*, '(f 6.3, f 6.3)') x_new, y_new

end program

