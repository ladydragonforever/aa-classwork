require_relative "./poly_tree-solution/lib/00_tree_node.rb"
require "byebug"
# require "set"

class KnightPathFinder
  attr_reader :pos, :considered_positions, :root_node

  def self.valid_moves(pos)
    row, col = pos
    valid_moves = []
    pos_1 = [row - 2, col + 1]
    pos_2 = [row - 2, col - 1]
    pos_3 = [row + 1, col + 2]
    pos_4 = [row - 1, col + 2]
    pos_5 = [row + 2, col + 1]
    pos_6 = [row + 2, col - 1]
    pos_7 = [row + 1, col - 2]
    pos_8 = [row - 1, col - 2]

    valid_moves += [pos_1] + [pos_2] + [pos_3] + [pos_4] + [pos_5] + [pos_6] + [pos_7] + [pos_8]
    valid_moves.reject do |pos|
      pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] >7 
    end
  end

  def initialize(pos)
    # debugger
    @pos = pos
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    self.build_move_tree
  end

  # def considered_positions=(new_pos)
  #   @considered_positions << new_pos
  # end

  def build_move_tree
    move_tree = []
    queue = [root_node]
    until queue.empty?
      
      current_node = queue.shift
      kids = new_move_positions(current_node.value)
      kids.each do |child|
         current_node.add_child(PolyTreeNode.new(child))
         considered_positions << child
         move_tree << current_node
      end

      row = current_node.value[0]
      col = current_node.value[1]
      
      # return current_node if current_node.value row == 0 || row == 7 || col == 0 || col == 7

      queue.concat(current_node.children)
    end
    return move_tree
  end

  def new_move_positions(pos)
    #start_point = @considered_positions.first
    #new_moves = @considered_positions.concat(KnightPathFinder.valid_moves(pos))
    valid_positions = KnightPathFinder.valid_moves(pos)
    valid_positions.reject { |position| @considered_positions.include?(position) }
  end

  def find_path(end_pos)
    
    self.build_move_tree

  end

  def trace_path_back(end_pos)
    result = []
  
     
    current_node = self.find_path(end_pos)
    until current_node.parent.nil?
      result << current_node.parent.value
      current_node = current_node.parent
    end

    return result

 
  end

  # def inspect
  #   @value.inspect
  # end

 # k = KnightPathFinder.new([6,6])

 





end