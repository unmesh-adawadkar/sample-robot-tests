*** Settings ***
Documentation    Suite description
Library             SeleniumLibrary
Library             String


*** Test Cases ***
Verify Robot Framework site
    Open Browser    https://google.co.in     Chrome
    Maximize Browser Window
    Close Browser
