package Config::Constants;

our %Data = (
  BASE_URL => 'http://localhost:5000/',
  STATIC_URL => 'http://localhost:5000/',
  ambiente => 'desarrollo',
  CSRF => 'TLXTtwXA-_et0s5uKPPcAGm5dtQIAjXgHmmM',
  servicio_eventos => 'http://localhost:4000/',
  servicio_accesos => 'http://localhost:5000/',
  servicio_cculima => 'http://localhost:5010/',
  servicio_archivos => 'http://192.168.1.11:3031/',
);

our %FTP = (
  host => '192.168.1.11',
  user => 'pepe',
  pass => 'kiki123',
  debug => 1,
  directorio => 'Documentos/python/archivos/static'
);

1;
