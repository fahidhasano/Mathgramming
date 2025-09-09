program files
    implicit none
    integer:: a,b,c,p
    open(unit=1, file="rafid.txt", status="old",action="read" )
    read(1,*) a,b,c
    open(unit=2, file="fahid.txt",status="unknown", action="write")
    p=a+b+c
    write(2,*) "sum is :",p
    close(1)
    close(2)
end program
