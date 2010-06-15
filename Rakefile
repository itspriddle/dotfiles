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

def manifest
  %w[
    caprc
    gitignore
    hushlogin
    inputrc
    localrc
    railsrc
    rvmrc
    paths
    my.cnf
    irbrc
    gemrc
  ].sort
end
