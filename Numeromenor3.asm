.data                                                                        #Sección para declarar variables
title: .asciiz "Programa para encontrar el menor de tres números\n"          #Declara una cadena de caracteres con el título
prompt1: .asciiz "Ingresa el primer número: "                                #Declara una cadena de caracteres
prompt2: .asciiz "Ingresa el segundo número: "                               #Declara una cadena de caracteres
prompt3: .asciiz "Ingresa el tercer número: "                                #Declara una cadena de caracteres
resultado: .asciiz "El número menor es: "                                    #Declara una cadena de caracteres

.text                                                                        #Sección de código
.globl main

main:
    # Imprimir el título
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, title                                                #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Pide al usuario que ingrese el primer número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt1                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Lee el primer número desde la entrada estándar
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $s0, $v0                                                #$s0 almacena el primer número
    # Pide al usuario que ingrese el segundo número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt2                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Lee el segundo número desde la entrada estándar
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $s1, $v0                                                #$s1 almacena el segundo número
    # Pide al usuario que ingrese el tercer número
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, prompt3                                              #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Lee el tercer número desde la entrada estándar
    li $v0, 5                                                    #Código de servicio 5 para leer un entero
    syscall                                                      #Llama al sistema para leer un entero
    move $s2, $v0                                                #$s2 almacena el tercer número
    # Encuentra el número menor
    move $t0, $s0                                                #$t0 almacena el número menor inicialmente
    # Compara $t0 con $s1
    blt $s1, $t0, menor_s1                                       #Salta a menor_s1 si $s1 es menor que $t0, si no...
    # Compara $t0 con $s2
    blt $s2, $t0, menor_s2                                       #Salta a menor_s2 si $s2 es menor que $t0, si no...
    j fin                                                        #Salta hasta la etiqueta fin
menor_s1:
    move $t0, $s1                                                #$t0 almacena a $s1
    j fin                                                        #Salta hasta la etiqueta fin
menor_s2:
    move $t0, $s2                                                #$t0 almacena a $s2
fin:
    # Imprime el resultado
    li $v0, 4                                                    #Código de servicio 4 para imprimir una cadena
    la $a0, resultado                                            #Carga la dirección de la cadena a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Imprime el número menor
    li $v0, 1                                                    #Código de servicio 1 para imprimir un número entero
    move $a0, $t0                                                #Carga el valor $t0 a $a0
    syscall                                                      #Llama al sistema para imprimir
    # Salir del programa
    li $v0, 10                                                   #Código de servicio 10 para terminar la ejecución
    syscall
