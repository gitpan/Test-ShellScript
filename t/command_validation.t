#!/usr/bin/perl

use 5.008000;
use strict;
use warnings;
use Test::ShellScript;

run_ok('ls', "^TEST:");
