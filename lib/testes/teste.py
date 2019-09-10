altura = float(input())
peso = float(input())

imc = peso/(altura *  altura)

print(imc)
if(imc < 18.5):
    print("Abaixo do peso")
elif(imc >= 18.5 and imc <= 24.9):
    print("Peso normal")
elif(imc >= 25 and imc <= 19.9):
    print("Sobrepeso")
elif(imc >= 30):
    print("Em algum grau de obedidade")