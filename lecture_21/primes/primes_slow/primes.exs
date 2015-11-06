defmodule Primes do

  def calculate_single(n) do
    1..n
    |> Enum.map(&Primes.is_prime/1)
    |> Enum.map(&Primes.convert/1)
    |> Enum.reduce(fn(x,y) -> x + y end)
  end

  def calculate_parallel(n) do
    1..n
    |> Parallel.map(&Primes.is_prime/1)
    |> Parallel.map(&Primes.convert/1)
    |> Enum.reduce(fn(x,y) -> x + y end)
  end

  def is_prime(0), do: false
  def is_prime(1), do: false
  def is_prime(2), do: true
  def is_prime(n) when rem(n,2) == 0, do: false
  def is_prime(n) do
    sqrt = :math.sqrt(n)
    i    = 3
    check(i, sqrt, n)
  end
  def check(i, sqrt, _) when i > sqrt, do: true
  def check(i, _, n) when rem(n, i) == 0, do: false
  def check(i, sqrt, n), do: check(i+2, sqrt, n)

  def convert(val) when val == true, do: 1
  def convert(val) when val == false, do: 0
end

{time, result} =
  :timer.tc(fn() -> Primes.calculate_single(1000000) end)
:io.format "~.2f secs~n", [time/1000000.0]
IO.puts inspect(result)

{time, result} =
  :timer.tc(fn() -> Primes.calculate_parallel(1000000) end)
:io.format "~.2f secs~n", [time/1000000.0]
IO.puts inspect(result)

