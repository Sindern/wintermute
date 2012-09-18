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


languagemodel = '7502' #set this to something sensible

keycommand = {
	'TERMINAL': "super+t", #spawn the terminal

}
#for letter in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ':
#	keycommand[letter] = letter.lower() #add all the letters - yes this is a true python file, you can do w/e you want in here

programcommand = {
	'FIREFOX': "firefox",
	'NOTEPAD': "geany",
	'WEATHER': "/home/wintermute/Dropbox/ProjCoding/automation_bot/speech/weather.sh",
	'DATE': "/home/wintermute/Dropbox/ProjCoding/automation_bot/speech/date.sh",
	'TIME': "/home/wintermute/Dropbox/ProjCoding/automation_bot/speech/time.sh",
	'SHUTUP': "/home/wintermute/Dropbox/ProjCoding/automation_bot/speech/shutup.sh",
	'CAPTAINS LOG': "touch $HOME/wmlisten ; sleep 5; rm -f $HOME/wmlisten",
#	'CAPTAINS LOG': "/home/wintermute/Dropbox/ProjCoding/automation_bot/speech/captainslog.sh",
}

mousecommand = {
}

progswithargs = {
	'ALERT': "notify-send" #just to demonstrate with arguments 
}

confirm = [ #anything listed here produces a confirm dialog before being executed
	'HIBERNATE' 
]
