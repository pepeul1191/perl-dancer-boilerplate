package Config::Constants;

our %Data = (
  BASE_URL => 'http://localhost:5000/',
  STATIC_URL => 'http://localhost:9090/',
  ambiente => 'desarrollo',
  CSRF => 'TLXTtwXA-_et0s5uKPPcAGm5dtQIAjXgHmmM',
  servicio_eventos => 'http://localhost:4000/',
  servicio_accesos => 'http://localhost:5000/',
  servicio_cculima => 'http://localhost:5010/',
  servicio_archivos => 'http://192.168.1.11:3031/',

);

our %Ambiente = (
  session => 'activo',
  csrf => 'activo',
  static => 'desarrollo',
);

our %FTP = (
  host => '192.168.1.11',
  user => 'pepe',
  pass => 'kiki123',
  debug => 1,
  directorio => 'Documentos/python/archivos/static'
);

our %CSRF = (
  key => 'Csrf_Val',
  value => 'mpt/sr6eS2AlCRHU7DVThMgFTN08pnfSDf/C94eZx7udfm0lvgaYWLYJttYPKzGKDTlXwVU/d2FOxbKkgNlsTw==',
);

our %Login = (
  usuario => 'admin',
  contrasenia => 'sistema123',
);

1;
