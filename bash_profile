for file in $HOME/.bashrc $HOME/.paths
do
  [[ -f $file ]] && source $file
done
