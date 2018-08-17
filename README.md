## Perl Dancer

Instalación de paquetes de CPANM

	$ curl -L http://cpanmin.us | perl - --sudo Dancer2
	$ sudo cpanm Plack::Middleware::Deflater DBD::SQLite DBD::mysql JSON JSON::Create JSON::XS Crypt::MCrypt Try::Tiny Plack::Loader::Shotgun Plack::Handler::Starman

Arrancar Dancer:

	$ plackup -r bin/app.psgi

Arrancar Dancer con autoreload luego de hacer cambios:

	$ plackup -L Shotgun bin/app.psgi

Arrancar en modo de producción con workers:

	$ plackup -E deployment -s Starman --workers=50 -p 4000 -a bin/app.psgi

### Mmigraciones

Migraciones con DBMATE - ubicaciones:

    $ dbmate -d "ubicaciones/migrations" -e "DATABASE_UBICACIONES" new <<nombre_de_migracion>>
    $ dbmate -d "ubicaciones/migrations" -e "DATABASE_UBICACIONES" up

---

Fuentes:

+ http://blog.endpoint.com/2015/01/cleaner-redirection-in-perl-dancer.html
