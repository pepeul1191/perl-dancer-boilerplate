package Config::Database;
use Config::Schema;
use DBI;
use DBIx::Transaction;

my $driver   = 'SQLite';
my $database = 'db/ubicaciones.db';
my $dsn = 'DBI:' . $driver . ':dbname=' . $database;
my $userid = '';
my $password = '';
our $DB = Config::Schema->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
our $TX = DBIx::Transaction->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;

1;
