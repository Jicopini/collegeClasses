        PROGRAM LooneyTown
        IMPLICIT NONE
        
        INTEGER, PARAMETER :: Lunker = 30
        INTEGER, PARAMETER :: Loonter = 15
        INTEGER, PARAMETER :: Little = 5
        INTEGER, PARAMETER :: Pooney = 1
        INTEGER :: Luns = 0
        INTEGER :: Loos = 0
        INTEGER :: Lits = 0
        INTEGER :: Poos = 0
        INTEGER :: Amount
        REAL :: Amt
        CHARACTER(10) :: input
        character(len = 8) :: DateINFO
        character(len = 4) :: Year, Month*2, Day*2
        character(len = 10) :: TimeINFO, PrettyTime*12
        character(len = 2) :: Hour, Minute, Second*6

        IF(COMMAND_ARGUMENT_COUNT().NE.1)THEN
                WRITE(*,*)'Error, one command-line argument required'
                STOP
        ENDIF

        call get_command_argument(1,input)

        read(input,*)Amt
        Amount = int(Amt)
    
        if(Amount < 1 .or. Amount > 99)then
        write(*,*) 'Error, input is out of bounds'
        stop
        endif

        call date_and_time(DateINFO, TimeINFO)
        Year = DateINFO(1:4)
        Month = DateINFO(5:6)
        Day = DateINFO(7:8)
        Hour = TimeINFO(1:2)
        Minute = TimeINFO(3:4)
        Second = TimeINFO(5:10)
        write(*,fmt="(a)",advance="no")Month
        write(*,fmt="(a)",advance="no")"-"
        write(*,fmt="(a)",advance="no")Day
        write(*,fmt="(a)",advance="no")"-"
        write(*,fmt="(a)",advance="no")Year
        write(*,fmt="(a)",advance="no")", "
        write(*,fmt="(a)",advance="no")Hour
        write(*,fmt="(a)",advance="no")":"
        write(*,fmt="(a)",advance="no")Minute
        write(*,*)

        if(Amount >= Lunker)then
                Luns = Amount / Lunker
                Amount = Amount - (Luns * Lunker)
        endif
        if(Luns > 0)then
                write(*,fmt="(1x,i0,a)",advance="no") Luns," Lunker"
        endif

        if(Amount >= Loonter)then
                Loos = Amount / Loonter
                Amount = Amount - (Loos * Loonter)
        endif

        if(Luns > 0.and.Loos > 0)then
                write(*,fmt="(a)",advance="no")","
        endif

        if(Loos > 0)then
                write(*,fmt="(1x,i0,a)",advance="no") Loos," Loonter"
        endif

        if(Amount >= Little)then
                Lits = Amount / Little
                Amount = Amount - (Lits * Little)
        endif
        
        if(Loos > 0.or.Luns > 0)then
                if(Lits > 0)then
                        write(*,fmt="(a)",advance="no")","
                endif
        endif

        if(Lits > 0)then
                write(*,fmt="(1x,i0,a)",advance="no") Lits," Little"
        endif
        
        if(Amount>=Pooney)then
                Poos = Amount
        endif

        if(Luns > 0.or.Loos > 0.or.Lits >0)then
                if(Poos > 0)then
                        write(*,fmt="(a)",advance="no")","
                endif
        endif
        if(Poos > 0)then
                write(*,fmt="(1x,i0,a)",advance="no") Poos," Pooney"
        endif
        
        write(*,*)

        stop
        end program LooneyTown

