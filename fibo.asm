.data                                                                                    #Sección para declarar variables
title: .asciiz "Programa para generar secuencia Fibonacci\n"                             #Declara una cadena de caracteres con el título
prompt: .asciiz "Ingresa la cantidad de elementos para la secuencia de Fibonacci: "      #Declara una cadena de caracteres
resultado: .asciiz "Secuencia de Fibonacci: "                                            #Declara una cadena de caracteres
separador: .asciiz " "                                                                   #Declara una cadena de caracteres

.text                                                                                    #Sección de código
.globl main

main:
    # Imprimir el título
    li $v0, 4                                                                            #Código de servicio 4 para imprimir una cadena
    la $a0, title                                                                        #Carga la dirección de la cadena a $a0
    syscall                                                                              #Llama al sistema para imprimir
    # Pide al usuario la cantidad de elementos
    li $v0, 4                                                                            #Código de servicio 4 para imprimir una cadena
    la $a0, prompt                                                                       #Carga la dirección de la cadena a $a0
    syscall                                                                              #Llama al sistema para imprimir
    # Lee la cantidad de elementos desde la entrada estándar
    li $v0, 5                                                                            #Código de servicio 5 para leer un entero
    syscall                                                                              #Llama al sistema para leer un entero
    move $s0, $v0                                                                        #$s0 almacena la cantidad de elementos
    # Verifica si la cantidad de elementos es menor o igual a 0
    blez $s0, fin
    # Inicializa los primeros dos números de Fibonacci
    li $t0, 0
    li $t1, 1
    # Imprime el primer número de Fibonacci (0)
    li $v0, 1                                                                           #Código de servicio 1 para imprimir un número entero
    move $a0, $t0                                                                       #Carga el valor $t0 a $a0
    syscall                                                                             #Llama al sistema para imprimir
    # Si se solicitó imprimir más de 1 elemento, imprime también el segundo número (1)
    bge $s0, 2, imprimir_segundo
    # Si solo se solicitó imprimir un elemento, termina
    j fin
imprimir_segundo:
    # Imprime el segundo número de Fibonacci (1)
    li $v0, 1                                                                           #Código de servicio 1 para imprimir un número entero
    move $a0, $t1                                                                       #Carga el valor $t0 a $a0
    syscall                                                                             #Llama al sistema para imprimir
    # Genera y muestra el resto de la secuencia de Fibonacci
    li $s1, 2                                                                           # Inicializa el contador en 2 (ya que hemos impreso dos números)
generar_fibonacci:
    # Calcula el siguiente número de Fibonacci y lo almacena en $t2
    add $t2, $t0, $t1
    # Imprime un espacio como separador
    li $v0, 4                                                                           #Código de servicio 4 para imprimir una cadena
    la $a0, separador                                                                   #Carga la dirección de la cadena a $a0
    syscall                                                                             #Llama al sistema para imprimir
    # Imprime el número de Fibonacci calculado
    li $v0, 1                                                                           #Código de servicio 1 para imprimir un número entero
    move $a0, $t2                                                                       #Carga el valor $t0 a $a0
    syscall                                                                             #Llama al sistema para imprimir
    # Actualiza los registros para la siguiente iteración
    move $t0, $t1                                                                       #Carga el valor $t1 a $t0
    move $t1, $t2                                                                       #Carga el valor $t2 a $t1
    # Incrementa el contador
    addi $s1, $s1, 1
    # Comprueba si se han impreso suficientes elementos
    bge $s1, $s0, fin
    # Realiza la siguiente iteración
    j generar_fibonacci
fin:
    # Termina el programa
    li $v0, 10                                                                         #Código de servicio 10 para terminar la ejecución
    syscall
