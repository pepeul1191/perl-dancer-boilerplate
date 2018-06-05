package Handler::Home;
use Dancer2;

hook before => sub {
    response_header 'X-Powered-By' => 'Perl Dancer 1.3202, Ubuntu';
    #print Filter::Acl::alc(request);
  };

get '/' => sub {
	#redirect 'http://softweb.pe/';
  return 'Home';
};

1;
