﻿;Click v1.61121

ClickS(x,y,z:=0)
{
	global uid
	global Background
	global XDiff
	global YDiff
	global Class
	global ClickDelay
	if(z == 0)
	{
		global coffset
	}
	else
	{
		coffset := z
	}
	Sleep ClickDelay
	WinActivateRestore()
	Random, xoff, -coffset, coffset
	Random, yoff, -coffset, coffset
	if Background = 1
	{
		SetControlDelay 0
		if Class = 0
		{
			tx := xoff+x
			ty := yoff+y
			ControlClick, x%tx% y%ty%, ahk_id %uid%,,,,NA Pos
		}
		else
		{
			tx := x-XDiff+xoff
			ty := y-YDiff+yoff
			ControlClick, %Class%,ahk_id %uid%,,,, x%tx% y%ty%
		}
	}
	else if Background = 0
	{
		tx := xoff+x
		ty := yoff+y
		Click %tx%, %ty%
	}
	return
}
