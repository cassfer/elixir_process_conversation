defmodule ElixirTesteTest.VerificaDisponibilidadeSiteTest do
	use ExUnit.Case

	test "Retorna 200 caso o site esteja online" do
		ElixirTeste.VerificaDisponibilidadeSite.verifica_primesoftware

		conteudo_arquivo = File.read!(Path.join([
			:code.priv_dir(:elixir_teste),
			'arquivo.txt'
		]))

		resultado = String.contains?(conteudo_arquivo, "200");

		assert resultado == :true
	end
end
