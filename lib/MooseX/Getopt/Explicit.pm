## no critic (RequireUseStrict)
package MooseX::Getopt::Explicit;

## use critic (RequireUseStrict)
use Moose::Role;

with 'MooseX::Getopt';

around _compute_getopt_attrs => sub {
    my ( $orig, $self, @args ) = @_;

    my @attrs = $self->$orig(@args);

    return grep {
        $_->does('MooseX::Getopt::Meta::Attribute::Trait')
    } @attrs;
};

1;

__END__

# ABSTRACT: MooseX::Getopt, but without implicit option generation

=head1 SYNOPSIS

  use Moose;
  with 'MooseX::Getopt::Explicit';

  has foo => (
    is => 'rw',
  ); # Does *not* cause a Getopt option to be generated!

  has bar => (
    is     => 'ro'
    isa    => 'Str',
    traits => ['Getopt'],
  ); # *Does* cause a Getopt option to be generated!

=head1 DESCRIPTION

B<NOTE> I didn't know about L<MooseX::Getopt::Strict> when I wrote this; use
that instead!

L<MooseX::Getopt> is nice, but I don't care for how it creates a command
line option for every attribute in my classes unless explicitly overridden.
So this role does the opposite: it requires C<traits =E<gt> ['Getopt']> in
order for a command line option to be generated.

=head1 SEE ALSO

L<MooseX::Getopt>

=cut
