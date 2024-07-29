*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Keywords ***
Criar Usuário
    [Arguments]  ${nome}  ${trabalho}
    Create Session  api  ${BASE_URL}  verify=False
    ${corpo}=  Create Dictionary  name=${nome}  job=${trabalho}
    ${response}=  POST On Session  api  /users  json=${corpo}
    Log  ${response.status_code}
    Log  ${response.text}
    Should Be Equal As Strings  ${response.status_code}  201
    ${corpo}=  Evaluate  json.loads('''${response.text}''')  json
    Should Contain  ${corpo}  id
    RETURN  ${corpo}

Listar Usuarios
    Create Session  api  ${BASE_URL}  verify=False
    ${response}=  GET On Session  api  /users
    Log  Solicitação GET: url=${BASE_URL}/users  level=INFO
    Log  Resposta GET: ${response.status_code}  level=INFO
    Log  Resposta GET: ${response.text}  level=INFO
    Should Be Equal As Strings  ${response.status_code}  200
    ${corpo}=  Evaluate  json.loads('''${response.text}''')  json
    RETURN  ${corpo}

Consultar Usuário
    [Arguments]  ${id_usuario}
    Create Session  api  ${BASE_URL}  verify=False
    ${url}=  Set Variable  /users/${id_usuario}
    ${response}=  GET On Session  api  ${url}
    Log  Solicitação GET: url=${BASE_URL}${url}  level=INFO
    Log  Resposta GET: ${response.status_code}  level=INFO
    Log  Resposta GET: ${response.text}  level=INFO
    Should Be Equal As Strings  ${response.status_code}  200
    ${corpo}=  Evaluate  json.loads('''${response.text}''')  json
    Should Contain  ${corpo}  data
    RETURN  ${corpo['data']}

Atualizar Usuário
    [Arguments]  ${id_usuario}  ${nome}  ${trabalho}
    Create Session  api  ${BASE_URL}  verify=False
    ${url}=  Set Variable  /users/${id_usuario}
    ${corpo}=  Create Dictionary  name=${nome}  job=${trabalho}
    ${response}=  PUT On Session  api  ${url}  json=${corpo}
    Log  ${response.status_code}
    Log  ${response.text}
    Should Be Equal As Strings  ${response.status_code}  200
    ${corpo}=  Evaluate  json.loads('''${response.text}''')  json
    RETURN  ${corpo}

Excluir Usuário
    [Arguments]  ${id_usuario}
    Create Session  api  ${BASE_URL}  verify=False
    ${url}=  Set Variable  /users/${id_usuario}
    ${response}=  DELETE On Session  api  ${url}
    Log  ${response.status_code}
    Log  ${response.text}
    Should Be Equal As Strings  ${response.status_code}  204
