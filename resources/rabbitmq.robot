*** Settings ***
Documentation       RabbitMQ Helpers API

Library             RequestsLibrary

*** Variables ***
${RABBITMQ_BASE_URL}    https://woodpecker.rmq.cloudamqp.com/api/queues/xxugqlly/email
&{RABBITMQ_HEADERS}
...                     Content-Type=application/json
...                     Authorization=Basic eHh1Z3FsbHk6OTdrQTNzMUExUmhFQTJRYThOX3JoR1ZkVmVQdHdPM0g=


*** Keywords ***
Purge Messages
    ${payload}    Create Dictionary
    ...    vhost=xxugqlly
    ...    name=email
    ...    mode=purge

    ${response}    DELETE     ${RABBITMQ_BASE_URL}/contents    json=${payload}    headers=${RABBITMQ_HEADERS}

    RETURN    ${response}

Get Message
    ${payload}    Create Dictionary
    ...    vhost=xxugqlly
    ...    name=email
    ...    truncate=50000
    ...    ackmode=ack_requeue_true
    ...    encoding=auto
    ...    count=1

    ${response}    POST    ${RABBITMQ_BASE_URL}/get    json=${payload}    headers=${RABBITMQ_HEADERS}

    RETURN    ${response.json()}[0]

