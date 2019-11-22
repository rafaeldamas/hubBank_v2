# frozen_string_literal: true

def boas_vindas
  puts 'Boas vindas'
  puts 'Informe nome de jogador: '
  nome_invalido = true

  while nome_invalido

    nome = gets.strip.capitalize

    if nome.empty? || ALGUMA(COISA(QUE(EU(AINDA(NAO(SEI(OQUE(É))))))))
      nome_invalido = true
      puts 'Favor informe um nome valido'
    else
      nome_invalido = false

    end
  end

  puts "Vamos jogar senhor(a) #{nome}!"
  nome
end
