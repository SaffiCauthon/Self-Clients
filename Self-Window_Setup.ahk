; \file     Self-Window_Setup.AHK
; \brief    Place windows where they should be >:(
; \author   Saffi Cauthon
; \date     12.05.2021 (dd/mm/yy)
; \version  0.00.01
; \project  Self-Window_Setup
;-------------------------------------------------------------------------------

#SingleInstance, Force  ;Make sure that only one AHK app is running at a time

osrs_start_pos_x    :=  1111
osrs_start_pos_y    :=  0
osrs_size_x         :=  809
osrs_size_y         :=  540
osrs_transpose_x    :=  -100
osrs_transpose_y    :=  0

rs3_start_pos_x     :=  1104
rs3_start_pos_y     :=  508
rs3_size_x          :=  823
rs3_size_y          :=  579
rs3_transpose_x     :=  -100
rs3_transpose_y     :=  0

F11::
{
    WinGet, osrs_id, List, RuneLite
    Loop, %osrs_id%
    {
        this_id := osrs_id%A_Index%

        WinMove
            ,ahk_id %this_id%
            ,
            ,osrs_start_pos_x + (A_Index-1)*osrs_transpose_x
            ,osrs_start_pos_y + (A_Index-1)*osrs_transpose_y
            ,osrs_size_x
            ,osrs_size_y
            ,
            ,

        if A_Index = osrs_id
            Break
    }
}
Return

F12::
{
    WinGet, rs3_id, List, RuneScape
    Loop, %rs3_id%
    {
        this_id := rs3_id%A_Index%

        WinMove
            ,ahk_id %this_id%
            ,
            ,rs3_start_pos_x + (A_Index-1)*rs3_transpose_x
            ,rs3_start_pos_y + (A_Index-1)*rs3_transpose_y
            ,rs3_size_x
            ,rs3_size_y
            ,
            ,
        
        if A_Index = rs3_id
            Break
    }
}
Return