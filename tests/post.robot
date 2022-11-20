*** Settings ***
Documentation       POST /partners

Resource            ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should create a new partner
    ${payload}    Factory New Partner
    Remove Partner By Name    ${payload}[name]

    ${response}    POST Partner    ${payload}

    Status Should Be    201
    ${result}    Find Partner By Name    ${payload}[name]
    Should Be Equal    ${response.json()}[partner_id]    ${result}[_id]

