use strict;

package EnsEMBL::Matt::SiteDefs;
sub update_conf {
  $SiteDefs::ENSEMBL_PORT                   = 9030;
  $SiteDefs::ENSEMBL_PROXY_PORT             = undef;
  $SiteDefs::ENSEMBL_SERVERNAME             = undef;
  $SiteDefs::ENSEMBL_STATIC_SERVER          = '';
  $SiteDefs::ENSEMBL_MIRRORS                = undef;

  $SiteDefs::ENSEMBL_LOGINS                 = 0; ## Change to 1 to turn user logins on
  $SiteDefs::ENSEMBL_TMP_DIR_BLAST          = $SiteDefs::ENSEMBL_SERVERROOT."/blastqueue";
  $SiteDefs::ENSEMBL_MAIL_ERRORS            = 0;
  
  $SiteDefs::ENSEMBL_BLAST_ENABLED = 0;
  $SiteDefs::ENSEMBL_MEMCACHED = {};

  $SiteDefs::ENSEMBL_API_VERBOSITY          = 'WARNING'; ## Shut up the API a bit!
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_HANDLER_ERRORS;
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_VERBOSE_STARTUP;
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_EXTERNAL_COMMANDS;

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

  $SiteDefs::ENSEMBL_USERDB_NAME            = 'ensembl_web_user_db';
  $SiteDefs::ENSEMBL_USERDB_USER            = 'ensro';
  $SiteDefs::ENSEMBL_USERDB_HOST            = 'ensdb-userdb.internal.sanger.ac.uk';
  $SiteDefs::ENSEMBL_USERDB_PORT            =  5305;
  $SiteDefs::ENSEMBL_USER_COOKIE            = 'ENSEMBL_DEV_USER';
  $SiteDefs::ENSEMBL_SESSION_COOKIE         = 'ENSEMBL_DEV_SESSION';
  $SiteDefs::ENSEMBL_MART_ENABLED           = 0;
  $SiteDefs::ENSEMBL_MIRRORS                = {};
  $SiteDefs::UDC_CACHEDIR                   = '';

  $SiteDefs::LUCENE_ENDPOINT                = "http://webindex-dev.internal.sanger.ac.uk:8080/sanger-web/ws/searchService";
  $SiteDefs::LUCENE_EXT_ENDPOINT            = "http://webindex-dev.internal.sanger.ac.uk:8080/sanger-web/ws/searchExtService";

  $SiteDefs::ENSEMBL_WEBADMIN_ID     = 94;
  $SiteDefs::ENSEMBL_USERADMIN_ID    = 95;
}

1;
