---
layout: default
title: "Mutation Testing: How to Check the Quality of the Tests Themselves"
---

[#qa](./) [#dev](../../dev)

## Mutation Testing: How to Check the Quality of the Tests Themselves

Everyone writes unit tests, but how do you know how good they are? Code coverage is only a quantitative metric. You can have 100% coverage but not test the key logic. Mutation testing evaluates the quality of tests by making small changes to the code and checking whether the tests fail.

1. Artificial changes—mutants—are introduced into the source code (for example, replacing > with <, deleting a line, changing a condition).
2. The tests are run.
3. If the tests fail, the mutant is killed (the tests worked).
4. If the tests pass, the mutant survives (the tests did not notice the change).
5. Metric: percentage of killed mutants = test suite quality.

**Types of Mutations (Examples)**

| Operator          | Source Code  | Mutant         |
|-------------------|--------------|----------------|
| Change arithmetic | `a + b`      | `a - b`        |
| Change condition  | `if (x > 5)` | `if (x >= 5)`  |
| Remove call       | `saveData();`| (empty)        |
| Replace constant  | `MAX = 100`  | `MAX = 0`      |
| Invert boolean    | `return true`| `return false` |

**Tools**
- Java - PITest (PiTest)
- JavaScript/TypeScript - Stryker Mutator
- PHP - Infection
- Python - Mutmut, Cosmic Ray
- C# - Stryker.NET
- Ruby - Mutant
- Go - go-mutesting

**Example (Java + PITest)**
```xml
<plugin>
    <groupId>org.pitest</groupId>
    <artifactId>pitest-maven</artifactId>
    <version>1.15.0</version>
    <configuration>
        <targetClasses>
            <param>com.example.*</param>
        </targetClasses>
        <targetTests>
            <param>com.example.*</param>
        </targetTests>
    </configuration>
</plugin>
```

Run: mvn test-compile org.pitest:pitest-maven:mutationCoverage
Result: HTML report with color-coded kill/survivor mutants.

| ✅ Pros                         | ❌ Cons                                                  |
|----------------------------------|----------------------------------------------------------|
| Objective test quality assessment| High execution cost (hours instead of minutes)           |
| Finds blind spots in tests       | Requires filter adjustments (not all mutants are useful) |
| Forces you to write more         | May generate false positives (equivalent to mutants)     |
|meaningful tests                  |                                                          |

**When to use**
- Critical modules (calculations, security, core business logic).
- With high reliability requirements (fintech, medtech).
- For evaluating a regression test suite before release.

_There's no need to run mutation tests on every commit—only in nightly builds or before going live._


This is a quality level that helps ensure bugs aren't missed even with 100% coverage.
