package MyApp;
use Dancer ':syntax';

our $VERSION = '0.1';

set serializer => 'JSON';

get '/' => sub {
    template 'index';
};

post '/' => sub {
    debug "Command received ".(param('cmd') || "null");
};

true;
