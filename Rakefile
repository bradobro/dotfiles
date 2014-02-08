#Rakefile to install and update configuration for vim, tmux, and shell

ignore_files = %w(Rakefile README.md .gitignore)

desc "install configuration"
task :install do
  files = Dir['*'] - ignore_files
  system %Q{ln -sfF "$PWD/dot.vim" "$HOME/.vim"}
  system %Q{ln -sf "$PWD/dot.vimrc" "$HOME/.vimrc"}
  system %Q{ln -sf "$PWD/dot.pryrc" "$HOME/.pryrc"}
  system %Q{ln -sf "$PWD/dot.tmux.conf" "$HOME/.tmux.conf"}
  system %Q{$PWD/dot.vim/bundle && git clone https://github.com/gmarik/vundle.git}
end
