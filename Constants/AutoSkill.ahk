AutoSkill()
{	
	Global
	AutoSkillStarlist := 1,2,3,4,5
	AutoSkillTypelist := HandGun,SubmachineGun,Rifle,AssaultRifle,MachineGun,ShotGun
	if (InStr(AutoSkillStarlist, %AutoSkillStar%) || InStr(AutoSkillTypelist, %AutoSkillType%))
	{
		if(FindClick(A_ScriptDir "\pics\Research\Skill\SkillReady", "rLDPlayer mc o40 Count1 n0") || FindClick(A_ScriptDir "\pics\Research\Skill\SkillReady2", "rLDPlayer mc o40 Count1 n0"))
		{
			Transition("Research\Skill\Research","Research\Skill\ResearchClicked")
			loop,4
			{
				if(A_index == 4)
				{
					sleep 1000
					DragDownToUp(500, 675, 350)
					index := 3
				}
				else 
				{
					index := A_index
				}
				x:=200*index+(1)
				y:=200*index+(-601)
				if(FindClick(A_ScriptDir "\pics\Research\Skill\Slot", "rLDPlayer mc o100 Count1 n0 w5000,50 a200," x ",-30," y ""))
				{
					RFindClick("Research\Skill\Slot", "rLDPlayer mc o100 w10000,1000 a200," x ",-30," y "")
					if(FindClick(A_ScriptDir "\pics\Research\Skill\SortBySorted", "rLDPlayer mc o40 Count1 n0 w4000,50") == 0)
					{
						RFindClick("Research\Skill\Level", "rLDPlayer mc o40 w10000,1000")
						sleep 1000
						ClickS(977,711)
						sleep 1000
						ClickS(977,630)
						sleep 1000
						RFindClick("Research\Skill\Descending", "rLDPlayer mc o40 w10000,1000")
						sleep 1000
						RFindClick("Research\Skill\Filter", "rLDPlayer mc o40 w10000,1000")
						if(AutoSkillStar != 0)
						{
							sleep 1000
							RFindClick("Research\Skill\"AutoSkillStar, "rLDPlayer mc o40 w10000,1000")
						}
						if(AutoSkillType != 0)
						{
							sleep 1000
							RFindClick("Research\Skill\"AutoSkillType, "rLDPlayer mc o40 w10000,1000")
						}
						sleep 1000
						ClickS(600,650)
						RFindClick("Research\Skill\Confirm", "rLDPlayer mc o40 w5000,1000")
					}
					sleep 2000
					loop,6
					{
						Clickcordx:= -90+A_index*180
						ClickS(Clickcordx,340)
						sleep 300
					}
					RFindClick("Research\Skill\StartTraining", "rLDPlayer mc o40 w5000,1000")
				}
			}
			sleep 3000
			RFindClick("Research\Skill\Back", "rLDPlayer mc o30 w30000,1000")
		}
	}
	return
}


