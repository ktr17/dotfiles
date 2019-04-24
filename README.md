# dotfiles
### VIMの設定
ホームディレクトリで
git clone https://github.com/ktr17/dotfiles.git

viではなくvimをインストールしていることを確認する

dotfiles内で
```sh deinInstaller.sh .vim```
を実行する

.vimrc内の101行目，104行目，105行目，109行目の/Users/〇〇を自分のホームディレクトリのアカウント名にする

vimの設定を反映させるためにホームディレクトリにリンクを貼る
```
ln -s ~/dotfiles/.vim ~/
ln -s ~/dotfiles/.vimrc ~/
```

初回のvim起動時に各種プラグインのインストールが開始される
途中でエンターを押す必要がある
