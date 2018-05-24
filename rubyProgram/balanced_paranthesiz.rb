#steps
# initialize comparison_paranthesis as an empty array
# iterated the string 
# pushing the opening character in to the comparison_paranthesis
# once a closing character is found by checking it in the opening_brackets array (pre-defined opening characters) and then
# pop a character from the  comparison_paranthesis  and saved it in starting_paranthesis
# compared the value in the starting_paranthesis and along with the pairs that is also been predefined with the hash
#if the pair doent match then it will false
#else after all the iteration the comparison_paranthesis is empty then it is a balanced string

def balanced_paranthesis(string)
	comparison_paranthesis = []
	opening_brackets = ["(","[","{"]
	pairs = {
		"(" => ")",
		"[" => "]",
		"{" => "}"
	}
	string.split("").each do |char|
		if opening_brackets.include? char
			comparison_paranthesis.push(char)
		else
			starting_paranthesis = comparison_paranthesis.pop #"("
			if pairs[starting_paranthesis] != char # ( != }
				return false	
			end
		end
	end
	return comparison_paranthesis.empty?
end
puts balanced_paranthesis("()[]{}") #true
puts balanced_paranthesis("([{}])") #true
puts balanced_paranthesis("([]{})")#true
puts balanced_paranthesis("([)]") #false
puts balanced_paranthesis("([]") #false
puts balanced_paranthesis("[])") #false
puts balanced_paranthesis("([})") #false
puts balanced_paranthesis("()") #true











