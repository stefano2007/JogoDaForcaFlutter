# repos

Jogo da Forca

Jogador tem 6 tentativas de acertar uma palavra.

Exemplo Layout

----¬  Palpite
|   |
|   0
|  /|\
|  / \
|
=========

Dica(Categoria): Cidade
 _ _ _ _ _ _ _



Premissas
* Usar o teclado do Android ou gerar nova.
* Quando o Jogado joga uma letra já selecionada não permitir e não computar como perca
* Após escolher a primeira letra não deixar alterar o jogo (Resetar) apenas após quando ganhar ou perder.
* Criar Lista por categorias(servir como dica)


CategoriaJogoForca
- Id
- Nome

PalavraJogoForca
- Id
- Nome
- Categoria :CategoriaJogoForca


Jogador
- Id
- Nome
- Email
- Idade
- Sexo
  int Vitorias () => {JogoForca.Venceu}

JogoForca
- Id
- Data
- Jogador
- Palavra : PalavrasJogoForca
- Venceu: bool
- Data Fim

--JogadaJogoForca
Id
Palpite: char
Acerto: bool