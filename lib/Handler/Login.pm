package Handler::Login;
use Dancer2;
use DateTime;
use utf8;
use JSON;
use JSON::Parse 'parse_json';
use Encode qw(decode encode);
use Config::Constants;
use Config::Helpers;
use Config::Database;
use Helper::Login;
use Data::Dumper;
hook before => sub {
  #print Filter::Acl::alc(request);
};

get '/' => sub {
  my $helper = \%Config::Helpers::ViewHelpers;
  my $LoginHelper = \%Helper::Login::LoginHelper;
  my %context = (
    title  => 'Bienvenido',
    mensaje  => '',
    constants => \%Config::Constants::Data,
    csrf => \%Config::Constants::CSRF,
    css => $helper->{'loas_css'}($LoginHelper->{'index_css'}()),
    js => $helper->{'load_js'}($LoginHelper->{'index_js'}()),
  );
  template 'login/index.tt', { %context }, { layout => 'blank.tt' };
};

post '/acceder' => sub {
  my $usuario = body_parameters->get('usuario');
  my $contrasenia = body_parameters->get('contrasenia');
  my $csrf_key = %Config::Constants::CSRF{'key'};
  my $csrf_request = body_parameters->get($csrf_key);
  my $mensaje = '';
  if ($csrf_request ne %Config::Constants::CSRF{'value'}){
    $mensaje = 'Eror de validación de CSRF';
  }else{
    if($usuario eq %Config::Constants::Login{'usuario'} && $contrasenia eq %Config::Constants::Login{'contrasenia'}){
      session usuario => $usuario;
      session estado => 'activo';
      session momento => DateTime->now;
      my $url = %Config::Constants::Data{'BASE_URL'};
      redirect $url;
      $mensaje = %Config::Constants::Data{'BASE_URL'};
    }else{
      $mensaje = 'Usuario y/o contraseña no coinciden';
    }
  }
  # --------------------------------------------------------------
  my $helper = \%Config::Helpers::ViewHelpers;
  my $LoginHelper = \%Helper::Login::LoginHelper;
  my %context = (
    title  => 'Bienvenido',
    mensaje  => $mensaje,
    constants => \%Config::Constants::Data,
    csrf => \%Config::Constants::CSRF,
    css => $helper->{'loas_css'}($LoginHelper->{'index_css'}()),
    js => $helper->{'load_js'}($LoginHelper->{'index_js'}()),
  );
  template 'login/index.tt', { %context }, { layout => 'blank.tt' };
};

get '/ver' => sub {
  my $usuario = session 'usuario';
  my $estado = session 'estado';
  my $momento = session 'momento';
  my %rpta = (
    usuario => $usuario,
    estado => $estado,
    momento => $momento->ymd . ' ' . $momento->hms,
  );
  #print("\n");print Dumper(\%rpta);print("\n");
  return Encode::decode('utf8', JSON::to_json(\%rpta));
};

get '/salir' => sub {
  context->destroy_session;
  my $url = %Config::Constants::Data{'BASE_URL'};
  redirect $url . 'login';
};

1;
