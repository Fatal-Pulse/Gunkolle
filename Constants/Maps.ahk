#Include %A_ScriptDir%/Functions/Mouse.ahk

RunMap(x)
{
	if (x == "0_2")
	{
		0_2()
	}
	else if(x == "4_6_data")
	{
		4_6_data()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
	else if(x == "6_3N")
	{
		6_3N()
	}
	else if(x == "6_3N_airstrike")
	{
		6_3N_airstrike()
	}
	else if(x == "10_4E")
	{
		10_4E()
	}
	else if(x == "10_4Ecdo")
	{
		10_4Ecdo()
	}
	else if(x == "Orphan_60Stars")
	{
		Orphan_60Stars()
	}
}

WaitBattle()
{
	GuiControl,, NB, In Battle
	FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o30 Count1 n0 w30000,50")
	sleep 7500
	Loop
	{		
		Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
		if Found >= 1
		{
			GuiControl,, NB, Finished battle
			break
		}
		else
		{
			;Safex, Safey dont click in a valid position
			ClickS(700,400)
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				break
			}
		}
	}
}

WaitTurn(turn)
{
	Global
	GuiControl,, NB, Waiting Turn %turn%
	loop
	{
		Found := FindClick(A_ScriptDir "\pics\Turn" turn, "rLDPlayer mc o30 Count1 n0 w1000")
		if Found >= 1
		{
			break
		}
		else
		{
			TerminateFound := FindClick(A_ScriptDir "\pics\Terminate", "rLDPlayer mc o30 Count1 n0 w1000")
			if TerminateFound >= 1
			{
				GuiControl,, NB, SF moving
			}
			else
			{
				WaitBattle()
			}	
		}		
	}
	GuiControl,, NB, G&K turn started
	TFindClick("Planning", "PlanningReady")
}

WaitExecution()
{
	Global
	loop
	{		
		Found := FindClick(A_ScriptDir "\pics\Planning", "rLDPlayer mc o30 Count1 n0 w5000")
		if Found >= 1
		{
			break
		}
		else
		{
			EndTurnFound := FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o30 Count1 n0 w1000")
			if EndTurnFound >= 1 
			{
				GuiControl,, NB, Executing Plan			
			}
			else
			{
				WaitBattle()
			}
		}		
	}
}

nodes(nodecount)
{
	Global
	loop, %nodecount%
	{
		Found := 0
		FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0 w30000,50")
		sleep 5000
		while(Found == 0)
		{
			Found := 0
			Found := FindClick(A_ScriptDir "\pics\LoadScreen", "rLDPlayer mc o50 n0 Count1 w100,50")
			if Found >= 1
			{

			}
			else
			{
				;ClickS(Safex,Safey)
				ClickS(700,400)
			}
			GuiControl,, NB, %found%
		}
		FindClick(A_ScriptDir "\pics\Turn", "rLDPlayer mc o50 Count1 n0 w30000,50")
	}
}

;GoHome()
;{
;	Global
;	RetirementLoop := 1
;	loop, %RetirementLoop%
;	{
;		Found1 := 0
;		Found2 := 0
;		Found3 := 0
;		sleep 5000
;		while(Found1 == 0 && Found2 == 0)
;		{
;			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
;			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rLDPlayer mc o40 Count1 n0")
;			if (Found1 >= 1 or Found2 >= 1)
;			{
;
;			}
;			else
;			{
;				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
;				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
;				if FoundExp >= 1
;				{
;					RetirementLoop++
;				}
;				ClickS(Homex+52,Homey)
;			}
;			GuiControl,, NB, %found1% %found2% %found3% 
;		}
;	}
;}

GoHome()
{
	Global
	RetirementLoop := 1
	loop, %RetirementLoop%
	{
		Found1 := 0
		Found2 := 0
		Found3 := 0
		Found4 := 0
		Found5 := 0
		sleep 5000
		while(Found1 == 0 && Found2 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w250,50 Count1 n0 a1200,,,-600")
			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rLDPlayer mc o40 Count1 n0")
			
			if (Found1 >= 1 or Found2 >= 1)
			{

			}
			else
			{
				Found4 := FindClick(A_ScriptDir "\pics\ReturnFromResult", "rLDPlayer mc o40 Count1 w100,50")
                sleep 1000
				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
				Found5 := FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(398,649)
			}
			GuiControl,, NB, %found1% %found2% %found3% %found4% %found5% 
		}
	}
}

0_2()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 2000
		ClickS(725, 430)
		RFindClick("\Maps\0_2\0_2Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	sleep 1000
	ClickS(649, 401)
	RFindClick("\Maps\0_2\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(455, 395)
	RFindClick("\Maps\0_2\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(1145, 695)
	sleep 3000
	ClickS(455, 395)
	sleep 200
	ClickS(455, 395)
	sleep 500
	ClickTilGone("\Maps\0_2\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1500
	ClickS(649, 401)
	sleep 500
	RFindClick("\Maps\0_2\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(582, 99)
	sleep 500
	ClickS(814, 115)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	sleep 12000
	nodes(2)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

4_6_data()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 2000
		DragDownToUp(500, 675, 350)
		sleep 500
		ClickS(750, 625)
		RFindClick("\Maps\4_6\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	sleep 500
	Loop, 9
	{
		sleep 500
		ClickS(842, 400)
		sleep 500
		RFindClick("\Maps\4_6\OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 1000
		ClickS(868, 46)
		sleep 500
		RFindClick("\Maps\4_6\OK", "rLDPlayer mc o10 w30000,50 ")
		sleep 1000
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		sleep 3000
		ClickS(868, 46)
		sleep 1000
		RFindClick("\Maps\4_6\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
		sleep 1000
		ClickS(745, 235)
		sleep 300
		ClickS(820, 260)
		sleep 500
		RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
		sleep 9800
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
			if (FoundBattle == true)
				{
					ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
					RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
				}
		sleep 6500
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
			if (FoundBattle == true)
				{
					ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
					RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
				}
		sleep 4800
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
			if (FoundBattle == true)
				{
					ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
					RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
				}
		sleep 500
		Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
		Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
		TFindClick("\Maps\4_6\Terminate","\Maps\4_6\TerminateRestart")
		ClickTilGone("\Maps\4_6\TerminateRestart", " rLDPlayer mc o10 w30000,50")
		sleep 3500
	}
	sleep 500
	ClickS(842, 400)
	sleep 500
	RFindClick("\Maps\4_6\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(868, 46)
	sleep 500
	RFindClick("\Maps\4_6\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	ClickS(868, 46)
	sleep 1000
	RFindClick("\Maps\4_6\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(745, 235)
	sleep 300
	ClickS(820, 260)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	sleep 9800
	FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
		if (FoundBattle == true)
			{
				ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
				RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
			}
	sleep 6500
	FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
		if (FoundBattle == true)
			{
				ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
				RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
			}
	sleep 4800
	FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
		if (FoundBattle == true)
			{
				ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
				RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
			}
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
	sleep 500
	TFindClick("\Maps\4_6\Terminate","\Maps\4_6\TerminateOK")
	ClickTilGone("\Maps\4_6\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

5_4_friendly()
{
	Global
	sleep 2000
	ClickS(716, 664)
	RFindClick("\Maps\5_4\Battle", "rLDPlayer mc o20 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\5_4\5_4MapWait", "rLDPlayer mc o10 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	while (true)
	{
		sleep 1500
		ClickS(840, 330)
		sleep 500
		RFindClick("Maps\5_4\OK", "rLDPlayer mc o10 w30000,50")
		sleep 500
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		sleep 3000
		ClickS(425, 350)
		sleep 1500
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\20Max", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("Maps\5_4\OK", "rLDPlayer mc o20 w30000,50")
		sleep 1500
		ClickS(425, 560)
		RFindClick("Maps\5_4\Support", "rLDPlayer mc o50 w30000,50 ")  
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\20Max", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
		}
		RFindClick("Maps\5_4\SupportFriend", "rLDPlayer mc o50 w30000,50 ")
		RFindClick("Maps\5_4\OK", "rLDPlayer mc o20 w30000,50")
		sleep 500
		TFindClick("\Maps\5_4\Terminate","\Maps\5_4\Restart")
		ClickTilGone("\Maps\5_4\Restart", " rLDPlayer mc o10 w30000,50")
		RFindClick("Maps\5_4\5_4MapWait", "rLDPlayer mc o20 w30000,50 n0")
		sleep 1000
	}
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\5_4\20Max", "rLDPlayer mc o30 Count1 w1000,50")
		if(Found >= 1)
		{
			GuiControl,, NB, Friends Done for today, select another map.
			Pause
		}
		Else
		{
			sleep 500
			TFindClick("\Maps\5_4\Terminate","\Maps\5_4\Restart")
			ClickTilGone("\Maps\5_4\Restart", " rLDPlayer mc o10 w30000,50")
		}
}

6_3N()
{
	Global
	sleep 2000
	ClickS(715, 550)
	RFindClick("\Maps\6_3N\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	sleep 500
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50")
	sleep 2000
	RFindClick("\Maps\6_3N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 2000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50 ")
	Sleep 1000
	ClickS(750, 378)
	sleep 1000
	ClickS(706, 425)
	sleep 2000
	ClickS(606, 425)
	Sleep 2000
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("\Maps\6_3N\Confirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	TFindClick("\Maps\6_3N\Terminate","\Maps\6_3N\TerminateRestart")
	ClickTilGone("\Maps\6_3N\TerminateRestart", " rLDPlayer mc o10 w30000,50")
	sleep 3500
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50")
	sleep 2000
	RFindClick("\Maps\6_3N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 2000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 18000 ;need it
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50 ")
	Sleep 1000
	ClickS(750, 378)
	sleep 1000
	ClickS(706, 425)
	sleep 2000
	ClickS(606, 425)
	Sleep 2000
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("\Maps\6_3N\Confirm", "rLDPlayer mc o30 w30000,50")
	sleep 500
	ClickS(695, 370)
	sleep 1500
	ClickS(706, 425)
	sleep 500
	RFindClick("\Maps\6_3N\Echelon2", "rLDPlayer mc o30 w2000,50")
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o30 w30000,50")
	sleep 2500
	ClickS(706, 425)
	sleep 500
	ClickS(706, 425)
	sleep 500
	ClickTilGone("\Maps\6_3N\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	ClickS(706, 425)
	RFindClick("\Maps\6_3N\Retreat", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("\Maps\6_3N\Confirm", "rLDPlayer mc o30 w30000,50")
	sleep 500
	TFindClick("\Maps\6_3N\Terminate","\Maps\6_3N\TerminateRestart")
	ClickTilGone("\Maps\6_3N\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

6_3N_airstrike()
{
	Global
	sleep 2000
	ClickS(715, 550)
	RFindClick("\Maps\6_3N\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	sleep 500
	Loop, 4
	{
		ClickS(522, 372)
		sleep 500
		RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50")
		sleep 2000
		RFindClick("\Maps\6_3N\StartCombat", "rLDPlayer mc o5 w30000,50")
		sleep 3000
		ClickS(522, 372)
		sleep 500
		RFindClick("\Maps\6_3N\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
		sleep 500
		ClickS(750, 378)
		sleep 500
		RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
		nodes(2)
		sleep 2000
		TFindClick("\Maps\6_3N\Terminate","\Maps\6_3N\TerminateRestart")
		ClickTilGone("\Maps\6_3N\TerminateRestart", " rLDPlayer mc o10 w30000,50")
		sleep 3500
	}
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\OK", "rLDPlayer mc o5 w30000,50")
	sleep 2000
	RFindClick("\Maps\6_3N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	ClickS(522, 372)
	sleep 500
	RFindClick("\Maps\6_3N\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(750, 378)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 2000
	TFindClick("\Maps\6_3N\Terminate","\Maps\6_3N\TerminateOK")
	ClickTilGone("\Maps\6_3N\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

10_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 2000
		ClickS(720, 660)
		RFindClick("\Maps\10_4E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	sleep 1000
	ClickS(486, 232)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(576, 397)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(855, 737)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	ClickS(576, 397)
	sleep 200
	ClickS(576, 397)
	sleep 500
	ClickTilGone("\Maps\10_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1500
	ClickS(576, 397)
	sleep 500
	RFindClick("\Maps\10_4E\Retreat", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\10_4E\Confirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(486, 175)
	sleep 1500
	ClickS(486, 232)
	sleep 500
	RFindClick("\Maps\10_4E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(420, 330)
	sleep 500
	ClickS(570, 196)
	sleep 500
	ClickS(626, 234)
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 15000
	ClickS(486, 398)
	sleep 200
	ClickS(486, 398)
	sleep 500
	RFindClick("\Maps\10_4E\Retreat", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\10_4E\Confirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	TFindClick("\Maps\10_4E\Terminate","\Maps\10_4E\TerminateOK")
	ClickTilGone("\Maps\10_4E\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

10_4Ecdo()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 2000
		ClickS(720, 660)
		RFindClick("\Maps\10_4E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	sleep 1000
	ClickS(486, 232)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(576, 397)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	ClickS(855, 737)
	RFindClick("\Maps\10_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	ClickS(486, 232)
	sleep 200
	ClickS(486, 232)
	sleep 500
	ClickTilGone("\Maps\10_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1500
	RFindClick("\Maps\10_4E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(420, 330)
	sleep 500
	ClickS(570, 196)
	sleep 500
	ClickS(626, 234)
	sleep 500
	ClickS(486, 232)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 15000
	ClickS(486, 398)
	sleep 200
	ClickS(486, 398)
	sleep 500
	RFindClick("\Maps\10_4E\Retreat", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\10_4E\Confirm", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	TFindClick("\Maps\10_4E\Terminate","\Maps\10_4E\TerminateOK")
	ClickTilGone("\Maps\10_4E\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

Orphan_60Stars()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 2000
		RFindClick("\Maps\Snow\Snow", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\Snow\Map", "rLDPlayer mc o30 w30000,50")
		RFindClick("\Maps\Snow\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	loop, 5
	{
	sleep 1000
	ClickS(435, 194)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(640, 426)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(840, 247)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	ClickS(435, 194)
	sleep 200
	ClickS(435, 194)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(640, 426)
	sleep 200
	ClickS(640, 426)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(840, 247)
	sleep 200
	ClickS(840, 247)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\Snow\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(622, 191)
	sleep 500
	ClickS(435, 194)
	sleep 1000
	RFindClick("\Maps\Snow\Select", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(395, 455)
	sleep 500
	ClickS(524, 383)
	sleep 500
	ClickS(640, 426)
	sleep 1000
	RFindClick("\Maps\Snow\Select2", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(774, 342)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	sleep 12000
	RFindClick("\Maps\Snow\MapComplete", "rLDPlayer mc o10 w30000,50 ")
	loop, 7
	{
	ClickS(640, 102)
	sleep 1000
	}
	ClickS(640, 102)
	sleep 3500
	RFindClick("\Maps\Snow\Map", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\Snow\Battle", "rLDPlayer mc o30 w30000,50")
	sleep 2500
	}
	sleep 1000
	ClickS(435, 194)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(640, 426)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(840, 247)
	RFindClick("\Maps\Snow\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	ClickS(435, 194)
	sleep 200
	ClickS(435, 194)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(640, 426)
	sleep 200
	ClickS(640, 426)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	ClickS(840, 247)
	sleep 200
	ClickS(840, 247)
	sleep 500
	ClickTilGone("\Maps\Snow\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\Snow\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(622, 191)
	sleep 500
	ClickS(435, 194)
	sleep 1000
	RFindClick("\Maps\Snow\Select", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(395, 455)
	sleep 500
	ClickS(524, 383)
	sleep 500
	ClickS(640, 426)
	sleep 1000
	RFindClick("\Maps\Snow\Select2", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	ClickS(774, 342)
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	sleep 12000
	RFindClick("\Maps\Snow\MapComplete", "rLDPlayer mc o10 w30000,50 ")
	loop, 7
	{
	ClickS(640, 102)
	sleep 1000
	}
	ClickS(640, 102)
	sleep 3500
	FindClick(A_ScriptDir "\pics\CombatReturnEvent", "rLDPlayer mc o40 Count1 w100,50")
	sleep 3000
	GuiControl,, NB, Expedition Check
FoundLoginCollectNotice := FindClick(A_ScriptDir "\pics\LoginCollectNotice", "rLDPlayer mc o40 Count1 n0")
	if (FoundLoginCollectNotice == true)
	{
		GuiControl,, NB, Login Collect Found
		TFindClick("LoginCollectNotice","LoginCollectNotice2")
		sleep 3000
		TFindClick("LoginCollectNotice2","LoginCollectNotice3")
		sleep 1000
		TFindClick("LoginCollectNotice3","LoginCollectNotice4")
		ClickTilGone("LoginCollectNotice4", " rLDPlayer mc o10 w30000,50")
	}
FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundAchievement == true)
	{
		GuiControl,, NB, Achievement Found
		ClickS(130, 300)
		sleep 3000
	}
FoundExpedition := FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundExpedition == true)
	{
		GuiControl,, NB, Expedition Found
		RFindClick("ExpeditionArrive", "rLDPlayer mc o50 w30000,50")
		RFindClick("ExpeditionConfirm", "rLDPlayer mc o50 w30000,50")
		sleep 3000
	}
FoundExpedition := FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundExpedition == true)
	{
		GuiControl,, NB, Expedition Found
		RFindClick("ExpeditionArrive", "rLDPlayer mc o50 w30000,50")
		RFindClick("ExpeditionConfirm", "rLDPlayer mc o50 w30000,50")
		sleep 3000
	}
FoundExpedition := FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundExpedition == true)
	{
		GuiControl,, NB, Expedition Found
		RFindClick("ExpeditionArrive", "rLDPlayer mc o50 w30000,50")
		RFindClick("ExpeditionConfirm", "rLDPlayer mc o50 w30000,50")
		sleep 3000
	}
FoundExpedition := FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundExpedition == true)
	{
		GuiControl,, NB, Expedition Found
		RFindClick("ExpeditionArrive", "rLDPlayer mc o50 w30000,50")
		RFindClick("ExpeditionConfirm", "rLDPlayer mc o50 w30000,50")
	}
FoundAchievement := FindClick(A_ScriptDir "\pics\Achievement", "rLDPlayer mc o40 Count1 n0 w500")
	if (FoundAchievement == true)
	{
		GuiControl,, NB, Achievement Found
		ClickS(130, 300)
		sleep 3000
	}
	GuiControl,, NB, Collected 60 Stars.
	pause
}