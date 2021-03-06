#!/bin/bash

# USAGE
# ./record.sh /full/path/to/repository EPISODE_NUMBER

REPO_TO_RECORD=$1
RECORDING_HOME_DIR=$1/.git/recording
RECORDED_CLONED_REPO=$RECORDING_HOME_DIR/repo
REPO_WITH_TAGS=$2

# https://raw.githubusercontent.com/git/git/master/contrib/workdir/git-new-workdir
~/bin/git/contrib/workdir/git-new-workdir $REPO_TO_RECORD $RECORDED_CLONED_REPO

echo "sync {
    default.direct,
    source='$REPO_TO_RECORD',
    target='$RECORDED_CLONED_REPO',
    exclude = { '.git/' }
}
" > $RECORDING_HOME_DIR/lsyncd.conf

echo "#!/bin/bash
while :; do clear; cat clone_link; sleep 1; done;
" > $RECORDING_HOME_DIR/show_clone_link.sh && chmod +x $RECORDING_HOME_DIR/show_clone_link.sh


lsyncd $RECORDING_HOME_DIR/lsyncd.conf


cd $RECORDED_CLONED_REPO

git checkout -b recording-`printf "E%02d" $3`

### count down before recording
secs=10
while [ $secs -gt 0 ]; do echo -ne "Recording starts in $secs\033[0K\r"; sleep 1; : $((secs--)); done


### recording
while :; 
do
  tag=`printf "E%02d-%02dh%02dm%02ds" $3 $(($SECONDS/3600)) $((($SECONDS%3600)/60)) $(($SECONDS%60))`;
  git add .
  git commit -m "$tag"; git tag $tag ;

  echo -e "\n\tgit clone --branch $tag $REPO_WITH_TAGS\n" > $RECORDING_HOME_DIR/clone_link

  sleep 1; 
done
