#summary Short introduction to SPTF



## Background ##

## SPTF Flow ##

![http://www.fileden.com/files/2008/8/31/2074614/My%20Documents/sptf-flow.jpg](http://www.fileden.com/files/2008/8/31/2074614/My%20Documents/sptf-flow.jpg)

## Test Case Definition ##

For SPTF user, test case is represented by single file. It's in YAML format and contains
information<br>that is used by SPTF in the execution as well as in management manner.<br>
Some of this information is necessary to execute the test case,<br>
some is helpful in the interaction between test cases and some may be used to management<br>
the test case.<br>
Let's take a look on the format of such a file and define each metadata it may care with.<br>
<br>
<pre><code><br>
---<br>
author:       # Who create this test case<br>
date:         # When it happen <br>
continuity:   # In case of failure, do we want to continue ? 0 for yes, 1 for no.<br>
description: |<br>
             # here comes a detailed definition of what we're doing in this<br>
             # specific test case, i.e. what this test case is about, what are its<br>
             # parameters, what is the expected result, etc`.<br>
             # You maybe verbose here as much as you desire. And you should ...<br>
executor:    # What code is actually executing this test case. Here there are<br>
             # 2 options:<br>
             # - the Perl way<br>
			 <br>
class:       # name of the Perl module to be loaded<br>
             # should be placed in lib/<br>
method:      # name of the test method<br>
  <br>
             # or ..<br>
<br>
binary:      # name of the binary file with the test<br>
             # should be placed in bin/<br>
id:          # test case ID<br>
parameters:  # method agruments<br>
 - arg1<br>
 - arg2<br>
dependency:  # ID of some other test case on which this one<br>
             # is depend on<br>
bug:         # ID (or string) of the bug this test case is<br>
             # reproducing<br>
prereq:      # name of the binary file to execute before<br>
             # this test case, should be placed in prereq/<br>
postreq:     # same as above, running after this test case<br>
priority:    # test case priority<br>
skip:        # skip execution of this test (1 to skip)<br>
summary:     # short description of this test case<br>
tags:        # keyword description of this test case<br>
  - tag1<br>
  - tag2<br>
todo:        # using this if code for this test case<br>
             # does not exists yet<br>
<br>
</code></pre>

Each of this parameters maybe viewed using <i>sptf</i> driver through its<br>
own <code>--show-</code> flag.<br>
<br>
<h2>Create Test Case in Perl</h2>

<h2>Create Test Case in other language</h2>

<h2>What is Test Scenario ?</h2>

Basically it's very similar in concept to the test case. It's YAML file<br>
as well.<br>
<br>
<h2>Create Test Scenario metadata</h2>

<h2>Start to use it</h2>

Now we can watch the summary of each test case within the newly created<br>
scenario, you may say to verify it:<br>
<br>
<pre><code># ./sptf --show-tc-summary --scenario-id 1<br>
</code></pre>

If you already forgot what this scenario is about:<br>
<br>
<pre><code># ./sptf --show-description --scenario-id 1<br>
</code></pre>

To execute the test scenario we've just create:<br>
<br>
<pre><code># ./sptf --run --scenario-id 1<br>
</code></pre>

<h2>Why TAP ?</h2>

While writing testing framework or any framework that should report something,<br>at some point you have to decide what kind of report your framework will use.<br>
Some says - even a bad framework will be popular if its reporting system is good looking.<br> So why TAP and not some 'yet another' fancy HTML coolness ?<br>
It's because:<br>
<br>
<ol><li>It's a protocol and as such any language can produce it easily<br>
</li><li>It separate report creation from its presentation. Once you've TAP output in your test, you may parse it and create any report you can only imagine.<br>
</li><li>TAP already have some parsers (CLI as well HTML) that creates really nice test result reports.</li></ol>

So SPTF tests produce TAP output. It depends on you what to do with it.<br>
<br>
<h2>The other mode SPTF can work in</h2>

As we already know, testing facilities in SPTF are very basic.<br>SPTF will execute the test method and simple check (using <a href='http://cpan.uwinnipeg.ca/htdocs/Test-Simple/Test/More.html'>Test::More</a> <b>ok</b> function) its result,<br>if it was true or false. In some cases, it may not be sufficient.<br>Perl has very rich testing framework, why not to use it in our tests ?<br>
This is why SPTF offer a different mode of work, Test Builder mode. In our code we can use <a href='http://cpan.uwinnipeg.ca/htdocs/Test-Simple/Test/Builder.html'>Test::Builder</a> class<br>to create our own TAP output. Now through the configuration file (<i>.sptfrc</i>) option <i>testbuilder</i> or using <i>--test-builder</i> flag<br> in CLI, we can ask SPTF simple to run this method without using SPTF internal testing mechanism (<b>STPF</b> will not verify the result with the <b>ok</b> function).<br>In Test Builder mode our tests will be much more flexible, exact and verbose if we need it.<br>
<br>
To put is shortly, if you have simple test returning 0 or 1 as result, don't bother - go for simple mode.<br>If you need more complex operation, data structure, file, etc` comparing and more verbose output (by default or on demand) - Test Builder mode is your friend.<br>
<br>
<b>NOTE: You can create and maintain test cases in both modes, but single test scenario may includes only</b><br>test cases of one kind. It has to be either simple mode or Test Builder mode!<br>(This way I can't create multilanguage test scenario,so probably I'll change it in the future)<br>
<br>
<h2>Create Test Case in Perl in Test Builder mode</h2>

<b>NOTE: In Test Builder mode, SPTF will pass to your function a string as a very first parameter!</b><br>This string is a combination of test case ID and its summary. It will let you to use it later in your methods code<br>s test case description or as any kind of diagnostic information.<br>Keep it in mind because ignoring this ugly hack may break your test!<br>(Of course as almost everything in SPTF, you may cancel this behavior by adding <i>adddefaultname => 1</i> option to the <b>.sptfrc</b> file).<br>
<pre><code># ./sptf --run --scenario-id 1 --test-builder <br>
</code></pre>