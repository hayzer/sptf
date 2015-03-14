## Why another framework I ? ##
There are a lot of CLI based testing frameworks and environments. Some are good, some are much better. But none of them, that I'm aware about, has all of the features I wanted. So I washed my eyes with other people cool ideas, stole them and put them into one basket.

## Why another framework II ? ##
Because I can.

## Why **SPTF** is good for me ? ##
  * I can manage and execute my tests with one application
  * I don't need to remember, to read long STPs, to analyze spagheti code, to read boring documents, to ask annoying programmers, not even wild guessing - to know exactly what my tests are testing.
  * I can run each test separately or in bunches. Same with test scenarios.
  * I decide when to quit or when to continue on failures.
  * I can prioritize my tests.
  * My tests have dependencies. No more failures after hours of testing because I forgot to add some small operation.
  * I can execute additional operations before and/or after each test case.
  * I can skip my test or sign it as to be done in the future.
  * Each test has its owner so there always someone to be blame.
  * No need to code to get all those features.
  * I can easily convert the test metadata to any format I/my boss like - PDF, RTF, HTML, etc`.
  * With all this, if one day I'll decide that SPTF is not good enough, I can migrate to other testing framework without changing my code. Of course it depends on the 'other testing framework' ..

## Why SPTF is NOT good for me ? ##
  * I already have 10000 test cases.
  * My testing code is written in Perl and in OO way (although Sub::Exporter or Class::Exporter may solve this limitation)
  * I think that creating and maintaining additional information about each test case is an overkill task.
  * I already manage my tests information using other software.
  * I don't know yet, but I'll find something.

## Isn't SPTF just another test runner ? ##
It is. But not like the others, SPTF can manage its own tests. More about this in the [Introduction](Introduction.md).

## Isn't SPTF just another test manager ? ##
It is. But not in the manner of Testopia/Testlink for example. In SPTF each test has its own metadata. I opposite to the other test managers, where either you'll have to manually sign the test result or you'll have to use some external API to do this, SPTF can execute the tests and report the results according to its metadata. More about this in the [Introduction](Introduction.md).