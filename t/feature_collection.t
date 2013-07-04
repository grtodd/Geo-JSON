# feature_collection.t

use Test::Most;

use lib 't/lib';
use GeoJSONTests;

use Geo::JSON::FeatureCollection;

my $pkg = 'Geo::JSON::FeatureCollection';

my %properties = ( property_1 => 'foo', property_2 => 'bar' );

my @features =    #
    map {
    GeoJSONTests->object(
        'Feature' => { Geometry => $_, properties => {%properties} } )
    }             #
    map { GeoJSONTests->object($_) }    #
    GeoJSONTests->types;

ok my $feature_collection = $pkg->new(
    {   features   => \@features,
        properties => {%properties},
    }
);

isa_ok $feature_collection, $pkg;

done_testing();

