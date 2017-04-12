def merge_sort array
  n = array.size

  # Array of size 1 or less is always sorted
  return array if n <= 1

  # Apply "Divide & Conquer" strategy

  # 1. Divide
  mid = n / 2
  part_a = merge_sort array.slice(0, mid)
  part_b = merge_sort array.slice(mid, n - mid)

  # 2. Conquer
  sorted = []
  i = 0
  j = 0

  while i < part_a.size && j < part_b.size
    # Take the smallest of the two, and push it on our array
    if part_a[i] < part_b[j]
      sorted << part_a[i]
      i += 1
    else part_b[j] < part_a[i]
      sorted << part_b[j]
      j += 1
    end
  end

  while i < part_a.size
    sorted << part_a[i]
    i += 1
  end

  while  j < part_b.size
    sorted << part_b[j]
    j += 1
  end

  return sorted
end

# array size 8 containing distincs elements between 0..10
input = (0..10).to_a.sort{ rand() - 0.5 }[0..7]
p "Input: #{input}"

output = merge_sort input
p "Output: #{output}"
