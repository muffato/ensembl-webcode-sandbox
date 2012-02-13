use strict;

package EnsEMBL::Matt::SiteDefs;
sub update_conf {
  $SiteDefs::ENSEMBL_PORT                   = 9030; 
  #$SiteDefs::ENSEMBL_PROXY_PORT             = 80;
  $SiteDefs::ENSEMBL_SERVERNAME             = 'enssand-01.internal.sanger.ac.uk';
  $SiteDefs::ENSEMBL_STATIC_SERVER          = '';

  $SiteDefs::ENSEMBL_TMP_DIR_BLAST          = $SiteDefs::ENSEMBL_SERVERROOT."/blastqueue";
  $SiteDefs::ENSEMBL_MAIL_ERRORS            = 0;
  $SiteDefs::ENSEMBL_USERDB_HOST            = 'ensdb-1-07.internal.sanger.ac.uk';
  $SiteDefs::ENSEMBL_USERDB_PORT            =  5305;

  $SiteDefs::ENSEMBL_TMP_DIR                = $SiteDefs::ENSEMBL_SERVERROOT.'/tmp';
  $SiteDefs::ENSEMBL_TMP_DIR_IMG            = $SiteDefs::ENSEMBL_SERVERROOT.'/img/tmp';
  $SiteDefs::ENSEMBL_TMP_DIR_CACHE          = $SiteDefs::ENSEMBL_SERVERROOT.'/img/cache';
  $SiteDefs::ENSEMBL_TMP_DIR_DOTTER         = $SiteDefs::ENSEMBL_SERVERROOT.'/tmp/dotter';

 my  $LOG = $SiteDefs::ENSEMBL_SERVERROOT."/logs/".$SiteDefs::ENSEMBL_SERVER;
  my $DATESTAMP = '';
  if( $SiteDefs::ENSEMBL_DEBUG_FLAGS & 64 ) { ##  Set to 0 - disables time stamped logs
        ##  Set to 1 -  enables time stamped logs
    my @TIME = gmtime();
    $DATESTAMP = sprintf( ".%04d-%02d-%02d-%02d-%02d-%02d", $TIME[5]+1900, $TIME[4]+1, @TIME[3,2,1,0] );
  }

  $SiteDefs::ENSEMBL_PIDFILE    = "$LOG.httpd.pid";
  $SiteDefs::ENSEMBL_ERRORLOG  = "$LOG$DATESTAMP.error_log";
  $SiteDefs::ENSEMBL_CUSTOMLOG = "$LOG$DATESTAMP.access_log ensembl_extended";

  $SiteDefs::ENSEMBL_WEBADMIN_ID     = 94;
  $SiteDefs::ENSEMBL_USERADMIN_ID    = 95;
}

1;
