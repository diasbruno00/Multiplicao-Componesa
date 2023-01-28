
.data
numero1: .word 24
numero2: .word 45
espaco: .asciiz " "
resultado: .asciiz "O resultado final: "

.text 
la $s0,numero1
lw $t0,0($s0)  #carregando o numero1 da memoria

la $s1,numero2 #carregando o numero2 da memoria
lw $t1,0($s1)

add $t2,$zero,1 #condicao do inicio do laco
add $t3,$zero,5 # condicao do fim do laco

inicio:
beq $t2,$t3,fimDoLaco #  se inicio for igual ao fim chama o 'fim do laco' se nao continue executando 

sll $t1, $t1,1  # multiplicando
li $v0,1       
add $a0,$zero,$t1   #imprimindo o numero da multiplicacao
syscall

li $v0,4
la $a0,espaco #imprimindo o espaco
syscall


srl $t0 ,$t0,1  # dividindo
li $v0,1
add $a0,$zero, $t0  #imprimindo o numero da divisao
syscall

li $v0,4
la $a0,espaco #imprimindo o espaco
syscall

andi $t4 , $t0,1  #"verificar se o número e par ou impar"

add $t2,$t2,1 # incremento do laço

beq $t4,$zero,Par # se o numero for par chama 'Par' se nao continue executando abaixo
add $t5,$t5,$t1   #  somando apenas os numeros que restavam na coluna da direita

Par:

j inicio # volta pro 'inicio'

fimDoLaco:
li $v0, 4
la $a0,resultado # mostra a mensagem resultado
syscall

li $v0,1
add $a0,$zero,$t5 # mostra o valor do resultado
syscall

li $v0,10
syscall      # encerra o programa
