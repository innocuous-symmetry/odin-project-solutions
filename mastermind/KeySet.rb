class KeySet
  def initialize(array_keys = nil)
    @key = Array.new(4)
    if (array_keys)
      @key << array_keys
    end
  end

  def put_keys(array_keys)
    @key << array_keys
  end
end
