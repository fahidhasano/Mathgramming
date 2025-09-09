subroutine two_dim_array
    implicit none
    integer:: i,j
    real, dimension(2,3):: a
    read(*,*) ((a(i,j),j=1,3),i=1,2)
    write(*,10) ((a(i,j),j=1,3),i=1,2)
    10 format (3(2x,f5.2),/,3(2x,f5.2))

end subroutine

subroutine line
    implicit none
    character(len=100):: a,b,c
    a="amar"
    b="sonar"
    c="bangla"
    write(*,10) a,b,c
    10 format(A,/,A,//,A)
end subroutine

program calling
    call two_dim_array
end program
