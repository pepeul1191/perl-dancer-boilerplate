package Config::App;
use Dancer2;

our $VERSION = '0.1';

hook before => sub {
  #response_header 'X-Powered-By' => 'Perl Dancer 1.3202, Ubuntu';
};

any qr{.*} => sub {
  status 'not_found';
  '404 =P';
};

1;
