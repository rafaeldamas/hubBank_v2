#language: pt 

Funcionalidade: Transferência entre contas

@transfer_success
Cenário: transferência com sucesso
    Dado que eu tenho uma conta com um saldo positivo 
    Quando eu faço uma transferência 
    Então apresente a mensagem 'Transferência realizada com sucesso!'
    E apresente o saldo atual 

@invalid_transfer
Cenário: Erro na transferência
    Dado que eu tenho uma conta com o saldo positivo
    Quando eu faço uma transferência com saldo insuficiente
    Então mostre a mensagem de erro 'Saldo insuficiente na conta.'
    E mostre o saldo da conta

@transfer_negative_number
Cenário: Transferência de valor negativo
    Dado que eu tenho uma conta com um saldo positivo
    Quando eu faço uma transferência com o valor negativo
    Então apresente a mensagem de erro 'Não é permitido inserir valores negativos na conta.'

@transfer
Esquema do Cenário: Transferência de valores
    Dado que eu tenho uma conta com saldo positivo
    Quando eu faço uma transferência de valor
    Então retorne a mensagem de sucesso 'Transferência realizada com sucesso!'

    Exemplos: 
    |valor|mensagem|
    | '100' | 'Transferência realizada com sucesso!' |
    | '150' | 'Saldo insuficiente na conta.' |
    |'-200' |'Não é permitido inserir valores negativos na conta.'|

@insufficient_founds
Cenário: Transferir um valor com o saldo negativo.
    Dado que eu tenho uma conta com saldo negativo
    Quando eu faço uma transferência
    Então vejo a mensagem de erro 'Saldo insuficiente na conta.'