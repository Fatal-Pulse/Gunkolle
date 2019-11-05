#Include %A_ScriptDir%/Functions/Mouse.ahk

RunMap(x)
{
	if (x == "0_2")
	{
		0_2()
	}
	else if(x == "2_1E")
	{
		2_1E()
	}
	else if(x == "3_5")
	{
		3_5()
	}
	else if(x == "3_4E")
	{
		3_4E()
	}
	else if(x == "3_2N")
	{
		3_2N()
	}
	else if(x == "4_6_data")
	{
		4_6_data()
	}
	else if(x == "4_3E")
	{
		4_3E()
	}
	else if(x == "5_4")
	{
		5_4()
	}
	else if(x == "5_4_friendly")
	{
		5_4_friendly()
	}
	else if(x == "5_2E")
	{
		5_2E()
	}
	else if(x == "5_2N")
	{
		5_2N()
	}
	else if(x == "6_4E")
	{
		6_4E()
	}
	else if(x == "6_3N")
	{
		6_3N()
	}
	else if(x == "6_3N_airstrike")
	{
		6_3N_airstrike()
	}
	else if(x == "7_2E")
	{
		7_2E()
	}
	else if(x == "10_4E")
	{
		10_4E()
	}
	else if(x == "10_4Ecdo")
	{
		10_4Ecdo()
	}
	else if(x == "VA5")
	{
		VA5()
	}
	else if(x == "VA7")
	{
		VA7()
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
				ClickS(Safex,Safey)
			}
			GuiControl,, NB, %found%
		}
		FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o50 Count1 n0 w30000,50")
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
                sleep 2000
				Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1 w100,50")
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o30 Count1")
				if FoundExp >= 1
				{
					RetirementLoop++
				}
				ClickS(398,649)
			}
			GuiControl,, NB, %found1% %found2% %found3% %found4% 
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
		ClickM(725, 430)
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
	sleep 155000
	RFindClick("\Maps\0_2\NoAmmo", "rLDPlayer mc o10 w30000,50 ")
	sleep 3000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

2_1E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\2_1E\Map", "rLDPlayer mc o200 w5000,50")
		RFindClick("\Maps\2_1E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\2_1E\MapWait", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\2_1E\HeliPort", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\2_1E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\2_1E\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\2_1E\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	TFindClick("\Maps\2_1E\CommandPostResupply","\Maps\2_1E\CommandPostClicked")
	TFindClick("\Maps\2_1E\CommandPostResupply2","\Maps\2_1E\Resupply")
	ClickTilGone("\Maps\2_1E\Resupply", " rLDPlayer mc o10 w30000,50")
	TFindClick("\Maps\2_1E\HeliPortResupply", "\Maps\2_1E\HeliPortResupply2")
	sleep 200
	RFindClick("\Maps\2_1E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 200
	RFindClick("\Maps\2_1E\EnemyPort", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\2_1E\EnemyPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

3_5()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		DragDownToUp(770, 700, 350)
		RFindClick("\Maps\3_5\Map", "rLDPlayer mc o200 w5000,50")
		RFindClick("\Maps\3_5\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\3_5\MapWait", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\3_5\HeliPort", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_5\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_5\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_5\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	TFindClick("\Maps\3_5\CommandPostResupply","\Maps\3_5\CommandPostClicked")
	TFindClick("\Maps\3_5\CommandPostResupply2","\Maps\3_5\Resupply")
	ClickTilGone("\Maps\3_5\Resupply", " rLDPlayer mc o10 w30000,50")
	TFindClick("\Maps\3_5\HeliPortResupply", "\Maps\3_5\HeliPortResupply2")
	sleep 200
	RFindClick("\Maps\3_5\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 200
	RFindClick("\Maps\3_5\Enemy2", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_5\Enemy4", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(4)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

3_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\3_4E\Map", "rLDPlayer mc o200 w5000,50")
		RFindClick("\Maps\3_4E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\3_4E\MapWait", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\3_4E\HeliPort", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_4E\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 2500
	RFindClick("\Maps\3_4E\Heliport1", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\3_4E\Heliport2", "rLDPlayer mc o10 w30000,50 ")
	ClickTilGone("\Maps\3_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\3_4E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	DragDownToUp(700, 730, 50)
	sleep 500
	RFindClick("\Maps\3_4E\Enemy1", "rLDPlayer mc o30 w30000,50 ")
	sleep 200
	RFindClick("\Maps\3_4E\Enemy2", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

3_2N( )
{
	Global
	RFindClick("\Maps\3_2N\3_2N", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\3_2N\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\3_2N\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{
	
	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("\Maps\3_2N\HeliPort1", "rLDPlayer mc o30 w30000,50 a199,200,-980,-440")
	RFindClick("\Maps\3_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\3_2N\HeliPort2", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	sleep 200
	RFindClick("\Maps\3_2N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	RFindClick("\Maps\3_2N\HeliPort2After", "rLDPlayer mc o30 w30000,10 n2 a270,550,-920,-100")
	RFindClick("\Maps\3_2N\HeliPort2AfterClicked", "rLDPlayer mc o30 w30000,50 a270,550,-920,-100")
	RFindClick("\Maps\3_2N\Resupply", "rLDPlayer mc o5 w2000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\HeliPort2AfterClicked", "rLDPlayer mc o30 w30000,50 a270,550,-920,-100")
	RFindClick("\Maps\3_2N\Retreat", "rLDPlayer mc o40 w30000,50 ")
	RFindClick("\Maps\3_2N\Confirm", "rLDPlayer mc o40 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\3_2N\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\EchelonStart", "rLDPlayer mc o40 w30000,50 a199,200,-980,-440")
	sleep 500
	RFindClick("\Maps\3_2N\3_2NEnemy1", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\3_2N\3_2NEnemy2", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\3_2N\3_2NEnemy3", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(3)
	RFindClick("\Maps\3_2N\HeliportLast", "rLDPlayer mc o30 w2000,50 a270,550,-920,-100 ")
	RFindClick("\Maps\3_2N\Echelon3", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\3_2N\HeliPortOk", "rLDPlayer mc o60 w30000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\Echelon1", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\Switcher", "rLDPlayer mc o30 w30000,50 ")
	sleep 1000
	RFindClick("\Maps\3_2N\Switch", "rLDPlayer mc o60 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\3_2N\HeliportLastClicked", "rLDPlayer mc o30 w30000,50 a270,550,-920,-100 ")
	RFindClick("\Maps\3_2N\Retreat", "rLDPlayer mc o40 w30000,50 ")
	RFindClick("\Maps\3_2N\Confirm", "rLDPlayer mc o40 w30000,50 ")
	sleep 500
	RFindClick("\Maps\3_2N\Terminate", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\3_2N\TerminateOK", "rLDPlayer mc o30 w30000,50")
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
		ClickM(750, 625)
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
			Else
				{
				}
		sleep 6500
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
			if (FoundBattle == true)
				{
					ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
					RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
				}
			Else
				{
				}
		sleep 4800
		FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
			if (FoundBattle == true)
				{
					ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
					RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
				}
			Else
				{
				}
		sleep 1000
		Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
		sleep 500
		TFindClick("\Maps\4_6\Terminate","\Maps\4_6\TerminateRestart")
		ClickTilGone("\Maps\4_6\TerminateRestart", " rLDPlayer mc o10 w30000,50")
		sleep 3500
	}
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
		Else
			{
			}
	sleep 6500
	FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
		if (FoundBattle == true)
			{
				ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
				RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
			}
		Else
			{
			}
	sleep 4800
	FoundBattle := FindClick(A_ScriptDir "\pics\Maps\4_6\Pause", "rLDPlayer mc o40 Count1 n0 w500")
		if (FoundBattle == true)
			{
				ClickTilGone("\Maps\4_6\Pause", "rLDPlayer mc o10 w30000,50 ")
				RFindClick("\Maps\4_6\Withdraw", "rLDPlayer mc o10 w30000,50 ")
			}
		Else
			{
			}
	sleep 1000
	Found := FindClick(A_ScriptDir "\pics\Maps\4_6\DollDrop", "rLDPlayer mc o30 Count1 w1000,50")
	sleep 500
	TFindClick("\Maps\4_6\Terminate","\Maps\4_6\TerminateOK")
	ClickTilGone("\Maps\4_6\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}

4_3E( )
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\4_3E\4_3eMap", "rLDPlayer mc o5 w30000,50")
		RFindClick("battle", "rLDPlayer mc o5 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	RFindClick("\Maps\4_3E\Heliport", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_3E\Battleok", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_3E\CommandPost", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\4_3E\Battleok", "rLDPlayer mc o30 w30000,50")
	sleep 500
	RFindClick("StartOperation", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	TFindClick("\Maps\4_3E\CommandCentreResupply","\Maps\4_3E\CommandCentreResupply2")
	TFindClick("\Maps\4_3E\CommandCentreResupply2","\Maps\4_3E\Resupply")
	sleep 500
	ClickTilGone("\Maps\4_3E\Resupply", " rLDPlayer mc o30 w30000,50")
	sleep 1500
	TFindClick("\Maps\4_3E\HeliportResupply", "\Maps\4_3E\HeliportResupplyClicked")
	RFindClick("\Maps\4_3E\PlanningMode", "rLDPlayer mc o30 w30000,50 ")
	sleep 200
	DragUpToDown(680, 67, 720)
	sleep 500
	RFindClick("\Maps\4_3E\EndNode", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("Execute", "rLDPlayer mc o30 w30000,50")
	nodes(4)
	sleep 2000 ;need it, otherwise 'illegal action' window will pop
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

5_4_friendly()
{
	Global
	ClickM(716, 664)
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
		sleep 1000
		ClickS(840, 330)
		RFindClick("Maps\5_4\OK", "rLDPlayer mc o10 w30000,50")
		RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
		sleep 1000
		RFindClick("Maps\5_4\5_4MapWait", "rLDPlayer mc o25 w30000,50 n0")
		sleep 1500
		ClickS(425, 350)
		sleep 500
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
		RFindClick("Maps\5_4\Terminate", "rLDPlayer mc o20 w30000,50")
		RFindClick("Maps\5_4\Restart", "rLDPlayer mc o20 w30000,50")
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
			RFindClick("Maps\5_4\Terminate", "rLDPlayer mc o20 w30000,50")
			RFindClick("Maps\5_4\Restart", "rLDPlayer mc o20 w30000,50")
		}
}

5_4(friendly := False)
{
	Global
	if (friendly == False)
	{
		RetirementLoop := 1
		while (RetirementLoop != 0)
		{
			Transition("\Maps\5_4\5_4Map", "\Maps\5_4\Battle")
			RFindClick("\Maps\5_4\Battle", "rLDPlayer mc o20 w30000,50")
			Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
			if(Found == 1)
			{
				Retirement()
				RetirementLoop++
			}
			RetirementLoop--
		}
		Found := NoStopFindClick("Maps\5_4\5_4MapWait", "rLDPlayer mc o10 Count1 n0 w30000,50")
		if Found >= 1
		{

		}
		Else
		{
			GuiControl,, NB, Paused
			Pause
		}
	}
	RFindClick("\Maps\5_4\TopLeftHeliPort", "rLDPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\OK", "rLDPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\CommandCenter", "rLDPlayer mc o10 w30000,50 Center a950,,,-500")
	RFindClick("\Maps\5_4\OK", "rLDPlayer mc o10 w30000,50")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	TFindClick("\Maps\5_4\CommandCenterAfter", "\Maps\5_4\CommandCenterAfterClicked")
	TFindClick("\Maps\5_4\CommandCenterAfterClicked", "\Maps\5_4\Resupply")
	RFindClick("\Maps\5_4\Resupply", "rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\5_4\5_4MapWait", "rLDPlayer mc o10 w30000,50")
	TFindClick("\Maps\5_4\TopLeftHeliPort", "\Maps\5_4\TopLeftHeliPortClicked")
	RFindClick("\Maps\5_4\PlanningMode", "rLDPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy3", "rLDPlayer mc o10 w30000,50")
	RFindClick("\Maps\5_4\5_4Enemy5", "rLDPlayer mc o10 w30000,50")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

5_2E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\5_2E\5_2E", "rLDPlayer mc o5 w30000,50")
		RFindClick("battle", "rLDPlayer mc o5 w30000,50")	
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	RFindClick("\Maps\5_2E\HeliportBottomLeft", "rLDPlayer mc o30 w30000,50")
	RFindClick("Battleok", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2E\CommandPost", "rLDPlayer mc o30 w30000,50")
	RFindClick("Battleok", "rLDPlayer mc o5 w30000,50")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 2000
	TFindClick("\Maps\5_2E\CommandCentreResupply","\Maps\5_2E\CommandCentreResupply2")
	TFindClick("\Maps\5_2E\CommandCentreResupply2","\Maps\5_2E\Resupply")
	sleep 500
	ClickTilGone("\Maps\5_2E\Resupply", " rLDPlayer mc o30 w30000,50")
	sleep 1000
	TFindClick("\Maps\5_2E\HeliportBottomLeftResupply", "\Maps\5_2E\HeliportBottomLeftClicked")
	RFindClick("\Maps\5_2E\PlanningMode", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\5_2E\Node1", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\Node3", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2E\NodeEnd", "rLDPlayer mc o30 w30000,50")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(5)
	sleep 1000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

5_2N()
{
	Global
	RFindClick("\Maps\5_2N\5_2N", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\5_2N\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	DragDownToUp(770, 700, 350)
	RFindClick("\Maps\5_2N\HeliPortBL", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortBR", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortTR", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	TFindClick("\Maps\5_2N\HeliportBR2", "\Maps\5_2N\HeliportBR2Clicked")
	TFindClick("\Maps\5_2N\HeliportBR2Clicked","\Maps\5_2N\Resupply")
	RFindClick("\Maps\5_2N\Resupply", "rLDPlayer mc o5 w30000,50")
	sleep 500
	TFindClick("\Maps\5_2N\HeliportBR2Clicked","\Maps\5_2N\Retreat")
	RFindClick("\Maps\5_2N\Retreat", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Confirm", "rLDPlayer mc o5 w30000,50")
	sleep 500
	TFindClick("\Maps\5_2N\HeliportBL2", "\Maps\5_2N\HeliportBL2Clicked")
	RFindClick("\Maps\5_2N\PlanningMode", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Route1", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Route2", "rLDPlayer mc o5 w30000,50")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 500
	TFindClick("\Maps\5_2N\HeliportBL2", "\Maps\5_2N\HeliportBL2Clicked")
	TFindClick("\Maps\5_2N\HeliportBL2Clicked","\Maps\5_2N\Retreat")
	RFindClick("\Maps\5_2N\Retreat", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Confirm", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("\Maps\5_2N\Terminate", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\TerminateRestart", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortBL3", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortTL3", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\HeliPortOK", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\StartCombat", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	TFindClick("\Maps\5_2N\HeliportBL3", "\Maps\5_2N\HeliportBL3Clicked")
	RFindClick("\Maps\5_2N\PlanningMode", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Route3", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Route4", "rLDPlayer mc o5 w30000,50")
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 500
	TFindClick("\Maps\5_2N\HeliportBL3", "\Maps\5_2N\HeliportBL3Clicked")
	TFindClick("\Maps\5_2N\HeliportBL3Clicked","\Maps\5_2N\Retreat")
	RFindClick("\Maps\5_2N\Retreat", "rLDPlayer mc o5 w30000,50")
	RFindClick("\Maps\5_2N\Confirm", "rLDPlayer mc o5 w30000,50")
	sleep 500
	RFindClick("\Maps\5_2N\Terminate", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\5_2N\TerminateOK", "rLDPlayer mc o30 w30000,50")
	GoHome()
}

6_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\6_4E\Map", "rLDPlayer mc o200 w5000,50")
		RFindClick("\Maps\6_4E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\6_4E\MapWait", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\6_4E\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\6_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 2800
	TFindClick("\Maps\6_4E\Echelon1", "\Maps\6_4E\Echelon1Clicked")
	TFindClick("\Maps\6_4E\Echelon1Clicked", "\Maps\6_4E\Resupply")
	sleep 500
	ClickTilGone("\Maps\6_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\6_4E\Move1", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\CommandPost2", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Deploy", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 20000
	RFindClick("\Maps\6_4E\Echelon2", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move2", "rLDPlayer mc o10 w30000,50 ")
	sleep 1500
	nodes(1)
	sleep 500
	TFindClick("\Maps\6_4E\Echelon3", "\Maps\6_4E\Echelon3Clicked")
	TFindClick("\Maps\6_4E\Echelon3Clicked", "\Maps\6_4E\Resupply")
	sleep 500
	ClickTilGone("\Maps\6_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\6_4E\Move3", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\CommandPost3", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Deploy", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	nodes(1)
	sleep 5000
	RFindClick("\Maps\6_4E\Echelon4", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move4", "rLDPlayer mc o10 w30000,50 ")
	nodes(1)
	sleep 500
	RFindClick("\Maps\6_4E\Echelon5", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move5", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	sleep 500
	RFindClick("\Maps\6_4E\Echelon6", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move6", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\CommandPost4", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Deploy", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	nodes(1)
	sleep 4600
	RFindClick("\Maps\6_4E\Echelon7", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Back1", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch1", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Back2", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch2", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Back3", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch3", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	TFindClick("\Maps\6_4E\Echelon7Clicked", "\Maps\6_4E\Resupply")
	sleep 500
	ClickTilGone("\Maps\6_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1000
	RFindClick("\Maps\6_4E\Back4", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch4", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Back5", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch5", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Back6", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch6", "rLDPlayer mc o30 w30000,50 ")
	sleep 2500
	DragUpToDown(625, 50, 725)
	sleep 500
	RFindClick("\Maps\6_4E\Move7", "rLDPlayer mc o10 w30000,50 ")
	nodes(1)
	sleep 500
	RFindClick("\Maps\6_4E\Echelon8", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move8", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	sleep 2000
	nodes(1)
	sleep 5500
	RFindClick("\Maps\6_4E\EchelonSwitch", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\EchelonSwitch2", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch7", "rLDPlayer mc o30 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\PlanningMode", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move9", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	sleep 500
	RFindClick("\Maps\6_4E\Echelon9", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move10Start", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Move10Again", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Move10End", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	nodes(1)
	sleep 7500
	TFindClick("\Maps\6_4E\Echelon10", "\Maps\6_4E\Echelon10Clicked")
	TFindClick("\Maps\6_4E\Echelon10Clicked", "\Maps\6_4E\Resupply")
	sleep 500
	ClickTilGone("\Maps\6_4E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\6_4E\Move11", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Move12", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	nodes(1)
	RFindClick("\Maps\6_4E\Heliport", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Ok", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Echelon11", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Echelon12", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Switch8", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("\Maps\6_4E\Move13", "rLDPlayer mc o10 w30000,50 ")
	sleep 2000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	nodes(1)
	sleep 7000
	RFindClick("\Maps\6_4E\Echelon14", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move14", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move15", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Echelon15", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Select2", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\6_4E\Move16", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	nodes(3)
	sleep 6000
	TFindClick("\Maps\6_4E\RetreatEch1", "\Maps\6_4E\RetreatEch1Clicked")
	RFindClick("\Maps\6_4E\RetreatEch1Clicked", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\6_4E\Retreat", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\6_4E\Confirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 3000
	TFindClick("\Maps\6_4E\RetreatEch2", "\Maps\6_4E\RetreatEch2Clicked")
	RFindClick("\Maps\6_4E\RetreatEch2Clicked", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\6_4E\Retreat", "rLDPlayer mc o30 w30000,50 ")
	RFindClick("\Maps\6_4E\Confirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 3000
	RFindClick("\Maps\6_4E\Terminate", "rLDPlayer mc o30 w30000,50")
	sleep 500
	RFindClick("\Maps\6_4E\TerminateOK", "rLDPlayer mc o30 w30000,50")
	GoHome()
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
	sleep 35000
	RFindClick("\Maps\6_3N\Wiped2", "rLDPlayer mc o10 w30000,50 ")
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
	sleep 35000
	RFindClick("\Maps\6_3N\Wiped2", "rLDPlayer mc o10 w30000,50 ")
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
		sleep 3000
		Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\Exhausted", "rLDPlayer mc o30 Count1 w1000,50")
		sleep 22000
		Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\Exhausted", "rLDPlayer mc o30 Count1 w1000,50")
		sleep 22500
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
	sleep 3000
	Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\Exhausted", "rLDPlayer mc o30 Count1 w1000,50")
	sleep 22000
	Found := FindClick(A_ScriptDir "\pics\Maps\6_3N\Exhausted", "rLDPlayer mc o30 Count1 w1000,50")
	sleep 22500
	TFindClick("\Maps\6_3N\Terminate","\Maps\6_3N\TerminateOK")
	ClickTilGone("\Maps\6_3N\TerminateOK", " rLDPlayer mc o10 w30000,50")
	GoHome()
}
	
7_2E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		RFindClick("\Maps\7_2E\7_2E", "rLDPlayer mc o200 w5000,50")
		RFindClick("\Maps\7_2E\Battle", "rLDPlayer mc o30 w30000,50")
		Found := FindClick(A_ScriptDir "\pics\CombatTdollEnhancement", "rLDPlayer mc o30 Count1 n0 w3000,50")
		if(Found == 1)
		{
			Retirement()
			RetirementLoop++
		}
		RetirementLoop--
	}
	Found := NoStopFindClick("Maps\7_2E\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Cound not find map reference, Paused
		Pause
	}
	RFindClick("\Maps\7_2E\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\7_2E\OK", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\7_2E\HeliPort", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\7_2E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	TFindClick("\Maps\7_2E\CommandCenterResupply", "\Maps\7_2E\CommandCenterResupplyClicked")
	TFindClick("\Maps\7_2E\CommandCenterResupply2","\Maps\7_2E\Resupply")
	ClickTilGone("\Maps\7_2E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 1500
	TFindClick("\Maps\7_2E\HeliPortResupply","\Maps\7_2E\HeliPortResupply2")
	TFindClick("\Maps\7_2E\HeliPortResupply2","\Maps\7_2E\Resupply")
	ClickTilGone("\Maps\7_2E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\7_2E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\7_2E\7_2EEnemy1", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	nodes(2)
	RFindClick("\Maps\7_2E\HeliPortDummy", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\7_2E\OK", "rLDPlayer mc o10 w30000,50 ")
	sleep 1000
	RFindClick("\Maps\7_2E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\7_2E\Echelon1", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\7_2E\7_2EEnemy2", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	sleep 15000 
	nodes(3)
	sleep 1000
	DragRightToLeft(400, 1200, 500)
	sleep 200
	TFindClick("\Maps\7_2E\HeliPort2Resupply","\Maps\7_2E\HeliPort2Resupply2")
	TFindClick("\Maps\7_2E\HeliPort2Resupply2","\Maps\7_2E\Resupply")
	ClickTilGone("\Maps\7_2E\Resupply", " rLDPlayer mc o10 w30000,50")
	sleep 500
	RFindClick("\Maps\7_2E\PlanningMode", "rLDPlayer mc o10 w30000,50 ")
	sleep 500
	RFindClick("\Maps\7_2E\EnemyPost", "rLDPlayer mc o30 w30000,50 ")
	sleep 200
	RFindClick("Execute", "rLDPlayer mc o5 w30000,50")
	sleep 1500
	nodes(3)
	sleep 4000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}

10_4E()
{
	Global
	RetirementLoop := 1
	while (RetirementLoop != 0)
	{
		sleep 1000
		ClickM(720, 660)
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
	sleep 175000
	RFindClick("\Maps\10_4E\NoAmmo", "rLDPlayer mc o10 w30000,50 ")
	sleep 5000
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
		sleep 1000
		ClickM(720, 660)
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
	sleep 175000
	RFindClick("\Maps\10_4E\NoAmmo", "rLDPlayer mc o10 w30000,50 ")
	sleep 5000
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

VA5( )
{
	Global
	RFindClick("\Maps\VA5\va11halla", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	RFindClick("\Maps\VA5\Chicken", "rLDPlayer mc o5 w30000,50")
	sleep 100
	RFindClick("\Maps\VA5\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\VA5\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("\Maps\VA5\Heliport", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Echelon3", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	TFindClick("\Maps\VA5\HeliportSelect", "\Maps\VA5\HeliportSelectClicked")
	sleep 500
	RFindClick("\Maps\VA5\PlanningMode", "rLDPlayer mc o30 w2000,50 ")
	RFindClick("\Maps\VA5\Route", "rLDPlayer mc o30 w2000,50 ")
	sleep 500
	RFindClick("\Maps\VA5\EndRoute", "rLDPlayer mc o30 w2000,50 ")
	RFindClick("\Maps\VA5\Execute", "rLDPlayer mc o30 w2000,50 ")
	sleep 4000
	nodes(1)
	sleep 6500
	TFindClick("\Maps\VA5\HeliportSelect", "\Maps\VA5\HeliportSelectClicked")
	RFindClick("\Maps\VA5\HeliportSelect2", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA5\Retreat", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA5\Confirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\VA5\Terminate", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\VA5\TerminateRestart", "rLDPlayer mc o30 w30000,50")
	sleep 3500
	RFindClick("\Maps\VA5\Heliport", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Echelon3", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA5\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	TFindClick("\Maps\VA5\HeliportSelect", "\Maps\VA5\HeliportSelectClicked")
	sleep 500
	RFindClick("\Maps\VA5\PlanningMode", "rLDPlayer mc o30 w2000,50 ")
	RFindClick("\Maps\VA5\Route", "rLDPlayer mc o30 w2000,50 ")
	sleep 500
	RFindClick("\Maps\VA5\EndRoute", "rLDPlayer mc o30 w2000,50 ")
	RFindClick("\Maps\VA5\Execute", "rLDPlayer mc o30 w2000,50 ")
	sleep 4000
	nodes(1)
	sleep 6500
	TFindClick("\Maps\VA5\HeliportSelect", "\Maps\VA5\HeliportSelectClicked")
	RFindClick("\Maps\VA5\HeliportSelect2", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA5\Retreat", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA5\Confirm", "rLDPlayer mc o30 w30000,50 ")
	sleep 500
	RFindClick("\Maps\VA5\Terminate", "rLDPlayer mc o30 w30000,50")
	RFindClick("\Maps\VA5\TerminateOK", "rLDPlayer mc o30 w30000,50")
	GoHome()
}

VA7( )
{
	Global
	RFindClick("\Maps\VA7\va11halla", "rLDPlayer mc o5 w30000,50")
	sleep 3000
	RFindClick("\Maps\VA7\Truth", "rLDPlayer mc o5 w30000,50")
	sleep 100
	RFindClick("\Maps\VA7\Battle", "rLDPlayer mc o5 w30000,50")
	Found := FindClick(A_ScriptDir "\pics\Maps\VA7\WaitMap", "rLDPlayer mc o30 Count1 n0 w30000,50")
	if Found >= 1
	{

	}
	Else
	{
		GuiControl,, NB, Paused
		Pause
	}
	RFindClick("\Maps\VA7\CommandPost", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("\Maps\VA7\Ok", "rLDPlayer mc o10 w30000,50 ")
	RFindClick("StartCombat", "rLDPlayer mc o25 w3000,10 a1000,620 n3 sleep200")
	sleep 3000
	RFindClick("\Maps\VA7\CommandPostSelect", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA7\CommandPostSelect2", "rLDPlayer mc o60 w30000,50 ")
	RFindClick("\Maps\VA7\Resupply", "rLDPlayer mc o40 w30000,50 ")
	sleep 1000
	RFindClick("\Maps\VA7\Paradrop", "rLDPlayer mc o30 w2000,50 ")
	RFindClick("\Maps\VA7\Helipad", "rLDPlayer mc o30 w2000,50 ")
	sleep 5000
	RFindClick("\Maps\VA7\PlanningMode", "rLDPlayer mc o30 w2000,50 ")
	sleep 300
	RFindClick("\Maps\VA7\Manticore", "rLDPlayer mc o30 w2000,50 ")
	sleep 300
	RFindClick("\Maps\VA7\Execute", "rLDPlayer mc o30 w2000,50 ")
	nodes(2)
	sleep 3000
	RFindClick("EndTurn", "rLDPlayer mc o30 w30000,50 a1100,620 n3 sleep250")
	GoHome()
}


