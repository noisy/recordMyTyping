#!/bin/bash

# USAGE
# ./record.sh /full/path/to/repository EPISODE_NUMBER


REPO_TO_RECORD=$1
RECORDED_CLONED_REPO=$1/.git/timer_repo

# https://raw.githubusercontent.com/git/git/master/contrib/workdir/git-new-workdir
~/bin/git/contrib/workdir/git-new-workdir $REPO_TO_RECORD $RECORDED_CLONED_REPO

echo "sync {
    default.direct,
    source='$REPO_TO_RECORD',
    target='$RECORDED_CLONED_REPO',
    exclude = { '.git/' }
}
" > $REPO_TO_RECORD/.git/lsyncd.conf

lsyncd $REPO_TO_RECORD/.git/lsyncd.conf


cd $RECORDED_CLONED_REPO

while :; 
do
  tag=`printf "E%02d-%02dh%02dm%02ds" $2 $(($SECONDS/3600)) $((($SECONDS%3600)/60)) $(($SECONDS%60))`;
  git add .
  git commit -m "$tag"; git tag $tag ; 
  sleep 1; 
done
