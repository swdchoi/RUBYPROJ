##create board
class Board 
  def initialize (x, y)
    @height = y
    @width = x
    @board = createboard
    @boardfliped = flippedboard
  end

  def createboard
    board = {}
    i = 1
    while i <= @width
      j = 1
      while j <= @height
        if board[i]
          board[i] << j
        else
          board[i] = [j]
        end
        j += 1
      end
      i += 1
    end
    return board
  end

  def flippedboard
      board = {}
      i = 1
      while i <= @height
        j = 1
        while j <= @width
          if board[i]
            board[i] << j
          else
            board[i] = [j]
          end
          j += 1
        end
        i += 1
      end
      return board
  end

  def typeboard
    i = 0
    while i < @height
      j = 1
      while j <= @width
        heights = (1..@height).to_a
        if heights.include?(@board[j][i])
          print(" - ")
        else
          print(" #{@board[j][i]} ")
        end
        j += 1
      end
      puts(" ")
      i += 1
    end
  end

  def width
    @width
  end

  def getboard
    @board
  end

  def getflippedboard
    @boardfliped
  end

  def heightchoices
    @height
  end

end

#########################################################################################################################

class Game
  
  def initialize(x, y)
    @board = Board.new(x, y)
    @turn = "X"
    @playerinput = 0
    @placedheight = 0
  end

  def showboard
    @board.typeboard
  end

  def placetile(a)
    @playerinput = gets.chomp.to_i
    widthchoices = (1..@board.width).to_a
    heightchoice = (1..@board.heightchoices).to_a

    until widthchoices.include?(@playerinput)
      @playerinput = gets.chomp.to_i

    end

    i = heightchoice.length - 1

    until heightchoice.include?(@board.getboard[@playerinput][i]) || i < 0
      i -= 1
    end

    @placedheight = i
    
    if a == "O"
      @board.getboard[@playerinput][i] = "O"
      @board.getflippedboard[i + 1][@playerinput - 1] = "O"
    elsif a == "X"
      @board.getboard[@playerinput][i] = "X"
      @board.getflippedboard[i + 1][@playerinput - 1] = "X"
    elsif i < 0
      return puts("nospace")
    end
    
    puts showboard

  end

  def play
    
    gamefin = false

    until gamefin == true
      if @turn == "X"
        @turn = "O"
      else 
        @turn = "X"
      end
      placetile(@turn)
      gamefin = gamewin
    end

    puts("You win!")

  end

  def gamewin

    if @turn == "X"
      a = "X"
    else
      a = "O"
    end

    i = @board.heightchoices - 1
    j = @board.width - 1


    hwin = 0
    wwin = 0

    until hwin == 4 || i < 0
      if @board.getboard[@playerinput][i] == a
        hwin += 1
      else 
        hwin = 0
      end
      i -= 1
    end

    until wwin == 4 || j < 0
      if @board.getflippedboard[@placedheight + 1][j] == a
        wwin += 1
      else
        wwin = 0 
      end
      j -= 1
    end

    k = @placedheight
    l = @playerinput
    diagl = @board.getboard[l][k]

    dwin = 0
    dwinl = 0
    dwinr = 0

    if l == 1
      dwinl += 1
    else
      until diagl != a || l < 1 || k < 1 || dwinl == 4
        l -= 1
        k -= 1
        diagl = diagr = @board.getboard[l][k]
        dwinl += 1
      end
    end

    k = @placedheight
    l = @playerinput
    diagr = @board.getboard[l][k]
    
    if l == @board.width
      dwinr += 1
    else
      until diagr != a || l > @board.width || k >= @board.heightchoices - 1 || dwinr == 4
        l += 1
        k += 1
        diagr = @board.getboard[l][k]
        dwinr += 1
      end
    end

    k = @placedheight
    l = @playerinput
    rdiagl = @board.getboard[l][k]

    rdwin = 0
    rdwinl = 0
    rdwinr = 0

    if l == @board.width
      rdwinl += 1
    else
      until rdiagl != a || l > @board.width || k <= 1 || rdwinl == 4
        l += 1
        k -= 1
        rdiagl = @board.getboard[l][k]
        rdwinl += 1
      end
    end

    k = @placedheight
    l = @playerinput
    rdiagr = @board.getboard[l][k]
    
    if l == 1
      rdwinr += 1
    else
      until rdiagr != a || l < 1 || k >= @board.heightchoices - 1 || rdwinr == 4
        l -= 1
        k += 1
        rdiagr = @board.getboard[l][k]
        rdwinr += 1
      end
    end

    dwin = dwinl + dwinr
    rdwin = rdwinl + rdwinr

    if hwin == 4 || wwin == 4 || dwin == 4 || rdwin == 4
      return true
    end

  end

end


game = Game.new(6,8)
game.play

#board = Board.new(3,5)
#puts(board.getboard)
#puts(board.getflippedboard)
