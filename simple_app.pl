use Dancer2;

sub demo {
  'hola';
};

get '/' => sub {
  'Hello World!'
};

get '/hola' => \&demo;

dance;
