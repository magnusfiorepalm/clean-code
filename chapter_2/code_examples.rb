class ChapterTwo

  def getThem(the_list)
    list1 = []
    the_list.each do |x|
      if x[0] == 4
        list1 << x
      end
    end
    list1
  end

end
