use Mojo::Base -strict;

use Test::More;

use FindBin;
use lib "$FindBin::Bin/../lib";


BEGIN {
    use_ok 'MyApp';
}

done_testing;
