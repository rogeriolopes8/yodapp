*Settings*
Documentation       Suite de testes do cadastro de personagens

Library     ${EXECDIR}/resources/factories/users.py

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session
Test Teardown   End Session

*Test Cases*
Deve cadastrar um novo personagem
    [Tags]      happy
    
    # ta chamando do codigo python
    ${user}     factory Yoda 
    
    # &{user}     Create Dictionary
    # ...         name=Mestre Yoda
    # ...         email=yoda@jedi.com
    # ...         ordem=Jedi
    # ...         tpjedi=Cavaleiro Jedi
    # ...         bdate=fevereiro-1970-20
    # ...         instagram=@yoda

    Go To User Form
    Fill User Form              ${user}
    Select Jedi                 ${user}[tpjedi]
    Check Accept Comunications
    Submit User Form
    Toaster Message Should Be   Usuário cadastrado com sucesso!
    Go To Home Page
    User Should Be visible       ${user}

Email incorreto
    [Tags]      inv_email
    
    ${user}     factory Darth Vader
    # &{user}     Create Dictionary
    # ...         name=Dath Vader
    # ...         email=vader&mail.com
    # ...         ordem=Sith
    # ...         bdate=dezembro-1980-15
    # ...         instagram=@vader

    Go To User Form
    Fill User Form      ${user}          
    Check Accept Comunications
    Submit User Form
    Toaster Message Should Be   Oops! O email é incorreto.

