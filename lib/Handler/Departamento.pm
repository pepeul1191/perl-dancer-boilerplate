package Handler::Departamento;
use Dancer2;
use utf8;
use JSON;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
use Try::Tiny;
use Config::Database;
use Config::Schema;
use Helper::Home;
#use Data::Dumper;

hook before => sub {
  #print Filter::Acl::alc(request);
};

get '/listar' => sub {
  my $rpta = '';
  my $status = 200;
  eval {
    my @rs = $Config::Database::DB->resultset('Departamento')->all;
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

1;
