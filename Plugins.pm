## If you wish to use the EnsEMBL web-code from the command line, you will
## need to hardcode the server root here 

## $SiteDefs::ENSEMBL_SERVERROOT = '/path to root of ensembl tree';

$SiteDefs::ENSEMBL_PLUGINS = [
  'EnsEMBL::Matt'         => $SiteDefs::ENSEMBL_SERVERROOT.'/sandbox-mm14',
  'EnsEMBL::Staging'      => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/staging',
  'EnsEMBL::Widgets'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/widgets',
  'EnsEMBL::Sanger_dev'   => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/dev',
  'EnsEMBL::Genoverse'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/genoverse',
  'EnsEMBL::Sanger'       => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/sanger',
  'EnsEMBL::Ensembl'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/ensembl',
  'EnsEMBL::Docs'         => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/docs',
];

1;
