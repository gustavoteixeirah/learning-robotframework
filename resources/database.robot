*** Settings ***
Documentation        Database helpers connection

Library              RobotMongoDBLibrary.Delete
Library              RobotMongoDBLibrary.Find

*** Variables ***
&{MONGO_URI}        connection=mongodb://localhost:27017/PartnerDB        database=PartnerDB      collection=partner
