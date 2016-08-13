cd cert
read -a UPDATE_LIST <<< $(find ./ -maxdepth 1 | grep .crt)
for CRT_FILE in "${UPDATE_LIST[@]}"; do
  DOMAIN=$(echo $CRT_FILE | grep -o '[^/]\+' | tail -1 | awk -F'.' '{print $1}')
  read -a FILE_LIST <<< $(ls ${DOMAIN}*)
  FOLDER=$(sed 's/_/./g' <<< $DOMAIN)
  cd $FOLDER/
  APPLY_DATE=$(ls *.csr.pem | sort | tail -1 | awk -F'.' '{print $1}')
  for FILE in "${FILE_LIST[@]}"; do
    SUFFIX=${FILE#$DOMAIN}
    mv ../$FILE $APPLY_DATE$SUFFIX
    rm $SUFFIX
    ln -s $APPLY_DATE$SUFFIX $SUFFIX
  done
  cd ../
done
