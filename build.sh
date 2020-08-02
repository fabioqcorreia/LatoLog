#! /bin/bash

build () {
  echo "Cleaning old builds..."
  rm -rf dist/ build/ LatoLog.egg-info/ || true

  echo "Creating new builds"
  python3 setup.py sdist bdist_wheel || echo "Error building files, check for more info on output"

  echo "Checking with twine..."
  twine check dist/* || echo "Error while checking files with twine"

  echo "Done!"
}

test_upload () {
  build
  echo "Uploading to PyPi test repository..."
  python3 -m twine upload --repository testpypi dist/*
  echo "Done!"
}

prod_upload () {
  build
  echo "Uploading to PyPi main repository..."
  python3 -m twine upload dist/*
  echo "Done!"
}

help () {
  echo -ne "You have three options: \n"\
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


