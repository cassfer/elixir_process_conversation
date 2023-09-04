defmodule ElixirTeste.ServidorAleatorio do
	use GenServer

	def start_link(_) do
		GenServer.start_link(
			__MODULE__,
			:ok,
			name: :servidor_aleatorio
			)
	end

	def init(:ok) do
		{:ok, %{}}
	end

	def handle_cast(:verifica_site, _) do
		ElixirTeste.VerificaDisponibilidadeSite.verifica_primesoftware
		{:noreply, %{}}
	end
end