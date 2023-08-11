def sacar(historico, saldo, valor):
    global NUMERO_SAQUES
    if NUMERO_SAQUES < LIMITE_SAQUES and valor <= LIMITE_VALOR_SAQUE and valor <= saldo:
        saldo -= valor
        historico.append(f"Saque: R${valor:.2f}")
        NUMERO_SAQUES += 1
    elif valor > saldo:
        print("Valor do saque superior ao saldo!")
    elif valor > LIMITE_VALOR_SAQUE:
        print("Valor limite do saque ultrapassado!")
    else:
        print("Número limite de saques por dia atingido!")

def depositar(historico, saldo, valor):
    historico.append(f"Depósito: R${valor:.2f}")
    saldo += valor

def extrato_view(historico, saldo):
    print("Extrato final:")
    for slot in historico:
        print(slot)
    print(f"Saldo: R${saldo:.2f}")

def criar_user(users, nome, data_de_nasc, cpf, endereco):
    new_user = {
        "nome": nome,
        "data_de_nascimento": data_de_nasc,
        "cpf": cpf,
        "endereco": endereco,
    }
    users.append(new_user)

def criar_conta_corrente(user, contas):
    contaID = int(input("Insira o ID da conta: "))
    conta = [[contaID, user]]
    contas.append(conta)

def mostrar_contas(contas):
    for a in contas:
        print(f"{a}")

def mostrar_usuarios(Users):
    for a in Users:
        print(f"{a}")

if __name__ == '__main__':
    menu = """
------------------------------
[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair
[nu] Criar novo usuario
[nc] Criar nova conta corrente
[mc] Mostrar contas
[mu] Mostrar usuarios
------------------------------
=> """

    historico = []
    Users = []
    Contas = []

    NUMERO_SAQUES = 0
    LIMITE_SAQUES = 3
    LIMITE_VALOR_SAQUE = 500
    saldo = 0

    while True:
        opcao = str(input(menu))

        if opcao == "d":
            valor = float(input("Insira o valor do depósito: "))
            depositar(historico, saldo, valor)

        elif opcao == "s":
            valor = float(input("Insira o valor do saque: "))
            sacar(historico, saldo, valor)

        elif opcao == "e":
            extrato_view(historico, saldo)
        
        elif opcao == "nc":
            nome = input("Insira o nome do usuário: ")
            usuario = ""

            for user in Users:
                if user["nome"] == nome:
                    usuario = user
            
            if usuario != "":
                criar_conta_corrente(user, Contas)
                print("Conta corrente criada e vinculada ao usuário.")

            else:
                print("Usuário não encontrado.")
            
        
        elif opcao == "nu":
            nome = str(input("Cadastre seu nome.\n=> "))
            data = str(input("Insira a data de nascimento no formato DD/MM/AAAA.\n=> "))
            cpf = str(input("Insira o CPF.\n=> "))
            endereco = str(input("Insira o endereço.\n=> "))
            criar_user(Users, nome, data, cpf, endereco)

        elif opcao == "mc":
            mostrar_contas(Contas)

        elif opcao == "mu":
            mostrar_usuarios(Users)
            
        elif opcao == "q":
            print("\nAté logo...")
            break

        else:
            print("Operação inválida, por favor selecione novamente a operação desejada.")
