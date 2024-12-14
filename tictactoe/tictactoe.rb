
class Game
  @@board = [1,2,3,4,5,6,7,8,9]

  def initialize
    @playerone = Player.new(1, "X")
    @playertwo = Player.new(2, "O")
    @playerTurn = 1
    @win = [
            [1,2,3],
            [4,5,6],
            [7,8,9],
            [3,5,7],
            [2,5,8],
            [1,5,9],
            [1,4,7],
            [2,5,8],
            [3,6,9]
            ]
    @winner = false
    puts showBoard
  end

  def showBoard
  i = 0
    while i < @@board.length
      if (i+1) % 3 == 0 
        puts " #{@@board[i]} "
      else
        print " #{@@board[i]} "
      end
      i += 1
    end
  end

  def playernumShowing
    puts @playerone.playernumShow
    puts @playertwo.playernumShow
  end

  def playerOnePick
    pickgood = false
    while pickgood == false do
      pick = gets.to_i 
      if @@board[pick-1] == "X" || @@board[pick-1] == "O"
      puts "can't do that"
      pickgood = false
      else     
        @@board[pick-1] = @playerone.marker
        pickgood = true
      end
    end
  end

  def playerTwoPick
    pickgood = false
    while pickgood == false do
      pick = gets.to_i 
      if @@board[pick-1] == "X" || @@board[pick-1] == "O"
      puts "can't do that"
      pickgood = false
      else     
        @@board[pick-1] = @playertwo.marker
        pickgood = true
      end
    end
  end
  
  def winner
      i = 0
      while i < @win.length
        a = 0
        b = 0
        c = 0
        while a < @win[a].length
          if @@board[@win[i][a]-1] == "X"
            b += 1
          elsif @@board[@win[i][a]-1] == "O"
            c += 1
          end
            a += 1
        end
        if b == 3
          @winner = true
          return puts "1 WIN"
        elsif c == 3
          @winner = true
          return puts "2 WIN"
        end
        i += 1
      end
      if @@board.flatten.all?{|num| num.is_a?(String)}
        @winner = true
        return puts "DRAW"
      end
  end

  def play
    while @winner == false
      playerOnePick
      showBoard
      winner
      if @winner == true
        return
      end
      playerTwoPick
      showBoard
      winner
    end
  end
end

class Player
  def initialize (playerNumber, marker)
    @playerNumber = playerNumber
    @marker = marker
  end

  def playernumShow
    puts @playerNumber
    puts @marker
  end

  def marker
    return @marker
  end

end

game = Game.new
game.play
