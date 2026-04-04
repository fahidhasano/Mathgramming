program convergence_proving
    real:: x_old=4.4, y_old=1.0, x_new, y_new,tol=0.001
    integer::i
    write(*,*) "Iteration number   x new    y new"
    do i=1,5
        x_new=sqrt(7.0-y_old)
        y_new=-sqrt(x_old-4.0)
        write(*,*) i,x_new,y_new
        if(abs(x_new-x_old)<tol .and. abs(y_new-y_old)<tol) then
            exit
        end if
        x_old=x_new
        y_old=y_new
    end do
    if (i==5) then
        print*, "It doesnot converge after 5 iterations"
    end if


end program
