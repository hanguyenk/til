require 'pry'

knapsack_capacity = 6
items = [
  { name: "Water", weight: 3, value: 10 },
  { name: "Book", weight: 1, value: 3 },
  { name: "Food", weight: 2, value: 9 },
  { name: "Jacket", weight: 2, value: 5 },
  { name: "Camera", weight: 1, value: 6 },
]

# Greatest common divisor
def gcd(u, v)
  u, v = u.abs, v.abs
  while v > 0
    u, v = v, u % v
  end
  u
end

min_weight = items.map { |item| item[:weight] }.min
base = gcd(min_weight, knapsack_capacity)
col_nums = knapsack_capacity / base
grid = Array.new(items.size) { Array.new(col_nums) }
items.each_with_index do |item, i|
  for j in (0...col_nums)
    puts "DEBUG | [#{i}][#{j}]"
    if item[:weight] > (j + 1)
      if i == 0
        grid[i][j] = { value: 0, items: [] }
      else
        grid[i][j] = grid[i-1][j]
      end
    elsif item[:weight] == (j + 1)
      if i == 0 || item[:value] > grid[i-1][j][:value]
        grid[i][j] = { value: item[:value], items: [item[:name]] }
      else
        grid[i][j] = grid[i-1][j]
      end
    else
      if i == 0
        grid[i][j] = { value: item[:value], items: [item[:name]] }
      else
        case_1 = grid[i-1][j][:value]
        case_2 = item[:value] + grid[i-1][j - item[:weight]][:value]
        if case_1 >= case_2
          grid[i][j] = grid[i-1][j]
        else
          grid[i][j] = {
            value: case_2,
            items: [item[:name]] + grid[i-1][j - item[:weight]][:items]
          }
        end
      end
    end
    puts "DEBUG | #{grid[i][j]}"
  end
end
