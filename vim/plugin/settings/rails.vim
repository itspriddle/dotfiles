if has("autocmd")
  " Add :Rfactory command
  autocmd User Rails Rnavcommand factory spec/factories test/factories -suffix=.rb -default=model()

  " Add :Rconfig command
  autocmd User Rails Rnavcommand config config -glob=*.* -suffix= -default=routes.rb
end
