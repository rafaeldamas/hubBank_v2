# frozen_string_literal: true

require 'spec_helper'
require 'Contateste.rb'

describe 'conta' do
  it 'verificar nome' do
    cadastro = Contateste.new
    cadastro.validar_nome('r@f@el')
    # expect(cadastro.nome).to eql?('rafael')
  end

  it 'verificar idade' do
    cadastro = Contateste.new
    cadastro.validar_idade(18)
    expect(cadastro.idade).to be > 17
  end

  it 'verificar CPF' do
    cadastro = Contateste.new
    cadastro.validar_cpf(39_704_961_871)
    expect(cadastro.cpf).to be nil
  end
end

describe 'transferencia' do
  it 'transferir saldo negativo' do
    transferencia = Contateste.new
    transferencia.cadastrar('Rafael', 19, 39_704_961_871, 148)
    transferencia.validar_saldo(-200)
    expect(transferencia.saldo).to be > 0
  end

  it 'verificar saldo' do
    conta = Contateste.new
    conta.cadastrar('Rafael', 19, 39_704_961_871, 148)
    expect(conta.saldo).to be < 149
  end

  it 'transferir saldo insuficiente' do
    transferencia = Contateste.new
    transferencia.cadastrar('Rafael', 19, 39_704_961_871, 148)
    transferencia.validar_transferencia(transferencia, 200)
    expect(transferencia.saldo).to be < 200
  end
end
