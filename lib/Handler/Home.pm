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
  template 'home/index.tt', { %context }, { layout => 'blank.tt' };
};

1;
