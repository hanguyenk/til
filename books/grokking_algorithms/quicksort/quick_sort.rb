# ======= Simple quick sort, only uniq numbers ===============
# def quick_sort(arr)
#   return arr if arr.size < 2
#   pivot = arr[0]
#   left, right = arr.partition{ |e| e <= pivot }
#   quick_sort(left) + quick_sort(right)
# end

# def quick_sort(arr)
#   return arr if arr.size < 2
#   pivot = arr[0]
#   left = arr.select { |e| e <= pivot }
#   right = arr.select { |e| e > pivot }
#   quick_sort(left) + [pivot] + quick_sort(right)
# end


# ======= Better quick sort, only uniq numbers ==============
def quick_sort(arr)
  return list if list.uniq.size < 2
  p = list.sample
  left, right = list.partition{|elmt| elmt <= p}
  quick_sort(left) + quick_sort(right)
end
