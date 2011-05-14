after "deploy" do
  growl_send "Deployed #{application}"
end

after "rollback" do
  growl_send "Rolled back #{application}"
end

def growl_send(message)
  `growlnotify -n "cap" -t "Capistrano" -m "#{message}"`
end

