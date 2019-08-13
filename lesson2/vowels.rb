alphabet = ("a".."z").to_a
vowels = ["a", "e", "i", "o", "u"]
vowels_hash = {}
number = 0
for letter in alphabet
  number += 1
  for vowel in vowels
    if letter == vowel
      vowels_hash[vowel] = number
    end
  end
end
puts vowels_hash
