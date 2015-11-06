defmodule FibRunner do

  def run() do
    input = [ 37, 37, 37, 37, 37, 37, 37, 37, 37, 37 ]

    Enum.each(
      1..10,
      fn(workers) ->
        {time, result} =
          :timer.tc(FibScheduler, :run, [workers, FibSolver, :fib, input])
        if workers == 1 do
          IO.puts inspect(result)
          IO.puts "\n #   time (s)"
        end
        :io.format "~2B     ~.2f~n", [workers, time/1000000.0]
      end)
  end

end
