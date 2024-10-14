# [Computer-Architecture] Minimum Changes To Make Alternating Binary String

## 1. Task Description
You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.

The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.

Return the minimum number of operations needed to make s alternating.

## 2 Method Used
The problem requires converting a binary string into an alternating pattern where no two adjacent characters are the same. There are two possible alternating patterns: 
one starting with '0' and the other starting with '1'. We calculate the number of changes needed to convert the string into each of these patterns and return 
the smaller of the two values. The space complexity is O(1) as only a few variables are used to track counts, while the time complexity is O(n), 
where n is the length of the string, as we need to iterate through the string once.

-> [read more...](https://hackmd.io/@dinosaur/H1X4bxtJye)
