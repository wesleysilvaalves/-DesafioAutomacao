*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Acessar a página de login
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window

Preencher campos com dados randômicos
    Wait Until Element Is Visible    xpath=//input[@data-qa='signup-name']    10s
    Input Text    xpath=//input[@data-qa='signup-name']    ${RANDOM_NAME}
    Wait Until Element Is Visible    xpath=//input[@data-qa='signup-email']    10s
    Input Text    xpath=//input[@data-qa='signup-email']    ${RANDOM_EMAIL}
    Wait Until Element Is Visible    xpath=//button[@data-qa='signup-button']    10s
    Click Button    xpath=//button[@data-qa='signup-button']

Inserir informações da conta
    Wait Until Element Is Visible    xpath=//input[@name='password']    10s
    Input Text    xpath=//input[@name='password']    ${RANDOM_PASSWORD}
    Wait Until Element Is Visible    xpath=//select[@id='days']    10s
    Select From List By Value    xpath=//select[@id='days']    ${RANDOM_DAY}
    Select From List By Value    xpath=//select[@id='months']    ${RANDOM_MONTH}
    Select From List By Value    xpath=//select[@id='years']    ${RANDOM_YEAR}
    Wait Until Element Is Visible    xpath=//input[@id='newsletter']    10s
    Execute JavaScript    document.querySelector('input[id="newsletter"]').click()
    Wait Until Element Is Visible    xpath=//input[@id='optin']    10s
    Execute JavaScript    document.querySelector('input[id="optin"]').click()

Inserir informações de endereço
    Wait Until Element Is Visible    xpath=//input[@name='first_name']    10s
    Input Text    xpath=//input[@name='first_name']    ${RANDOM_NAME}
    Input Text    xpath=//input[@name='last_name']    ${RANDOM_NAME}
    Input Text    xpath=//input[@name='company']    ${RANDOM_COMPANY}
    Input Text    xpath=//input[@name='address1']    ${RANDOM_ADDRESS}
    Input Text    xpath=//input[@name='address2']    ${RANDOM_ADDRESS2}
    Select From List By Value    xpath=//select[@name='country']    India
    Input Text    xpath=//input[@name='state']    São Paulo
    Input Text    xpath=//input[@name='city']    São Paulo
    Input Text    xpath=//input[@name='zipcode']    ${RANDOM_ZIP}
    Input Text    xpath=//input[@name='mobile_number']    ${RANDOM_PHONE}

Remover iframe
    Wait Until Element Is Visible    xpath=//iframe[@id='aswift_1']    10s
    Execute JavaScript    document.querySelector('#aswift_1').style.display='none'

Criar conta e validar mensagem
    Wait Until Element Is Visible    xpath=//button[@data-qa='create-account']    10s
    Execute JavaScript    window.scrollBy(0, 1000)
    Run Keyword If    ${True}    Execute JavaScript    document.querySelector('button[data-qa="create-account"]').click()
    Wait Until Element Is Visible    xpath=//p[contains(text(),'Congratulations! Your new account has been successfully created!')]    10s
    Element Should Contain    xpath=//p[contains(text(),'Congratulations! Your new account has been successfully created!')]    ${EXPECTED_MESSAGE}
    Close Browser
