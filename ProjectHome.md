**This project is depreciated!!!**
I don't work on this anymore because frankly, I think the idea was not that good..

**SPTF** stands for Simple Perl Testing Framework.
**SPTF** is a single file application that combines together test management and test
execution. Each test case has its own metadata to describe it and to define the way how it will be executed. No more complex file names and nested directories to describe and manage your tests. Test cases can be bunch together into test scenarios. **SPTF** manage and
execute test cases and test scenarios according to this metadata. With all this, **SPTF** is
totally separated from the testing code. Originally **SPTF** was created to execute tests
written in Perl only, but now it can handle tests written in other langauges as well.
**SPTF** prints out the test results in [TAP](http://testanything.org/wiki/index.php/Main_Page)
format. More info on wiki and the best place to start is [here](WhySPTF.md).

# Current Features #

  * execute tests written in different languages
  * execute multiple test cases and scenarios
  * test report is in [TAP](http://testanything.org/wiki/index.php/Main_Page) format
  * easily available information about the test cases and scenarios,like
    1. description
    1. summary
    1. who's executing the test
    1. what are the parameters of the test
    1. summary of test cases in given scenario
    1. author
    1. date
  * easy to create new scenarios from the existing test cases
  * execute test cases by their priorities
  * search test cases by keywords
  * quit on failure is configurable per test case
  * execute pre-test and post-test case operations
  * dependency between test cases within given scenario
  * skip execution of chosen test case
  * pass broken test (i.e you may add new test case before the testing code is actually ready)

# Upcoming features and ideas #
  * [future](Future.md)