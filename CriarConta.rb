# frozen_string_literal: true

require_relative 'spec/Contateste'

@conta_um = Contateste.new
@conta_dois = Contateste.new

# Cadastro da Conta 1

saldo_conta_um = 148

puts 'Digite o nome para conta 1: '
nome = gets.strip
nome_validado = @conta_um.nome_validar(nome)

puts 'Digite sua idade: '
idade = gets.chomp.to_i
idade_validada = @conta_um.idade_validar(idade)

puts 'Digite seu CPF: '
cpf = gets.chomp.to_i
cpf_validado = @conta_um.cpf_validar(cpf)

puts

@conta_um.cadastrar(nome, idade, cpf, saldo_conta_um)

puts 'Conta 1'
puts "Nome: #{nome_validado}"
puts "Idade: #{idade_validada}"
puts "CPF: #{cpf_validado}"
puts "Seu saldo é de: #{@conta_um.saldo}" unless @conta_um.idade < 18

puts

# Cadastro da Conta 2

@saldo_conta_dois = 274
puts 'Digite o nome para conta 2: '
nome_dois = gets.chomp.strip
nome_validado_dois = @conta_dois.nome_validar(nome_dois)

puts 'Digite sua idade: '
idade_dois = gets.chomp.to_i
idade_dois_validada = @conta_dois.idade_validar(idade_dois)

puts 'Digite seu CPF: '
cpf_dois = gets.chomp.to_i
cpf_validado_dois = @conta_dois.cpf_validar(cpf_dois)

puts

@conta_dois.cadastrar(nome_dois, idade_dois, cpf_dois, @saldo_conta_dois)

puts 'Conta 2'
puts "Nome: #{nome_validado_dois}"
puts "Idade: #{idade_dois_validada}"
puts "CPF: #{cpf_validado_dois}"
puts "Seu saldo é de: #{@conta_dois.saldo}" unless @conta_dois.idade < 18

puts

# Transferência para conta 2
puts 'Adicione o valor que deseja ser transferido para a conta 2: '
@valor = gets.chomp.to_i

@conta_um.transferir(@conta_um, @valor)
@conta_dois.somar_saldo(@valor)

puts

# Transferência para conta 1

puts 'Adicione o valor que deseja ser transferido para a conta 1: '
@valor_dois = gets.chomp.to_i

@conta_dois.transferir(@conta_dois, @valor_dois)
@conta_um.somar_saldo(@valor_dois)

puts
# Extrato

puts 'Extrato'
puts "Saldo conta 1: #{@conta_um.saldo}"
puts "Saldo conta 2: #{@conta_dois.saldo}"
