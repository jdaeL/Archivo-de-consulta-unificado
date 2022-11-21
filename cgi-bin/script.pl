#!C:\xampp\perl\bin\perl.exe
use strict;
use warnings;
use CGI;

# primera parte del html
print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link type="text/css" href="../style.css" rel="stylesheet" />
        <title>Resultado de Consulta</title>
    </head>
<body>

HTML

# CGI
my $q = CGI->new;
my $name    = $q->param('nombre');
my $lic     = $q->param('licenciamiento');
my $local   = $q->param('denlocal');
my $program = $q->param('denprograma');
# to upper case     ->     uc = upper case || lc = lower case
my $name    = uc($name);
    ### lic es valor escalar
my $local   = uc($local);
my $program = uc($program);

# ENCONTRAR VALORES POR LINEA EN EL TEXTO
my @lines;
# abrir el archivo
print "<h3> CODIGO_ENTIDAD|NOMBRE|PERIODO_LICENCIAMIENTO|DEPARTAMENTO_LOCAL|DENOMINACION_PROGRAMA|TIPO_GESTION|ESTADO_LICENCIAMIENTO|CODIGO_FILIAL|NOMBRE_FILIAL|DEPARTAMENTO_FILIAL|PROVINCIA_FILIAL|CODIGO_LOCAL|PROVINCIA_LOCAL|DISTRITO_LOCAL|LATITUD_UBICACION|LONGITUD_UBICACION|TIPO_AUTORIZACION_LOCAL|TIPO_NIVEL_ACADEMICO|NIVEL_ACADEMICO|CODIGO_CLASE_PROGRAMA_N2|NOMBRE_CLASE_PROGRAMA_N2|TIPO_AUTORIZACION_PROGRAMA|TIPO_AUTORIZACION_PROGRAMA_LOCAL</h3>\n";    
open(IN,"../resources/univ.txt") or die "<h1>ERROR: al abrir archivo</h1>\n";   

    while(my $line =<IN>) {
        print "<h2> $line </h2>" if $line =~ /$name/n;
    }

close(IN);


print <<HTML;
    Ingrese <a href="../index.html">aqui</a> para regresar al formulario de búsqueda
    </body>
</html>
HTML










