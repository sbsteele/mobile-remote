package lights;
use Dancer ':syntax';

our $VERSION = '0.1';

use IO::Handle;
use Fcntl;

use constant NULL => "";
use constant DEVICE => "/dev/ttyACM0";
use constant DEVICE2 => "/dev/ttyUSB0";
my $device = DEVICE; my $device2 = DEVICE2;

sub doze { select(undef,undef,undef,$_[0]) };

sysopen( ARDUINO, DEVICE, O_RDWR|O_NONBLOCK) or die "Can't open Arduino serial port: $!\n";
sysopen( OPPO, DEVICE2, O_RDWR|O_NONBLOCK) or die "Can't open OPPO serial port: $!\n";

my @args = ("stty", "--f=$device2", 9600);
system(@args);

doze 2;


get '/' => sub {
  
    template 'index';

};

post '/' => sub {


    my $mde = param('cmd');
    if (defined $mde){

	    if ($mde eq "OFF"){ syswrite ARDUINO, "0", 1; }
	    if ($mde eq "RED"){ syswrite ARDUINO, "1", 1; }
            if ($mde eq "GRN"){ syswrite ARDUINO, "2", 1; }
            if ($mde eq "BLU"){ syswrite ARDUINO, "3", 1; }
	    if ($mde eq "WHT"){ syswrite ARDUINO, "4", 1; }
            if ($mde eq "FDE"){ syswrite ARDUINO, "5", 1; }
            else { syswrite OPPO, "#$mde\r", 5;} 


             }



};

