#!/usr/bin/env bash

#quickly set up symlink for config files 
#to improve...

fullpath=$(realpath $0)
dir=$(dirname $fullpath)

Neovim=~/.config/nvim
Tmux=~/.tmux.conf
Sessionizer=~/.local/bin/tmux-sessionizer

#declare -a links=("~/.config/nvim" "~/.tmux.conf" "~/.local/bin/tmux-sessionizer")
#declare -a files=("$dir/nvim" "$dir/tmux/.tmux.conf" "$dir/bin/.local/bin/tmux-sessionizer.sh")
links=("~/.config/nvim ~/.tmux.conf ~/.local/bin/tmux-sessionizer")
files="$dir/nvim $dir/tmux/.tmux.conf $dir/bin/.local/bin/tmux-sessionizer.sh"

chmod +x $dir/bin/.local/bin/tmux-sessionizer.sh 

echo $STOW_FOLDERS | sed "s/,/ /g"

#for (( i=0; i<${length}; i++ ));
#do
#    echo "--- Deleting ${links[$i]} ---"
#   
#    #echo "rm -rf ${links[$i]}" && rm -rf ${links[$i]} && echo
#    #echo "--- Creating symlink ${links[$i]} ---" 
#    #echo "ln -s ${files[$i]} ${links[$i]}" && ln -s "${files[$i]}" "${links[$i]}" && echo 
#    #echo 
#
#done

#echo "--- Deleting $Neovim ---"
#echo "rm -rf $Neovim" && rm -r $Neovim && echo
#
#echo "--- Creating symlink $Neovim ---" 
#echo "ln -s $dir/nvim $Neovim" && ln -s $dir/nvim $Neovim && echo 
#
#echo "--- Deleting $Tmux ---"
#echo "rm -rf $Tmux" && rm -r $Tmux && echo 
#
#echo "--- Creating symlink $Tmux ---" 
#echo "ln -s $dir/tmux/.tmux.conf ~/.tmux.conf" && ln -s $dir/tmux/.tmux.conf $Tmux && echo 
#
#echo "--- Deleting $Sessionizer ---"
#echo "rm -rf $Sessionizer" && rm -r $Sessionizer && echo 
#
#echo "--- Setting up tmux-sessionizer ---"
#echo "chmod +x $dir/bin/.local/bin/tmux-sessionizer.sh" && chmod +x $dir/bin/.local/bin/tmux-sessionizer.sh && echo 
#
#echo "--- Creating symlink $Sessionizer ---"
#echo "ln -s $dir/bin/.local/bin/tmux-sessionizer.sh $Sessionizer"
#ln -s $dir/bin/.local/bin/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer
