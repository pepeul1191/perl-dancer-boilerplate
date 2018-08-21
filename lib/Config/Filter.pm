package Config::Filter;
use Config::Constants;
use Data::Dumper;
our sub session_true {
  my($session, $context) = @_;
  my $ambiente = %Config::Constants::Ambiente{'session'};
  print("\n");print Dumper(shift);print("\n");
  if($ambiente eq 'activo'){
    my $estado = $session->{'data'}->{'estado'};
    print("\n");print Dumper($estado);print("\n");
    if($estado ne 'activo'){
      my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/505';
      shift response->redirect($url);
    }
  }
}

our sub session_false {
  my($session, $context) = @_;
  my $ambiente = %Config::Constants::Ambiente{'session'};
  print("\n");print Dumper("session_false");print("\n");
  if($ambiente eq 'activo'){
    my $estado = $session->{'data'}->{'estado'};
    print("\n");print Dumper($estado);print("\n");
    if($estado eq 'activo'){
      my $url = %Config::Constants::Data{'BASE_URL'};
      shift response->redirect($url);
    }
  }
}

1;
