require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # def parent=()
    #     unless parent.nil?
    #     parent << children
    # end

    def parent=(new_parent)
    # remove self from previous parent's children array
        unless parent.nil?
           parent.children.delete(self)
        end
        @parent = new_parent
        unless new_parent.nil?
           
            if !new_parent.children.include?(self)
                new_parent.children << self 
            end
        end
    end

    def add_child(new_child)
        self.children << new_child
        new_child.parent = self
    end
    
    def remove_child(child)
        if child.parent == nil
            raise "This node is not a child!"
        end
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        children.each do |child|
            search_result = child.dfs(target) 
            return search_result unless search_result.nil?  
        end
        return nil
    end

    def bfs(target)
        # queue = [self]
        # until queue.empty?
        #     current_nod = queue.shift
        #     return current_nod if current_nod.value == target
        #     queue.concat(current_nod.children)
        # end

        # nil
        queue = [self]
        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target
            queue.concat(current_node.children)
        end
        nil

    end

    def inspect
        @value.inspect
    end

end
