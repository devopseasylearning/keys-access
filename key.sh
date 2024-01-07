#! /bin/bash

### checking if you have a key
rm -rf ~/add-keys || true
mkdir ~/add-keys
cd ~/add-keys

if 
   [[ -z $1 ]]
then
echo "your did not enter your prefer name, please enter your prefer name "
 exit 1
fi 


SESSION=`echo $1 |  awk '{print substr($0,1,2)}'`

if 
[[ ${SESSION} == a1 ]] ||[[ ${SESSION} == s2 ]] || [[ ${SESSION} == s3 ]] || [[ ${SESSION} == s4 ]] || [[ ${SESSION} == s5 ]] || [[ ${SESSION} == s6 ]] || [[ ${SESSION} == s7 ]]  || [[ ${SESSION} == s8 ]] || [[ ${SESSION} == s9 ]]
then 
echo "looks good"
else 
echo "wrong prefer name"
exit 1

fi 


KEY=$(ls -l ~/.ssh | grep -io id_rsa.pub)

if 
  [[ ${KEY} == id_rsa.pub  ]]
then 
echo "you are good to go "

rm -rf ~/temps || true
mkdir temps
cp -r ~/.ssh/id_rsa.pub  temps/$1.pem

ls -l | grep -io temps/$1.pem
echo "KEY COPY "
elif 
  [[ ${KEY} != id_rsa.pub  ]] 
then 
  mkdir ~/.ssh || true 
  cd ~/.ssh
  yes id_rsa  | ssh-keygen -q -t rsa -N '' >/dev/null
clear
echo "CREATE AND KEY COPY"
fi 

echo 
echo 

rm -rf key-access-server || true 
git clone https://devopseasylearning:glpat-MNxhoZY5W7xLeovjB4j4@gitlab.com/session03/instructors/key-access-server.git 
git config --global user.name "devopseasylearning"
git config --global user.email info@devopseasylearning.com
cd key-access-server/keys 
git pull --all
sleep 10 
git pull --all
cat  ~/.ssh/id_rsa.pub > ./$1.pem
git add -A 
git commit -m "adding $1.pem"
git push  https://devopseasylearning:glpat-MNxhoZY5W7xLeovjB4j4@gitlab.com/session03/instructors/key-access-server.git 

cd - && rm -rf key-access-server

cd ~
echo "INSTRUCTIONS"
echo "PLEASE NOTIFY ERIC VIA WHATSAPP at 832-342-0700"


# glpat-P3m8vQvCZExeYym_Tbtv

# git clone https://devopseasylearning:glpat-P3m8vQvCZExeYym_Tbtv@gitlab.com/session03/instructors/key-access-server.git
