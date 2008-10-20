package My::Test;
#===============================================================================
#
#         FILE:  Test.pm
#
#  DESCRIPTION:  Example of test class for SPTF 
#
#        FILES:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Thomas Maier (), <hayzer@gmail.com>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  10/18/08 23:18:22 IST
#     REVISION:  ---
#===============================================================================
use strict;
use warnings;

use base qw(Exporter);

our @EXPORT = qw(does_file_exists);


sub does_file_exists {
	my ($file) = @_;

	(-e $file) ? 0 : 1;
}

1;

