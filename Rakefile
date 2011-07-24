desc "Update all installed plugins"
task :update_plugins do
  puts "Updating plugins"
  sh "git submodule foreach 'git checkout master; git pull'"
end

desc "Update readme"
task :update_readme do
  out = File.read('.gitmodules').scan(/url = (.*).git/).flatten.map do |repo|
    [File.basename(repo), repo.gsub('git://', 'https://')]
  end.sort { |a, b| a[0].downcase <=> b[0].downcase }.each do |(name, url)|
    puts "* [#{name}](#{url})"
  end
end
