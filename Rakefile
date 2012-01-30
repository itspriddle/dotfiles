# namespace :plugins do
#   desc "Add plugin"
#   task :add, :repo, :path do |_, args|
#     puts "git submodule add #{args[:repo]} #{args[:path]}"
#   end
# end

desc "Update readme"
task :update_readme do
  out = File.read('.gitmodules').scan(/url = (.*).git/).flatten.map do |repo|
    [File.basename(repo), repo.gsub('git://', 'https://')]
  end.sort { |a, b| a[0].downcase <=> b[0].downcase }.each do |(name, url)|
    puts "* [#{name}](#{url})"
  end
end
