package MyAPP;
use Mojo::Base 'Mojolicious';

use MyAPP::Routes;
use MyAPP::Authentication;

sub startup {
    my $self = shift;

    # load auth plugin
    $self->plugin('authentication' => {
        'autoload_user' => 1,
        'session_key' => 'my_eureka_portal_bitch',
        'load_user' => sub {
           return MyAPP::Authentication->load_user(@_);
        },
        'validate_user' => sub {
           return MyAPP::Authentication->validate_user(@_);
        },
    });

    # Router
    my $r = $self->routes;
    $r->namespaces( ['MyAPP::Controller'] );

    # default route to controller
    $r->get('/')->to('Home#index');

    MyAPP::Routes->load($r);
}

1;
