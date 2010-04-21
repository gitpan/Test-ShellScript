#!/usr/bin/perl

use 5.010000;
use strict;
use warnings;
use Test::ShellScript;


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
isCurrentValue("ls");
isCurrentVariable("params");
isCurrentValue("ls");

nextSlot();
isCurrentVariable("executed");
isCurrentValue("false");

nextSlot();
isCurrentVariable("executed");
isCurrentValue("true");

nextSlot();
isCurrentVariable("output");
isCurrentValue("0");
