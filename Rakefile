
ignore_files = %w(Rakefile README.md .gitignore)

default_user = 'team'

desc "install configuration"
task :install, [:user] do |t, args|
  args.with_defaults(user: default_user)
  user = args.user

  # Link all non-ignored files
  files = Dir["#{user}/*"] - ignore_files
  files.each do |source|
    destination = source.gsub(/^\w+/,'$HOME')  #rebase to ~
    destination.gsub!(/dot\./,'.') # transform 'dot.' to '.'
    # Link symbolic, no-follow-dir, verbose, force replace file, force replace dir
    #require 'pry'; binding.pry
    case RUBY_PLATFORM
    when /^.*darwin.*$/
      cmd =  %Q{ln -shvfF "$PWD/#{source}" "#{destination}"}
    when /linux$/
      cmd =  %Q{ln -snvfF "$PWD/#{source}" "#{destination}"}
    end
    system cmd
  end

  # get vundle into the right place
  system %Q{test ! -e $PWD/#{user}/dot.vim/bundle/vundle && cd $PWD/#{user}/dot.vim/bundle && git clone https://github.com/gmarik/vundle.git}
  puts 'In vim execute :BundleInstall'
end
