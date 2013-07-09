package Geo::JSON::GeometryCollection;

# VERSION

# ABSTRACT: object representing a geojson GeometryCollection

use Moo;
extends 'Geo::JSON::Base';

use Carp;
use Types::Standard qw/ ArrayRef /;
use Geo::JSON::Types -types;

has geometries =>
    ( is => 'ro', isa => ArrayRef [Geometry], required => 1 );

sub all_positions {
    my $self = shift;

    return [ map { @{ $_->all_positions } } @{ $self->geometries } ];
}

=head1 SYNOPSIS

    use Geo::JSON::GeometryCollection;
    my $gcol = Geo::JSON::GeometryCollection->new({
        geometries => [ ... ],
    });
    my $json = $mpt->to_json;

=head1 DESCRIPTION

A GeoJSON object with a geometries attribute consisting of an arrayref of
Geometry objects (Point, MultiPoint, LineString, MultiLineString, Polygon,
MultiPolygon).

=cut

1;

