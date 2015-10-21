defmodule EnumWorkshop do
  @doc """
  reimplement the functionality of `Enum.count/1` without using the
  `count/1` function from the `Enum.module`.

    iex> EnumWorkshop.count([])
    0

    iex> EnumWorkshop.count([1])
    1

    iex> EnumWorkshop.count([1, 2, 3, 4])
    4
  """
  @spec count(list) :: [Any]
  def count(list) do
    Enum.reduce(list, 0, fn(_, acc) -> acc+1 end)
    #Enum.count list # replace with your own implementation
  end

  @doc """
  reimplement the functionality of `Enum.member?/1` without using the
  `member?/1` function from the `Enum.module`.

    iex> EnumWorkshop.member?([], 5)
    false

    iex> EnumWorkshop.member?([1], 1)
    true

    iex> EnumWorkshop.member?([1, 2, 3, 4], 3)
    true

    iex> EnumWorkshop.member?([1, 2, 3, 4], 7)
    false
  """
  @spec member?(list, Any) :: Boolean
  def member?(list, n) do
    do_member list, n # replace with your own implementation
  end

  defp do_member([], _) do
    false
  end

  defp do_member([head|tail], n) do
    if head == n do
      true
    else
      do_member(tail,n)
    end
  end


  @doc """
  reimplement the functionality of `Enum.reverse/1` without using the
  `reverse/1` function from the `Enum.module`.

    iex> EnumWorkshop.reverse([1, 2, 3, 4])
    [4, 3, 2, 1]

    iex> EnumWorkshop.reverse([1, 1, 2, 2])
    [2, 2, 1, 1]

    iex> EnumWorkshop.reverse([1, 2, 1])
    [1, 2, 1]
  """
  @spec reverse(list) :: [Any]
  def reverse(list) do
    do_reverse(list, []) # replace with your own implementation
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([head|tail], acc) do
    do_reverse(tail, [head|acc])
  end




  @doc """
  reimplement the functionality of `Enum.min/1` without using the
  `min/1` function from the `Enum.module`.

    iex> EnumWorkshop.min([1, 2, 3, 4])
    1

    iex> EnumWorkshop.min([4, 3, 2, 1])
    1

    iex> EnumWorkshop.min([5, 42, 3, 108, 3])
    3
  """
  @spec min([Integer]) :: Integer
  def min([]) do
    :error # replace with your own implementation
  end
  def min([head|tail]) do
    do_min(tail,head) # replace with your own implementation
  end

  defp do_min([], min) do
    min
  end
  defp do_min([head|tail], min) when head < min do
    do_min(tail,head)
  end
  defp do_min([_|tail], min) do
    do_min(tail,min)
  end

  @doc """
  reimplement the functionality of `Enum.filter/2` without using the
  `filter/2` function from the `Enum.module`.

    iex> EnumWorkshop.filter([1, 2, 3, 4], fn x -> x < 3 end)
    [1, 2]

    iex> EnumWorkshop.filter([1, 1, 2, 2], fn x -> x == 1 end)
    [1, 1]

    iex> EnumWorkshop.filter([1, 2, 3, 4, 5, 6], fn x -> rem(x, 2) == 1 end)
    [1, 3, 5]
  """
  @spec filter(list, function) :: [Any]
  def filter(list, fun) do
    do_filter(list, fun, [])
  end

  defp do_filter([], _, acc) do
    reverse acc
  end
  defp do_filter([head|tail], fun, acc) do
    if(fun.(head)) do
      do_filter(tail, fun, [head|acc])
    else
      do_filter(tail, fun, acc)
    end
  end


  @doc """
  reimplement the functionality of `Enum.dedup/1` without using the
  `dedup/1` function from the `Enum.module`.

    iex> EnumWorkshop.dedup([1, 2, 3, 4])
    [1, 2, 3, 4]

    iex> EnumWorkshop.dedup([1, 1, 2, 2])
    [1, 2]

    iex> EnumWorkshop.dedup([1, 1, 2, 2, 1, 1])
    [1, 2, 1]
  """
  @spec dedup(list) :: [Any]
  def dedup([head|tail]) do
    do_dedup(tail, head, [head])
  end

  defp do_dedup([], _, acc) do
    reverse acc
  end
  defp do_dedup([topic|tail], topic, acc) do
    do_dedup tail, topic, acc
  end
  defp do_dedup([head|tail], _, acc) do
    do_dedup tail, head, [head|acc]
  end

  @doc """
  reimplement the functionality of `Enum.chunk/2` without using the
  `chunk/1` function from the `Enum.module`.

    iex> EnumWorkshop.chunk([1, 2, 3, 4], 2)
    [[1, 2], [3, 4]]

    iex> EnumWorkshop.chunk([4, 3, 2, 1], 2)
    [[4, 3], [2, 1]]

    iex> EnumWorkshop.chunk([5, 42, 3, 108], 3)
    [[5, 42, 3]]
  """
  @spec chunk(Any, pos_integer) :: [list]
  def chunk(list, n) do
    do_chunk(list,[],0,n,[]) # replace with your own implementation
  end

  defp do_chunk([], acc,n,n, chunk) do
    reverse [reverse(chunk)|acc]
  end
  defp do_chunk([], acc,_, _, _) do
    reverse acc
  end
  defp do_chunk([head|tail],acc,n, n ,chunk) do
    do_chunk(tail,[reverse(chunk)|acc],1,n,[head])
  end
  defp do_chunk([head|tail], acc, m, n ,chunk) do
    do_chunk(tail,acc,m+1,n,[head|chunk])
  end


end
