package Helper::Home;
use Config::Constants;

my $constants = \%Config::Constants::Data;

our %HomeHelper = (
  index_css => sub {
    my @rpta = ();
    if($constants->{'ambiente'} eq 'desarrollo'){
      push @rpta, 'bower_components/bootstrap/dist/css/bootstrap.min';
      push @rpta, 'bower_components/font-awesome/css/font-awesome.min';
      push @rpta, 'bower_components/swp-backbone/assets/css/constants';
      push @rpta, 'bower_components/swp-backbone/assets/css/dashboard';
      push @rpta, 'bower_components/swp-backbone/assets/css/table';
      push @rpta, 'assets/css/constants';
      push @rpta, 'assets/css/styles';
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
      push @rpta, 'bower_components/underscore/underscore-min';
      push @rpta, 'bower_components/backbone/backbone-min';
      push @rpta, 'bower_components/handlebars/handlebars.min';
      push @rpta, 'bower_components/swp-backbone/layouts/application';
      push @rpta, 'bower_components/swp-backbone/views/table';
      push @rpta, 'bower_components/swp-backbone/views/modal';
      push @rpta, 'models/ubicaciones/departamento';
      push @rpta, 'models/ubicaciones/provincia';
      push @rpta, 'collections/ubicaciones/departamento_collection';
      push @rpta, 'collections/ubicaciones/provincia_collection';
      push @rpta, 'data/ubicaciones/tabla_distrito';
      push @rpta, 'data/ubicaciones/tabla_provincia';
      push @rpta, 'data/ubicaciones/tabla_departamento';
      push @rpta, 'views/ubicaciones/tabla_provincia_view';
      push @rpta, 'views/ubicaciones/tabla_departamento_view';
      push @rpta, 'views/ubicaciones/ubicacion_view';
      push @rpta, 'routes/ubicaciones';
    }
    if($constants->{'ambiente'} eq 'produccion'){
      push @rpta, 'bower_components/ckeditor/ckeditor';
      push @rpta , 'dist/contenido-min';
    }
    return @rpta;
  },
);

1;
