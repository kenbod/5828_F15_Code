defmodule Runner do

  def convert({_,true}),  do: 1
  def convert({_,false}), do: 0

  def run() do
    input = Enum.into(1..100000, [])

    Enum.each(
      8..8,
      fn(workers) ->
        {time, result} =
          :timer.tc(Scheduler, :run, [workers, Solver, :loop, input])
        {time1, sum} =
          :timer.tc(
            fn() ->
              result |> Enum.map(&Runner.convert/1)
                     |> Enum.reduce(fn(x,y) -> x + y end) 
            end)
        if workers == 1 do
          IO.puts "Result: #{sum}"
          IO.puts "\n #   time (s)"
        end
        :io.format "~2B     ~.2f~n", [workers, (time+time1)/1000000.0]
      end)
  end

end
