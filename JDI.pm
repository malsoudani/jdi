package JDI;
use base qw( CLI::Framework );

sub usage_text { q{
    $0 [--verbose|v]

    OPTIONS
        --db [path]  : path to SQLite database file
        -v --verbose : be verbose
        -h --help    : show help

    COMMANDS
        help        - show application or command-specific help
        menu        - print command menu
        console     - start a command console for the application
}}

sub option_spec {
    [ 'help|h'      => 'show help' ],
    [ 'verbose|v'   => 'be verbose' ],
    [ 'db=s'        => 'path to SQLite database file' ],
}

sub command_map {
    help    => 'CLI::Framework::Command::Help',
    menu    => 'My::Journal::Command::Menu',
    console => 'CLI::Framework::Command::Console',
}

sub command_alias {
    h   => 'help',
    m   => 'menu',
    sh  => 'console',
    c   => 'console',
}

sub init {
    my ($self, $opts) = @_;
    return 1;
}

1;
