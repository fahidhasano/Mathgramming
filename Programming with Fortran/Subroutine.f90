subroutine divisors(n,c)
    implicit none
    integer:: n,c
    write(*,*) "Enter a number"
    read(*,*) n
    do c=1,n
        if (mod(n,c)==0) then
        print*,c
        end if
    end do

end subroutine
subroutine concatenation
    implicit none
    character(len=10)::a
    character(len=8)::b,c
    a="abcdefghij"
    b="12345678"
    c=a(1:3)//b(4:6)//a(6:8)
    write(*,*) c
end subroutine
! Sorting number in ascending order
subroutine bubble_sort
    implicit none
    integer::i,j,a(1000),n,t
    write(*,*) "Enter length:"
    read(*,*) n
    write(*,*) "Enter numbers:"
    do i=1,n
        read(*,*) a(i)
    end do
    do i=1,n-1
        do j=1,n-i
        if (a(j)>a(j+1)) then
            t=a(j)
            a(j)=a(j+1)
            a(j+1)=t
        end if
    end do
    end do
    do i=1,n
        write(*,*) a(i)
    end do
end subroutine
!All odd positive integers<100 and not divisible by 7 so that there are 4 numbers a line
subroutine array
    implicit none
    integer:: i,c=0
    do i=1,99
        if(.not.mod(i,2)==0.and..not.mod(i,7)==0) then
            c=c+1
            write(*,'(i20)',advance='No') i

        end if
        if (c==4) then
            write(*,*)
            c=0
        end if
    end do
end subroutine

program subroutine_test
    !call your desired subroutine
    call bubble_sort
end program
