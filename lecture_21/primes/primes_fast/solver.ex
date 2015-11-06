defmodule Solver do

  def loop(scheduler) do
    send(scheduler, {:ready, self})
    receive do
      {:prime, values, client} -> process(client, values)
                                  loop(scheduler)
      {:shutdown}              -> exit(:normal)
    end
  end

  defp process(client, values), do: send(client, result(values))

  defp result(values) do
    sum = values
          |> Enum.map(fn(n)   -> is_prime(n) end)
          |> Enum.map(fn(val) -> convert(val) end)
          |> Enum.reduce(fn(x,y) -> x + y end)
    {:answer, sum, self}
  end

  defp is_prime(0), do: false
  defp is_prime(1), do: false
  defp is_prime(2), do: true
  defp is_prime(n) when rem(n,2) == 0, do: false
  defp is_prime(n) do
    sqrt = :math.sqrt(n)
    i    = 3
    check(i, sqrt, n)
  end
  defp check(i, sqrt, _) when i > sqrt, do: true
  defp check(i, _, n) when rem(n, i) == 0, do: false
  defp check(i, sqrt, n), do: check(i+2, sqrt, n)

  defp convert(true), do: 1
  defp convert(false), do: 0

end
