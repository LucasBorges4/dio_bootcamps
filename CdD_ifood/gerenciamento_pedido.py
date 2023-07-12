def main():
    qtd_pedidos = int(input())
    
    cupom10 = 1/10
    cupom20 = 1/5    
    total = 0


    for i in range(1, qtd_pedidos + 1):
        pedido = input().split(" ")
        nome = pedido[0]
        valor = float(pedido[1])
        total += valor
    
    cupom_choice = str(input())
    
    if (cupom_choice == "10%"):
      total*= (1 - cupom10)
    
    elif (cupom_choice == "20%"):
      total *= (1 - cupom20)
    
    print(f"Valor total: {total:.2f}") 

if __name__ == "__main__":
    main()