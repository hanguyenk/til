- Selection sort is O(n^2)
- Merge sort is O(n log n)
- Quick sort in worst case takes O(n^2), in average case takes O(n log n)

- Quick sort vs Merge sort: Quick sort has smaller constant than merge sort. So if they are both O(n log n) time, quick sort is faster.
- The quick sort also hits the average case way more often than the worst case

```
• D&C works by breaking a problem down into smaller and smaller pieces. If you’re using D&C on a list, the base case is probably an empty array or an array with one element.
• If you’re implementing quicksort, choose a random element as the pivot.  e average runtime of quicksort is O(n log n)!
• The constant in Big O notation can matter sometimes.  at’s why quicksort is faster than merge sort.
• The constant almost never matters for simple search versus binary search, because O(log n) is so much faster than O(n) when your list gets big.
```
