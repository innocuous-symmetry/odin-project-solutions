### STOCK PICKER
def stock_picker(stock_prices)
  left = 0
  right = 1
  highest = 0
  solution = [nil, nil]

  until left == stock_prices.length - 1
    until right == stock_prices.length - 1
      right += 1
      temp = stock_prices[right] - stock_prices[left]
      if temp > highest
        highest = temp
        solution[0] = left
        solution[1] = right
      end
    end

    left += 1
    right = left + 1 unless left + 1 == stock_prices.length
  end

  solution
end

print stock_picker([17,3,6,9,15,8,6,1,10])
