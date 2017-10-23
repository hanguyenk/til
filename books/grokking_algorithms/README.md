## Grokking Algorithm

1. Introduction to algorithm
- Binary search is lot faster than simple search.
- O(log n) is faster than O(n), but it gest a lot faster once the list of items you're searching through grows.
- Algorithm speed isn't measured in seconds.
- Algorithm times are measured interms of **growth** of an algorithm.
- Algorithm times are written in Big O notation.

2. Selection sort
- Your computer's memory is like a giant set of drawers.
- When you want to store multiple elements, use an array or a list
- With an array, all your elements are stored right next to each other.
- With a list, elements are strewn all over, and one element stores the address of the next one.
- Linked lists allow fast inserts and deletes.
- All elements in the array should be the same type (all ints, all doubles, and so on).

3. Recursion
- Recursion is when a functions call itself.
- Every recursive function has two cases: the base case and the recursive case.
- A stack has two operations: push and pop.
- All function calls go onto the call stack.
- The call stack can get very large, which takes up a lot of memory.

4. Quicksort
- Divide and Conquer (D&C) works by breaking a problem down into smaller and smaller pieces. If you're using D&C on a list, the base case is probably an empty array or an array with one element.
- If you're implementing quicksort, choose a random element as the pivot. The average runtime of quicksort is O(n log n)!
- The constant in Big O notation can matter sometimes. That's why quicksort is faster than merge sort.
- The constant almost never matter for simple search versus binary search, because O(log n) is so much faster than O(n) when your list gets big.

5. Hash tables
You'll almost never have to implement a hash table yourself. The programming language you use should provide an implementation for you. You can use Python's hash tables and assume that you'll get the average case performance: constant time. 
Hash tables are a powerful data structure because they're so fast and they let you model data in a different way. You might soon find that you're using them all the time: 
- You can make a hash table by combining a hash function with an array.
- Collisions are bad. You need a hash function that minimizes collisions.
- Hash tables are good for modeling relationships from one item to another item.
Once your load factor is greater than .07, it's time to resize your hash table.
- Hash tables are used for caching data (for example, with a web server).
- Hash tables are great for catching duplicates.

6. Breadth-first search
- Breadth-first search tells you if there's path from A to B.
- If there's a path, breadth-first search will find the shortest path.
- If you have a problem like "find the shortest X", try modeling your problem as a graph, and use breadth-first search to solve.
- A directed graph has arrows, and the relationship follows the direction of the arrow (rama -> adit means "rama owes adit money").
- Undirected graphs don't have arrows, and the relationship goes both ways (ross - rachel means "ross dated rachel and rachel dated ross").
- Queues are FIFO (First In, First Out).
- Stacks are LIFO (Last In, First Out).
- You need to check people in the order they were added to the search list, so the search list needs to be a queue. Otherwise, you won't get the shortest path. 
- Once you check someone, make sure you don't check them again. Otherwise, you might end up in a infinite loop.

7. Dijstra's algorithm
- Breadth-first search is used  to calculate the shortest path for an unweighted graph.
- Dijkstra's algorithm is used to calculate the shortest path for a weighted graph.
- Dijkstra's algorithm works when all the weights are positive.
- If you have negative weights, use Bellman-Ford algorithm.

8. Greedy algorithms
- Greedy algorithms optimize locally, hoping to end up with a global optimum.
- NP-complete problems have no known fast solution.
- If you have an NP-complete problem, your best bet is to use an approximation algorithm.
- Greedy algorithms are easy to write and fast to run, so they make good approximation algorithms.

9. Dynamic programming
- Dynamic programming is useful when you're trying to optimize something given a constraint.
- You can use dynamic programming when the problem can be broken into discrete subproblems.
- Every dynamic-programming solution involves a grid.
- The values in the cells are usually what you're trying to optimize.
- Each cell is a subproblem, so think about how you can divide your problem into subproblems.
- There's no single formula for calculating a dynamic-programming solution.

10. K-nearest neighbors
I hope this gives you an idea of all the different things you can do with KNN and with machine learning! Machine learning is an interesting field that you can go pretty deep into if you decide to: 
- KNN is used for classification and regression and involves looking at the k-nearest neighbors.
- Classification = categorization into a group.
- Regression = predicting a response (like a number).
- Feature extraction means converting an item (like a fruit or a user) into a list of numbers that can be compared.
- Picking good features is an important part of a sucessful KNN algorithm.

11. Where to go next
