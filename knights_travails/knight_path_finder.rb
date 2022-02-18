class KnightPathFinder
  def self.valid_moves(pos)

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