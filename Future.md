 Short list of features I plan to add to SPTF

  * Support for Win32
  * Support for class + method execution style in other languages (Ruby, Python, etc).
  * Replace metadata format (YAML) with other format. Probably using Config:Std (?).
  * Split more code into subroutines. One day SPTF will became a class maybe.
  * Split current help into short help and more verbose man.
  * Method parameters within metadata should be any data structure and not only array (damn!).
  * **Plugin capability**. Load dynamically module to do something with the executed test<br>entity (case,scenario,test result) or maybe some other stuff as well. Thus all fancy presentation and execution methods may use CPAN modules but the core (basic usage) still will be clean of them.<br>
<ul><li>Database to archive test results. (I'm not sure about this now).<br>
</li><li>'quiet' option for the test session. No test results goes to the output. Only return code.<br>
</li><li>Configurable timeout for each test case.<br>
</li><li>Stash mechanism for Perl based test cases. Currently the first parameter passed to the test case is TC summary from the metadata.<br>I want to replace it with Catalyst 'like' stash mechanism. Thus the first parameter passed to the TC method will be a hashref.<br>
<pre><code>sub test_case {<br>
   my ($stash,$parameters) = @_;<br>
}<br>
</code></pre>
</li></ul><blockquote><br>Its default value will be the test case details, so one will be able to use them as will in the test case code.<br>
<pre><code>print Dump $stash;<br>
# $HASH1 = {<br>
  id =&gt; 102,<br>
  summary =&gt; "This is my test case summary",<br>
  tags =&gt; [<br>
     'sanity',<br>
     'regression',<br>
  ],<br>
  etc`,<br>
}<br>
</code></pre>
<blockquote><br>But it can take with also any data to be passed to the other TC.<br>
</blockquote></blockquote><ul><li>Count time for each test case<br>
<pre><code> # ./sptf --run --scenario-id 10 --total-tc-time<br>
 ok - [1] my great test <br>
 # Total time TC[1]: 0:12:34.402<br>
 ok - [2] my other test<br>
 # Total time TC[2]: 0:00:01.321<br>
</code></pre>
</li><li><b>Failure reaction</b>. Configurable option to execute additional operation when test case failed. (<i>onfailure</i> tag)<br>
</li><li><b>Coverage</b>. New tag in metadata - feature. I assume that running all tests with given feature will<br>give 100% coverage for this feature. Disputable, but currently I like the idea.<br>
<pre><code> # ./sptf --run --scenario-id 10 --coverage<br>
   ........<br>
   TAP test results<br>
   ........<br>
# +---------+----------+-------------+--------------+<br>
# | Feature | Total TC | Executed TC | Coverage (%) |<br>
# +---------+----------+-------------+--------------+<br>
# |   DB    |   130    |    103      |      79      |<br>
# +---------+----------+-------------+--------------+<br>
# |  GUI    |   200    |    200      |     100      |<br>
# +---------+----------+-------------+--------------+<br>
# |  CLI    |    50    |      1      |     0.2      |<br>
# +---------+----------+-------------+--------------+<br>
</code></pre>
</li></ul><blockquote>Maybe successful statistics should be part of the coverage.<br>For less optimistic between us.(?)<br>
<pre><code># +---------+----------+-------------+------------|--------------+<br>
# | Feature | Total TC | Executed TC | Passed TC  | Coverage (%) |<br>
# +---------+----------+-------------+------------|--------------+<br>
# |   DB    |   130    |    103      |    100     |      77      |<br>
# +---------+----------+-------------+---------------------------+<br>
# |  GUI    |   200    |    200      |     20     |      10      |<br>
# +---------+----------+-------------+---------------------------+<br>
# |  CLI    |    50    |      1      |      0     |       0      |<br>
# +---------+----------+-------------+---------------------------+<br>
</code></pre>
The table output should be TAP compatible.<br>
</blockquote><ul><li><b>Showstopper</b>. Showstopper is test case ID where upon its failure, the whole test scenario will stop.<br>
</li><li><b>Dependency on failure</b>. Lets say, test case 2 depend on failure of test case 1. If test case 1 fail, test case 2 won't be executed and will report failure. Array of test cases should be supported.<br>
</li><li>Executing test cases/scenarios by given tag(s).<br>
</li><li>Logical operations on tags (thanks, Blumzi).<br>
<pre><code> # ./sptf --run --test-tag (sanity and not regression) and (server or client)<br>
</code></pre>
</li></ul><blockquote>or<br>
<pre><code> # ./sptf --show-summary --test-tag (customer or acceptance)<br>
</code></pre>
</blockquote><ul><li>Executing test cases by given author.<br>
</li><li>Allow certain number of failures in test scenario. Will overwrite the continuity option in test case.<br>
</li><li>Multiple ID test case dependency.<br>
</li><li>Show in which scenarios appears given test case.<br>
<pre><code> # ./sptf --show-scenario --test-id 102<br>
 TC[102] appears in scenarios: 1,15,23<br>
</code></pre>
</li><li>Execute given program before running the test, quit the test if pre program failed (sic?)<br>
<pre><code> # ./sptf --run --pre-test pre/create-env.pl --scenario-id 1<br>
</code></pre>
</li><li>Execute given program after the test. (<i>--post-test</i>)<br>
</li><li>Cancel pre/post requisite operations in test case. This way you may run the same test case once within scenario<br>where test cases depend each on another, but also in the random manner<br>where pre/post operation would build and destroy specific test case environment (fixture testing).<br>
<pre><code> # ./sptf --run --test-id 1,2,3,4 --no-prereq --no-postreq<br>
</code></pre>
</li></ul><blockquote>or<br>
<pre><code> # ./sptf --run --scenario-id 1 --no-prereq --no-postreq<br>
</code></pre>
</blockquote><ul><li>Cancel test cases dependency<br>
<pre><code> # ./sptf --run --scenario-id 1 --no-tc-dependency<br>
</code></pre>
</li><li>Execute specific test cases in random mode. (shuffle)<br>
<pre><code> # ./sptf --run --all-tests --shuffle --test-id 1,2,3,4<br>
</code></pre>
</li><li>Execute random number (in the range) of test cases from the entire pull of test cases in random way<br>
<pre><code> # ./sptf --run --all-tests --shuffle --min 10 --max 200<br>
</code></pre>
</li><li>Execute exact number of test cases for the entire test cases pull in random way.<br>
<pre><code> # ./sptf --run --all-tests --shuffle --min 256 --max 256<br>
</code></pre>
</li><li>The same way for the entire scenarios pull as well<br>
<pre><code> # ./sptf --run --shuffle --min 5 --max 10 --all-scenarios<br>
</code></pre>
</li><li>Execute random test cases based on shuffle family (tag in metadata). For example<br>
<pre><code> # ./sptf --run --shuffle-family 1,4,3 --min 10 --max 20 --all-tests<br>
</code></pre>
</li></ul><blockquote>will pick random test case from shuffle family 1 and execute, then random test case from shuffle family 2 and execute and so on 1 to 10 times (random).<br>It's good when test cases in only certain group of tests may be execute independently one from another. (I'm not sure about this)<br>
</blockquote><ul><li>Maybe even to run specific number of test cases/scenarios for each shuffle family<br>
<pre><code> # ./sptf --run --shuffle-family 1:10,4:2,3:1024 --all-tests<br>
</code></pre>
</li></ul><blockquote>will pick random 10 test cases from shuffle family 1 and execute them, then 2 test cases for shuffle family 4 and so on.<br>
</blockquote><ul><li>Current meta-scenario syntax is not build for the <b>shuffle</b> stuff. Fix it.<br>
</li><li>Any environmental variable maybe import into the test environment. May be helpful for example<br>with layered TAP diagnostics in Test Builder mode or for setting up logging layers.<br>
<pre><code> # ./sptf --run --test-id 1,2,3,4 --env-var DO_TRACE --env-var DEBUG_LEVEL=4<br>
</code></pre>
</li><li>Test scenario will support continuity option.<br>
</li><li>Show all test cases/scenarios belongs to given author.<br>
<pre><code> # ./sptf --show-tests --author me<br>
# +--------+-------------------------------+<br>
# | Author | Test ID                       |<br>
# +--------+-------------------------------+<br>
# | me     | 1,2,3,4,5,19,20,44,100,230,23 |<br>
# +--------+-------------------------------+<br>
</code></pre>
</li><li>Check if the method belongs to the class before it's execute. Report TAP on failure.<br>
</li><li><b>Test duration</b>. Each test case will have the metadata tag - <i>duration</i>. If so, <b>SPTF</b> will be able to supply several services.<br>
<pre><code> # ./sptf --show-duration --scenario-id 1<br>
 This scenario will durate: 0:31:44.302<br>
</code></pre>
</li></ul><blockquote>or<br>
<pre><code> # ./sptf --run --shuffle --all-tests --no-longer-then 30min<br>
</code></pre>
will execute random number of test cases with total runtime less then 30min.<br>
</blockquote><ul><li>Show all bugs and the TC ids they belongs to<br>
<pre><code> # ./sptf --show-all-bugs<br>
# +-------+---------+<br>
# | Bug   | Test ID |<br>
# +-------+---------+<br>
# | 00123 |   1     |<br>
# +-------+---------+<br>
# | 00442 |  107    |<br>
# +-------+---------+<br>
</code></pre></li></ul>

<ul><li>Show TC id for given bug ID<br>
<pre><code> # ./sptf --show-tc-id --bud-id 00442<br>
# +-------+---------+<br>
# | Bug   | Test ID |<br>
# +-------+---------+<br>
# | 00442 |  107    |<br>
# +-------+---------+<br>
</code></pre>
</li><li>Don't execute given TC<br>
<pre><code> # ./sptf --run --scenario 1 --dont-run 20,23,38<br>
</code></pre>
</li></ul><blockquote>will execute test scenario 1 but without test cases 20,23,38<br>
</blockquote><ul><li>Goto given TC upon the failure of TC while running TS. No test plan should be used. Tag in metadata: <b>goto: 30</b>. If TC failed, next executed TC will have ID 30</li></ul>

Some ideas here may oppose one to another. Maybe each one will have its importancy level, to avoid conflicts.