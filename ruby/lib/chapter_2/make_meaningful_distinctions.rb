class MakeMeaningfulDistinctions

  # 1
  def self.copy_chars(a1, a2)
    a1.each_with_index do |x, i|
      a2[i] = a1[i]
    end
  end

  #2
  def self.copy_arrays(source, destination)
    source.each_with_index do |x, index|
      destination[index] = source[index]
    end
  end

end

