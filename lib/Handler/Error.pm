package Handler::Error;
use Dancer2;
use Switch;
use Helper::Error;
#use Data::Dumper;
hook before => sub {
  #print Filter::Acl::alc(request);
};

get '/access/:error' => sub {
  my $rpta = '';
  my $status = 404;
  my $error = route_parameters->get('error');
  my $helper = \%Config::Helpers::ViewHelpers;
  my $ErrorHelper = \%Helper::Error::ErrorHelper;
  my %mensaje = ();
  switch($error){
    case '404'{
      %mensaje  = (
        numero => '404',
        mensaje => 'Archivo no encontrado',
        descripcion => 'La página que busca no se encuentra en el servidor',
        icono => 'fa fa-exclamation-triangle',
      );
    }
    case '505'{
      $status = 500;
      %mensaje  = (
        numero => '505',
        mensaje => 'Acceso restringido',
        descripcion => 'Necesita estar logueado.',
        icono => 'fa fa-ban',
      );
    }
    else {
      %mensaje  = (
        numero => '404',
        mensaje => 'Archivo no encontrado',
        descripcion => 'La página que busca no se encuentra en el servidor',
        icono => 'fa fa-exclamation-triangle',
      );
    }
  }
  my %context = (
    title  => 'Bienvenido',
    mensaje  => \%mensaje,
    constants => \%Config::Constants::Data,
    csrf => \%Config::Constants::CSRF,
    css => $helper->{'loas_css'}($ErrorHelper->{'access_css'}()),
    js => $helper->{'load_js'}($ErrorHelper->{'access_js'}()),
  );
  status $status;
  template 'error/access.tt', { %context }, { layout => 'blank.tt' };
};

any qr{.*} => sub {
  my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/404';
  redirect $url;
};

1;
