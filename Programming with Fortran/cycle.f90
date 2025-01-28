program CYCLE_STATEMENT
    integer::i
    do i=1,5
    if (i==3) cycle
    write(*,*) i
    end do
end program
