# frozen_string_literal: true

require 'pry-nav'
require 'cpf_cnpj'

class Conta
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
  end

  def idade_validar(idade)
    while idade < 18
      puts 'Para criar uma conta é necessário ser maior de idade.'
      puts 'Digite sua idade: '
      idade = gets.to_i
      @idade = idade
      end
    puts 'Conta criada com sucesso!'
  end

  def validar_idade(idade)
    @retorno = if idade >= 18
                 'Conta criada com sucesso!'
               else
                 'Para criar uma conta é necessário ser maior de idade.'
               end
    @retorno
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
    @retorno = if valor < 0
                 'Não é permitido inserir valores negativos na conta.'
               else
                 'Valor positivo'
               end
    @retorno
  end

  def validar_transferencia(saldo, valor)
    @response = if valor < 0
                  'Não é permitido inserir valores negativos na conta.'
                else
                  'Valor positivo'
                end

    if saldo < valor
      @retorno = 'Saldo insuficiente na conta.'
    else
      @retorno = 'Transferência realizada com sucesso!'
      @saldo = (saldo - valor)
      @saldo_atual = "Seu saldo atual é de: #{@saldo}"
    end

    @response = [@retorno, @saldo, @response]
  end

  # def transferir_valor(saldo, valor)
  #     case saldo, valor
  #         when valor < 0
  #             @response = 'Não é permitido inserir valores negativos na conta.'
  #         when valor > 0
  #             @response = 'Valor positivo'
  #         when saldo < valor
  #             @retorno = 'Saldo insuficiente na conta.'
  #         when saldo > valor
  #             @retorno = 'Transferência realizada com sucesso!'
  #             @saldo = (saldo - valor)
  #             @saldo_atual = "Seu saldo atual é de: #{@saldo}"
  #     end
  #     return @response = [@retorno,@saldo,@response]
  # end

  def validar_cpf(cpf)
    cpf_validate = CPF.new(cpf)
    cpf_validate.formatted
    cpf_validate.valid?
    cpf_validate.number

    if cpf_validate.valid?.nil?
      @retorno = 'CPF Inválido.'
      cpf_validate = CPF.new(cpf)
    else
      @retorno = 'CPF Válido.'
      # return cpf_validate.formatted
    end
    @retorno
  end

  def validar_nome(nome)
    nome_invalido = true

    if nome.empty? || nome.match('^[A-Za-z]$').nil?
      nome_invalido = true
      @response = 'Nome Inválido'

    else
      nome_invalido = false
    end

    @retorno = 'Nome Válido'

    @retorno = [@response, @retorno]
  end
end
