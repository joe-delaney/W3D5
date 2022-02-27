class PolyTreeNode

  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value 
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    #Remove self from current parent
    @parent.children.delete(self) unless @parent.nil?

    #Set new parent for self if not already in parent
    @parent = parent_node
    if parent
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent = nil
    else 
      raise "Child doesn't exist"
    end
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child| 
      search_result = child.dfs(target_value) 
      return search_result unless search_result.nil?
    end
    return nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      if el != target_value
        el.children.each do |child|
          queue.push(child)
        end
      else
        return self
      end
    end
    return nil
  end
end

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2

# this should work
raise "Bad parent=!" unless n3.parent == n2
raise "Bad parent=!" unless n2.children == [n3]

# this probably doesn't
raise "Bad parent=!" unless n1.children == []