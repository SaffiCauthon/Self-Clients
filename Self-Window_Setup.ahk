; \file     Self-Window_Setup.AHK
; \brief    Place windows where they should be >:(
; \author   Saffi Cauthon
; \date     04.12.2021 (dd/mm/yy)
; \version  0.00.03
; \project  Self-Window_Setup
;-------------------------------------------------------------------------------

#SingleInstance, Force  ;Make sure that only one AHK app is running at a time

steam_size_x         :=  765
steam_size_y         :=  548
steam_start_pos_x    :=  1146
steam_start_pos_y    :=  0
steam_transpose_x    :=  -100
steam_transpose_y    :=  0

osrs_size_x         :=  809
osrs_size_y         :=  540
osrs_start_pos_x    :=  1111
osrs_start_pos_y    :=  0
osrs_transpose_x    :=  -100
osrs_transpose_y    :=  0

rs3_size_x          :=  823
rs3_size_y          :=  579
rs3_start_pos_x     :=  1104
rs3_start_pos_y     :=  508
rs3_transpose_x     :=  -100
rs3_transpose_y     :=  0

rs3b_size_x         :=  823
rs3b_size_y         :=  579
rs3b_num_row        :=  2
rs3b_start_pos1_x   :=  1104
rs3b_start_pos1_y   :=  0
rs3b_start_pos2_x   :=  1104
rs3b_start_pos2_y   :=  508
rs3b_transpose_x    :=  -520
rs3b_transpose_y    :=  0


F10::
{
    WinGet, steam_id, List, Old School RuneScape
    Loop, %steam_id%
    {
        this_id := steam_id%A_Index%

        WinMove
            ,ahk_id %this_id%
            ,
            ,steam_start_pos_x + (A_Index-1)*steam_transpose_x
            ,steam_start_pos_y + (A_Index-1)*steam_transpose_y
            ,steam_size_x
            ,steam_size_y
            ,
            ,

        if A_Index = steam_id
            Break
    }
}
Return

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

+F12::
{
    WinGet, rs3_id, List,  RuneScape
    WinGet, rs3_nm, Count, RuneScape

    Loop, %rs3_id%
    {
        this_id := rs3_id%A_Index%
        num_row := rs3_nm // rs3b_num_row

        if(A_Index <= num_row)
        {
            WinMove
                ,ahk_id %this_id%
                ,
                ,rs3b_start_pos1_x + (A_Index-1)*rs3b_transpose_x
                ,rs3b_start_pos1_y + (A_Index-1)*rs3b_transpose_y
                ,rs3b_size_x
                ,rs3b_size_y
                ,
                ,
            
            if A_Index = rs3_id
                Break
        }
        else
        {
            WinMove
                ,ahk_id %this_id%
                ,
                ,rs3b_start_pos2_x + (A_Index-num_row-1)*rs3b_transpose_x
                ,rs3b_start_pos2_y + (A_Index-num_row-1)*rs3b_transpose_y
                ,rs3b_size_x
                ,rs3b_size_y
                ,
                ,
            
            if A_Index = rs3_id
                Break            
        }
    }
}
Return