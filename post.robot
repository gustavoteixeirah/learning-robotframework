*** Settings ***
Documentation        POST /partners
Library              RequestsLibrary
Library              RobotMongoDBLibrary.Delete

*** Variables ***
${BASE_URL}          http://localhost:3333/partners
&{MONGO_URI}        connection=mongodb://localhost:27017/PartnerDB        database=PartnerDB      collection=partner


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