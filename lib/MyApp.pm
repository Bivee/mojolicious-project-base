package MyApp;
use Mojo::Base 'Mojolicious';

use MyApp::Routes;
use MyApp::Authentication;

sub startup {
    my $self = shift;

    # load auth plugin
    $self->plugin(
        'authentication' => {
            'autoload_user' => 1,
            'session_key'   => 'uid',
            'load_user'     => sub {
                return MyApp::Authentication->load_user(@_);
            },
            'validate_user' => sub {
                return MyApp::Authentication->validate_user(@_);
            },
        }
    );

    # Router
    my $r = $self->routes;
    $r->namespaces( ['MyApp::Controller'] );

    MyApp::Routes->load($r);
}

1;
