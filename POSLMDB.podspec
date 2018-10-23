Pod::Spec.new do |s|
    s.name         =  'POSLMDB'
    s.version      =  '0.9.22'
    s.license      =  'MIT'
    s.summary      =  'Cocoapod for LMDB.'
    s.description  =  'Cocoapod for LMDB. LMDB is a fast key-value store developed by Symas.'
    s.homepage     =  'https://github.com/pavelosipov/POSLMDB'
    s.authors      =  'Pavel Osipov'

    s.ios.deployment_target = '7.0'
    s.osx.deployment_target = '10.7'

    s.source = { :git => 'https://github.com/pavelosipov/POSLMDB.git', :submodules => true }

    s.subspec 'lmdb' do |lmdb|
        lmdb.source_files  = %w{ mdb.c lmdb.h midl.h midl.c }.map { |f| File.join "lmdb-library/libraries/liblmdb", f }
        lmdb.header_dir    = 'lmdb'
        lmdb.requires_arc  = false
        lmdb.xcconfig      = {
            'GCC_PREPROCESSOR_DEFINITIONS' => 'MDB_USE_POSIX_SEM=1'
        }
    end

    s.requires_arc = false
end
