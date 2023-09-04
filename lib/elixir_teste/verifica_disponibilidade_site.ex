defmodule ElixirTeste.VerificaDisponibilidadeSite do
	defp retorna_status_site_primesoftware do
		case HTTPoison.get("https://www.primesoftware.com.br") do
			{:ok, retorno} -> retorno.status_code
		end
	end

	defp grava_arquivo(status_code) do
		caminho_arquivo = Path.join([
			:code.priv_dir(:elixir_teste),
			'arquivo.txt'
		])
		File.write!(caminho_arquivo, "Primesoftware status_code: #{status_code}")
		
	end

	def verifica_primesoftware do
		IO.puts("Estou iniciando a verificacao do site...")
		status_code = retorna_status_site_primesoftware()
		grava_arquivo(status_code)
	end

end