program RK_method_of_system_of_DE
    implicit none
    integer:: m=3,N=100,i,j
    real:: a=0.0,b=10.0,beta=10.0,gamma=1.0,h,t
    real,dimension(3)::w,alpha,k1,k2,k3,k4
    alpha(1)=0.9
    alpha(2)=0.1
    alpha(3)=0.0
    print*, "t          s(t)            I(t)     R(t)"
    h=(b-a)/N
    t=a
    do j=1,m
        w(j)=alpha(j)
    end do
    print*, t,w(1),w(2),w(3)
    do i=1,N
        k1(1)=h*f1(t,w(1),w(2),w(3),beta,gamma)
        k1(2)=h*f2(t,w(1),w(2),w(3),beta,gamma)
        k1(3)=h*f3(t,w(1),w(2),w(3),beta,gamma)
        k2(1)=h*f1(t+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0,w(3)+k1(3)/2.0,beta,gamma)
        k2(2)=h*f2(t+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0,w(3)+k1(3)/2.0,beta,gamma)
        k2(3)=h*f3(t+(h/2.0),w(1)+k1(1)/2.0,w(2)+k1(2)/2.0,w(3)+k1(3)/2.0,beta,gamma)
        k3(1)=h*f1(t+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0,w(3)+k2(3)/2.0,beta,gamma)
        k3(2)=h*f2(t+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0,w(3)+k2(3)/2.0,beta,gamma)
        k3(3)=h*f3(t+(h/2.0),w(1)+k2(1)/2.0,w(2)+k2(2)/2.0,w(3)+k2(3)/2.0,beta,gamma)
        k4(1)=h*f1(t+h,w(1)+k3(1),w(2)+k3(2),w(3)+k3(3),beta,gamma)
        k4(2)=h*f2(t+h,w(1)+k3(1),w(2)+k3(2),w(3)+k3(3),beta,gamma)
        k4(3)=h*f3(t+h,w(1)+k3(1),w(2)+k3(2),w(3)+k3(3),beta,gamma)
        do j=1,m
            w(j)=w(j)+(k1(j)+2.0*k2(j)+2.0*k3(j)+k4(j))/6.0


        end do
        t=a+real(i)*h
        print*, t,w(1),w(2),w(3)


    end do
    contains
    function f1(t,S,I,R,b,g)
        implicit none
        real:: t,S,I,R,b,g,f1
        f1=-b*S*I

    end function
    function f2(t,S,I,R,b,g)
        implicit none
        real:: t,S,I,R,b,g,f2
        f2=(b*S*I)-g*I

    end function
    function f3(t,S,I,R,b,g)
        implicit none
        real:: t,S,I,R,b,g,f3
        f3=g*I

    end function





end program
