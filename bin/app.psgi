#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use Plack::Builder;
use lib "$FindBin::Bin/../lib";
use Config::App; # aplicación principal
# handlers
use Handler::Error;
use Handler::Login;
use Handler::Home;
use Handler::Departamento;
use Handler::Provincia;
use Handler::Distrito;
# use this block if you don't need middleware, and only have a single target Dancer app to run here

builder {
  enable 'Deflater';
  Config::App->to_app;
  enable 'Headers', set => ['X-Powered-By' => 'Perl Dancer 2.0260, Ubuntu'];
  mount '/'             => Handler::Home->to_app;
  mount '/departamento' => Handler::Departamento->to_app;
  mount '/login'        => Handler::Login->to_app;
  mount '/distrito'     => Handler::Distrito->to_app;
  mount '/error'             => Handler::Error->to_app;
  mount '/provincia'             => Handler::Provincia->to_app;
}


=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use MyDancer::App;
use Plack::Builder;

builder {
    enable 'Deflater';
    MyDancer::App->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use MyDancer::App;
use MyDancer::App_admin;

use Plack::Builder;

builder {
    mount '/'      => MyDancer::App->to_app;
    mount '/admin'      => MyDancer::App_admin->to_app;
}

=end comment

=cut
