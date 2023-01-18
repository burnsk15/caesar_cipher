require 'pry-byebug'

# Make sure that whatever letters were upper and lower case and the same in the new encrypted message
def same_case(first_array, newer_array)
    first_array.each_with_index do |item, index|
        if item == item.upcase
            newer_array[index].upcase!
        elsif item == item.downcase
            newer_array[index].downcase!
        else
            next
        end
    end
end

# Take a string and a number to create a caesar cipher
def caesar_cipher (string, shift)
    alphabet_array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    new_array = []
    # Split string into array but keeps case format
    original_array = string.split("")
    # Split string into a all lowercase array for comparision
    old_array = string.downcase.split("")
    
    # Loop though each item in the array
    old_array.each_with_index do |str, i|
        # Keep common puncuation and spaces and pass them to the new array
        if str == "!" || str == "." || str == "," || str == " "
        new_array << str
        # Loop through the alphabet
        else alphabet_array.each_with_index do |letter, x|
            if old_array[i] == letter
                # Wrap from z to a
                if (x + shift) > 25
                    new_array << alphabet_array[x + shift -26]
                else
                    new_array << alphabet_array[x + shift]
                end
            else
                next
            end
        end
        end
    end
    same_case(original_array, new_array)
    puts new_array.join("")

end

caesar_cipher("AbC xYz!", 1)
