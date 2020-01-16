# search and delete broken symlinks
find /output -type l -exec test ! -e {} \; -delete

# search and delete empty folders
find /output -type d -empty -delete
