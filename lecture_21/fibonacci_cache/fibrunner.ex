defmodule FibRunner do

  def run() do
    input = Enum.into(1..10000, [])
    FibCache.start()
    {time, result} =
      :timer.tc(FibScheduler, :run, [8, FibSolver, :fib, input])
    Enum.each(result, fn({n, val}) -> IO.puts "#{n}: #{val}" end)
    :io.format "~.2f secs~n", [time/1000000.0]
  end

end
