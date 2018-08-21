package Model::Provincia;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('provincias');
__PACKAGE__->add_columns(qw/ id nombre departamento_id /);
__PACKAGE__->set_primary_key('id');
#__PACKAGE__->has_many(cds => 'MyApp::Schema::Result::CD', 'artistid');

1;
