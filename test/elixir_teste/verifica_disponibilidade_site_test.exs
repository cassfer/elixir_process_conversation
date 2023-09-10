defmodule ElixirTesteTest.VerificaDisponibilidadeSiteTest do
	use ExUnit.Case
	import Mock

	test "Retorna 200 caso o site esteja online" do
		ElixirTeste.VerificaDisponibilidadeSite.verifica_primesoftware

		conteudo_arquivo = File.read!(Path.join([
			:code.priv_dir(:elixir_teste),
			'arquivo.txt'
		]))

		resultado = String.contains?(conteudo_arquivo, "200");

		assert resultado == :true
	end

	test "retorna 200 com mock" do

		:ets.new(:conteudos, [:set, :private, :named_table])

		with_mock File, [write!: fn(_path, conteudo) -> :ets.insert_new(:conteudos, {conteudo}) end] do
			ElixirTeste.VerificaDisponibilidadeSite.verifica_primesoftware
		end

		conteudos = :ets.tab2list(:conteudos)
		[primeiro_valor | _] = conteudos

		primeiro_valor_em_string = Kernel.inspect(primeiro_valor)

		resultado = String.contains?(primeiro_valor_em_string, "200");

		assert resultado == :true

	end
end
