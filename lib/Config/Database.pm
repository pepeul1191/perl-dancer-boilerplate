package Config::Database;
use Teng;
use Teng::Schema::Loader;
use DBI;

sub connection {
  my $driver   = 'SQLite';
  my $database = 'db/ubicaciones.db';
  my $dsn = 'DBI:' . $driver . ':dbname=' . $database;
  my $userid = '';
  my $password = '';

  return Teng::Schema::Loader->load(
    dbh => DBI->connect(
      $dsn,
      $userid,
      $password,
      {
        RaiseError => 1
      }
    ),
    namespace => 'Model',
  );
}

1;
