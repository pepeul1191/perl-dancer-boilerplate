package Helper::Home;
use Config::Constants;

my $constants = \%Config::Constants::Data;

our %HomeHelper = (
  index_css => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
      push @rpta, 'bower_components/bootstrap/dist/css/bootstrap.min';
      push @rpta, 'bower_components/font-awesome/css/font-awesome.min';
    }
    if($constants->{'ambiente'} eq 'produccion'){
      push @rpta , 'dist/contenido-min';
    }
    return @rpta;
  },
  index_js => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
      push @rpta, 'bower_components/jquery/dist/jquery.min';
      push @rpta, 'bower_components/bootstrap/dist/js/bootstrap.min';
      push @rpta, 'bower_components/handlebars/handlebars.min';
      push @rpta, 'bower_components/underscore/underscore-min';
      push @rpta, 'bower_components/backbone/backbone-min';
    }
    if($constants->{'ambiente'} eq 'produccion'){
      push @rpta, 'bower_components/ckeditor/ckeditor';
      push @rpta , 'dist/contenido-min';
    }
    return @rpta;
  },
);

1;
