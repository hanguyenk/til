```
3.1 Suppose I show you a call stack like this.
 ____________
|GREET2      |
|____________|
|Name:|MAGGIE|
|____________|
|GREET       |
|____________|
|Name:|MAGGIE|
|____________|

What information can you give me, just based on this call stack?
```
=> It would call `GREET2` first then `GREET`

```
3.2 Suppose you accidentally write a recursive function that runs forever. As you saw, your computer allocates memory on the stack for each function call. What happens to the stack when your recursive function runs forever?
```
=> Stack overflow because the call stack pointer exceeds the stack bound
