# Roshambo

Um simples app escrito em Swift que simula o famoso jogo Jokenpô.

### Conceitos utilizados

No desenvolvimento deste app foram aprendidos os seguintes conceitos:

* Criação de um segundo ViewController
* Transição entre controllers usando: apenas código, segues + código e apenas segues
* Carregamento de imagens dinamicamente
* Implementação de um simples model com a lógica do jogo
* Uso de constraints

### Changelog

#### v1.1

Refatoração e enorme simplificação no código, após analisar a solução com model da Udacity:

* Melhorias no enum `Move`: quando você está aprendendo Swift, não fica inteiramente claro que um enum funciona como uma classe qualquer, ou seja, pode ter propriedades estáticas e métodos. Sabendo disso, foram feitas as seguintes mudanças.
    * Método `defeats`: responsável pelo relacionamento entre os `Moves`. Faz sentido os `Moves` saberem qual ganha de qual
    * Propriedade computada `image`: retorna uma `UIImage` correspondente ao movimento, para facilitar a atualização da UI
    * Refatoração do método `random`: com o Swift 4.2 um enum pode implementar o protocolo `CaseIterable`, permitindo obter todos os cases do enum e facilitando o acesso a um aleatório
* Melhorias no struct `MatchResult`
    * Renomeado para `Match`
    * Guarda a data do match em uma propriedade
    * Cria o `Move` do oponente usando `Move.random()`, sendo desnecessário que um ViewController o crie
    * Propriedades computadas `winner` e `loser`: retornam o `Move` ganhador e perdedor do match através do `Move.defeats(_:)`. Retorna um opcional, pois o match pode ter empatado
    * Propriedade computada `draw`: verifica se o match empatou
* Melhorias no `MatchViewController`
	* Renomeado para `NewMatchViewController`
    * Os botões chamam a mesma action e são diferenciados pelo `sender`
* Melhorias no `MatchResultViewController`:
    * A lógica de preenchimento da view está toda no `viewWillAppear`
    * Atualizar o título é simples, pois basta verificar se há um vencedor e se este foi o usuário
    * Atualizar as imagens do `Move` do usuário e do oponente são simples, já que a imagem fica no próprio enum
    * Para escrever a frase e obter a imagem do match, usa-se dicionários usando o vencedor como key

#### v2.0

* Adicionado uma propriedade `history` no `NewMatchViewController` que mantém todas as partidas feitas pelo usuário
* Um novo ViewController, `MatchHistoryViewController` exibe o histórico utilizando um `UITableView`
* Foi criada uma classe filha do `UITableViewCell` com layout personalizado para exibição do histórico