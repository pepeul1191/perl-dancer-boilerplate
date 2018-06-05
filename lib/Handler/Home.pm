package Handler::Home;
use Dancer2;

hook before => sub {
    response_header 'X-Powered-By' => 'Perl Dancer 1.3202, Ubuntu';
    #print Filter::Acl::alc(request);
  };

get '/' => sub {
  my %context = (
    'title'  => 'Animalitos Perl',
    'menu' => '[{"url":"#/","nombre":"Home"},{"url":"#/buscar","nombre":"Buscar"},{"url":"#/contacto","nombre":"Contacto"}]',
    'data'  => '""',
    'qunit' => 1
  );
  #template 'home/index.tt', {%context}, { layout => 'site.tt' };
  template 'home/index.tt', {%context}, { layout => 'blank.tt' };
};

1;
