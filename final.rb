require "pry"


class BoardCase
  attr_accessor :value, :idcase #value = X, O ou vide // idcase = case de 1 à 9

    def initialize(idcase)
      @value = " "
      @idcase = idcase
    end

    def print_case
      return "["+@value.to_s+"]"
    end
end


class Board
  include Enumerable
  attr_accessor = :array, :errorfin

    def initialize #Quand la classe s'initialize : crée 9 instances BoardCases, rangées dans une array
      @array = [BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" "), BoardCase.new(" ")]
      @errorfin = 0
    end

    def print_board #Imprime le tableau vide
      i = 0
      3.times do #3 lignes
      puts ""
          for i in (i..i+2) do #sur chaque ligne : 3 arrays (de 0 à 2, 3 à 5, 6 à 8)
            print @array[i].print_case
            i = i+1
          end
      end
      puts ""
    end

    def play(idcase, pion) #change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
        @array[idcase - 1].value = pion
    end

    def victory #on étudie le contenu des lignes, des colonnes et des diagonales.
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
                  puts "#{@player1.pseudo} wins"
                  errorfin = 1
              elsif buffer[0].to_s+buffer[1].to_s+buffer[2].to_s == "OOO"
                  puts "#{@player2.pseudo} wins"
                  errorfin = 1
              end
          end
      end
    end

    def rech_errorfin
      return @errorfin
    end

    def access(ind)
      return @array[ind - 1].value
    end

end


class Player

  attr_accessor :pseudo, :pion
  attr_writer :victory

    def initialize (pseudo, pion)
      puts "Quel est le nom du joueur 1 ?"
      @pseudo = gets.chomp
      puts "Quel est le nom du joueur 2 ?"
      @pseudo = gets.chomp
      @pion = pion
    end
end


class Game
  attr_accessor :board, :player1, :player2

    def initialize  #A l'initialisation, Game créé 2 instances joueurs et une instance board
      @board = Board.new
      nb_players = 2
      nb_players.times {|x| instance_variable_set("@player#{x+1}", Player.new(x+1))}
      #@player1 = Player.new("Xavier","X")
    #  @player2 = Player.new("Oscar","O")
    end

    def go
      puts "Bienvenue dans Tictactoe"

        for i in 1..10
          turn (i) unless @board.rech_errorfin == 1
        end
    end

    def turn(i)

      puts "tour n° #{i}"
      puts @board.print_board

      error = 1

        if i.even?
          while error == 1
              puts "hey #{@player2.pseudo}, what do you play ? - from 1 to 9"
              choice = gets.chomp.to_i
            error = 0 if @board.access(choice) == " "
            end
            @board.play(choice,player2.pion)
          else
            while error == 1
              puts "hey #{@player1.pseudo}, what do you play ? - from 1 to 9"
              choice = gets.chomp.to_i
            error = 0 if @board.access(choice) == " "
            end
            @board.play(choice,player1.pion)
          end



        #vérifie si il a gagné - .victory?

        #passe au joueur suivant



      #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
    end

end

Game.new.go
