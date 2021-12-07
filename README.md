# AoC-2021
![swift workflow](https://github.com/mikezs/AoC-2021/actions/workflows/swift.yml/badge.svg)
[![codecov](https://codecov.io/gh/mikezs/AoC-2021/branch/develop/graph/badge.svg?token=64OZZEYDTF)](https://codecov.io/gh/mikezs/AoC-2021)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=mikezs_AoC-2021&metric=alert_status)](https://sonarcloud.io/dashboard?id=mikezs_AoC-2021)

## Advent Of Code (AoC) 2021

This are my solutions to the [Advent Of Code 2021](https://adventofcode.com/2021/) event. This year I've been playing along with [timsearle](https://github.com/timsearle/), [SFrost007](https://github.com/SFrost007/) and [ajabero](https://github.com/ajabero/AdventofCode21), please check out their solutions if you're interested.

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

### Day 3
Quite the step up in difficaulty. I decided to use string manipulation rather than try and use pure binary numbers for speed and keeping the word width the same rather than detecting it.

Part 1 was done really quickly, but for Part 2 I wanted to write some custom array extensions but just decided to quickly smash out a funciton to do it and I might (probably will) come back later to tidy it up and make it re-usable.

### Day 4
Completed in the back of a [car](https://media.autoexpress.co.uk/image/private/s--CO2gL5rB--/f_auto,t_content-image-full-desktop@2/v1563183731/autoexpress/2018/12/bmw-x5-12.jpg) on the way to a motorbike show. Part 1 was relatively easy to model (I knew my `Array.verticalSlice` funciton would come in handy again), but with part 2 I constantly had the issue where my tests would pass but with my asnwer was wrong :(. Got there in the end though!

### Day 5
Part 1 solution was easy, and I got to use the function that I've been wanting to use; [`signum`](https://developer.apple.com/documentation/swift/int/2886673-signum) (signed number denoting positive, negative or none) and I also got to use the [`stride`](https://developer.apple.com/documentation/swift/1641347-stride) function to loop backwards through a sequence of numbers.

Part 2 required diagonals to be added, so needed to make a solution to part 1 that also included vectors that changed both axis' for each position change. Although the solution was quite straightforward, I was distracted while implementing so it took me lots of iterations to finally get it right.

I'd like to refactor this to use a solution that [I saw on reddit](https://www.reddit.com/r/adventofcode/comments/r9824c/comment/hnagkga/) which I think would make it only a couple of lines and still be easy to understand.

### Day 6
Part 1 was the basic "model it as an `Int` array like in the worked example". Whipped it up in 5 minutes and ran it, great. Part 2 of "run it loads more times" I ran as release and went and made breakfast, but obviously this is designed to not complete in a sensible time.

I could think of 2 ways to complete this in an optimal way: The number of each fish's replications can be calculated, and then the replications of those, and so on in a recursive function. The way that I chose was to model each day with the number of fish that were currently in that state, which meant that I only had to really care about the numbers of fish on day 0 and add their total to day 6 and set this for day 8. This completed really fast and was quite easy to understand.

### Day 7
Managed to do a full functional chain for both parts from the start. Part 1 was relatively straightfoward but my part 2 is not optimal and takes a couple of seconds on release. I need to calculate/cache the sums of the numbers in an efficient way and then look them up when doing the loop
