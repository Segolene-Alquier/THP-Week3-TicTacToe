require "pry"


class BoardCase
  attr_accessor :value, :idcase #value = X, O ou vide // idcase = case de 1 à 9

    def initialize(value)
      @value = " "
      @idcase = idcase
    end

    def print_case  #on imbrique la valeur entre 2 crochets pour plus de visibilité
      return "["+@value.to_s+"]"
    end
end


class Board
  include Enumerable
  attr_accessor = :array, :victorious_player

    def initialize #Quand la classe s'initialize : crée 9 instances BoardCases, rangées dans une array
      @array = [BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" ")]
      @victorious_player = nil
    end

    def print_board #Imprime le tableau vide via 2 boucles imbriquées
      i = 0
      3.times do # la 1ère imprime 3 lignes
      puts ""
          for i in (i..i+2) do # la 2ème imprime la valeur de 3 Boardcases (de 0 à 2, 3 à 5, 6 à 8)
            print @array[i].print_case
            i = i+1
          end
      end
      puts ""
    end

    def play(idcase, pion) #change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    #on parcourt l'array stockant les Boardcases. L'index est calculé avec le paramètre idcase
    #et on affecte au bon index la valeur du pion joué
        @array[idcase - 1].value = pion

        victory_test #puis on itère sur les cases pour avec la fonction victory_test
    end

    def victory_test #on étudie le contenu des lignes, des colonnes et des diagonales.
    #Les index des cases correspondantes sont stockés dans les arrays du hash ar_test

    buffer = [] #Mémoire tampon : permet de stocker des données de manière non-permanente
    ar_test = {0 => [0,1,2], 1 => [3,4,5], 2 => [6,7,8], 3 => [0,3,6], 4 => [1,4,7], 5 => [2,5,8], 6 => [0,4,8], 7 => [6,4,2]}
    #0 : ligne1 ; 1 : ligne2 ; 2 : ligne3 ; 3 : colonne1 ; 4 : colonne2 ; 5 : colonne3 ; 6 : diagonale descendante ; 7 : diagonale montante

      for i in (0..ar_test.length-1) do
        buffer.clear
          for y in ar_test[i] do
          puts
          buffer << @array[y].value # On stocke dans buffer les BoardCases
              if buffer[0].to_s+buffer[1].to_s+buffer[2].to_s == "XXX" #Si
                  puts "Player 1 wins ! Yaaay"
                  @victorious_player = @player1
                  errorfin = 1
              elsif buffer[0].to_s+buffer[1].to_s+buffer[2].to_s == "OOO"
                  puts "Player 2 wins ! Yaaay"
                  @victorious_player = @player2
                  errorfin = 1
              end
          end
          return @victorious_player
      end
    end
end


class Player

  attr_accessor :pseudo, :pion
  attr_writer :victory

    def initialize (pseudo, pion)
      @pion = pion
      @pseudo = pseudo
    end
end


class Game
  attr_accessor :board, :player1, :player2

    def initialize  #A l'initialisation, Game créé 2 instances joueurs et une instance board
      @board = Board.new
      @player1 = Player.new("Player 1","X")
      @player2 = Player.new("Player 2","O")
    end

    def get_pseudo(player)
      return @player.pseudo
    end
    def go
      puts "-°-°-°-° WELCOME TO TIC.TAC.TOE. °-°-°-°- "

        for i in 1..10
          turn(i)
        end
    end

    def turn(i)
      puts ""
      puts "Turn n° #{i}"
      puts @board.print_board # Imprime le tableau

      if i.even?
          puts "Hey #{@player2.pseudo}, what do you play ? - pick from 1 to 9"
          puts "                              1 2 3"
          puts "                              4 5 6"
          puts "                              7 8 9"
          choice = gets.chomp.to_i
          @board.play(choice,player2.pion)
      else
          puts "Hey #{@player1.pseudo}, what do you play ? - pick from 1 to 9"
          puts "                              1 2 3"
          puts "                              4 5 6"
          puts "                              7 8 9"
          choice = gets.chomp.to_i
          @board.play(choice,player1.pion)
      end
    end

end

Game.new.go
