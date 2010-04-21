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

run_ok(getCmdLine(), "^TEST:");

### --- continuous time flow mode
reset_timeline();
variable_ok("executed", "false");
variable_ok("executed", "true");

reset_timeline();
variable_ok("params", "ls");
variable_ok("executed", "false");
variable_ok("executed", "true");
variable_ok("output", "0");
