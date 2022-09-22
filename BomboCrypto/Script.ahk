#NoEnv							
#MaxThreadsperHotkey
SetWorkingDir %A_ScriptDir%		
SendMode Input

#persistent
;SetTimer, Script, 2400000

#persistent
SetTimer, NewMap, 10000

NewMap(){
	tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, new.png ;150
		
			if (ErrorLevel = 0){
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 150
	    		Send, {LButton}
	    		Sleep 500
	    
		}
		if (ErrorLevel = 1){
			if(tentativas > 3){
				return
		}
		tentativas++
		}				
	}
}

Script(){
	Loop{
		Reset()
		Voltar()
		Heroes()
		MandaTrabalhar()
		Xis()
		Start()
		AntiIdle()

	}
}

AntiIdle(){
	tentativa = 0

	Loop{
		Voltar()
		Heroes()
		Xis()
		Start()
		

		
		if(tentativa > 5){
			return
		}
		tentativa++
		Sleep, 300000
	}

}

MandaTrabalhar(){	
		tentativas = 0
		Scroll()
		Loop{
			
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, work2.png ;150

			if (ErrorLevel = 0){
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 300
	    		Send, {LButton}
	    		Sleep, 2000
	    		
					    		
		}
		if (ErrorLevel = 1){
			tentativas++
			VerificaHouse()
			Sleep, 300
			VerificaTimeout()
			Sleep, 300
			if(tentativas > 2){
				Sleep, 500
				VerificaHouse()

				return
		}
		
		


		}				
	}
}

VerificaHouse(){
	tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, house.png ;150
		
			if (ErrorLevel = 0){
				Cancela()
				Sleep, 500
				return	
					    		
			}
			if (ErrorLevel = 1){
				Sleep, 50
				if(tentativas > 1){
					return
			}
			tentativas++
			}				
	}	

}

VerificaTimeout(){
	tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, timeout.png ;150
		
			if (ErrorLevel = 0){
				Cancela()
				Sleep, 20
				return	
					    		
			}
			if (ErrorLevel = 1){
				Sleep, 50
				if(tentativas > 1){
					return
			}
			tentativas++
			}				
	}	

}

Scroll(){
	MouseMove, 650, 250
	count = 0
	Loop{
		Send {WheelDown}
		count++

		if(count = 780){
		Sleep, 200
		return
		}
	}

}

Start(){
	
	MouseMove, 700, 350, 10
	Sleep, 200
	Send, {LButton}
	Sleep, 500
}

Cancela(){
	
	MouseMove, 960, 200, 10
	Sleep, 100
	Send, {LButton}
	Sleep, 300
}

Reset(){
	
		tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, play.png ;150
		
			if (ErrorLevel = 0){
				
				ForceReconect()
				Sleep, 500
				Start()
				Sleep, 500
				return	
					    		
			}
		if (ErrorLevel = 1){
			Sleep, 100
			if(tentativas > 10){
				return
		}
		tentativas++
		}				
	}	


}


WaitPlay(){
		tentativas = 0
		
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, play2.png ;150
		
			if (ErrorLevel = 0){
				
				Sleep, 200
				return	
					    		
			}
		if (ErrorLevel = 1){
			Sleep, 1000

			if(tentativas > 30){
				Send, +{F5}
				WaitPlay()
				return
			}
		
		}				
		tentativas++
	}	


}


ForceReconect(){
	Send, {F12}
	Sleep, 4000
	Reconect()

	tentativas = 0
	Loop{

		ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, fail.png ;150
		
		if (ErrorLevel = 0){
			
					Send, +{F5}
					WaitPlay()
					Reconect()
					tentativas = 0	
				
			}
		if (ErrorLevel = 1){
			Sleep, 1000
			if(tentativas > 20){
				Send, {F12}
				EsperaDebug()
				return
			}
		}
		tentativas++
	}				
}

EsperaDebug(){
		tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, full.png ;150
		
			if (ErrorLevel = 0){
				return
					    		
			}
		if (ErrorLevel = 1){
			Sleep, 1000
			if(tentativas > 20){
				Send, +{F5}
				Sleep, 10000
				ForceReconect()
				return
		}
		tentativas++
		}				
	}	


}	


Reconect(){
tentativas = 0
		
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, play2.png ;150
			Random var, 2, 20
			if (ErrorLevel = 0){
				MouseMove, FoundX+var, FoundY+var
				Sleep, 500
				Send, {LButton}
				MouseMove, FoundX+var, FoundY+var
				Sleep, 500
				Send, {LButton}	
				MouseMove, FoundX+var, FoundY+var
				Sleep, 500
				Send, {LButton}		
				return
					    		
			}
		if (ErrorLevel = 1){
			Sleep, 1000

			if(tentativas > 30){
				Send, +{F5}
				WaitPlay()
				return
			}
		
		}				
		tentativas++
	}	



}

Xis(){
	
	MouseMove, 750, 190, 10
	Sleep, 200
	Send, {LButton}
	Sleep, 500
}

Voltar(){
	
	MouseMove, 260, 120, 10
	Sleep, 200
	Send, {LButton}
	Sleep, 500
}

Heroes(){
	
	MouseMove, 1100, 609, 10
	Sleep, 200
	Send, {LButton}
	Sleep, 500
}

End::
	;MandaTrabalhar()
	Script()
	;Reset()
	;Reconect()
	return

Home::
	Reload
	return
