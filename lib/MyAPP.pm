package MyAPP;
use Mojo::Base 'Mojolicious';

sub startup {
    my $self = shift;

    # Router
    my $r = $self->routes;
    $r->namespaces( ['MyAPP::Controller'] );

    # Normal route to controller
    $r->any('/')->to('home#index');

    $r->any('/:controller/:action/:id')
      ->to( controller => 'home', action => 'index', id => 0 );
}

1;
