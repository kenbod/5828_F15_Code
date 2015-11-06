defmodule FibSolver do

  def fib(scheduler) do
    send(scheduler, {:ready, self})
    receive do
      {:fib, n, client} -> process(client, n)
                           fib(scheduler)
      {:shutdown}       -> exit(:normal)
    end
  end

  defp process(client, n) do
    send(client, {:answer, n, calc(n), self})
  end

  defp calc(n) when n >= 0 do
    if value = FibCache.get(n) do
      value
    else
      result = calc(n-1) + calc(n-2)
      FibCache.put(n, result)
      result
    end
  end

end
