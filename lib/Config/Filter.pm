package Config::Filter;
use Config::Constants;
#use Data::Dumper;
sub session_true {
  my($session, $context) = @_;
  my $ambiente = %Config::Constants::Ambiente{'session'};
  if($ambiente eq 'activo'){
    my $estado = $session->{'data'}->{'estado'};
    if($estado ne 'activo'){
      my $url = %Config::Constants::Data{'BASE_URL'} . 'error/access/505';
      $context->response->redirect($url);
    }
  }
}

sub session_false {
  my($session, $context) = @_;
  my $ambiente = %Config::Constants::Ambiente{'session'};
  if($ambiente eq 'activo'){
    my $estado = $session->{'data'}->{'estado'};
    if($estado eq 'activo'){
      my $url = %Config::Constants::Data{'BASE_URL'};
      $context->response->redirect($url);
    }
  }
}

1;
