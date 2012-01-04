git init
git add .
git commit -m 'initial project version'

git clone git://github.com/schacon/grit.git

git clone git://github.com/schacon/grit.git mygrit

git status

#ignoring files
cat .gitignore

#Skipping the Staging Area
git commit -am 'message'

#removeing files
git rm file

git rm --cached readme.txt

git rm log/\*.log

git mv readme.txt readme

git log

#showing your remote
git remote

git remote -v

#This means I can pull contributions from any of these users pretty easily. But notice that
#only the origin remote is an SSH URL,so it’s the only one I can push to

#Adding Remote Repositories
git remote add pb git://github.com/paulboone/ticgit.git
git fetch pb

#inspecting a remote
git remote show origin

git tag

git tag -l v1.4.2.*

git tag -a v1.4 -m 'my version 1.4'
git show v1.4

git tag -s v1.5 -m 'my signed 1.5 tag'
git show v1.5

git tag v1.4-lw

git log --pretty=oneline

git tag -a v1.2 9fceb02

git push origin v1.5
git push origin --tags

git branch testing
git checkout testing

gti checkout master

git checkout -b iss53
   
  #this is shorthand for

git branch iss53
git checkout iss53

git branch -d hotfix

git branch -v
git branch --merged
git branch --no-merged


