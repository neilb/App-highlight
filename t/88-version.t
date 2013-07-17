use strict;
use warnings;

use File::Basename;
use lib dirname(__FILE__);

use Test::More tests => 2;
use App::Cmd::Tester;
use Test::AppHighlightWords;

use App::highlight;

## version - show version number
{
    my $result = test_app('App::highlight' => [ '--version' ]);

    like(
        $result->stdout,
        qr/$App::highlight::VERSION/ms,
        "highlight --version => $App::highlight::VERSION"
    );

    is($result->error, undef, 'threw no exceptions');

    restore_stdin();
}
