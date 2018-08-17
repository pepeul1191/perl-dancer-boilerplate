package Handler::Home;
use Dancer2;
use Config::Constants;
use Config::Helpers;
use Config::Database;
use Helper::Home;

use Data::Dumper;

hook before => sub {
  response_header 'X-Powered-By' => 'Perl Dancer 1.3202, Ubuntu';
  #print Filter::Acl::alc(request);
};

get '/' => sub {
  my $helper = \%Config::Helpers::ViewHelpers;
  my $HomeHelper = \%Helper::Home::HomeHelper;
  my %context = (
    title  => 'Animalitos Perl',
    menu => '[{"url":"#/","nombre":"Home"},{"url":"#/buscar","nombre":"Buscar"},{"url":"#/contacto","nombre":"Contacto"}]',
    data  => '""',
    css => $helper->{'loas_css'}($HomeHelper->{'index_css'}()),
    js => $helper->{'load_js'}($HomeHelper->{'index_js'}()),
    qunit => 1
  );
  print("1 ++++++++++++++++++++++++++++++++");
  my $row = $Config::Database::teng->single('departamentos' =>
    {
      id => 10
    }
  )->{'row_data'};
  print("\n");print Dumper($row);print("\n");
  my @rs = $Config::Database::teng->search('departamentos');
  my @departamentos = ();
  for my $r(@rs){
    push @departamentos, $r->{'row_data'};
  }
  print("2 ++++++++++++++++++++++++++++++++");
  print("\n");print Dumper(@departamentos);print("\n");
  print("3 ++++++++++++++++++++++++++++++++");
  #template 'home/index.tt', {%context}, { layout => 'site.tt' };
  template 'home/index.tt', {%context}, { layout => 'blank.tt' };
};

1;
