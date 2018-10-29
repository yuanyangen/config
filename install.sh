CURRENT_DIR=`pwd`
HOME_DIR=$HOME
rm $HOME_DIR/.zshrc
rm $HOME_DIR/.vimrc


ln -s $CURRENT_DIR/vimrc $HOME_DIR/.vimrc
ln -s $CURRENT_DIR/zshrc $HOME_DIR/.zshrc

# install tmux config
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local
