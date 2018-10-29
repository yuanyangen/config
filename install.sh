CURRENT_DIR=`pwd`
HOME_DIR=$HOME
rm $HOME_DIR/.zshrc
rm $HOME_DIR/.vimrc


ln -s $CURRENT_DIR/vimrc $HOME_DIR/.vimrc
ln -s $CURRENT_DIR/zshrc $HOME_DIR/.zshrc
