*** Settings ***
Documentation       GET /partners

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Create Partner List

*** Test Cases ***
Should return a partner list
    [Tags]    critical

    ${response}    GET Partners
    Status Should Be    200

    ${size}    Get Length    ${response.json()}

    Should Be True    ${size} > 0

Should search partner by name
    
    ${response}    Search Partner     João
    Status Should Be    200

    ${size}    Get Length    ${response.json()}

    Should Be True    ${size} == 1

    Should Be Equal    ${response.json()}[0][name]    Adega do João



*** Keywords ***
Create Partner List
    ${partners}    Factory Partner List
    
    FOR  ${partner}  IN  @{partners}
        POST Partner    ${partner}
    END