package Handler::Home;
use Dancer2;
use Config::Constants;
use Config::Helpers;
use Config::Database;
use Helper::Home;
#use Data::Dumper;
hook before => sub {
  if (request->path eq '/') {
    my $ambiente = %Config::Constants::Ambiente{'session'};
    if($ambiente eq 'activo'){
      my $estado = session 'estado';
      if($estado ne 'activo'){
        my $url = %Config::Constants::Data{'BASE_URL'};
        redirect $url . 'error/access/505';
      }
    }
  }
};

get '/' => sub {
  my $helper = \%Config::Helpers::ViewHelpers;
  my $HomeHelper = \%Helper::Home::HomeHelper;
  my %context = (
    title  => 'Animalitos Perl',
    modulos => '[{"url":"contenidos/","nombre":"Contenidos"},{"url":"ubicaciones/","nombre":"Ubicaciones"}]',
    items => '[{"subtitulo":"","items":[{"item":"Ubicaciones del Perú","url":"ubicaciones/#/ubicacion"},{"item":"Autocompletar","url":"ubicaciones/#/autocompletar"}]}]',
    data  => '{"mensaje":false,"titulo_pagina":"Gesti\u00f3n de Ubicaciones","modulo":"Ubicaciones"}',
    csrf => \%Config::Constants::CSRF,
    constants => \%Config::Constants::Data,
    css => $helper->{'loas_css'}($HomeHelper->{'index_css'}()),
    js => $helper->{'load_js'}($HomeHelper->{'index_js'}()),
    qunit => 1
  );
  template 'home/index.tt', { %context }, { layout => 'app.tt' };
};

any qr{.*} => sub {
  my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/404';
  redirect $url;
};

1;
