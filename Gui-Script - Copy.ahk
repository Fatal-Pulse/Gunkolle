#SingleInstance force

#Persistent
#SingleInstance
#Include %A_ScriptDir%/Functions/Gdip_All.ahk ;Thanks to tic (Tariq Porter) for his GDI+ Library => ahkscript.org/boards/viewtopic.php?t=6517

#Include %A_ScriptDir%/Constants/PixelColor.ahk

#Include %A_ScriptDir%/Functions/Click.ahk
#Include %A_ScriptDir%/Functions/TimerUtils.ahk
#Include %A_ScriptDir%/Functions/PixelCheck.ahk
#Include %A_ScriptDir%/Functions/Window.ahk
#Include %A_ScriptDir%/Functions/PixelSearch.ahk
#Include %A_ScriptDir%/Functions/PixelMap.ahk
#Include %A_ScriptDir%/Functions/Notify.ahk
#Include %A_ScriptDir%/Functions/FindClick.ahk


IniRead, NotificationLevel, config.ini, Variables, NotificationLevel, 1
IniRead, TWinX, config.ini, Variables, LastXS, 0
IniRead, TWinY, config.ini, Variables, LastYS, 0
SpecificWindows()
IniRead, WINID, config.ini, Variables, WINID, Nox
IniRead, MinRandomWait, config.ini, Variables, MinRandomWaitS, 0
IniRead, MaxRandomWait, config.ini, Variables, MaxRandomWaitS, 300000
IniRead, Doll1, config.ini, Variables, Doll1, AR15
IniRead, Doll2, config.ini, Variables, Doll2, M4A1
IniRead, Doll3, config.ini, Variables, Doll3
IniRead, Doll4, config.ini, Variables, Doll4
IniRead, WeaponType, config.ini, Variables, WeaponType, AssaultRifle
IniRead, ProductionTdoll, config.ini, Variables, ProductionTdoll, 0
IniRead, ProductionEquipment, config.ini, Variables, ProductionEquipment, 0
IniRead, Enhancement, config.ini, Variables, Enhancement, 0
; IniRead, DisassembleCycle, config.ini, Variables, DisassembleCycle, 3
IniRead, FriendCollector, config.ini, Variables, FriendCollector, 0
IniRead, BatteryCollector, config.ini, Variables, BatteryCollector, 0
IniRead, CombatSimsData, config.ini, Variables, CombatSimsData, 0
IniRead, SortieInterval, config.ini, Variables, SortieInterval, -1 ;900000 for full morale
IniRead, WorldV, config.ini, Variables, WorldSwitcher 


WFindClick(x,y,SearchNumber := 40)
{	
	local RandX, RandY, radius := 5
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY += Round((sqrt(1 - OutX ** 2) * radius * Sign)) 
	RandX += Round((OutX * radius))
	GuiControl,, NB, %x%
	Found := 0
	Found := FindClick(A_ScriptDir "\pics\" x,y " rLDPlayer mc o"SearchNumber " dtop n0")
	while (found == 0) 
	{
		SearchNumber:= SearchNumber + 6
		Found := FindClick(A_ScriptDir "\pics\" x,y " rLDPlayer mc o"SearchNumber " n0")
		GuiControl,, NB, pixel shade offset [%SearchNumber%]
		if (SearchNumber >= 200)
		{
			GuiControl,, NB, Could not find %x%, exit and redo config.
			Pause
			SearchNumber := 0
		}
	}
	GuiControl,, NB, pixel shade offset [%SearchNumber%]
	FindClick(A_ScriptDir "\pics\" x, y " dx Center x" RandX " y"  RandY " o" SearchNumber)
	previousImg := x
}
; RFindClick(x,y)
; {
; 	local RandX, RandY
; 	Random, RandX, -10, 10
; 	Random, RandY, -10, 10
; 	GuiControl,, NB, %x%
; 	FindClick(A_ScriptDir "\pics\" x,y " Center x"RandX " y"RandY )
; 	return
; }

RFindClick(x,y,v*)
{
	local RandX, RandY := v[1], radius := 10, counter := 0
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY := RandY + Round((sqrt(1 - OutX ** 2) * radius * Sign))
	RandX := RandX + Round((OutX * radius))
	GuiControl,, NB, %x%
	Found := 0
	while (Found == 0)
	{
		Found := FindClick(A_ScriptDir "\pics\" x,y " Center x"RandX " y"RandY " n0 count1")
		if(Found == 0)
		{
			FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Count1")
			FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o40 Count1")
		}
		else
		{
			FindClick(A_ScriptDir "\pics\" x,y " Center x"RandX " y"RandY)
			previousImg := x
		}
		count++
	}
	return
}

NoStopFindClick(x,y,v*)
{
	local RandX, RandY := v[1], radius := 10, looper := 1, counter := 0
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY := RandY + Round((sqrt(1 - OutX ** 2) * radius * Sign))
	RandX := RandX + Round((OutX * radius))
	GuiControl,, NB, %x%
	Found := FindClick(A_ScriptDir "\pics\" x,y " Center x"RandX " y"RandY " n0 count1")
	Found2:= FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o50 Center x"RandX " y"RandY "Count1")
	loop, %looper%
	{
		if (Found == 1)
		{
			FindClick(A_ScriptDir "\pics\" x,y "Center x"RandX " y"RandY)
			return 1
		}
		if (Found2 == 1)
		{
			while(Found3 != 1)
			{
				FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o50 Center x"RandX " y"RandY "Count1")
				Found3 := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o50 Center x"RandX " y"RandY "Count1")
			}
			looper +=1
		}
	}
}


Production()
{
	Global
	Found := FindClick(A_ScriptDir "\pics\Production\FactoryReady", "rLDPlayer mc o5 n0 count1")
	if( Found == 1) 
	{
		RFindClick("\Production\FactoryReady", "rLDPlayer mc o5")
		if (ProductionTdoll == 1)
		{
			RFindClick("Production\WaitForTdollProduction", "rLDPlayer mc o5 w30000,50 n0")
			FoundSlot1 := FindClick(A_ScriptDir "\pics\Production\TdollProductionComplete1", "rLDPlayer mc o5 n0 count1 w2000,50")
			FoundSlot2 := FindClick(A_ScriptDir "\pics\Production\TdollProductionComplete2", "rLDPlayer mc o5 n0 count1")
			loop,2
			{
				ProductionCounter := A_Index
				if (FoundSlot%A_Index% == 1)
				{
					RFindClick("Production\TdollProductionComplete"A_Index, "rLDPlayer mc o5 w30000,50")
					Loop
					{
						if ( FindClick(A_ScriptDir "\pics\Production\TdollProductionStart"ProductionCounter, "rLDPlayer mc o5 n0 count1") == 1 )
						{
							break
						}
						Else
						{
							ClickS(Safex,Safey)
							sleep 500
						}
					}
					RFindClick("Production\TdollProductionStart"A_Index, "rLDPlayer mc o5 w30000,50")
					RFindClick("Production\StartProduction", "rLDPlayer mc o5 w30000,50")
					sleep 1000
				}
			}
		}
		RFindClick("Production\WaitForTdollProduction", "rLDPlayer mc o5 w30000,50 n0")
		Found := FindClick(A_ScriptDir "\pics\Production\EquipmentReady", "dx rLDPlayer mc o5 count1 n0 w2000,50")
		if ( Found == 1)
		{
			RFindClick("Production\EquipmentReady", "rLDPlayer mc o5 w30000,50")
			RFindClick("Production\WaitForTdollProduction", "rLDPlayer mc o5 w30000,50 n0")
			FoundSlot1 := FindClick(A_ScriptDir "\pics\Production\EquipmentSlotComplete1", "dx rLDPlayer mc o5 n0 count1 w2000,50")
			FoundSlot2 := FindClick(A_ScriptDir "\pics\Production\EquipmentSlotComplete2", "rLDPlayer mc o5 n0 count1")
			FoundSlot3 := FindClick(A_ScriptDir "\pics\Production\EquipmentSlotComplete3", "rLDPlayer mc o5 n0 count1")
			loop,3
			{
				ProductionCounter := A_Index
				if (FoundSlot%A_Index% == 1)
				{
					RFindClick("Production\EquipmentSlotComplete"A_Index, "rLDPlayer mc o5 w30000,50")
					Loop
					{
						if ( FindClick(A_ScriptDir "\pics\Production\EquipmentSlotStart"ProductionCounter, "rLDPlayer mc o5 n0 count1") == 1 )
						{
							break
						}
						Else
						{
							ClickS(Safex,Safey)
							sleep 500
						}
					}
					if ( ProductionEquipment == 1)
					{
						RFindClick("Production\EquipmentSlotStart"A_Index, "rLDPlayer mc o5 w30000,50")
						RFindClick("Production\StartProduction", "rLDPlayer mc o5 w30000,50")
						sleep 1000
					}
				}
			}
		}
		sleep 1000
		RFindClick("FactoryReturn", "rLDPlayer mc o5 w30000,50")
	}
}


TimeCheck()
{
	global FriendCollector
	global FriendChecker
	if(FriendCollector == 1)
	{
		if(FriendChecker == 1)
		{
			FormatTime, TimeString,%A_NowUTC%, HHmm
			if TimeString between 0400 and 0415
			{ 
				FriendChecker--
				Random, FriendTime, 1900000, 1800000
				SetTimer, FriendFlag, %Friendtime%
				RFindClick("Dorm\Dorm", "rLDPlayer mc o5 w30000,50")
				RFindClick("Dorm\Visit", "rLDPlayer mc o5 w30000,50")
				sleep 100
				RFindClick("Dorm\MyFriends", "rLDPlayer mc o5 w30000,50")
				RFindClick("Dorm\VisitDorm", "rLDPlayer mc o5 w30000,50")
				FoundMessage := 0
				FoundMessage := FindClick(A_ScriptDir "\pics\Dorm\Message", "rLDPlayer mc o30 count1 n0")
				while (FoundMessage == 0)
				{
					RFindClick("Dorm\Like", "rLDPlayer mc o5 w30000,50")
					sleep 500
					Found := FindClick(A_ScriptDir "\pics\Dorm\Battery", "rLDPlayer mc o5 count1 n0")
					if (Found == 1)
					{
						RFindClick("Dorm\Battery", "rLDPlayer mc o5 w30000,50")
						RFindClick("Dorm\BatteryClose", "rLDPlayer mc o5 w30000,50")
					}
					RFindClick("Dorm\Next", "rLDPlayer mc o5 w30000,50")
					sleep 1000
					RFindClick("Dorm\WaitForFriends", "rLDPlayer mc o5 w30000,50 n0")
					FoundMessage := FindClick(A_ScriptDir "\pics\Dorm\Message", "rLDPlayer mc o30 count1 n0 ")
				}
				RFindClick("Dorm\Return", "rLDPlayer mc o5 w30000,50")
				RFindClick("Dorm\Exit", "rLDPlayer mc o5 w30000,50")
			} 
		}
	}
}

RRClick(pointx, pointy)
{
	local RandX, RandY,radius := 10
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	OutY := Round((sqrt(1 - OutX ** 2) * radius * Sign) + pointy)
	OutX := Round((OutX * radius) + pointx)
	MsgBox, %OutX%  %OutY%
}

ClickWait(ClickThis,WaitForThis)
{
	local RandX, RandY, radius := 10
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY := Round((sqrt(1 - OutX ** 2) * radius * Sign)) + 5
	RandX := Round((OutX * radius))
	GuiControl,, NB, %WaitForThis%
	Found := FindClick(A_ScriptDir "\pics\" WaitForThis, "rLDPlayer mc o40 Count1 n0 w1000,50")
	While (Found != 1)
	{
		RFindClick(ClickThis, "rLDPlayer mc o40 Center x"RandX " y"RandY)
		Found := FindClick(A_ScriptDir "\pics\" WaitForThis, " rLDPlayer mc o40 Count1 n0 w1000,50")
	}
}


Transition(ClickThis,WaitForThis)
{
	Global
	local RandX, RandY, radius := 10
	local Counter
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY := Round((sqrt(1 - OutX ** 2) * radius * Sign))
	RandX := Round((OutX * radius))
	FormatTime, TimeString,% A_NowUTC, HHmm
	Found := FindClick(A_ScriptDir "\pics\" WaitForThis, "rLDPlayer mc o40 Count1 n0 w1000,50")
	While (Found == 0)
	{
		FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o40 Center x"RandX " y"RandY)
		FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o40 Center x"RandX " y"RandY)
		FindClick(A_ScriptDir "\pics\"ClickThis, "rLDPlayer mc o30 Center x"RandX " y"RandY)
		Found := FindClick(A_ScriptDir "\pics\" WaitForThis, " rLDPlayer mc o40 Count1 n0 w1000,50")
		Found2:= FindClick(A_ScriptDir "\pics\MissionAccompished", "rLDPlayer mc o50 Count1 n0")
		GuiControl,, NB, Waiting for [%WaitForThis%]
		Counter++
		if ((Counter >= 10) && (Found == 0))
		{
			Counter = 0
			GuiControl,, NB, ded
		}
		if (Found2 == true)
		{
			FoundHome = 0
			While (FoundHome != true) 
			{
				ClickS(Expeditionx,Expeditiony)
				FoundHome := FindClick(A_ScriptDir "\pics\WaitForHome", "rLDPlayer mc o30 w1000,50 Count1 n0 a1200,,,-600")
			}
			
		}

	}
}


GoHome2()
{
	Global
	loopcount := 1
	loop, %loopcount%
	{
		Found1 := 0
		Found2 := 0
		Found3 := 0
		while(Found1 == 0 && Found2 == 0 && Found3 == 0)
		{
			Found1 := FindClick(A_ScriptDir "\pics\Home", "rLDPlayer mc o5 Count1 n0")
			Found2 := FindClick(A_ScriptDir "\pics\DailyMessage", "rLDPlayer mc o40 Count1 n0")
			Found3 := FindClick(A_ScriptDir "\pics\CombatReturn", "rLDPlayer mc o40 Count1")
			if (Found1 >= 1 or Found2 >= 1 or Found2 >= 1)
			{

			}
			else
			{
				FoundExp := FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o5 Count1 n0")
				if FoundExp >= 1
				{
					loopcount++
				}
				ClickS(Expeditionx,Expeditiony)
				sleep 200
			}
			MsgBox, %Expeditionx% %Expeditiony% %found3% 
		}
	}
}

TFindClick(ClickThis,WaitForThis,v*)
{
	local RandX, RandY := v[1], radius := 10
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY := RandY + Round((sqrt(1 - OutX ** 2) * radius * Sign))
	RandX := RandX + Round((OutX * radius))
	Found := FindClick(A_ScriptDir "\pics\" WaitForThis, "rLDPlayer mc o30 Count1 n0 w1000,50")
	GuiControl,, NB, %ClickThis%
	While (Found == 0)
	{
		FindClick(A_ScriptDir "\pics\"ClickThis, "rLDPlayer mc o30 Center x"RandX " y"RandY) 
		Found := FindClick(A_ScriptDir "\pics\" WaitForThis, " rLDPlayer mc o30 Count1 n0 w1000,50")
		GuiControl,, NB, Waiting for [%WaitForThis%]
	}
}

; if (RegExMatch(Day, "Tuesday|Friday|Sunday"))
CombatSimsData := 2
CombatCheck := 1
; FoundSlot1 := FindClick(A_ScriptDir "\pics\Production\TdollProductionComplete1", "rLDPlayer mc o30 n0 count1 w2000,50")
; MsgBox,% FoundSlot1
; RFindClick("Production\WaitForTdollProduction", "rLDPlayer mc o50 w30000,50 n0")
; FoundSlot1 := FindClick(A_ScriptDir "\pics\Production\TdollProductionComplete1", "rLDPlayer mc o30 n0 count1 w2000,50")
; FoundSlot2 := FindClick(A_ScriptDir "\pics\Production\TdollProductionComplete2", "rLDPlayer mc o30 n0 count1")
; loop,2
; {
; 	ProductionCounter := A_Index
; 	if (FoundSlot%A_Index% == 1)
; 	{
; 		RFindClick("Production\TdollProductionComplete"A_Index, "rLDPlayer mc o30 w30000,50")
; 		Loop
; 		{
; 			if ( FindClick(A_ScriptDir "\pics\Production\TdollProductionStart"ProductionCounter, "rLDPlayer mc o50 n0 count1") == 1 )
; 			{
; 				break
; 			}
; 			Else
; 			{
; 				ClickS(Safex,Safey)
; 				sleep 500
; 			}
; 		}
; 		RFindClick("Production\TdollProductionStart"A_Index, "dx rLDPlayer mc o50 w30000,50  n0")
; 		RFindClick("Production\StartProduction", "dx rLDPlayer mc o50 w30000,50 n0 ")
; 		sleep 1000
; 	}
; }		.





ClickTilGone(x,y,v*)
{
	local RandX, RandY := v[1], radius := 5
	Random, OutX, -1.0, 1.0
	Random, Sign, -1.0, 1.0
	RandY += Round((sqrt(1 - OutX ** 2) * radius * Sign)) 
	RandX += Round((OutX * radius))
	GuiControl,, NB, %x%
	Found := FindClick(A_ScriptDir "\pics\" x,y " count1 Center x"RandX " y"RandY)
	While (Found == 1)
	{
		FindClick(A_ScriptDir "\pics\" x,y "Center x"RandX " y"RandY " w1,1")
		Found := FindClick(A_ScriptDir "\pics\" x,y " n0 count1 w1,1")
		count += 1
		if(found != 1)
		{
			break
		}
	}
}


; Random, CombatSimsDataTime, 7200000,  7500000
; FormatTime, TimeString,%A_NowUTC%, HHmm
; FormatTime, someday, %A_NowUTC%, ddd
; if (((RegExMatch(someday, "Sun|Tue|Fri") && (TimeString >= 0800 && TimeString <= 2400)) || (RegExMaetch(someday, "Mon|Wed|Sat") && (TimeString >= 0000 && TimeString <= 0800))))
; {
; 	MsgBox, lol
; }

; MsgBox,% TimeString someday
; sunday 8-24, monday 0-8 || Tuesday 8-24, wenesday 0-8 || Friday 8-24 , Satuday 0-8
; if (((CombatSims >= 1) && (CombatCheck == 1)))
; {
; 	FormatTime, TimeString,% A_NowUTC, HHmm
; 	FormatTime, someday, A_NowUTC, ddd
; 	if (((RegExMatch(someday, "Tues|Fri|Sun") && (TimeString >= 0800 and TimeString <= 2400)) || (RegExMatch(someday, "Mon|Wen|Sat") && (TimeString >= 0000 and TimeString <= 0800))))
; 	{
; 		; Transition("Combat","CombatPage")
; 		RFindClick("CombatSims\Data\CombatSims", "rLDPlayer mc o30 w2000,50")
; 		Found := FindClick(A_ScriptDir "\pics\CombatSims\Data\DataModeClicked", "rLDPlayer mc o30 Count1 w1500,50 n0")
; 		if (Found != True)
; 			RFindClick("CombatSims\Data\DataMode", "rLDPlayer mc o30 w500,50")
; 		FoundZero := FindClick(A_ScriptDir "\pics\CombatSims\Data\Energy0", "rLDPlayer mc o30 Count1")
; 		While (FoundZero != true) {
; 			While (FoundZero != true) {
; 				EnergyCount++
; 				FoundZero := FindClick(A_ScriptDir "\pics\CombatSims\Data\Energy" EnergyCount, "rLDPlayer mc o30 Count1")
; 			}
; 			MsgBox, %EnergyCount%
; 			GuiControl,, NB, Energy read count = %EnergyCount%
; 			loop,3 {
; 				if((Mod(EnergyCount, A_Index) == 0) && (CombatSims == A_Index))
; 					RFindClick("CombatSims\Data\Training" A_Index, "rLDPlayer mc o30 Count1")
; 			}
; 			RFindClick("CombatSims\Data\EnterCombat", "rLDPlayer mc o30 w5000,50")
; 			RFindClick("CombatSims\Data\Confirm", "rLDPlayer mc o30 w5000,50")
; 			Found := 0
; 			sleep 7000
; 			While (Found != true) {
; 				ClickS(Safex,Safey)
; 				Found := FindClick(A_ScriptDir "\pics\CombatSims\Data\DataModeClicked", "rLDPlayer mc o30 Count1 w500,50 n0")
; 			}
; 		}
; 	}
; 	MsgBox, %EnergyCount%
; }

WaitForNextTurn1()
{
	Global
	TurnCount := 0
	CurrentTurnCountFound := 0
	FoundTurn := 0
	Found := 0
	While(CurrentTurnCountFound == 0)
	{
		TurnCount += 1
		CurrentTurnCountFound := FindClick(A_ScriptDir "\pics\Maps\Combat\Turn"TurnCount, "rLDPlayer mc o35 Count1 n0")
	}
	TurnNumber := TurnCount + 1
	While(FoundTurn == 0)
	{
		FoundTurn := FindClick(A_ScriptDir "\pics\Maps\Combat\Turn"TurnNumber, "rLDPlayer mc o25 Count1 n0")
		FoundCombat := FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0")
		sleep 2000
		if(FoundCombat >= 1)
		{
			sleep 5000
			while(Found == 0)
			{
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
		}
	}
}

NodeTransversal1(FinalNodeTurnImg,x)
{
	Global
	Finalnode := 0
	Found := 0
	While(FinalNode == 0)
	{
		FinalNode := FindClick(A_ScriptDir "\pics\"FinalNodeTurnImg , x " Count1 n0")
		FoundCombat := FindClick(A_ScriptDir "\pics\CombatPause", "rLDPlayer mc o25 Count1 n0")
		sleep 1000
		if(FoundCombat >= 1)
		{
			sleep 5000
			while(Found == 0)
			{
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
		}
	}
	FindClick(A_ScriptDir "\pics\EndTurn", "rLDPlayer mc o50 Count1 n0 w30000,50")
}

; ControlClick, x922 y478, ahk_id 0x220f5a,,,,NA Pos
; ControlClick, x922 y478, ahk_id 0x1f0c0e, , Left, , NA

ControlGet, ld_id, Hwnd, , RenderWindow1, LDPlayer
loop,3
{
	loop 5
	{
		ControlSend ,, {F5 down}, ahk_id %ld_id%  
		sleep 100
	}
}



; ControlClick, x922 y513, Girls, , Left, , NA Pos

; ControlClick, x922 y478, Girls,,,,NA Pos




; The following example opens MS Paint and draws a little house:

		; Found := FindClick(A_ScriptDir "\pics\TdollEnhancement", "rLDPlayer mc o10 Count1 n0 w5000,50")
		; While (Found != 1)
		; {
		; 	FindClick(A_ScriptDir "\pics\ExpeditionArrive", "rLDPlayer mc o10")
		; 	FindClick(A_ScriptDir "\pics\ExpeditionConfirm", "rLDPlayer mc o10")
		; 	FindClick(A_ScriptDir "\pics\Factory", "rLDPlayer mc o10")
		; 	Found := FindClick(A_ScriptDir "\pics\TdollEnhancement", " rLDPlayer mc o10 Count1 n0 w1000,50")
		; }




			; Loop
			; {
			; 	ClickS(TdollRetirementSlot1x+180*rti,TdollRetirementSlot1y)
			; 	ClickS(TdollRetirementSlot1x+180*rti,TdollRetirementSlot1y+310)
			; 	rti := rti+1
			; 	Sleep 10

			; }Until (rti > rti2)
; Found := FindClick(A_ScriptDir "\pics\Maps\0_2\DragSquadClicked", "rLDPlayer mc o10 Count1 n0")

; Production()

FriendFlag:
{
	SetTimer, FriendFlag, Off
	FriendChecker := 1
	return
}

#Include %A_ScriptDir%/Functions/Click.ahk
#Include %A_ScriptDir%/Functions/TimerUtils.ahk
#Include %A_ScriptDir%/Functions/PixelCheck.ahk
#Include %A_ScriptDir%/Functions/Pause.ahk
#Include %A_ScriptDir%/Functions/Window.ahk
#Include %A_ScriptDir%/Functions/PixelSearch.ahk
#Include %A_ScriptDir%/Functions/PixelMap.ahk
#Include %A_ScriptDir%/Functions/Notify.ahk
#Include %A_ScriptDir%/Functions/FindClick.ahk
#Include %A_ScriptDir%/Constants/Maps.ahk
#Include %A_ScriptDir%/Constants/Retirement.ahk

Initialize()
{
	global
	FriendCollector := 1
	FriendChecker := 1
}


F1::
Reload
return

F2::
Pause
return

^q::
FormatTime, TimeString,% A_NowUTC, HHmm
FormatTime, someday, A_NowUTC, ddd
FormatTime, UTC, % A_NowUTC, HH:mm
MsgBox, %UTC% %someday%
return