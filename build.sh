#!/bin/bash

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
  declare -a OS=(
  )
else
  declare -a OS=(
    "windows"
    "linux"
    "darwin"
  )
fi

echo -e "\n=============\nBuild Stage\n=============\n"

for i in "${OS[@]}"
do
  if [ "$i" == "windows" ]; then
    FILENAME=ddos-client
    OUT_FN=ddos-client-$i.exe
  else
    FILENAME=ddos-client
    OUT_FN=ddos-client-$i
  fi
  echo -e "\nBuilding ${i}"
  mkdir -p bin/${i}
  GOOS=${i} go build -o ${FILENAME} ./client/
  mv ${FILENAME} bin/${i}/${OUT_FN}
done