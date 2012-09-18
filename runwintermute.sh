cd $HOME/wintermute && git pull 
echo "chmodding .sh files to +x "
find $HOME/wintermute -type f -iname "*.sh" -print -exec chmod +x "{}" \;
echo "removing old conf files"
rm -fv $HOME/.config/voximp/*
echo "installing new conf files"
cp -Rv $HOME/wintermute/voximp/* $HOME/.config/voximp
voximp