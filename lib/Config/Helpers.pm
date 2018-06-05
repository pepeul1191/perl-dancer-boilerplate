package Config::Helpers;
use Config::Constants;

my $constants = \%Config::Constants::Data;

our %ViewHelpers = (
  loas_css => sub {
    my(@csss) = @_;
    my $rpta = '';
    if(length @csss > 0){
      for my $css(@csss){
        my $url = $constants->{'STATIC_URL'};
        my $temp = '<link rel="stylesheet" type="text/css" href="' . $url . $css . '.css"/>';
        $rpta = $rpta . $temp;
      }
    }
    return $rpta;
  },
  load_js => sub {
    my(@jss) = @_;
    my $rpta = '';
    for my $js(@jss){
      my $url = $constants->{'STATIC_URL'};
      my $temp = '<script src="' . $url . $js . '.js" type="text/javascript"></script>';
      $rpta = $rpta . $temp;
    }
    return $rpta;
  },
);

1;
