program fibonacci
    integer:: a(100),i,c=0
    print*, "Enter first n th integer:"
    read(*,*) n
    a(1)=0
    a(2)=1
    do i=3,n
        a(i)=a(i-2)+a(i-1)
    end do
    do i=1,n
        write(*,"(i20)" ,advance="No") a(i)
        c=c+1
        if (c==3) then
        write(*,*)
        c=0
    end if
    end do

end program
