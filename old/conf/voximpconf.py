#################################
#  Voximp 0.0.1  Sample Config  #
#################################
# When you change this file you #
# must regenerate the language  #
# model files. Firstly call     #
# voximp -c and follow the      #
# instructions. Set	        #
# languagemodel below to approp #
# value                         #
#################################


languagemodel = '2131' #set this to something sensible

keycommand = {
	'TERMINAL': "super+t", #spawn the terminal

}
#for letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ':
#	keycommand[letter] = letter.lower() #add all the letters - yes this is a true python file, you can do w/e you want in here

programcommand = {
  'WINTERMUTE': "touch $HOME/wintermute/wmlisten ; sleep 5; rm -f $HOME/wintermute/wmlisten",
	'WEATHER': "bash $HOME/wintermute/speech/weather.sh",
	'DATE': "bash $HOME/wintermute/speech/date.sh",
	'TIME': "bash $HOME/wintermute/speech/time.sh",
	'SHUTUP': "bash $HOME/wintermute/speech/shutup.sh",
	'CAPTAINS LOG': "bash $HOME/wintermute/speech/captainslog.sh",
}

mousecommand = {
}

progswithargs = {
	'ALERT': "notify-send" #just to demonstrate with arguments 
}

confirm = [ #anything listed here produces a confirm dialog before being executed
	'HIBERNATE' 
]
