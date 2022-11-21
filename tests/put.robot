*** Settings ***
Documentation       PUT /partners

Resource            ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should enable a partner
    ${partner}    Factory New Partner
    Remove Partner By Name    ${partner}[name]
    ${response}    POST Partner    ${partner}
    ${partner_id}    Set Variable    ${response.json()}[partner_id]

    ${response}    Enable Partner    ${partner_id}

    Status Should Be    200

Should disable a partner
    ${partner}    Factory Disable Partner
    ${partner_id}    Create a new partner    ${partner}
    Enable Partner    ${partner_id}

    ${response}    Disable Partner    ${partner_id}

    Status Should Be    200

Should return 404 when trying to enable a deleted partner
    ${partner}    Factory 404 Partner
    ${partner_id}    Create a new partner    ${partner}
    Remove Partner By Name    ${partner}[name]
    
    ${response}    Enable Partner    ${partner_id}

    Status Should Be    404
