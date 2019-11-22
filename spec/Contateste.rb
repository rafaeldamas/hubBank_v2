# frozen_string_literal: true

require 'pry-nav'
require 'cpf_cnpj'

class Contateste
  attr_accessor :nome, :idade, :cpf, :saldo

  def cadastrar(nome, idade, cpf, saldo)
    @nome = nome
    @idade = idade
    @cpf = cpf
    @saldo = saldo
  end

  def transferir(conta, valor)
    while conta.saldo < valor
      puts 'Saldo insuficiente na conta.'
      puts 'Tente novamente:'
      valor = gets.chomp.to_i
    end

    while valor < 0
      puts 'Não é permitido inserir valores negativos na conta.'
      puts 'Tente novamente: '
      valor = gets.chomp.to_i
    end
    puts 'Transferência realizada com sucesso!'
    conta.saldo = (conta.saldo - valor)
    puts "Seu saldo atual é de: #{conta.saldo}"
  end

  def somar_saldo(valor)
    @saldo += valor
  end

  def nome_validar(nome)
    nome_invalido = true

    if nome.empty? || nome.match('^[A-Za-z]$').nil?
      nome_invalido = true
      puts 'Favor informe um nome valido:'
      nome = gets.strip
    else
      nome_invalido = false
    end
    nome
  end

  def idade_validar(idade)
    @idade = idade

    while idade < 18
      puts 'Para criar uma conta é necessário ser maior de idade.'
      puts 'Digite sua idade: '
      idade = gets.to_i
      @idade = idade
      puts "A idade digitada foi #{idade}"
      end
    idade
  end

  def cpf_validar(cpf)
    cpf_validate = CPF.new(cpf)
    cpf_validate.formatted
    cpf_validate.valid?
    cpf_validate.number

    while cpf_validate.valid?.nil?
      puts 'Digite um CPF válido: '
      cpf = gets.chomp.to_i
      cpf_validate = CPF.new(cpf)
    end
    cpf_validate.formatted
  end

  def validar_saldo(valor)
    if valor < 0
      puts 'Não é possível inserir saldos negativos na conta.'
    else
      puts 'Valor positivo'
    end
  end

  def validar_transferencia(conta, valor)
    if conta.saldo < valor
      puts 'Saldo insuficiente na conta.'
    else
      puts 'Transferência realizada com sucesso!'
    end
  end

  def validar_cpf(cpf)
    cpf_validate = CPF.new(cpf)
    cpf_validate.formatted
    cpf_validate.valid?
    cpf_validate.number

    if cpf_validate.valid?.nil?
      puts 'CPF Inválido.'
      cpf_validate = CPF.new(cpf)
    else
      puts 'CPF Válido.'
      return cpf_validate.formatted
    end
  end

  def validar_nome(nome)
    @nome_validado = nome.gsub(/@/, 'a')

    if !nome.nil?
      puts @nome_validado
    else
      puts 'Nome Inválido'
    end
  end
end
