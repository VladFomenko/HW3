# bad code, but it works.
# 1.Large number of storage arrays
# 2.each in each
# needs improvement
#

class Brackets
  def initialize(str)
    @str = str
    @arr_brackets = []
    @res = []
    @res_two = []
    @res_three = []
    @result = []
    @arr_brackets_open = ['(', '[', '{', '<', ')', ']', '}', '>']
  end

  def valid?
    @arr_brackets = @str.split('')

     if @arr_brackets.size % 2 != 0
       return p false
     end
     @arr_brackets.each do |i|
        @arr_brackets_open.each_with_index do |val, index|
          if i == val
              @res << index
          end
        end
     end

     @res.each_with_index do |val, index|
        if val < 4
          @res_three << val
          @res_two << val + 4
        elsif val > 3 && @res[index - 1] < 4
          @res_three = @res_three + @res_two.reverse
          @res_two = []
        end
     end

     @result = @res_three.map{|i| @arr_brackets_open[i]}
     p @str == @result.join('')
  end

end
