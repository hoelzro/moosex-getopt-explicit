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

# ABSTRACT: A short description of MooseX::Getopt::Explicit

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 FUNCTIONS

=head1 SEE ALSO

=cut
