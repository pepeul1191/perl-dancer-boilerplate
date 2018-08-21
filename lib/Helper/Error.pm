package Helper::Error;
use Config::Constants;

my $constants = \%Config::Constants::Data;

our %ErrorHelper = (
  access_css => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
      push @rpta, 'bower_components/bootstrap/dist/css/bootstrap.min';
      push @rpta, 'bower_components/font-awesome/css/font-awesome.min';
      push @rpta, 'bower_components/swp-backbone/assets/css/constants';
      push @rpta, 'assets/css/constants';
      push @rpta, 'assets/css/error';
    }
    if($constants->{'ambiente'} eq 'produccion'){
      push @rpta , 'dist/error-min';
    }
    return @rpta;
  },
  access_js => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
    }
    if($constants->{'ambiente'} eq 'produccion'){
    }
    return @rpta;
  },
);

1;
