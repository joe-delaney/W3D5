class KnightPathFinder

  def build_move_tree

  end

  def initialize(start_position)
    @root_node = PolyTreeNode.new(start_position)
    build_move_tree
  end
end