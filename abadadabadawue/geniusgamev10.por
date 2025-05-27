programa{

  //Membros
  //Marcos Felix Da Silva, Kleiverson de Oliveira Vogel, Priscila dos Santos do Nascimento, Amanda dos Santos do Nascimento, Rafael Silva Couto


  inclua biblioteca Util
    // Definindo variáveis globais
    inteiro maxJogadores = 4
    inteiro maxBotoes = 4
    inteiro dificuldadeInicial = 600

    cadeia jogadores[maxJogadores]
    inteiro totalJogadores
    inteiro sequencia[100]
    inteiro tamanhoSequencia = 0
    inteiro dificuldade = dificuldadeInicial

    funcao inicio(){
      
      inteiro jogadorAtual = 0
      // Pedindo o número de jogadores
      escreva("Bem-vindo ao jogo da memória Genius!\n")
      escreva("Quantos jogadores? (1 a ", maxJogadores, "): ")
      leia(totalJogadores)
      // Pedindo os nomes dos jogadores
      para (inteiro i = 0; i < totalJogadores; i++){
            escreva("Digite o nome do jogador ", i + 1, ": ")
            leia(jogadores[i])
            limpa()
        }
      // Boleano definindo o status do jogo como verdadeiro para o jogo iniciar
      logico jogoAtivo = verdadeiro
      // Aqui define de qual jogador é a vez
      enquanto (jogoAtivo){
        jogadorAtual = jogadorAtual % totalJogadores
        escreva("", jogadores[jogadorAtual], " sua vez!", "\n")
        Util.aguarde(1000)
      // Funções chamadas para definir o número que deve ser gravado e mostrar
        adicionarNumeroNaSequencia()
        mostrarSequencia()
      // Verifica se a resposta do jogador foi errada
        se(nao verificarRespostaDoJogador()){
          escreva(jogadores[jogadorAtual], " errou a sequência!\n")
      // Se o jogador errar o jogo acaba
          se(totalJogadores == 1){
            escreva("Fim de jogo. Você perdeu!\n", "\nSua pontuação foi: ", tamanhoSequencia - 1, "\n")
            jogoAtivo = falso
          } senao {
          // Remove o jogador que errou
          para (inteiro i = jogadorAtual; i < totalJogadores - 1; i++){
                jogadores[i] = jogadores[i + 1]
          }
          totalJogadores--
          // Se só sobrou um jogador declara ele vencedor
          se(totalJogadores == 1){
            escreva("O vencedor é: ", jogadores[0], "!\n", "\nSua pontuação foi: ", tamanhoSequencia - 1, "\n")
            jogoAtivo = falso
          }
                }
          // Caso acerte a sequência emite a mensagem e o jogo continua      
            } senao {
              escreva("Parabéns ", jogadores[jogadorAtual], ", sequência correta!\n")
              jogadorAtual++
          // Aqui aumenta a dificuldade depois de 3 acertos, limitando pra 300 ms    
              se(tamanhoSequencia % 3 == 0){
                dificuldade = dificuldade - 100
                se(dificuldade < 300){
                        dificuldade = 300
                }
          // Avisa que a dificuldade foi aumentada      
              escreva("Dificuldade aumentada. Tempo entre botões: ", dificuldade, "ms\n")
              }
            }
        }
    }
          // Funçõs lógicas chamadas acima 
    funcao adicionarNumeroNaSequencia(){
        inteiro novoNumero = Util.sorteia(1, 4)
        sequencia[tamanhoSequencia] = novoNumero
        tamanhoSequencia++
    }

    funcao mostrarSequencia(){
        escreva("Memorize a sequência:\n")
        para (inteiro i = 0; i < tamanhoSequencia; i++){
            escreva(">> Memorize! ", sequencia[i], "\n")
            Util.aguarde(dificuldade)
            limpa()
        }
    }

    funcao logico verificarRespostaDoJogador(){
    inteiro resposta
    para (inteiro i = 0; i < tamanhoSequencia; i++){
        escreva("Rodada ", i + 1, ": ")
        leia(resposta)

        se(resposta != sequencia[i]){
            retorne falso // Se a resposta for diferente dá erro e finaliza o jogo
        }
    }
    retorne verdadeiro // Se a resposta for igual o jogo continua
}
}