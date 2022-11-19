*** Settings ***
Documentation        POST /partners

Resource             ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should create a new partner
    
    ${payload}     Create Dictionary
    ...            name=Kode GT
    ...            email=contact@gustavoteixeira.dev
    ...            whatsapp=55999696541
    ...            business=Restaurante
    
    ${headers}     Create Dictionary
    ...            Content-Type=application/json
    ...            auth_user=qa
    ...            auth_password=ninja

    &{filter}      Create Dictionary
    ...            name=Kode GT

    DeleteOne      ${MONGO_URI}     ${filter}

    ${response}    POST    ${BASE_URL}    
    ...            json=${payload}    
    ...            headers=${headers} 

    Status Should Be    201

    ${results}    Find  ${MONGO_URI}     ${filter}

    Should Be Equal    ${response.json()}[partner_id]    ${results}[0][_id]

    