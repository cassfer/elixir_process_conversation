import Config

config :elixir_teste, ElixirTeste.Agendador, jobs: [
	{"* * * * *", fn -> GenServer.cast(:servidor_aleatorio, :verifica_site) end}
]