package WebService::Mailhog;

use Mojo::Base -base;
use Mojo::UserAgent;
use Mojo::URL;
use Mojo::JSON qw/j/;

has mailhogHost => sub { die "Required 'mailhogHost' parameter to new missing" };

has ua => sub { Mojo::UserAgent->new() };

sub messages {
  my $self = shift;
  my $start = shift || 0;
  my $limit = shift || 10;

  my $query = Mojo::URL->new($self->mailhogHost);
  $query->path("/api/v2/messages");
  $query->query(start => $start, limit => $limit);

  my $res = $self->ua->get($query)->res;
  if($res->is_error) {
    die "HTTP Request to mailhog failed!";
  }

  $res->json;
}

sub search {
  my $self = shift;
  my $kind = shift || die "missing required parameter 'kind'";
  my $query = shift || "";
  my $start = shift || 0;
  my $limit = shift || 10;

  my $requestURL = Mojo::URL->new($self->mailhogHost);
  $requestURL->path("/api/v2/messages");
  $requestURL->query(kind => $kind, query => $query, start => $start, limit => $limit);

  my $res = $self->ua->get($requestURL)->res;
  if($res->is_error) {
    die "HTTP Request to mailhog failed!";
  }

  $res->json;
}

=head1 NAME

WebService::Mailhog - The great new WebService::Mailhog!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WebService::Mailhog;

    my $mailHog = WebService::Mailhog->new(mailHogUrl => "http://your.mailhog.api:8025");
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Sven Eppler, C<< <cpan at sveneppler.de> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-WebService-mailhog at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=WebService-Mailhog>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WebService::Mailhog


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=WebService-Mailhog>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WebService-Mailhog>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/WebService-Mailhog>

=item * Search CPAN

L<https://metacpan.org/release/WebService-Mailhog>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2019 by Sven Eppler.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1; # End of WebService::Mailhog
