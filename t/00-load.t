#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'WebSerice::Mailhog' ) || print "Bail out!\n";
}

diag( "Testing WebSerice::Mailhog $WebSerice::Mailhog::VERSION, Perl $], $^X" );
