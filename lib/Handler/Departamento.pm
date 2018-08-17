package Handler::Departamento;
use Dancer2;
use utf8;
use JSON;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
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
  my @rs = $Config::Database::teng->search('departamentos');
  my @rpta = ();
  for my $r(@rs){
    push @rpta, $r->{'row_data'};
  }
  return Encode::decode('utf8', JSON::to_json \@rpta);
};

1;
