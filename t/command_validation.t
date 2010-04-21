#!/usr/bin/perl

use 5.010000;
use strict;
use warnings;
use Test::ShellScript;

run_ok('ls', "^TEST:");
