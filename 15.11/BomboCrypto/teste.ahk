#NoEnv							
#MaxThreadsperHotkey
SetWorkingDir %A_ScriptDir%		
SendMode Input

#persistent
SetTimer, ConnectWallet, 10000

ConnectWallet() {
	tentativas = 0
		Loop {
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, conectar.png ;150
		
			if (ErrorLevel = 0){
				Sleep, 200
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 150
	    		Send, {LButton}
				Sleep, 1000
				Meta()
				return
	    
		}
		if (ErrorLevel = 1){
			if(tentativas > 3){
				return
		}
		tentativas++
		}				
	}
}

Meta(){
	Sleep 25000
	tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, metamask.png ;150
		
			if (ErrorLevel = 0){
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 150
	    		Send, {LButton}
	    		Sleep 5000
				Assinar()
	    
		}
		if (ErrorLevel = 1){
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, metamask2.png ;150
			if (ErrorLevel = 0){
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 150
	    		Send, {LButton}
	    		Sleep 5000
				Assinar()
	    
		}
			if(tentativas > 3){
				return
		}
		tentativas++
		}				
	}

}

Assinar(){
	tentativas = 0
		Loop{
			ImageSearch, FoundX, FoundY, 0 ,0, A_ScreenWidth, A_ScreenHeight, *50, assinar.png ;150
		
			if (ErrorLevel = 0){
				MouseMove, FoundX, FoundY, 2
	    		Sleep, 150
	    		Send, {LButton}
	    		Sleep 50000
				Start()
	    
		}
		if (ErrorLevel = 1){
			if(tentativas > 3){
				return
		}
		tentativas++
		}				
	}

}

Start(){
	MsgBox, Foi mane
}
