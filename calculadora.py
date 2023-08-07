print("Bem-vindo à calculadora!")

while True:
    operador = input("Qual operação você gostaria de realizar? (adição, subtração, multiplicação ou divisão)")
    if operador not in ["+", "-", "*", "/"]:
        print("Operação inválida.")
        continue

    número1 = float(input("Digite o primeiro número: "))
    número2 = float(input("Digite o segundo número: "))

    if operador == "+":
        resultado = número1 + número2
    elif operador == "-":
        resultado = número1 - número2
    elif operador == "*":
        resultado = número1 * número2
    else:
        resultado = número1 / número2

    print(f"O resultado é {resultado}.")

    resposta = input("Deseja continuar? (s/n)")
    if resposta == "n":
        break
