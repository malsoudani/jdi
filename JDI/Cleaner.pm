package JDI::Cleaner;
use base qw( CLI::Framework::Command );
use Data::Dumper;
use Cwd;

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
    return scan_dir(@args);
}

sub scan_dir {
    my $target_dir = shift;
    my $start_dir = cwd;

    chdir $target_dir or die "Unable to open $target_dir: $!\n";
    opendir my $dir, '.' or die "can't open the current directory: $!\n";

    # lets read some directory names into @dir_names
    my @dir_names = readdir $dir or die "Unable to read the current dir: $!\n";
    print Dumper \@dir_names;
    close $dir; #close the filehandle we don't need it anymore

    foreach my $name (@dir_names) {
        next if ($name eq '.' || $name eq '..');

        if (-d $name) { # is this name a directory?
            scan_dir($name);
            next;
        }

        if ($name eq 'core') {
            if (defined $r) {
                unlink $name or die "Unable to delete $name: $!\n"
            } else {
                print "found one in $target_dir: $!\n";
            }
        }
    }
    chdir $start_dir or die "Unable to return to $start_dir: $!\n";
}

1;
