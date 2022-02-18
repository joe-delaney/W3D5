class KnightPathFinder
  SIZE = 8
  def self.valid_moves(pos)
    row, col = pos
    directions = [[-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1]]
    valid = []
    directions.each do |direction|
      new_row = row + direction[0]
      new_col = col + direction[1]
      if new_row >= 0 && new_col >= 0 && new_row < SIZE && new_col < SIZE
        valid << [new_row, new_col]
      end
      valid
    end

  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    build_move_tree
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    #Find all possible moves from valid moves
    possible_moves = KnightPathFinder.valid_moves(pos)

    #Only include possible moves not yet considered
    available_new_moves = possible_moves.select do |move| 
      !considered_positions.include?(move)
    end

    #Add available new moves to considered positions and return available new moves
    considered_positions.concat(available_new_moves)
    available_new_moves
  end

  private
  attr_reader :considered_positions
end