menu = """
------------------------------
[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair
------------------------------
=> """
historico = []
saldo = 0
limite_valor_saque = 500
numero_saques = 0
extrato = ""

LIMITE_SAQUES = 3

while True:
    opcao = str(input(menu))

    if opcao == "d":
        valor = float(input("Insira o valor do depósito: "))
        historico.append(f"""Depósito: R${valor:.2f}""")
        saldo += valor

    elif opcao == "s":
        valor = float(input("Insira o valor do saque: "))
        if (numero_saques < LIMITE_SAQUES and valor <= limite_valor_saque and valor < saldo):
            saldo -= valor
            historico.append(f"""Saque: R${valor:.2f}""")
            numero_saques += 1
        
        elif (valor > saldo):
            print("""-------------------------------------------
Valor do saque inferior ao saldo!
Tentativa de saque ignorada.
-------------------------------------------""")

        elif (valor > limite_valor_saque):
            print("""-------------------------------------------
Valor limite do saque ultrapassado!
Tentativa de saque ignorada.
-------------------------------------------""")
        else:
            print("""-------------------------------------------
Numero limite de saques por dia atingido!
Tentativa de saque ignorada.
-------------------------------------------""")
    
    elif opcao == "e":
        print("Extrato final:")
        for a in historico:
            print(f"{a}")
        print(f"Saldo: R${saldo:.2f}")
    
    elif opcao == "q":
        print("\nAté logo...")
        break
    
    else:
        print("Operação inválida, por favor selecione novamente a operação desejada.")



