use strict;

package EnsEMBL::Matt::SiteDefs;

sub update_conf {
  $SiteDefs::ENSEMBL_PORT                   = 5080;

  $SiteDefs::ENSEMBL_TMP_DIR                = $SiteDefs::ENSEMBL_SERVERROOT.'/tmp/';
  $SiteDefs::ENSEMBL_LOGDIR                 = $SiteDefs::ENSEMBL_SERVERROOT.'/logs/';
}


sub old_update_conf {
  $SiteDefs::ENSEMBL_PORT                   = 9073;
  $SiteDefs::ENSEMBL_PROXY_PORT             = undef;
  $SiteDefs::ENSEMBL_SERVERNAME             = undef;
  $SiteDefs::ENSEMBL_STATIC_SERVER          = '';
  $SiteDefs::ENSEMBL_MIRRORS                = undef;

  $SiteDefs::APACHE_DIR                     = '/localsw';
  $SiteDefs::SAMTOOLS_DIR                   = '/localsw/bin/samtools-0.1.18';
  $SiteDefs::BIOPERL_DIR                    = '/localsw/cvs/bioperl-live/';
  $SiteDefs::MINI_BIOPERL_161_DIR           = '/localsw/cvs/mini-bioperl-161/';
  $SiteDefs::ENSEMBL_PRIVATE_AUTH           = '/localsw/etc/privateauth';
  $SiteDefs::DATAFILE_BASE_PATH             = '/nfs/ensnfs-webdev/staging/';

  $SiteDefs::ENSEMBL_API_VERBOSITY          = 'WARNING'; ## Shut up the API a bit!
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_MAGIC_MESSAGES;
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_VERBOSE_STARTUP;
  $SiteDefs::ENSEMBL_DEBUG_FLAGS           |= $SiteDefs::ENSEMBL_DEBUG_EXTERNAL_COMMANDS;

  $SiteDefs::ENSEMBL_TMP_DIR                = $SiteDefs::ENSEMBL_SERVERROOT.'/tmp/';
  $SiteDefs::ENSEMBL_LOGDIR                 = $SiteDefs::ENSEMBL_SERVERROOT.'/logs/';

  $SiteDefs::ENSEMBL_MAIL_ERRORS            = 0;
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

  $SiteDefs::ENSEMBL_USERDB_NAME            = 'ensembl_accounts';
  $SiteDefs::ENSEMBL_USERDB_USER            = 'ensro';
  $SiteDefs::ENSEMBL_USERDB_HOST            = 'ensdbweb-1-vip.internal.sanger.ac.uk';
  $SiteDefs::ENSEMBL_USERDB_PORT            =  5305;
  $SiteDefs::ENSEMBL_LONGPROCESS_MINTIME    = 10;
  $SiteDefs::ENSEMBL_HELPDESK_EMAIL         = 'helpdesk@ensembl.org';
  $SiteDefs::ENSEMBL_NOREPLY_EMAIL          = 'no-reply@ensembl.org';
  $SiteDefs::TIDY_USERDB_CONNECTIONS       = 1;

  $SiteDefs::SOAP_PROXY                     = 'http://wwwcache.sanger.ac.uk:3128';
  $SiteDefs::SAMTOOLS_HTTP_PROXY            = 'http://wwwcache.sanger.ac.uk:3128';

  $SiteDefs::ENSEMBL_MART_ENABLED           = -1; ## This makes it think is enabled - but isn't on this IP!

  $SiteDefs::LUCENE_ENDPOINT                = "http://search.sanger.ac.uk/sanger-web/ws/searchService";
  $SiteDefs::LUCENE_EXT_ENDPOINT            = "http://search.sanger.ac.uk/sanger-web/ws/searchExtService";

  $SiteDefs::SUBSCRIPTION_EMAIL_LISTS       = [
    'announce-join@ensembl.org'               => q(Announcements - low-traffic list for release announcements and major service updates),
    'dev-join@ensembl.org'                    => q(Developers' list - discussion list for users of our API and webcode)
  ];
}

1;
