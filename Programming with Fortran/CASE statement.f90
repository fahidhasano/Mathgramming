program trafficlights
    implicit none
    character:: light
    write(*,*) "Enter the first letter of the color:"
    read(*,*) light
    select case(light)
    case('R','r')
        print*,"Stop!"
    case ('Y','y')
        print*,"Prepare to start!"
    case ('G','g')
        print*,"Go!"
    case default
        print*,"Error::Invalid character"

    end select
end program
