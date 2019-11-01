package WebService::Mailhog::MockUserAgent;
use Mojo::Base -base;

has body => "";
has code => 200;

has _mockedRes => sub {
    my $self = shift;
    my $res = Mojo::Message::Response->new(code => $self->code);
    $res->body($self->body);

    return $res;
};

sub get {
    my $self = shift;
    return $self;
}

sub res {
    my $self = shift;
    return $self->_mockedRes;
}

1;