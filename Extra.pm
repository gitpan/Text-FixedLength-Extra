package Text::FixedLength::Extra;

require 5.005_62;
use strict;
use warnings;

use Text::FixedLength;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Text::FixedLength::Extra ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(fixedlength
	
);
our $VERSION = '0.01';


# Preloaded methods go here.

sub fixedlength {
  my ($format_href, $data_href, $field_order_ref) = @_;

  my $delim = "\t";
  my (@format,@data);
  
  for (@$field_order_ref) {
    push @format, $format_href->{$_};
    push @data,   $data_href->{$_};
  }

  my $data = join $delim, @data;

  [ delim2fixed([$data], $delim, \@format) ] -> [0];

}
1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Text::FixedLength::Extra - simplify access to 

=head1 SYNOPSIS

  use Text::FixedLength::Extra;
  my %format        =   (record_type => '3L', total_orders => '5R');
  my @field_order   = qw(record_type total_orders);
  my %data          =   (record_type => 'F',  total_orders => 300);

  $x = fixedlength(\%format, \%data, \@field_order);


=head1 DESCRIPTION

A wrapper designed to simplify access to Text::FixedLength

=head2 EXPORT

fixedlength()


=head1 AUTHOR

T. M. Brannon, <TBONE@CPAN.ORG>

=head1 SEE ALSO

perl(1). Parse::FixedLength

=cut
