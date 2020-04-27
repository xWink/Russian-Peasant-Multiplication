! Name: Shawn Kaplan
! 
! This program prompts the user for 2 integers and multiplies
! them using both interative and recursive functions following
! the Russian Peasant Multiplication algorithm. The runtime
! of each function is measured and printed with the results.

program multiply

    implicit none
    
    integer*8 :: a, b, p1, p2
    real :: recurStartTime, recurEndTime, iterStartTime, iterEndTime, runTime
    
    ! Get multiplier and multiplicand
    write(*,*) 'Enter multiplier'
    read(*,*) a
    write(*,*) 'Enter multiplicand'
    read(*,*) b
    write(*,*)
    
    ! Time recursive multiplication
    call cpu_time(recurStartTime)
    call recur(a, b, p1)
    call cpu_time(recurEndTime)
    
    ! Time iterative multiplication
    call cpu_time(iterStartTime)
    call nonrecur(a, b, p2)
    call cpu_time(iterEndTime)
    
    ! Print answers and runtimes
    write(*,'(a)', advance='no') 'Recursive product: '
    write(*,*) p1
    write(*,'(a)', advance='no') 'Nonrecursive product: '
    write(*,*) p2
    write(*,*)
    
    runTime = (recurEndTime - recurStartTime) * 1000
    write(*,'(a)', advance='no') 'Recursive runtime (ms): '
    write(*,*) runTime
    
    runTime = (iterEndTime - iterStartTime) * 1000
    write(*,'(a)', advance='no') 'Nonrecursive runtime (ms): '
    write(*,*) runTime

end program multiply

recursive subroutine recur(a, b, p)
    
    implicit none
    
    integer*8, intent(in) :: a, b
    integer*8, intent(out) :: p
    
    if (a .eq. 0) then
        p = 0
    else if (a .eq. 1) then
        p = b
    else if (a .gt. 1 .and. (mod(a, 2) .eq. 0)) then
        call recur(a / 2, b + b, p)
    else if (a .gt. 1 .and. (mod(a, 2) .eq. 1)) then
        call recur(a / 2, b + b, p)
        p = p + b
    else
        p = 0
    end if

end subroutine recur

subroutine nonrecur(a, b, p)
    
    implicit none
    
    integer*8, intent(in) :: a, b
    integer*8, intent(out) :: p
    integer*8 :: x, y
    
    if (a .eq. 0) then
        p = 0
    else if (a .eq. 1) then
        p = b
    else
        x = a
        y = b
        p = 0
        do while (y > 0)
            if (mod(y, 2) .ne. 0) then
                p = p + x
            end if
            x = x * 2;
            y = y / 2;
        end do
    end if
    
end subroutine nonrecur
