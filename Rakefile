namespace :plugins do
  desc "Update all installed plugins"
  task :update do
    puts "Updating plugins"
    sh "git submodule foreach 'git checkout master; git pull'"
    Rake::Task['plugins:helptags'].invoke
  end

  # desc "Add plugin"
  # task :add, :repo, :path do |_, args|
  #   puts "git submodule add #{args[:repo]} #{args[:path]}"
  # end

  desc "Generate helptags"
  task :helptags do
    puts "Generating helptags"
    sh "vim -e -c 'Helptags|q' 2>&1 /dev/null"
  end
end

namespace :cleanup do
  dirs = [:view, :backup]

  desc "Cleanup ~/.vim/.{#{dirs.join(',')}}/*"
  task :all => dirs

  dirs.each do |dir|
    desc "Cleanup ~/.vim/.#{dir}/*"
    task :view do
      sh "rm -f #{ENV['HOME']}/.vim/.#{dir}/*"
    end
  end
end

desc "Update readme"
task :update_readme do
  out = File.read('.gitmodules').scan(/url = (.*).git/).flatten.map do |repo|
    [File.basename(repo), repo.gsub('git://', 'https://')]
  end.sort { |a, b| a[0].downcase <=> b[0].downcase }.each do |(name, url)|
    puts "* [#{name}](#{url})"
  end
end
