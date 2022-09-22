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
		Reset()
		Sleep, 2000
		Voltar()
		Heroes()
		Xis()
		Start()
		

		
		if(tentativa > 8){
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
	    		Sleep, 1000
	    		
					    		
			}
			if (ErrorLevel = 1){
				Sleep, 100
				ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, error.png ;150
			
				if (ErrorLevel = 0){
					Cancela()
					Sleep, 200
						
						    		
				}

				if (ErrorLevel = 1){
					tentativas++
					VerificaHouse()
					Sleep, 100
					VerificaTimeout()
					Sleep, 100
					if(tentativas > 5){
						Sleep, 500
						VerificaHouse()
						return
						}
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
				Sleep, 200
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

		if(count = 2200){
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
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, play.png ;150
		
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

	Reconect()

	tentativas = 0
	tentativas2 = 0
	Loop{

		ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, fail.png ;150
		
		if (ErrorLevel = 0){
			Sleep, 1000
			if(tentativas > 20){
				Send, ^{F5}
				Sleep, 5000
				ForceReconect()
				return
			}
					
				
			}
		if (ErrorLevel = 1){

			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, heroes.png ;150
			
			if (ErrorLevel = 0){
					return
				}	
				
			if (ErrorLevel = 1){

				ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, ok.png ;150
			
					if (ErrorLevel = 0){
							MouseMove,FoundX, FoundY
							Sleep, 300
							Send,{LButton}
							Sleep, 300
							MouseMove,FoundX, FoundY
							Sleep, 300
							Send,{LButton}
							Sleep, 300
							MouseMove,FoundX, FoundY
							Sleep, 300
							Send,{LButton}
							Sleep, 15000
							Reset()
							return
						}	

				Sleep, 1000
			}
			tentativas2++	
		}
		tentativas++
	}				
}

	


Reconect(){
tentativas = 0
		
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, play.png ;150
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

^End::
	Scroll()
	return

Home::
	Reload
	return
