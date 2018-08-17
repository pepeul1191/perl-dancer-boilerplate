package Handler::Departamento;
use Dancer2;
use utf8;
use JSON;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
use Try::Tiny;
use Config::Constants;
use Config::Helpers;
use Config::Database;
use Helper::Home;

use Data::Dumper;

hook before => sub {
  response_header 'X-Powered-By' => 'Perl Dancer 1.3202, Ubuntu';
  #print Filter::Acl::alc(request);
};

get '/listar' => sub {
  my $rpta = '';
  my $status = 200;
  try{
    my $db = Config::Database::connection;
    my @rs = $db->search('departamentos');
    my @temp = ();
    for my $r(@rs){
      push @temp, $r->{'row_data'};
    }
    $rpta = \@temp;
  }catch {
    my %temp = (
      tipo_mensaje => 'error',
      mensaje => [
        'Se ha producido un error en listar los departamentos',
        $_,
      ],
    );
    $status = 500;
    $rpta = \%temp;
  };
  status $status;
  return Encode::decode('utf8', JSON::to_json($rpta));
};

1;
