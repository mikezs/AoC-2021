# AoC-2021
![swift workflow](https://github.com/mikezs/AoC-2021/actions/workflows/swift.yml/badge.svg)
[![codecov](https://codecov.io/gh/mikezs/AoC-2021/branch/develop/graph/badge.svg?token=64OZZEYDTF)](https://codecov.io/gh/mikezs/AoC-2021)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=mikezs_AoC-2021&metric=alert_status)](https://sonarcloud.io/dashboard?id=mikezs_AoC-2021)

## Advent Of Code (AoC) 2021

This are my solutions to the [Advent Of Code 2021](https://adventofcode.com/2021/) event. This year I've been playing along with [timsearle](https://github.com/timsearle/) and [SFrost007](https://github.com/SFrost007/), please check out their solutions if you're interested.

### Project approach

This swift package manager project contains my MacOS command line tool, a framework with all of the logic to solve the puzzles and a test framework to validate against the AoC examples that are given in the puzzle descriptions.

The idea is to use the example problems/solutions provided in the puzzles to do TDD, but sometimes there are no examples that allow TDD.

There's a `config.swift` file hidden using git-secret. This is the format of the file:

```
import Foundation

enum Config {
    static let year = 2021
    // This is the session cookie from your browser after logging in to https://adventofcode.com/
    static let session = "[TOKEN]"
}
```

### Running

To run day 1:
- Either create a file called day1.txt with your puzzle input, or add your AoC session cookie to the code and it'll be created automatically
- Then run `swift run AoC 1` in Terminal

## Implementation notes

### Day 1
Logged on to find [SFrost007](https://github.com/SFrost007/) had already got his 2 stars! Although this year we're not competing on it (I cheated by having childcare duties meaning I could work on it before everyone else woke up) :D

First part was an array look-ahead problem, so just did a loop making sure I didn't go out of bounds and keeping a seperate variable for what I was looking at. Second part needed a window calculating, so made and tested a function for that. I really struggled with the indexes of the array bounds checking, so it took me 10 mins to write a function that should have taken 2. Thank goodness for tests otherwise that could have been an hour. I'm rusty from last year.

Edit: I went back and added the swift-algorithms package and made a function to compute the answer, part 1 just used it with the array, and part 2 with the windows calculated using the Algorithms library.

### Day 2
Pretty simple algorithm for today, just split the lines using a space, then added first part and the second part converted to an `Int` to a tuple for looping over and added the algorithm as simple if statements for both parts.
