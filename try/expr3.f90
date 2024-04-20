program name
    implicit none
    ! call my_func()
    contains

    subroutine my_func(a)
        integer(8), intent(in) :: a(1000*1000*2)
        print *, size(a)
    end subroutine
end program
