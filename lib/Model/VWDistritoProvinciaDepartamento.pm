package Model::VWDistritoProvinciaDepartamento;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('vw_distrito_provincia_departamento');
__PACKAGE__->add_columns(qw/ id nombre /);
__PACKAGE__->set_primary_key('id');

1;
