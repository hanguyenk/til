## Concurrent vs Parrallel

Let's assume that there is more work to be done than there are resources for doing them. That there are multiple threads or sequences of operations to step through. With only one thread or operation sequence there isn't much to discuss in terms of concurrency or parallelism.

### Concurrent

Concurrent operation means that two computations can **both make progress** and advance regardless of the other. If there are two threads, for example, then both make progress independently. The second computation doesn't need to wait for the first one to complete before it can be advanced.

![Conccurent](https://github.com/khandz/til/blob/master/programming/principles_and_concepts/img/concurrent-1.svg)

If computation is said to be concurrent, then it doesn't necessarily dictate how the concurrency is achieved under the hood. In single-core setup it is possible that the computations take turns in execution. The CPU might run few instructions from the other thread, then suspend it and switch over to the second and run few steps from it and so on. This is also called pre-emptive multithreading. It may also be possible that there are more cores available that can be used to run both at the same time. This, in fact, is parallel computation as we'll see next.


### Parallel

![Parallel](https://github.com/khandz/til/blob/master/programming/principles_and_concepts/img/parallel-1.svg)

Parallel operation means that two computations are **literally running simultaneously** - at the same time. At one point in time both computations are advanced. There is no taking turns, they are advanced at the same time. Naturally this is not possible with single-core CPU, but multiple-core architecture is required instead.

It can be said that if computation is parallel it is also concurrent - since parallel computation also fulfills the definition of concurrent computation.
