#Rakefile to install and update configuration for vim, tmux, and shell

ignore_files = %w(Rakefile README.md .gitignore)

default_user = 'team'

desc "install configuration"
task :install do
  user = default_user

  # Link all non-ignored files
  files = Dir["#{user}/*"] - ignore_files
  files.each do |source|
    destination = source.gsub(/^\w+/,'$HOME')  #rebase to ~
    destination.gsub!(/dot\./,'.') # transform 'dot.' to '.'
    msg = "Linking '#{source}' to '#{destination}'"
    # Link symbolic, no-follow-dir, verbose, force replace file, force replace dir
    cmd =  %Q{ln -shvfF "$PWD/#{source}" "#{destination}"}
    puts "Running: '#{cmd}'"
    system cmd
  end

  system %Q{test ! -e $PWD/#{user}/dot.vim/bundle/vundle && cd $PWD/#{user}/dot.vim/bundle && git clone https://github.com/gmarik/vundle.git}
end
