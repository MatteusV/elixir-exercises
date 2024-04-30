defmodule LogLevel do
  def to_label(code, from_legacy) do
   cond do
     code == 0 && from_legacy == false -> :trace
     code == 1 -> :debug
     code == 2 -> :info
     code == 3 -> :warning
     code == 4 -> :error
     code == 5 && from_legacy == false  -> :fatal
     true -> :unknown
   end
 end

 def alert_recipient(code, from_legacy) do
   label = to_label(code, from_legacy)

   cond do
    label == :fatal || label == :error -> :ops
    label == :unknown && from_legacy == true -> :dev1
    code in [0,1,2,3,4,5] == false -> :dev2
    true -> false
   end
 end
end
