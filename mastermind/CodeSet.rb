require_relative "../common/String.rb"

class CodeSet
  attr_accessor :code

  def initialize(array_code = nil)
    if (array_code)
      if (array_code.any? { |code| code < 0 or code > 6 })
        raise ArgumentError, "Code must be between 1 and 6"
      end

      @code = array_code
    else
      @code = Array.new(4)
    end
  end

  def to_s
    output = ""

    for cell in @code
      colorcode = cell + 31
      output += "\e[#{colorcode}m#{cell.to_s}\e[0m\n"
    end

    output
  end

  def put_codes(array_code)
    @code << array_code
  end
end

thing = CodeSet.new([1,2,3,4])
print thing.to_s
