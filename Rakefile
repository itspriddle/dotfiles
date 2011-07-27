# copied from http://github.com/josh/dotfiles/raw/master/Rakefile
#task :default => :install

desc "Install the dot files into user's home directory"
task :install do
  manifest.each do |file|
    source, file = file, File.basename(file)

    puts "linking ~/.#{file}"
    system %Q{unlink "$HOME/.#{file}"}
    system %Q{ln -s "$PWD/#{source}" "$HOME/.#{file}"}
  end
end

def linux?
  !! `uname -a`.chomp.match(/^Linux/)
end

def osx?
  !! `uname -a`.chomp.match(/^Darwin/)
end

def manifest
  %w[
    ackrc
    bash
    bashrc
    bash_profile
    caprc
    capistrano
    gitignore
    hushlogin
    inputrc
    localrc
    railsrc
    rvmrc
    my.cnf
    irbrc
    gemrc
    zshenv
    zshrc
    zsh
  ].sort
end
