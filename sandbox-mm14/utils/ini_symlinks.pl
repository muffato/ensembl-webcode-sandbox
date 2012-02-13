#!/usr/bin/env perl

##############################################################################
#
# SCRIPT TO GENERATE SYMLINKS TO ALTERNATIVE INI FILE ON STAGING 
# (Needed in early part of release, as healthchecks are now spread
# across two machines)
# start and end are the first and last species to create symlinks for,
# assuming an alphabetically sorted list of species
#
##############################################################################


##---------------------------- CONFIGURATION ---------------------------------

use strict;
use warnings;
use Carp;
use Data::Dumper qw( Dumper );


use FindBin qw($Bin);
use File::Basename qw( dirname );

use Pod::Usage;
use Getopt::Long;

use vars qw( $SERVERROOT $PLUGIN_ROOT $SCRIPT_ROOT $DEBUG $help $info $start $end $remove);

BEGIN{
  &GetOptions( 
               'help'      => \$help,
               'info'      => \$info,
               'start=s'   => \$start,
               'end:s'     => \$end,
               'remove'    => \$remove,
               'debug'     => \$DEBUG,
	     );

  pod2usage(-verbose => 2) if $info;
  pod2usage(1) if $help;

  $SCRIPT_ROOT = dirname( $Bin );
  warn "SCRIPT ROOT $SCRIPT_ROOT";
  ($SERVERROOT = $SCRIPT_ROOT) =~ s#/sanger-plugins/staging##;
  warn "SERVER $SERVERROOT";
  unshift @INC, "$SERVERROOT/conf";
  eval{ require SiteDefs };
  if ($@){ die "Can't use SiteDefs.pm - $@\n"; }
  map{ unshift @INC, $_ } @SiteDefs::ENSEMBL_LIB_DIRS;
}

our $INI_PATH = qq($SERVERROOT/sanger-plugins/staging/conf/ini-files/);


##---------------------------- SPECIES INFO ---------------------------------

use EnsEMBL::Web::SpeciesDefs;

my $SD = EnsEMBL::Web::SpeciesDefs->new();

# get a list of valid species for this release
my $release_id = $SD->ENSEMBL_VERSION;
my @release_spp = $SD->valid_species;
                                                                                
# check validity of user-provided species
my %species_check;
foreach my $sp (@release_spp) {
  $species_check{$sp}++;
}
if ($start || $end) {
  if ($start && ! $species_check{$start}) {
    croak "Species $end is not configured for release $release_id - please supply a valid species!\n";
  }
  if ($end && ! $species_check{$end}) {
    croak "Species $start is not configured for release $release_id - please supply a valid species!\n";
  }
}
else {
  croak "You must define at least one start or end species!\n";
}

##---------------------------- CREATE STATS ---------------------------------

my $flag = $start ? 0 : 1;

foreach my $sp (sort @release_spp) {
  if ($start && $sp eq $start) {
    $flag = 1;
  }
  
  next unless $flag == 1;

  my $alt_ini = 'ALTERNATIVE.ini';
  my $sp_ini  = $INI_PATH.$sp.'.ini';

  if ($remove) {
    system("rm $sp_ini");
  }
  else {
    system("ln -s $alt_ini $sp_ini");
  } 
  if ($end && $sp eq $end) {
    $flag = 0;
  }
}

exit;

1;
