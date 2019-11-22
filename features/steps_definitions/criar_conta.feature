#language: pt

Funcionalidade: Create account
   
   @dev-1
   Cenário: Validar saldo com sucesso
      Dado tenho uma conta
      Quando consulto o saldo da conta
      Então deve exibir a mensagem 'Valor positivo'
   
   @dev
   Cenário: Validar saldo com erro
      Dado tenho uma conta com saldo negativo
      Quando consulto o saldo da conta
      Então deve exibir a mensagem de erro 'Não é permitido inserir valores negativos na conta.'
      
   @age_success
   Cenário: Validar idade com sucesso
      Dado tenho uma idade 
      Quando tenho uma idade maior que 18
      Então deve exibir mensagem 'Conta criada com sucesso!'
   
   @invalid_age
   Cenário: Validar idade com erro
      Dado tenho a idade
      Quando tenho a idade menor que 18
      Então retorne a mensagem de erro 'Para criar uma conta é necessário ser maior de idade.'

   @name_success
   Cenário: Validar nome com sucesso
      Dado que preencho um nome 
      Quando tenho um nome válido
      Então exiba a mensagem 'Nome Válido'

   @invalid_name
   Cenário: Validar o nome com erro
      Dado que preencho um nome com caracter
      Quando tenho um nome inválido
      Então exiba a mensagem de erro 'Nome Inválido'

   @cpf_validate
   Cenário: Validar CPF
      Dado que preencho o CPF
      Quando tenho um cpf válido
      Então retorne a mensagem 'CPF Válido.'

   @invalid_cpf
   Cenário: Validar cpf inválido
      Dado que preencho o CPF errado
      Quando tenho um cpf inválido
      Então exiba mensagem de erro 'CPF Inválido.'

   @blank_name
   Cenário: Deixar o nome em branco
      Dado que eu tenho um nome
      Quando deixo o campo em branco
      Então exiba a mensagem de erro 'Nome Inválido'

   @blank_cpf
   Cenário: Deixar o CPF em branco
      Dado que eu tenho um cpf
      Quando deixo campo em branco
      Então devo ver a mensagem de erro 'CPF Inválido.'

   @cpf_validate_scenario_outline
   Esquema do Cenário: CPF com valores inválidos
      Dado que eu tenho um CPF
      Quando preencho com os <valores>
      Então mostre a <mensagem>

   Exemplos:
   | valores      |  mensagem      |
   | 'aaaaa'      | 'CPF Inválido.'| 
   |  '0,1'       | 'CPF Inválido.'|
   |'12345678910' | 'CPF Válido.'  |
   