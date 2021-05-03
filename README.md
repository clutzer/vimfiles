# vimfiles

This unified "VIM Files" directory can now be seamlessly used on both Windows
and Linux.

For Windows, issue the following commands:

> git clone ssh://git@gitlab.flaminhoop.com:9022/it/vimfiles.git %HOMEPATH%\vimfiles

For UNIX (Linux, Mac), issue the following commands:

$ git clone ssh://git@gitlab.flaminhoop.com:9022/it/vimfiles.git ~/.vim

Note: for Mac the above works for MacVim 7.4 and up.  However, for the command line version of vim (which at the time of writing is 7.3), you need the following step:

$ ln -s ~/.vim/vimrc ~/.vimrc

