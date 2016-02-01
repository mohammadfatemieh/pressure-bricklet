#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletPressure;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $p = Tinkerforge::BrickletPressure->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current pressure (unit is Pa)
my $pressure = $p->get_pressure();
print "Pressure: " . $pressure/1000.0 . " kPa\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
