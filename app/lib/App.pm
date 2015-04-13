package App;
use Mojo::Base 'Mojolicious';

use App::Routes;
use App::Helpers;

sub startup {
  my $self = shift;

  # Helpers register
  App::Helpers
    ->register( context => $self);

  # Routes register
  App::Routes
    ->register($self->routes);
}

1;
