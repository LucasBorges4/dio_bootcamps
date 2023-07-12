numPedidos = int(input())

for i in range(1, numPedidos + 1):
    prato = input()
    calorias = int(input())
    
    ehVegano = "Vegano"
    
    escolha = str(input())
    if escolha == "s":
        ehVegano = "Vegano"
    elif escolha == "n":
        ehVegano = "Nao-vegano"
    
    print(f"Pedido {i}: {prato} ({ehVegano}) - {calorias} calorias")
