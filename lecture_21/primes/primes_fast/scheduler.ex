defmodule Scheduler do

  def run(workers, module, func, input) do
    1..workers |> Enum.map(fn(_) -> spawn(module, func, [self]) end)
               |> schedule(input, [])
  end

  defp schedule(workers, input, results) do
    receive do
      {:ready, pid} when length(input) > 0 ->
        [ next | tail ] = input
        send(pid, {:prime, next, self})
        schedule(workers, tail, results)

      {:ready, pid} ->
        send(pid, {:shutdown})
        if length(workers) > 1 do
          schedule(List.delete(workers, pid), input, results)
        else
          Enum.reduce(results, fn(x,y) -> x + y end)
        end

      {:answer, result, _} ->
        schedule(workers, input, [ result | results])
    end
  end

end
