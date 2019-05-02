## If you wish to use the EnsEMBL web-code from the command line, you will
## need to hardcode the server root here 

## $SiteDefs::ENSEMBL_SERVERROOT = '/path to root of ensembl tree';

my $division;
my $ucdivision;
my $is_grch37;
if ($SiteDefs::ENSEMBL_SERVERROOT =~ /\.(.+)\b/) {
    if ($1 eq 'grch37') {
        $is_grch37 = 1;
    } else {
        $division = $1;
        $ucdivision = ucfirst $division;
    }
}

my $is_staging = $SiteDefs::ENSEMBL_SERVERROOT =~ /_staging\b/;

$SiteDefs::MATT_IS_STAGING  = $is_staging;
$SiteDefs::MATT_EG_DIVISION = $division;    # empty for vertebrates. Only refers to non-vertebrates divisions
$SiteDefs::MATT_GRCH37      = $is_grch37;   # for the "GRCh37" division. Cannot be set at the same time as MATT_EG_DIVISION

$SiteDefs::ENSEMBL_PLUGINS = [
  # always (and first)
  'EnsEMBL::Matt'         => $SiteDefs::ENSEMBL_SERVERROOT.'/ensembl-webcode-sandbox',

  # dev
  $division ? (
      'EnsEMBL::EGDev'          => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/ensembl-genomes/dev',
  ) : $is_grch37 ? (
      'EnsEMBL::GRCh37_dev'     => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37_dev',
  ) : (
      'EnsEMBL::Dev'            => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/dev',
  ),

  # staging
  $is_staging ? (
      $division ? (
          'EnsEMBL::EGStaging'  => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/ensembl-genomes/staging',
      ) : $is_grch37 ? (
          'EnsEMBL::GRCh37_staging' => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37_staging',
      ) : (
          'EnsEMBL::Staging'    => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/staging',
      ),
  ) : (
  ),

  # divsion
  $division ? (
      "EG::$ucdivision"         => $SiteDefs::ENSEMBL_SERVERROOT."/eg-web-$division",
  ) : $is_grch37 ? (
      'EnsEMBL::GRCh37'         => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37',
  ) : (
      'EnsEMBL::Ensembl'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/ensembl',
  ),

  # "common"
  # Must be loaded before EG::Common otherwise Apache complains that
  #   Cannot load /etc/httpd/modules/mod_perl.so into server:
  'EnsEMBL::Common'       => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/common',
  $division ? (
      'EG::Common'        => $SiteDefs::ENSEMBL_SERVERROOT.'/eg-web-common',
      'EG::EBEyeSearch'   => $SiteDefs::ENSEMBL_SERVERROOT.'/eg-web-search',
  ) : (
  ),

  # shared plugins
  'EnsEMBL::Widgets'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/widgets', #needed for CAFE and Species Tree widgets
  #'EnsEMBL::Solr'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/solr',
  #'EnsEMBL::Nginx'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/nginx',
  #'EnsEMBL::Memcached'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/memcached',
  #'EnsEMBL::Mart'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/mart',
  'EnsEMBL::Genoverse'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/genoverse',
  #'EnsEMBL::Tools_hive'   => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/tools_hive',
  #'EnsEMBL::Tools'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/tools',
  #'EnsEMBL::Users'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/users',
  'EnsEMBL::Docs'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/docs',
];

1;
