package MyAPP::Model;
use Mojo::Base -strict;

sub load {
    my $class = shift;
    my %param = @_ if @_ % 2 == 0;

    my $ns = 'MyAPP::Model';
    my $model = $param{model} || $_[0];

    if($model){
        # build require
        my $module_load = $ns;
        $module_load =~ s/::/\//g;

        require "${module_load}/${model}.pm";
        my $instance = "${ns}::${model}"->new;
        
        return $instance 
            if $instance && $instance->isa('MyAPP::Model::Base');

        return undef;
    }
}

sub exists {
    die "Method unimplemented!";
}

1;

__END__
=pod 

=head1 NAME

MyAPP::Model - Model factory for MyAPP app


=head1 SINOPSYS

    use MyAPP::Model;

    # getting new instance of User model if exists
    my $user_model = MyAPP::Model->load('User');


=head1 DESCRIPTION

This class is a simple factory that load and instanciate for provide a simple
way to get new instances of L<MyAPP> model classes.

This class is auto configured to find model classes under L<MyAPP::Model>
namespace.


=head2 Methods


=head3 load(C<$scalar>)

This method get a class name, find under namespace and (if exists) return an
instance of class if it is a son class of MyAPP::Model::Base

    package MyAPP::Model::User;
    use base 'MyAPP::Model::Base';

    # use here your favorite ORM our handle manually
    ...

And now you can load User class doing:

    use MyAPP::Model;

    # get MyAPP::Model::User class instance
    my $user_model = MyAPP::Model->load('User');


=head3 exists(C<$scalar>)

This method returns if class exists based on required inplementation.

    my $user_model;

    # load user model if exists
    $user_model = MyAPP::Model->load('User') 
        if MyAPP::Model->exists('User');


=head1 AUTHOR

Daniel Vinciguerra <daniel.vinciguerra@bivee.com.br>


=head1 COPYRIGHT AND LICENSE

2013 (c) Bivee

This is a free software; you can redistribute it and/or modify it under the same terms 
as a Perl 5 programming language system itself.

=cut
