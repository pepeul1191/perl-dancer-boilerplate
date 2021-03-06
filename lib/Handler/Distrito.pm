package Handler::Distrito;
use Dancer2;
use utf8;
use JSON;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
use Config::Database;
use Config::Schema;
#use Data::Dumper;
hook before => sub {
  #print Filter::Acl::alc(request);
};

get '/listar/:provincia_id' => sub {
  my $rpta = '';
  my $status = 200;
  my $provincia_id = route_parameters->get('provincia_id');
  eval {
    my @rs = $Config::Database::DB
      ->resultset('Distrito')
      ->search(
        {
          provincia_id => $provincia_id,
        },{
          columns => ['id', 'nombre'],
        }
      );
    my @temp = ();
    for my $r(@rs){
      push @temp, {
        id => $r->id,
        nombre => $r->nombre,
      }
    }
    $rpta = \@temp;
  };
  if($@ ne ''){
    my %temp = (
      tipo_mensaje => 'error',
      mensaje => [
        'Se ha producido un error en listar los distritos',
        $@->{'msg'},
      ],
    );
    $status = 500;
    $rpta = \%temp;
  }
  status $status;
  return Encode::decode('utf8', JSON::to_json($rpta));
};

get '/buscar' => sub {
  my $rpta = '';
  my $status = 200;
  my $nombre = query_parameters->get('nombre');
  eval {
    my @rs = $Config::Database::DB
      ->resultset('VWDistritoProvinciaDepartamento')
      ->search_like(
        {
          nombre => $nombre . '%',
        },{
          rows => 10,
          columns => ['id', 'nombre'],
        }
      );
    my @temp = ();
    for my $r(@rs){
      push @temp, {
        id => $r->id,
        nombre => $r->nombre,
      }
    }
    $rpta = \@temp;
  };
  if($@ ne ''){
    my %temp = (
      tipo_mensaje => 'error',
      mensaje => [
        'Se ha producido un error en buscar los distritos',
        $@->{'msg'},
      ],
    );
    $status = 500;
    $rpta = \%temp;
  }
  status $status;
  return Encode::decode('utf8', JSON::to_json($rpta));
};

any qr{.*} => sub {
  my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/404';
  redirect $url;
};

1;
