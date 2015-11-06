defmodule FibCache do

  def start() do
    cache = Enum.into([{0, 0}, {1, 1}], HashDict.new)
    pid   = spawn(fn() -> loop(cache) end)
    Process.register(pid, :cache)
  end

  def put(n, value) do
    cache = Process.whereis(:cache)
    send(cache, {:put, n, value})
  end 

  def get(n) do
    cache = Process.whereis(:cache)
    ref   = make_ref
    send(cache, {:get, self, ref, n})
    receive do
      {:result, ^ref, value} -> value
    end
  end

  defp loop(cache) do
    receive do
      {:put, n, value}       ->
        loop(Dict.put(cache, n, value))
      {:get, worker, ref, n} ->
        send(worker, {:result, ref, cache[n]}) 
        loop(cache)
      {:shutdown}            ->
        exit(:normal)
    end
  end

end
