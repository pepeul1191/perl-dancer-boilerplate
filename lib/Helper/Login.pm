package Helper::Login;
use Config::Constants;

my $constants = \%Config::Constants::Data;

our %LoginHelper = (
  index_css => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
      push @rpta, 'bower_components/bootstrap/dist/css/bootstrap.min';
      push @rpta, 'bower_components/font-awesome/css/font-awesome.min';
      push @rpta, 'bower_components/swp-backbone/assets/css/constants';
      push @rpta, 'bower_components/swp-backbone/assets/css/login';
      push @rpta, 'assets/css/constants';
      push @rpta, 'assets/css/login';
    }
    if($constants->{'ambiente'} eq 'produccion'){
      push @rpta , 'dist/login-min';
    }
    return @rpta;
  },
  index_js => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
    }
    if($constants->{'ambiente'} eq 'produccion'){
    }
    return @rpta;
  },
);

1;
