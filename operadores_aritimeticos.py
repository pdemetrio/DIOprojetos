# Adição
print (1+1)
# Subtração
print (10-5)
# Multiplicação
print (9*7)
# Divisão
print (50/5)
# Divisão por inteiro
print (12//4)
# Módulo (resto da divisão)
print (10%3)
# Potênciação
print (2**3)

# Operadores de comparação
saldo = 450
saque = 200
print (saldo >= saque)
print (saldo <= saque)
print (saldo == saque)
print (saldo != saque)

# Operadores lógicos

saldo = 1000
saque = 200
limite = 1000

saldo >= saque and saque <= limite

saldo = 1000
saque = 200
limite = 1000

saldo >= saque or saque <= limite

# Operador de negação

contatos_emergencia = []

not 1500 > 1000

not contatos_emergencia

not "saque_1500;"

not ""

# AND = para ser True tudo tem que ser True
# OR = para ser True apenas um tem que ser True

print(True and True and True)
print(True and False and True)
print(False and False and False)
print(True or True or True)
print(True or False or False)
print(False or False or False)

saldo = 1000
saque = 250
limite = 200
conta_especial = True

exp = saldo >= saque and saque <= limite or conta_especial and saldo >= saque
print(exp)

exp_2 = (saldo >= saque and saque <= limite) or (conta_especial and saldo >= saque)
print(exp_2)

conta_normal_com_saldo_suficiente = saldo >= saque and saque <= limite
conta_especial_com_saldo_suficiente = conta_especial and saldo >= saque

exp_3 = conta_normal_com_saldo_suficiente or conta_especial_com_saldo_suficiente
print(exp_3)

# Operador de indentidade

saldo = 1000
limite = 1000

print(saldo is limite)
print(saldo is not limite)

# Operadores de associação

frutas = ["limao", "uva"]
curso = "Curso de python"

print("laranja" not in frutas)
print("limao" in frutas)
print("Python" in curso)