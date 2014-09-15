# # Board
#
# Inspired by [FEN](en.wikipedia.org/wiki/Forsyth–Edwards_Notation),
# a Board is an object with fields:
#
# * pieces: the state of the board
@Board =
  clientId: "chessboard-js-board"
  initialBoard:
    pieces: {a8:"bR",b8:"bN",c8:"bB",d8:"bQ",e8:"bK",f8:"bB",g8:"bN",h8:"bR",a7:"bP",b7:"bP",c7:"bP",d7:"bP",e7:"bP",f7:"bP",g7:"bP",h7:"bP",a2:"wP",b2:"wP",c2:"wP",d2:"wP",e2:"wP",f2:"wP",g2:"wP",h2:"wP",a1:"wR",b1:"wN",c1:"wB",d1:"wQ",e1:"wK",f1:"wB",g1:"wN",h1:"wR"}
  #Renders a ChessBoardJS board from a Matey model
  #Attaches an event handler that says:
  #> Add a Board which takes into account the move that was made.
  render: (board) ->
    console.info("Rendering board")
    new ChessBoard @clientId,
      draggable: true
      onDrop: (source, target) ->
        console.log "Moving from #{source} to #{target}"
        Boards.insert Board.move(board, source, target)
      position: board.pieces

  # Takes a Board, returns a new one on which the move has been played.
  move: (board, from, to) ->
    newPieces = _.clone(board.pieces)
    mover = newPieces[from]
    delete newPieces[from]
    newPieces[to] = mover
    {
      pieces: newPieces
    }