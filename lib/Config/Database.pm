package Config::Database;
use Teng;
use Teng::Schema::Loader;
use DBI;

my $driver   = "SQLite";
my $database = "db/ubicaciones.db";
my $dsn = "DBI:$driver:dbname=$database";
my $userid = "";
my $password = "";

$dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;

our $teng = Teng::Schema::Loader->load(
  dbh => $dbh,
  namespace => 'Model',
);

1;
