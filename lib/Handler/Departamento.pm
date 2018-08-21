package Handler::Departamento;
use Dancer2;
use utf8;
use JSON;
use JSON::XS;
use Try::Tiny;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
use Config::Database;
use Config::Schema;
use Data::Dumper;
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

post '/guardar' => sub {
  my $self = shift;
  my $data = JSON::XS::decode_json(Encode::encode_utf8(param('data')));
  my @nuevos = @{$data->{"nuevos"}};
  my @editados = @{$data->{"editados"}};
  my @eliminados = @{$data->{"eliminados"}};
  my @array_nuevos;
  my %rpta = ();
  try {
    for my $nuevo(@nuevos){
      if ($nuevo) {
        my $temp_id = $nuevo->{'id'};
        my $nombre = $nuevo->{'nombre'};
        my $pais_id = $nuevo->{'pais_id'};
        my $temp = $Config::Database::DB->resultset('Departamento')->create({
          nombre => $nombre,
        });
        my %temp = ();
        $temp{'temporal'} = $temp_id;
        $temp{'nuevo_id'} = $temp->{'_column_data'}->{'id'};
        push @array_nuevos, {%temp};
      }
    }
    for my $editado(@editados){
      if ($editado) {
        my $id = $editado->{'id'};
        my $nombre = $editado->{'nombre'};
        $Config::Database::DB->resultset('Departamento')->search({
          id => $id,
        })->update({
          nombre => $nombre,
        });
      }
    }
    for my $eliminado(@eliminados){
      $Config::Database::DB->resultset('Departamento')->search({
        id => $eliminado,
      })->delete;
    }
    $rpta{'tipo_mensaje'} = "success";
    my @temp = ("Se ha registrado los cambios en los departamentos", [@array_nuevos]);
    $rpta{'mensaje'} = [@temp];
    #$Departamento->commit();
  } catch {
    #warn "got dbi error: $_";
    $rpta{'tipo_mensaje'} = "error";
    my @temp = ("Se ha producido un error en guardar la tabla de departamentos", "" . $_);
    $rpta{'mensaje'} = [@temp];
    #$Departamento->rollback();
  };
  #print("\n");print Dumper(%rpta);print("\n");
  return Encode::decode('utf8', JSON::to_json \%rpta);
};

any qr{.*} => sub {
  my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/404';
  redirect $url;
};

1;
