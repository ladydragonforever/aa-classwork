# n ^ 4
def largest_contiguous_subsum(list)
    subs = []
    sub_max = [list[0]]
    max = sub_max.sum

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            subs << list[i..j]
        end
    end

    subs.each do |sub|
        if sub.sum > sub_max.sum
            sub_max = sub
            max = sub.sum
        end
    end
    return max
end

# O(n)

def better_lcs(list)
    max = list[0]
    running_sum = 0
    right = 0
    while right < list.length
        running_sum += list[right]
        if max < running_sum
            max = running_sum
        end
        if running_sum < 0
            running_sum = 0
        end
        right+=1
    end
    max
            
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# list1 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list1) # => 8 (from [7, -6, 7])
# list2 = [-5, -2, -1, -3]
# p largest_contiguous_subsum(list2) # => -1 (from [-1])
# list = [5, 3, -7]
# p better_lcs(list) # => 8
# list1 = [2, 3, -6, 7, -6, 7]
# p better_lcs(list1) # => 8 (from [7, -6, 7])
# list2 = [-5, -2, -1, -3]
# p better_lcs(list2) # => -1 (from [-1])


def first_anagram?(str1, str2)
    new_str1= str1. split("")
    new_str1.permutation.to_a.map {|sub|sub.join}.include?(str2)

end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1,str2)

    other = str2.split('')
    str1.each_char do |char|
        other_idx = other.index(char)
        if other_idx.nil?
            return false
        else
        other.delete_at(other_idx)
        end
    
    end
    other.empty?
end
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

