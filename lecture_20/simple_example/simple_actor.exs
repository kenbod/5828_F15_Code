defmodule HiThere do
  def hello do
    receive do
      {:hello} -> IO.puts("HI!")
    end
    hello
  end
end

# the code belows creates an actor and shows
# that it can handle multiple calls to
# send because our function above loops
# and calls receive over and over again

# note this program will automatically terminate when
# the main thread below exits

actor = spawn(&HiThere.hello/0)

send(actor, {:hello})
send(actor, {:hello})
send(actor, {:hello})
