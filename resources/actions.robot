*Settings*
Documentation       ações customizadas do Yodapp

*Keywords*
Go To Home Page
    Go To       ${BASE_URL}
    Wait For Elements State     css=.carousel       visible     5

# Go To User Form -> ela vai para o formulario de cadastro de usuario
Go To User Form

    Click       text=Novo

    # Checkpoint (para saber se fomos de fato para a página de cadastro)
    Wait For Elements State     css=.card-header-title >> text=Cadastrar novo usuário
    ...         visible     5

# Fill User Form -> vai preencher o formulario de cadastro
Fill User Form
    [Arguments]     ${user}
    Fill Text       css=input[name="nome"]      ${user}[name]
    Fill Text       css=input[name="email"]      ${user}[email]

    Select Options By       css=.ordem select       text       ${user}[ordem] 

    Select Birth Date       ${user}[bdate]

    Fill Text       id=insta                            ${user}[instagram]

Select Jedi
    [Arguments]     ${tpjedi}
     Click           xpath=//input[@value="${tpjedi}"]/..//span[@class="check"]

Check Accept Comunications
    Click          xpath=//input[@name="comunications"]/../span[@class="check"]

Select Birth Date
    [Arguments]     ${text_date}

    @{date}         Split String        ${text_date}        -

    Click           css=input[name="Data de nascimento"]

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[1]     text        ${date}[0]

    Select Options By       xpath=(//header[@class="datepicker-header"]//select)[2]     value       ${date}[1]  

    Click               xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]

Submit User Form
# E submeto esse formuário
    Click           css=button >> text=Cadastrar

Toaster Message Should Be
    [Arguments]     ${expected_message}

    #a variavel está aqui e não na *Variables* pq é uma variavel que está sendo usada somente aqui, não precisa ser uma váriavel global
    ${element}      Set Variable        css=.toast div

    Wait For Elements State         ${element}           visible        5
    Get Text                        ${element}           equal         ${expected_message}

    # Wait For Elements State         css=.toast div >> text=${expected_message}          
    # ...                             visible     5
    
#isso aqui é para verificar se o mestre yoda foi cadastrado
User Should Be visible
    [Arguments]        ${user}
    ${element}     Set Variable    xpath=//td[contains(text(), "${user}[email]")]/..

    Wait For Elements State        ${element}    visible       5
