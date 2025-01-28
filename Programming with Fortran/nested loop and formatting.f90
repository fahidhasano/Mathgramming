program nested
    implicit none
    integer :: i,j
    real::roll=101,resultf=5458


    do i=1,10
        do j=1,15
            write(*,*) i,j

        end do
    end do

end program
