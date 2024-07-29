*** Settings ***
Resource    keywords_ui.robot
Library     SeleniumLibrary
Variables   ../../variables/variables.py

*** Variables ***
${URL}  https://automationexercise.com/login
${EXPECTED_MESSAGE}  Congratulations! Your new account has been successfully created!

*** Test Cases ***
Teste Completo UI
    [Documentation]  Teste completo de UI
    Acessar a página de login
    Preencher campos com dados randômicos
    Inserir informações da conta
    Inserir informações de endereço
    Criar conta e validar mensagem
