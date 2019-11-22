# frozen_string_literal: true

Given('tenho uma conta') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

When('consulto o saldo da conta') do
  @retorno = @conta.validar_saldo(@conta.saldo)
end

Then('deve exibir a mensagem {string}') do |mensagem_sucesso|
  expect(@retorno).to eq(mensagem_sucesso)
end

Given('tenho uma conta com saldo negativo') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, -200)
end

Then('deve exibir a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno).to eq(mensagem_erro)
end

Dado('tenho uma idade') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('tenho uma idade maior que {int}') do |idade|
  @retorno = @conta.validar_idade(idade)
end

Então('deve exibir mensagem {string}') do |mensagem_sucesso|
  expect(@retorno).to eq(mensagem_sucesso)
end

Dado('tenho a idade') do
  @conta.cadastrar('Rafael', 14, 39_704_961_871, 148)
end

Quando('tenho a idade menor que {int}') do |_idade|
  @retorno = @conta.validar_idade(@conta.idade)
end

Então('retorne a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno).to eq(mensagem_erro)
end

Dado('que preencho um nome') do
  @conta.cadastrar('Rafael', 23, 12_345_678_910, 200)
end

Quando('tenho um nome válido') do
  @retorno = @conta.validar_nome(@conta.nome)
end

Então('exiba a mensagem {string}') do |mensagem_sucesso|
  expect(@retorno[1]). to eq(mensagem_sucesso)
end

Dado('que preencho um nome com caracter') do
  @conta.cadastrar('R@f@el', 23, 12_345_678_910, 200)
end

Quando('tenho um nome inválido') do
  @retorno = @conta.validar_nome(@conta.nome)
end

Então('exiba a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno[0]).to eq(mensagem_erro)
end

Dado('que preencho o CPF') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('tenho um cpf válido') do
  @retorno = @conta.validar_cpf(@conta.cpf)
end

Então('retorne a mensagem {string}') do |mensagem_sucesso|
  expect(@retorno).to eq(mensagem_sucesso)
end

Dado('que preencho o CPF errado') do
  @conta.cadastrar('Rafael', 19, 1_231_232, 148)
end

Quando('tenho um cpf inválido') do
  @retorno = @conta.validar_cpf(@conta.cpf)
end

Então('exiba mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno).to eq(mensagem_erro)
end

Dado('que eu tenho um nome') do
  @conta.cadastrar('', 19, 39_704_961_871, 148)
end

Quando('deixo o campo em branco') do
  @retorno = @conta.validar_nome(@conta.nome)
end

Dado('que eu tenho um cpf') do
  @conta.cadastrar('Rafael', 19, nil, 148)
end

Quando('deixo campo em branco') do
  @retorno = @conta.validar_cpf(@conta.cpf)
end

Então('devo ver a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno).to eq(mensagem_erro)
end

Dado('que eu tenho um CPF') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('preencho com os {string}') do |valor_invalido|
  @retorno = @conta.validar_cpf(valor_invalido)
end

Então('mostre a {string}') do |mensagem|
  expect(@retorno).to eq(mensagem)
end
