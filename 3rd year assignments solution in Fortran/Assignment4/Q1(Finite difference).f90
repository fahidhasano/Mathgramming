program finite_difference
    implicit none
    integer,parameter:: N=10
    real:: a=1.0,b=2.0,alpha=1.0,beta=2.0
    real:: h,x,a_vec(N),b_vec(N),c_vec(N),d_vec(N)
    real:: l(N),u(N),z(N),w(0:N+1),y_exact,error
    integer::i
    h=(b-a)/(N+1)
    x=a+h
    a_vec(1)=2.0+(h**2.0)*q(x)
    b_vec(1)=-1.0+(h/2.0)*p(x)
    d_vec(1)=(-h**2.0)*r(x)+(1.0+(h/2.0)*p(x))*alpha
    do i=2,N-1
        x=a+i*h
        a_vec(i)=2.0+(h**2.0)*q(x)
        b_vec(i)=-1.0+(h/2.0)*p(x)
        c_vec(i)=-1.0-(h/2.0)*p(x)
        d_vec(i)=(-h**2.0)*r(x)
        end do

        x=b-h
        a_vec(N)=2.0+(h**2.0)*q(x)
        c_vec(N)=-1.0-(h/2.0)*p(x)
        d_vec(N)=(-h**2.0)*r(x)+(1.0-(h/2.0)*p(x))*beta
        l(1)=a_vec(1)
        u(1)=b_vec(1)/a_vec(1)
        z(1)=d_vec(1)/l(1)
        do i=2,N-1
            l(i)=a_vec(i)-c_vec(i)*u(i-1)
            u(i)=b_vec(i)/l(i)
            z(i)=(d_vec(i)-c_vec(i)*z(i-1))/l(i)



        end do
        l(N)=a_vec(N)-c_vec(N)*u(N-1)
        z(N)=(d_vec(N)-c_vec(N)*z(N-1))/l(N)
        w(0)=alpha
        w(N+1)=beta
        w(N)=z(N)
        do i=N-1,1,-1
            w(i)=z(i)-u(i)*w(i+1)


        end do
        print*, "x                  w(FDM)          exact           error  "
        do i=0,N+1
            x=a+i*h
            y_exact=1.139207*x+(-0.039207)*(1.0/x**2.0)-(3.0/10.0)*sin(log(x))-(1.0/10.0)*cos(log(x))
            error=abs(y_exact-w(i))

            print*, x,w(i),y_exact,error


        end do



    contains
    function p(x)
        implicit none
        real:: x, p
        p=-2.0/(x)
    end function
    function q(x)
        implicit none
        real:: x,q
        q=2.0/(x**2.0)

    end function
    function r(x)
        implicit none
        real:: x,r
        r=sin(log(x))/(x**2.0)
    end function






end program
