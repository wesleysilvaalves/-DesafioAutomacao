*** Settings ***
Resource    keywords_api.robot
Variables   ../../variables/variables.py

*** Variables ***
${BASE_URL}          https://reqres.in/api
${NOME}              NomeTeste
${TRABALHO}          TrabalhoTeste
${NOME_ATUALIZADO}   NomeTesteAtualizado
${TRABALHO_ATUALIZADO} TrabalhoTesteAtualizado

*** Test Cases ***
Teste Completo
    [Documentation]  Cria, consulta, atualiza e exclui um usuário, validando cada passo.
    ${corpo_criar}=  Criar Usuário  ${NOME}  ${TRABALHO}
    ${ID_USUARIO}=  Set Variable  ${corpo_criar['id']}
    Log  ID do usuário criado: ${ID_USUARIO}
    Should Not Be Empty  ${ID_USUARIO}

    ${corpo_listar}=  Listar Usuarios
    Log  Lista de usuários: ${corpo_listar}
    ${USUARIO}=  Get From Dictionary  ${corpo_listar}  data
    ${ID_USUARIO_LISTADO}=  Get From Dictionary  ${USUARIO[0]}  id
    Log  ID do usuário listado: ${ID_USUARIO_LISTADO}

    ${corpo_consultar}=  Consultar Usuário  ${ID_USUARIO_LISTADO}
    Log  Dados do usuário consultado: ${corpo_consultar}

    ${corpo_atualizar}=  Atualizar Usuário  ${ID_USUARIO_LISTADO}  ${NOME_ATUALIZADO}  ${TRABALHO_ATUALIZADO}
    Log  Dados do usuário atualizados: ${corpo_atualizar}

    ${corpo_consultar_atualizado}=  Consultar Usuário  ${ID_USUARIO_LISTADO}
    Log  Dados do usuário atualizados após consulta: ${corpo_consultar_atualizado}

    Excluir Usuário  ${ID_USUARIO_LISTADO}
    Log  Teste completo finalizado.
