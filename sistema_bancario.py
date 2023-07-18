# Implementar no sistema depósito, saque e extrato
# Todos os depósitos devem ser armazenados em uma váriavel e exibidos na opção extrato.
# 3 Saques com limite de 500 reais por saque. Quando o cliente não tem saldo, exibir a mensagem que não tem saldo.

menu = """

[1] Depositar
[2] Sacar
[3] Extrato
[0] Sair

=> """

saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == '1':
        valor = float(input('Informe o valor que você irá quardar conosco: '))

        if valor > 0:
            saldo += valor
            extrato += f'Depósito: R$ {valor:.2f}\n'

        else:
            print('Deu pau! O valor informado não é valido.')

    elif opcao == '2':
        valor = float(input('Informe quanto você quer tirar da conta: '))

        excedeu_saldo = valor > saldo

        excedeu_limite = valor > limite

        excedeu_saques = numero_saques >= LIMITE_SAQUES

        if excedeu_saldo:
            print('Deu pau! Você tá duro.')

        elif excedeu_limite:
            print('Operação não deu certo! O valor do saque é maior que o limite.')

        elif excedeu_saques:
            print('Deu pau! Número máximo de saques diário se foi.')

        elif valor > 0:
            saldo -= valor
            extrato += f'Saque: R$ {valor:.2f}\n'
            numero_saques += 1

        else:
            print('Deu pau! O valor informado não é valido.')

    elif opcao == '3':
        print('\n================ EXTRATO ================')
        print('Não foram realizadas movimentações.' if not extrato else extrato)
        print(f'\nSaldo: R$ {saldo:.2f}')
        print('==========================================')

    elif opcao == '0':
        print (f'Obrigado por ser nosso cliente, volte sempre.')
        break

    else:
        print('Número escolhido é inválido, por favor selecione um número da lista.')