if has("autocmd")
  " Add :Rfactory command
  autocmd User Rails Rnavcommand factory spec/factories test/factories -suffix=.rb -default=model()

  " Add :Rconfig command
  autocmd User Rails Rnavcommand config config -glob=*.* -suffix= -default=routes.rb

  autocmd User Rails Rnavcommand seeds db -glob=seeds.rb -suffix= -default=seeds.rb
end
