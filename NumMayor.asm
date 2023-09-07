.data                                                                        #Sección para declarar variables
title: .asciiz "Programa para encontrar el número mayor de tres números\n"   #Declara una cadena de caracteres con el título
prompt1: .asciiz "Ingrese el primer número: "                                #Declara una cadena de caracteres
prompt2: .asciiz "Ingrese el segundo número: "                               #Declara una cadena de caracteres
prompt3: .asciiz "Ingrese el tercer número: "                                #Declara una cadena de caracteres
result: .asciiz "El número mayor es: "                                       #Declara una cadena de caracteres

.text                                                                        #Sección de código
.globl main

main:
    # Imprimir el título
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, title                                                #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Mostrar el primer mensaje y leer el primer número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt1                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $t0, $v0                                                #Guarda el valor leído en $t0
    # Mostrar el segundo mensaje y leer el segundo número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt2                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $t1, $v0                                                #Guarda el valor leído en $t1
    # Mostrar el tercer mensaje y leer el tercer número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt3                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $t2, $v0                                                #Guarda el valor leído en $t2
    # Comparar los números
    bgt $t0, $t1, greater_than_t1         #Se comparan los valores de $t0 y $t1, se establece la etiqueta de salto incondicional
    move $t0, $t1                         #Asigna a $t0 el valor de $t1 si $t1 es mayor que $t0
greater_than_t1:                          #Etiqueta del destino a la que se saltará si $t0 es mayor que $t1
    bgt $t0, $t2, greater_than_t2         #Se comparan los valores de $t0 y $t2, se establece la etiqueta de salto incondicional
    move $t0, $t2                         #Asigna a $t0 el valor de $t2 si $t2 es mayor que $t0
greater_than_t2:                          #Etiqueta del destino a la que se saltará si $t0 es mayor que $t2
    # Mostrar el resultado
    li $v0, 4                                                   #Código de servicio 4 para imprimir una cadena
    la $a0, result                                              #Carga la dirección de la cadena a $a0
    syscall                                                     #Llama al sistema para imprimir
    li $v0, 1                                                   #Código de servicio 1 para imprimir un número entero
    move $a0, $t0                                               #Carga el valor del número entero a $a0
    syscall                                                     #Llama al sistema para imprimir
    # Salir del programa
    li $v0, 10                                                  #Código de servicio 10 para terminar la ejecución
    syscall
