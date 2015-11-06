defmodule Runner do

  def run() do

    n = 10000000

    Enum.each(
      1..8,
      fn(workers) ->
        input = Enum.chunk(1..n, round(n/workers))
        {time, result} =
          :timer.tc(Scheduler, :run, [workers, Solver, :loop, input])
        if workers == 1 do
          IO.puts "Result: #{result}"
          IO.puts "\n #   time (s)"
        end
        :io.format "~2B     ~.2f~n", [workers, time/1000000.0]
      end)
  end

end
