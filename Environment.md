﻿#summary Short introduction to SPTF



## **SPTF** environment and dependencies ##

**SPTF** should supply certain directory structure.

```
# tree -d -L 1 sptf/
sptf/
|--bin
|--config
|--lib
|--scenarios
`--tests

```

... where:

|`bin/`|-| the "binary" test cases.|
|:-----|:|:------------------------|
|`config/`|- |directory for all configuration files used by the tests.|
|`lib/`|- |the testing code.|
|`scenarios/`|- |scenarios metadata.|
|`tests/`|- |test cases metdata.|


---


NOTE: **SPTF** unit tests are written in **SPTF**. They may be used as an example.


---


### Dependencies ###

**SPTF** was proved to work correctly under:

_OS_

  * Gentoo
  * RHE 4
  * Centos 4.4
  * WinXP (currently there is an [issue](http://code.google.com/p/sptf/issues/detail?id=5))

_Perl versions_

  * 5.8.5
  * 5.8.7
  * 5.8.8

_Perl modules required or optional_

  * Test::Builder
  * Text::ASCIITable (optional)
  * Time::Elapse (optional)

(Other modules used by **SPTF** suppose to be the core modules)