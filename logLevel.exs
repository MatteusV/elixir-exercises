defmodule LogLevel do
  def alert_recipient(code, from_legacy) do
    label = to_label(code, from_legacy)

    case label do
      :error -> :operations_team
      :fatal -> :operations_team
      :unknown when from_legacy -> :dev1
      :unknown -> :dev2
      _ -> false
    end
  end

  defp to_label(code, legacy?) do
    case code do
      1 -> :debug
      2 -> :info
      3 -> :warn
      4 -> :error
      5 -> :fatal
      _ -> :unknown
    end
  end
end
