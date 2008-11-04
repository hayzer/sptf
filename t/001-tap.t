# Testing TAP output
use Test::TAP tests => 3;

#---------------------------------------------------------------------------
#  Check single test output
#---------------------------------------------------------------------------
my $out = qx{./sptf --run --test-id 1};
is_passing_tap $out, "Single test case TAP";

#---------------------------------------------------------------------------
#  Double test case TAP
#---------------------------------------------------------------------------
$out = qx{./sptf --run --test-id 1,2};
is_passing_tap $out, "Two test cases TAP";

#---------------------------------------------------------------------------
#  Scenario TAP
#---------------------------------------------------------------------------
$out = qx{./sptf --run --scenario-id 1};
is_passing_tap $out, "Scenario TAP";

