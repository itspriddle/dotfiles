task :default => :install

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
  %w[vim vimrc gvimrc].sort
end

desc "Update all installed plugins"
task :update_plugins do
  puts "Updating plugins"
  sh "git submodule foreach 'git checkout master; git pull origin master'"
end
