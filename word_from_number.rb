class WordFromNumberConversion

  def number_to_letters(numbs)

   return [] unless numbs.empty? || numbs.length == 10 || numbs.split('').select{|a|(a.to_i != 0 || a.to_i != 1)}.length > 0
    #number to letters mapping
    mapping_ltrs = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
    dictionary = {}  # to hold all values from dictionary
    file_path = "dictionary.txt" 
    File.foreach( file_path ) do |word|
      dictionary[word.length] = [] unless dictionary.has_key?(word.length)
      dictionary[word.length] << word.chop.to_s.downcase
    end

    keys = numbs.chars.map{|num|mapping_ltrs[num]}

    results = {}
    total_number = keys.length - 1 
    #to get matching records
    for i in (2..total_number - 2)
      a  = keys[0..i]
      next if a.length < 3
      b = keys[i + 1..total_number]
      next if b.length < 3
      a_combination = a.shift.product(*a).map(&:join)
      b_combination = b.shift.product(*b).map(&:join)
      results[i] = [(a_combination & dictionary[i+2]), (b_combination & dictionary[total_number - i +1])] # get common values from arrays
    end
    #matching words for output
    final_result = []
    results.each do |key, combinataions|
      next if combinataions.first.nil? || combinataions.last.nil?
      combinataions.first.product(combinataions.last).each do |combo_words|
        final_result << combo_words
      end
    end
  
    final_result << (keys.shift.product(*keys).map(&:join) & dictionary[11]).join(", ") 
    final_result
    
  end



end