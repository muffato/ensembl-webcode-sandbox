## If you wish to use the EnsEMBL web-code from the command line, you will
## need to hardcode the server root here 

## $SiteDefs::ENSEMBL_SERVERROOT = '/path to root of ensembl tree';

$SiteDefs::ENSEMBL_PLUGINS = [
  'EnsEMBL::Matt'       => $SiteDefs::ENSEMBL_SERVERROOT.'/sandbox-mm14',
  'EnsEMBL::Genoverse'  => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/genoverse',
  'EnsEMBL::Ensembl'    => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/ensembl',
];

1;
