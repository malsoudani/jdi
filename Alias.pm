
package JDI::Alias;
use base qw( CLI::Framework::Command );

sub usage_text { q{
    aliasor [--titles-only] <search regex>: search a journal
} }

sub option_spec { (
    [ 'thing' => 'search only journal titles' ],
) }

sub validate {
    my ($self, $opts, @args) = @_;
die "exactly one argument required (search regex)" unless @args == 1;
}

sub run {
    my ($self, $opts, @args) = @_;

    my $db = $self->cache->get( 'db' );

    return $opts->{'thing'};
}
