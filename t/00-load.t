#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'WebService::Mailhog' ) || print "Bail out!\n";
}

diag( "Testing WebService::Mailhog $WebService::Mailhog::VERSION, Perl $], $^X" );
