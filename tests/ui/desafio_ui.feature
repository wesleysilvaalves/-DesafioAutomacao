Feature: Criação de Conta

    Scenario: Validar a criação de conta com todos os requisitos
        Given o navegador está aberto na página de login
        When eu preencho o formulário de inscrição com dados aleatórios
        And eu clico no botão de inscrição
        And eu devo ser direcionado para a tela de "Criação de conta"
        And eu valido a data de aniversário com dados aleatórios
        And eu valido a marcação dos checkboxs
        And eu preencho os campos obrigatórios com dados randômicos
        And eu preencho o campo "Password" com dados alfanuméricos
        And eu preencho o campo "Company" com dados verdadeiros
        And eu preencho o campo "Address" apenas com dados de São Paulo
        And eu preencho os demais campos com dados randômicos
        And eu clico no botão "Create Account"
        Then eu devo ver a mensagem "Congratulations! Your new account has been successfully created!"
