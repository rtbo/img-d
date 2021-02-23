local dop = require('dop')

name = 'img-d'
version = '0.1.0'
authors = { 'Remi Thebault <remi.thebault@gmail.com>'}
copyright = { 'Copyright 2016-2021 Rémi THEBAULT' }
license = 'MIT'
langs = {'d'}

dependencies = {
    libpng = '~>1.6.37',
    ['libjpeg-turbo'] = '~>2.0.6'
}

function build(dirs, config, depinfos)
    local profile = config.profile
    local compiler = profile.compilers.d.path
    dop.from_dir(dirs.src, function()
        dop.run_cmd({'dub', 'build', '--build='..profile.build_type, '--compiler='..compiler})
    end)
end

function pack(dirs, config, dest)
    local install = dop.installer(dirs.src, dest)
    install.file('libimg.a', 'lib/libimg.a')
    install.dir('source/img', 'include/d/img-'..version..'/img')
end
