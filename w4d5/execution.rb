
require"byebug"
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

# n!
def first_anagram?(str1, str2)
    new_str1= str1. split("")
    new_str1.permutation.to_a.map {|sub|sub.join}.include?(str2)

end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

#n
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


def third_anagram?(str1, str2)
  
bubble_sort(str1) == bubble_sort(str2)

end

def bubble_sort(str)

  alphabet = ("a".."z").to_a

    sorted = false
    while !sorted
        sorted = true
        (0...str.length-1).each do |idx|
            a_idx = alphabet.index(str[idx])
            b_idx = alphabet.index(str[idx+1])
            if a_idx > b_idx
                str[idx], str[idx+1] = str[idx+1], str[idx]
                sorted = false
            end
        end
    end
    str
end


p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram(str1, str2)
    new_hash(str1).each do |k,v|
        return false if str2.count(k) != v
    end
    return true
end


def new_hash(str)
    new_hash = Hash.new(0)
    str.each_char do |cha|
        new_hash[cha] += 1
    end
    return new_hash
end

# bsearch on sorted array
require "set"
def two_sum?(arr,target)
    set = Set.new
    arr.each do |el|
        reminder = target - el
        return true if set.include?(el)
        set << reminder
    end
    false
end
    
    # new_arr = arr.sort
    # i,j = 0, arr.length-1
    
    # until i==j
    #     case arr[i]+arr[j] <=> target
    #     when 0
    #         return true
    #     when 1
    #         j -= 1
    #     when -1
    #         i += 1
    #     end
    # end
    # return false
# end
    




# def b_search (arr, target)
#     # deb`ugger
#     return nil if arr.empty?
#     middle = arr.length/2
#     if arr.length.odd?
#         left = arr[0..middle-1]
#         right = arr[middle+1..-1]
#     else
#         left = arr[0..middle-1]
#         right = arr[middle..array.length-1] 
#     end
#     return middle if target == arr[middle]
#     if target < arr[middle]
#         b_search(left, target)
#     else
#         search_result = b_search(right, target)
#         search_result + middle+1 unless search_result.nil?
#     end
# end
# p b_search([1,2,3,4,5,6,7], 5)
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) 



    