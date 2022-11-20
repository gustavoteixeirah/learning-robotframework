*** Settings ***
Documentation       Database helpers connection

Library             RobotMongoDBLibrary.Delete
Library             RobotMongoDBLibrary.Find


*** Variables ***
&{MONGO_URI}    connection=mongodb://localhost:27017/PartnerDB    database=PartnerDB    collection=partner


*** Keywords ***
Remove Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    name=${partner_name}

    DeleteOne    ${MONGO_URI}    ${filter}

Find Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    name=${partner_name}

    ${results}    Find    ${MONGO_URI}    ${filter}
    RETURN    ${results}[0]

