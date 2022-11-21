*** Settings ***
Documentation       GET /partners

Resource            ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should remove a partner
    ${partner}    Factory Remove Partner
    ${partner_id}    Create a new partner    ${partner}

    Delete Partner    ${partner_id}

    Status Should Be    204

Should return 404 when trying to remove a partner
    ${partner}    Factory 404 Partner
    ${partner_id}    Create a new partner    ${partner}
    Remove Partner By Name    ${partner}[name]

    Delete Partner    ${partner_id}

    Status Should Be    404