use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Sledge::Plugin::Cache',
    'VERSION_FROM' => 'lib/Sledge/Plugin/Cache.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More      => 0.32,
        Test::Exception => 0.21,
        Class::Accessor => 0.22,
        Class::Trigger  => 0.10,
    },
);
