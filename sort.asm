global sort
extern print


;bubble sort
sort:
    enter 0,0 ;cria um novo stack frame sem variaveis locais
    push ebx ; preservando ebx
    ;argumentos começam de +8 por causa de +4 do call e +4 do enter
    mov ecx, [ebp+8]  ;ponteiro do vetor
    mov edx, [ebp+12] ;tamanho do vetor



    xor eax,eax;contador 1 loop
    xor ebx,ebx;contador 2 loop

    ;checa se o vetor tem tamanho>1
    cpm ecx,1
    jle finished

    dec ecx ;transforma size para size-1 para facilitar no calculo dos limites dos fors

    .for1:
        xor ebx,ebx ; zera a variavel de controle do 2 for
        .for2:
        ;salvando os registradores de controle do loop externo e de size para podermos usar-los nas operações do vetor
        push eax
        push ecx

        ;obtendo os valores j e j+1 do vetor
        mov ecx,[edx+ebx*4]
        mov eax,[edx+ebx*4+4]

        cmp ecx,eax ;comparando vec[j] com vec[j+1]
        jle .skip ; caso ja estejam em ordem continua com o loop
        
        mov [edx+ebx*4],eax ;caso estejam fora de ordem faz o swap
        mov [edx+ebx*4+4],ecx

            .skip:
                pop ecx;restaura os registradores empilhados
                pop eax

                inc ebx
                cmp ebx,ecx;j<size-1
                jne for2
    inc eax
    cmp eax,ecx;i<size-1
    jne for1

    .finished:

        pop ebx;recupera ebx

        inc ecx; retorna ecx para o valor original do tamanho antes de passar para a funcao de print

        push ecx; empilha os parametros para a funcao de print
        push edx

        call print
        
        leave ;remove o stack frame
        ret