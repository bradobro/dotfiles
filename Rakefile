#Rakefile to install and update configuration for vim, tmux, and shell

ignore_files = %w(Rakefile README.md .gitignore)

default_user = 'brad'

desc "install configuration"
task :install do
  user = default_user
  files = Dir["#{user}/*"] - ignore_files
  system %Q{ln -sfF "$PWD/#{user}/dot.vim" "$HOME/.vim"}
  system %Q{ln -sf "$PWD/#{user}/dot.vimrc" "$HOME/.vimrc"}
  system %Q{ln -sf "$PWD/#{user}/dot.pryrc" "$HOME/.pryrc"}
  system %Q{ln -sf "$PWD/#{user}/dot.tmux.conf" "$HOME/.tmux.conf"}
  system %Q{test ! -e $PWD/#{user}/dot.vim/bundle && cd $PWD/#{user}/dot.vim/bundle && git clone https://github.com/gmarik/vundle.git}
end
