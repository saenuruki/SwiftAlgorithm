# Analysis
Given the name of the kingdom, we need to determine the ruler of that kingdom. Based on the information given in the problem, we can say that who the ruler is depends on the last letter of the kingdom name.

- If the last letter is a vowel, then the kingdom is ruled by Alice.
- If the last letter is a consonant other than 'y', then the kingdom is ruled by Bob.
- If the last letter is y, then the kingdom is ruled by nobody.

# Test Set 1
Let us create a function getRuler which takes as input a string kingdom and returns whether it is ruled by Alice, Bob or nobody. Consider x to be the last letter of kingdom.

- We will first check if x is a vowel, for this we can create a hashset consisting of all the vowels i.e. {a, e, i, o, u} and check if x is present in the hashset. If it is present return Alice.
- Now let us check if x is equal to y if so, then return nobody
- If both the above conditions are not satisfied, then x is a consonant and not equal to y. In this case, return Bob.

# Test Set 2
We can use the same approach for this test as well, but there is a small catch. In Test Set 1, because of the constraints, kingdom has at least 3 letters so x is always lowercase. In Test Set 2, kingdom can have only one letter, so x is an uppercase. We need to convert it to lowercase and then check if it is a vowel or equal to y.

# Time Complexity
Creating a hashset of vowels: O(5), which is equivalent to O(1).
For each test case:
- Converting x to a lowercase in case of kingdom having only one letter: O(1).
- Checking if x is a vowel: O(1).
- Checking if x is equal to y: O(1).
- We have T test cases, hence the overall time complexity is O(T)

# Note
Please take care of adding a .> (terminating period) at the end of the output sentence.