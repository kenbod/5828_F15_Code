defmodule Factorial do

  def fact(0) do
    1
  end

  def fact(n) do
    n * fact(n-1)
  end

end
