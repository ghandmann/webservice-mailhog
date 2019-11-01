#!perl -T
use 5.010;
use strict;
use warnings;
use Test::Most;
use WebService::Mailhog;
use Data::Dumper;
use WebService::Mailhog::MockUserAgent;

subtest 'die on unsuccessfull http status code' => sub {
    my $mockUA = WebService::Mailhog::MockUserAgent->new(code => 400);

    my $mh = WebService::Mailhog->new(mailhogHost => "http://localhost:32768", ua => $mockUA);

    dies_ok { $mh->search("from", "xdxxxx") };
};

subtest 'works with empty json response' => sub {
    my $mockUA = WebService::Mailhog::MockUserAgent->new(code => 200, body => "{}");

    my $mh = WebService::Mailhog->new(mailhogHost => "http://localhost:32768", ua => $mockUA);

    lives_ok { $mh->search("from", "xdxxxx") };
};


done_testing;
