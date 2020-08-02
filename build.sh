#! /bin/bash

Red='\e[38;2;241;23;18m'          # Red
Green='\e[38;2;28;237;137m'        # Green
Yellow='\e[38;2;255;229;82m'       # Yellow
Teal='\e[38;2;76;220;220m'

error_exit()
{
	echo -e "$1" 1>&2
	exit 1
}

build () {
  echo -e "$Green \n"
  echo -e " _           _        _                  "
  echo -e "| |         | |      | |                 "
  echo -e "| |     __ _| |_ ___ | |     ___   __ _  "
  echo -e "| |    / _\` | __/ _ \| |    / _ \ / _\` | "
  echo -e "| |___| (_| | || (_) | |___| (_) | (_| | "
  echo -e "\_____/\__,_|\__\___/\_____/\___/ \__, | "
  echo -e "                                   __/ | "
  echo -e "                                  |___/ "
  
  echo -e "Cleaning old builds...$Teal"
  rm -rf dist/ build/ LatoLog.egg-info/ || true

  echo -e "$Green"
  echo -e "Creating new builds$Teal\n"
  python3 setup.py sdist bdist_wheel || error_exit "$Red\nError building files, check for more info on output"

  echo -e "$Green"
  echo -e "Checking with twine...$Teal\n"
  twine check dist/* || error_exit "$Red\nError while checking files with twine"
  echo -e "$Green"
  echo -e "Done!\n"
}

test_upload () {
  build
  echo -e "$Green\nUploading to PyPi test repository...$Teal"
  python3 -m twine upload --repository testpypi dist/* || error_exit "$Red\nError uploading files, check for more info on output"
  echo -e "$Green\nDone!\n"
}

prod_upload () {
  build
  echo -e "$Green\nUploading to PyPi main repository...$Teal"
  python3 -m twine upload dist/* || error_exit "$Red\nError uploading files, check for more info on output"
  echo -e "$Green\nDone!\n"
}

help () {
  echo -ne "$Yellow\n"\
           "You have three options: \n"\
           " - build \n"\
           " - test_upload\n"\
           " - prod_upload\n"\
           "\nEither test_upload or prod_upload invokes build to verify if everything is ok before uploading.\n"
}


case $1 in
  "build") build;;
  "test_upload") test_upload;;
  "prod_upload") prod_upload;;
  "help") help;;
  *) echo -ne "Wrong argument or not supported.\n\n"; help;;
esac