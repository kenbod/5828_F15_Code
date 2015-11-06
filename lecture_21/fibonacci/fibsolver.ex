defmodule FibSolver do

  def fib(scheduler) do
    send(scheduler, {:ready, self})
    receive do
      {:fib, n, client} -> process(client, n)
                           fib(scheduler)
      {:shutdown}       -> exit(:normal)
    end
  end

  defp process(client, n), do: send(client, result(n))

  defp result(n), do: {:answer, n, fib_calc(n), self}

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n-1) + fib_calc(n-2)

end
