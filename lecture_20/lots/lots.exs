defmodule Simple do
  def loop do
    receive do
      {:hello} -> "HI!"
    end
    loop
  end
end

create = fn () ->
  Enum.map(1..10000, fn (_) -> spawn(&Simple.loop/0) end)
end

pids = Enum.map(1..10000, fn (_) -> spawn(&Simple.loop/0) end)

IO.inspect pids

IO.inspect :timer.tc(fn() -> create.() end)
