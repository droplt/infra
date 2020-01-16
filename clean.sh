if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# search and delete broken symlinks
find ${BASE_PATH}/filebot-output -type l -exec test ! -e {} \; -delete

# search and delete empty folders
find ${BASE_PATH}/filebot-output -type d -empty -delete
