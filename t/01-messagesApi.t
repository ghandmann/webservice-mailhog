#!perl -T
use 5.010;
use strict;
use warnings;
use Test::More;
use WebSerice::Mailhog;
use Data::Dumper;

my $mh = WebSerice::Mailhog->new(mailhogHost => "http://localhost:32768");

my $message = $mh->search("from", "xdxxxx");
say Dumper $message;