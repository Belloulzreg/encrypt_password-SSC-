# /usr/bin/bash
SYMBOLS='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
encryptedPassword=()
decryptedPassword=()
echo -e "Please enter the password you wish to encrypt/decrypt: \c"
read plainPassword
echo -e "Pleas enter the key you wish to use: \c"
read -s encKey
echo "Please chose the mode you wish to use"
select mode in Encrypt Decrypt
do
case $mode in 
Encrypt)
for ((i=0; i<${#plainPassword}; i++));
do 
for ((j=0; j<=${#SYMBOLS}; j++));
do
if [[ ${plainPassword:i:1} == ${SYMBOLS:j:1} ]]
then 
newindex=$((j+encKey))
encryptedPassword+=(${SYMBOLS:newindex:1})
fi
done
done
echo ${encryptedPassword[*]}
;;
Decrypt)
for ((i=0; i<${#plainPassword}; i++));
do 
for ((j=0; j<=${#SYMBOLS}; j++));
do
if [[ ${plainPassword:i:1} == ${SYMBOLS:j:1} ]]
then 
newindex=$((j-encKey))
decryptedPassword+=(${SYMBOLS:newindex:1})
fi
done
done
echo ${decryptedPassword[*]}
;;
*)
echo "I don't understand, please repeat again"
;;
esac
break
done 

