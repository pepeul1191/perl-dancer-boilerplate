use Dancer2;

sub demo {
  'hola';
};

get '/' => sub {
  'Hello World!'
};

get '/hola' => \&demo;

any qr{.*} => sub {
  status 'not_found';
  '404 =P';
};

public: '/public';

dance;
