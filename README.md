# dotfiles

## Setup
```
mkdir -p ~/Workspace/github.com/ktr17
cd ~/Workspace/github.com/ktr17
git clone https://github.com/ktr17/dotfiles.git
```

## config files link
```
make create_simlink
```

## Vim settings
viではなくvimをインストールしていることを確認する

dotfiles内で
```sh deinInstaller.sh .vim```
を実行する

.vimrc内の101行目，104行目，105行目，109行目の/Users/〇〇を自分のホームディレクトリのアカウント名にする

初回のvim起動時に各種プラグインのインストールが開始される
途中でエンターを押す必要がある
