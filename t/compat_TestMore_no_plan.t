#!/usr/bin/perl

use 5.008000;
use strict;
use warnings;
use Test::ShellScript;
use Test::More;

sub getCmdLine() {
	use Cwd 'abs_path';
	
	my @path = split '/', $0;
	pop @path; ## extract filename
	my $myPath = join '/', @path;
	$myPath = abs_path($myPath);
	
	return "$myPath/../samples/run.sh ls";
}

my $testNUmber = 1;
### --- step by step mode
run_ok(getCmdLine(), "^TEST:");
$testNUmber++;
isCurrentVariable("params");

### using Test::More
ok($testNUmber == 2);

### Back again to Test::ShellScript !!!
isCurrentValue("ls");
