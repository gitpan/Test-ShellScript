#!/usr/bin/perl

use 5.008000;
use strict;
use warnings;
use Test::ShellScript;
use Test::More tests => 6;

sub getCmdLine() {
	use Cwd 'abs_path';
	
	my @path = split '/', $0;
	pop @path; ## extract filename
	my $myPath = join '/', @path;
	$myPath = abs_path($myPath);
	
	return "$myPath/../samples/run.sh ls";
}

### --- step by step mode
run_ok(getCmdLine(), "^TEST:");
isCurrentVariable("params");

### using Test::More
ok(1);
isnt(1, 2, "ddddddddddd");
is (1, 1, "ssssssssss");

### Back again to Test::ShellScript !!!
isCurrentValue("ls");
