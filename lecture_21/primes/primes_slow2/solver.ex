defmodule Solver do

  def loop(scheduler) do
    send(scheduler, {:ready, self})
    receive do
      {:prime, n, client} -> process(client, n)
                             loop(scheduler)
      {:shutdown}       -> exit(:normal)
    end
  end

  defp process(client, n), do: send(client, result(n))

  defp result(n), do: {:answer, n, is_prime(n), self}

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

end
