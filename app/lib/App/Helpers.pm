package App::Helpers;
use Mojo::Base -strict;

sub register {
    my $self = shift;
    my $args = (@_ % 2 == 0)? {@_} : shift;

    # getting app reference
    my $app = $args->{context} || $args;

    $app->helper(
        schema => sub {
            my $self = shift;
            return App::Schema->init_db(@_);
        }
    );
}

1;
