## If you wish to use the EnsEMBL web-code from the command line, you will
## need to hardcode the server root here 

## $SiteDefs::ENSEMBL_SERVERROOT = '/path to root of ensembl tree';

$SiteDefs::ENSEMBL_PLUGINS = [
  # always (and first)
  'EnsEMBL::Matt'         => $SiteDefs::ENSEMBL_SERVERROOT.'/ensembl-webcode-sandbox',

  # staging
  #'EnsEMBL::Staging'      => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/staging',

  # grch37
  #'EnsEMBL::GRCh37_staging'=> $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37_staging',
  ##'EnsEMBL::GRCh37_test'   => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37_test',
  #'EnsEMBL::GRCh37'        => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/grch37',

  # always
  'EnsEMBL::Dev'          => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/dev',
  'EnsEMBL::Common'       => $SiteDefs::ENSEMBL_SERVERROOT.'/ebi-plugins/common',
  'EnsEMBL::Widgets'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/widgets', #needed for CAFE and Species Tree widgets
  #'EnsEMBL::Solr'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/solr',
  #'EnsEMBL::Nginx'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/nginx',
  #'EnsEMBL::Memcached'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/memcached',
  #'EnsEMBL::Mart'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/mart',
  'EnsEMBL::Genoverse'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/genoverse',
  #'EnsEMBL::Tools_hive'   => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/tools_hive',
  #'EnsEMBL::Tools'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/tools',
  #'EnsEMBL::Users'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/users',
  'EnsEMBL::Ensembl'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/ensembl',
  'EnsEMBL::Docs'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/docs',
];

1;
