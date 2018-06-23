use strict;

package EnsEMBL::Matt::SiteDefs;

sub update_conf {

  # Used to set a sensible location for the tmp dir
  $SiteDefs::ENSEMBL_SERVERROOT =~ /([^\/]*)$/;
  my $sandbox_name = $1;

  # All ports have to be different
  my $port_file = $SiteDefs::ENSEMBL_SERVERROOT.'/port';
  open(my $fh, '<', $port_file);
  my $port = <$fh>;
  chomp $port;
  close($fh);

  $SiteDefs::ENSEMBL_PORT                   = $port;
  $SiteDefs::ENSEMBL_TMP_DIR                = '/homes/w3_ens30/tmp/'.$sandbox_name;
  $SiteDefs::ENSEMBL_USERDATA_DIR           = '/homes/w3_ens30/tmp/'.$sandbox_name;

  $SiteDefs::ENSEMBL_OOB_LIMITS = {
     fd => 20,
     memory => 4096,
     age => 60*60
  };
}

1;
