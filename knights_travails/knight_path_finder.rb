require_relative 'tree_node.rb'

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
    end
    valid
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    build_move_tree
  end

  def build_move_tree
    #Set queue equal to first node
    queue = [root_node]

    until queue.empty?
      #save first node in line (queue)
      current_node = queue.shift
      #Get all possible moves for current node
      new_moves = new_move_positions(current_node.value)
      #if there are new moves, proceed, if not, move on to next node
      if new_moves.length > 0
        #Create a child for the current node for each possible move
        #Add child to queue so we process them
        new_moves.each do |new_move|
          child = PolyTreeNode.new(new_move)
          current_node.add_child(child)
          queue << child
        end
      end
    end
    #return root node which is now populated treecd
    root_node
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
  attr_reader :considered_positions, :root_node
end

start = KnightPathFinder.new([0, 0])
p start