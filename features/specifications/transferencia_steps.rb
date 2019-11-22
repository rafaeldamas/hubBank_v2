# frozen_string_literal: true

Dado('que eu tenho uma conta com um saldo positivo') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('eu faço uma transferência') do
  @retorno = @conta.validar_transferencia(@conta.saldo, 100)
end

Então('apresente a mensagem {string}') do |mensagem_sucesso|
  expect(@retorno[0]).to eq(mensagem_sucesso)
end

E('apresente o saldo atual') do
  expect(@retorno[1]).to eq(48)
  puts @retorno[1]
end

Dado('que eu tenho uma conta com o saldo positivo') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('eu faço uma transferência com saldo insuficiente') do
  @retorno = @conta.validar_transferencia(@conta.saldo, 500)
end

Então('mostre a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno[0]).to eq(mensagem_erro)
end

E('mostre o saldo da conta') do
  expect(@retorno[1]).to eq(148)
  puts @conta.saldo
end

Quando('eu faço uma transferência com o valor negativo') do
  @retorno = @conta.validar_transferencia(@conta.saldo, -200)
end

Então('apresente a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno[2]).to eq(mensagem_erro)
end

Dado('que eu tenho uma conta com saldo positivo') do
  @conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
end

Quando('eu faço uma transferência de valor') do
  @retorno = @conta.validar_transferencia(@conta.saldo, 100)
end

Então('retorne a mensagem de sucesso {string}') do |mensagem|
  expect(@retorno[0]).to eq(mensagem)
end

Dado('que eu tenho uma conta com saldo negativo') do
  @retorno = @conta.cadastrar('Rafael', 19, 39_704_961_871, -148)
end

Então('vejo a mensagem de erro {string}') do |mensagem_erro|
  expect(@retorno[0]).to eq(mensagem_erro)
end
