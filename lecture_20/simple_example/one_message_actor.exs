one_message = fn () ->
  receive do
    {:hello} -> IO.puts("HI!")
  end
end

actor = spawn(one_message)

send(actor, {:goodbye})

send(actor, {:hello})

# this second call to send will be ignored
# because our function above only calls receive once
send(actor, {:hello}) 
