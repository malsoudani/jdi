package JDI::Cleaner;
use base qw( CLI::Framework::Command );
use Data::Dumper;

sub usage_text { q{
    clean [--titles-only] <search regex>: search a journal
} }

sub option_spec { }

sub validate {
    my ($self, $opts, @args) = @_;
    # die "exactly one argument required (search regex)" unless @args == 1;
}

sub run {
    my ($self, $opts, @args) = @_;
    opendir my $dir, '.' or die "can't open the current directory: $!\n";

    # lets read some directory names into @dir_names
    my @dir_names = readdir $dir or die "Unable to read the current dir: $!\n";
    print Dumper \@dir_names;

    foreach my $dir (@dir_names) {
        next if ($dir eq '.' || $dir eq '..');

        if (-d $dir) {
            print "found a directory: $dir\n";
            next;
        }
    }
}
1;
