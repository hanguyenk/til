- A graph is made up of `nodes` and `edges`
- A node can be directly connected to many other nodes. Those nodes are called its `neighbor`
- A tree is a special type of graph, where no edges ever point back

```
• Breadth-first search tells you if there’s a path from A to B.
• If there’s a path, breadth-first search will find the shortest path.
• If you have a problem like “Find the shortest X,” try modeling your problem as a graph, and use breadth-first search to solve.
• A directed graph has arrows, and the relationship follows the direction of the arrow (rama -> adit means “rama owes adit money”).
• Undirected graphs don’t have arrows, and the relationship goes both ways (ross - rachel means “ross dated rachel and rachel dated ross”).
• Queues are FIFO (First In, First Out).
• Stacks are LIFO (Last In, First Out).
• You need to check people in the order they were added to the search list, so the search list needs to be a queue. Otherwise, you won’t get the shortest path.
• Once you check someone, make sure you don’t check them again. Otherwise, you might end up in an in nite loop.
```
