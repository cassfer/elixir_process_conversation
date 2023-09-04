defmodule Mix.Tasks.Escreve do
  @moduledoc """
    Documentacao completa da tarefa.
  """

  use Mix.Task

  @shortdoc "Escreve um numero aleatorio no arquivo.txt"

  def run(_) do
    ElixirTeste.EscreveNumeroAleatorio.escreve
  end

end
