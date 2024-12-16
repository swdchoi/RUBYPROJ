
#All the colors: Red, Blue, Yellow, Green, White, Black
#First Computer CREATES RANDOM CODE IN 4!
#
#PLAYER GUESS 
# IF PLAYER GUESS HAS COLOR IN CORRECT POSITION => WHITE
# IF PLAYER GUESS HAS COLOR IN WRONG POSITION => RED
# IF ALL WHITE, PLAYER WINS!
# 
#PLAYER CREATES 

class Game
@@computerguess = []
@@playerguess = []
@@hints = []
@@win = false
  def initialize ()
    @computer = Computer.new 
    @player = Player.new
  end

  def showCompGuess
    puts "hi"
    @@computerguess = @computer.computerg
    print @@computerguess
    puts "hi"
  end

  def compfirstg
    puts "hi"
    @@computerguess = @computer.compfirstguess
    print @@computerguess
    puts "hi"
  end

  def playerguess
    puts "hi"
    @@playerguess = @player.getInput
    print @@playerguess
    puts "hi"
  end

  def playerrounds
    i = 0
    hint = []
    while i <= 3 do
      if @@playerguess[i] == @@computerguess[i]
        hint.push("white")
      elsif @@computerguess.include?(@@playerguess[i])
        hint.push("red")
      end
    i += 1
    end
    @@hints = hint
  end

  def comprounds
    i = 0
    hint = []
    while i <= 3 do
      if @@playerguess[i] == @@computerguess[i]
        hint.push("white")
      elsif @@computerguess.include?(@@playerguess[i])
        hint.push("red")
      end
    i += 1
    end
    @@hints = hint
  end

  def hints
    print @@hints
    if @@hints.all?("white") && @@hints.length == 4
      @@win = true
    end
  end

  def play
    showCompGuess
    while @@win == false do
      playerguess
      playerrounds
      hints
    end
  end

  def compguesslogic (a)
    colorarr = ["Red", "Yellow", "Green", "White", "Black"]
    print @@hints
    if a <= 5 && @@hints.length != 4
      i = 3
      if @@hints.length == a - 1
        i -= a
      else
          while i >= 0
            @@computerguess[i] = colorarr[a]
            i -= 1
          end
      end
    elsif @@hints.length == 4
        while @@win == false
          if @@hints.all?("White")
            puts "computer got it!"
            @@win = true
            return
          else 
            #if @@hint.all?("Red")
              b = 0
              guessarr = []
              while b <= 3
                randomnum = rand(1..4)
                  if randomnum == 1
                    guessarr[b+2] = @@computerguess[b]
                    guessarr[b+3] = @@computerguess[b+1]
                    guessarr[b+1] = @@computerguess[b+2]
                    guessarr[b] = @@computerguess[b+3]
                  elsif randomnum == 2
                    guessarr[b+3] = @@computerguess[b]
                    guessarr[b+1] = @@computerguess[b+1]
                    guessarr[b+2] = @@computerguess[b+2]
                    guessarr[b] = @@computerguess[b+3]
                  elsif randomnum == 3
                    guessarr[b+1] = @@computerguess[b]
                    guessarr[b] = @@computerguess[b+1]
                    guessarr[b+3] = @@computerguess[b+2]
                    guessarr[b+2] = @@computerguess[b+3]
                  elsif randomnum == 4
                    guessarr[b+1] = @@computerguess[b]
                    guessarr[b+2] = @@computerguess[b+1]
                    guessarr[b] = @@computerguess[b+2]
                    guessarr[b+3] = @@computerguess[b+3]
                  end
                b += 1
              end
              @@computerguess = guessarr
              print @@computerguess
              #puts " "
              comprounds
            #end
          end
        end
    end
  end


  def compplay
    @@win = false
    playerguess
    compfirstg
    i = 0
    while @@win==false do
      comprounds
      compguesslogic(i)
      i += 1
    end
  end
end

class Computer 
  
  def computerg
    arr = []
    i = 0
    while i <= 3
      randomnum = rand(1..12)
      if randomnum <= 2 && 
        arr.push("Red")
      elsif randomnum <= 4 && randomnum > 2 
        arr.push("Blue")
      elsif randomnum <= 6 && randomnum > 4
        arr.push("Yellow")
      elsif randomnum <= 8 && randomnum > 6 
        arr.push("Green")
      elsif randomnum <= 10 && randomnum > 8
        arr.push("White")
      elsif randomnum <= 12 && randomnum > 10 
        arr.push("Black")
      end
      i += 1
    end
    return arr
  end

  def compfirstguess
    return ["Blue", "Blue", "Blue", "Blue"]
  end

end

class Player

  def getInput
    input = gets.to_s
    playerarr = input.split(" ")
      if playerarr.length < 4
        anotherinput = gets.to_s.split(" ")
        playerarr += anotherinput
      elsif playerarr.length > 4
        playerarr = playerarr[0, 4]
      end
    return playerarr
  end
end

game = Game.new
game.play
#game.compplay