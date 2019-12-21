EnhancementDollSwitcher()
{	
	Global
	y:=0
	loop,2
	{
		rti := 0
		rti2 := 5
		tpc := 0
		loop
		{
			tpc := PixelGetColorS(TdollEnhancement_Lockx+179*rti,TdollEnhancement_Locky+304*y,1)
			if (tpc == TdollEnhancement_Lock)
			{
				ClickS(TdollEnhancement_Lockx+180*rti,TdollEnhancement_Locky+304*y)
				break
			}
			rti := rti+1
		}until (rti > rti2)
		if (tpc == TdollEnhancement_Lock)
		{
			break
		}
		y++
	}
}

Retirement()
{
Transition("CombatTdollEnhancement","Retirement")
	sleep 1000
	RFindClick("Retirement", "rLDPlayer mc o50 w30000,50")
	sleep 1000
	Transition("RetirementNotClicked","RetirementClicked") 
	RFindClick("TdollRetirementSelect", "rLDPlayer mc o75 w30000,50")
	sleep 500
	RFindClick("SmartSelect", "rLDPlayer mc o75 w30000,50")
	sleep 500
	RFindClick("Filter", "rLDPlayer mc o20 w30000,50")
	RFindClick("ThreeStar", "rLDPlayer mc o20 w30000,50")
	RFindClick("Confirm", "rLDPlayer mc o20 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\3STAR", "rLDPlayer mc o50 Count1 n0")
	if Found >= 1
	{
	ClickTilGone("3STAR", " rLDPlayer mc o75 w30000,50 sleep100")
	}
	RFindClick("ConfirmRet", "rLDPlayer mc o75 w30000,50")
	sleep 500
	RFindClick("TdollRetirementDismantle", "rLDPlayer mc o75 w30000,50")
	sleep 500
	Found := FindClick(A_ScriptDir "\pics\RetireOK", "rLDPlayer mc o50 Count1 n1")
	Sleep 1000
	RFindClick("FactoryReturn", "rLDPlayer mc o50 w30000,50")
	sleep 2000
	Transition("Combat","CombatPage")

}
	return

