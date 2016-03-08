$SiteDefs::ENSEMBL_PLUGINS = [
    'EnsEMBL::SangerAdmin'  => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/admin',
    'EnsEMBL::Admin'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/admin',
    'EnsEMBL::Debian_Lenny' => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/lenny',
    'EnsEMBL::Sanger'       => $SiteDefs::ENSEMBL_SERVERROOT.'/sanger-plugins/sanger',
    'EnsEMBL::Users'        => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/users',
    'EnsEMBL::ORM'          => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/orm',
    'EnsEMBL::Ensembl'      => $SiteDefs::ENSEMBL_SERVERROOT.'/public-plugins/ensembl'
];

1;
