# encoding: utf-8

Before do
end

After do
  Driver.screenshot
  TrianguloScreen.limpar
end

Dado (/^que carreguei o aplicativo$/) do
  expect(TrianguloScreen.screen).to be(true)
end

E (/^preencher o lado (\w+) com o valor '(|.+?)'$/) do |lado, valor|
  TrianguloScreen.preencher_lado(lado, valor)
end

Quando (/^selecionar a opção validar$/) do
  @validacao = TrianguloScreen.validar
end

Então (/^espero ver a seguinte mensagem de validação '(.+?)'$/) do |mensagem|
  fail 'Retorno não apresenta mensagem "%s"' % [mensagem] unless @validacao.include? mensagem
end
