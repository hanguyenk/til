## Introduction
### Testing First Drives Design
1. Create a test. The test should be short and test for one thing in your code. The test should run automatically.
2. Make sure the test fails. Verifying the test failure before you write code helps ensture that the test really does what you expect.
3. Write the simplest code that could possibly make the test pass. Don't worry about good code yet. Don't look ahead. Sometimes, write just enough code to clear the current error.
4. After the test passes, refactor to improve the code. Clean up duplication. Optimize. Create new abstractions. Refactoring is a key part of design, so don't skip this. Remember to run tests again to make sure you haven't changed any behavior.
Repeat until done.

- Test-driven development enables you to design your software continuously and in small steps, allowing the design to respond to the changes in the code.

```
Prescription 1:
Use the TDD process to create and adjust your code's design in small, incremental steps.
```

```
Prescription 2:
In a test-driven process, if it is difficult to write tests for a feature, strongly consider the possibility that the underlying code needs to be changed.
```

### What Is TDD Good For?
- The primary purpose of test-driven development is to go beyond mere verification and use the tests to improve the code's structure.
- Testing has a lot of positive benefits to offer for coding, even beyond verification.
  + Preventing regression
  + Provide a detailed functional specification of program's behavior

### Words to Live By
Any change to the program logic should be driven by a failed test.
- If it's not tested, it's broken.
- Testing is supposed to help for the long term. The long term starts tomorrow, or maybe after lunch.
- It's not done until it works.
- Tests are code; refactor them, too.
- Start a bug fix by writing a test.
- Tests monitor the quality of your codebase. If it becomes difficult to write tests, it often means your codebase is too interdependent.
