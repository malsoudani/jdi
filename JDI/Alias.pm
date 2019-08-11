package JDI::Alias;
use base qw( CLI::Framework::Command );
use Data::Dumper;

sub usage_text { q{
    alias [--titles-only] <search regex>: search a journal
} }

sub option_spec { (
    [ 'thing' => 'testing thing' ],
) }

sub validate {
    my ($self, $opts, @args) = @_;
    die "exactly one argument required (search regex)" unless @args == 1;
}

sub run {
    my ($self, $opts, @args) = @_;

    print Dumper $opts->thing;
    print Dumper \@args;
    return @args;
}

1;
