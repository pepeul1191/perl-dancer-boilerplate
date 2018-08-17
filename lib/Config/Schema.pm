package Config::Schema;
use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_namespaces(
  result_namespace => '+Model',
);

1;
