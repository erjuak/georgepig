#!/usr/bin/perl

use strict;
use warnings;
use File::Copy;
my $fich_ip="/storage/datos/varios/fich_ip.txt";
my $fich_ip2="/storage/datos/varios/fich_ip2.txt";
my $ip_actual = `curl -4 icanhazip.com 2>/dev/null`;
my $ip_guardada;
sub manda_duck
     {
     my $manda_url_duck=`echo url="https://www.duckdns.org/update?domains=erjuak&token=64a6eccb-9667-4fed-b775-a611f28d9cef&ip=" |  curl -K - 2>/dev/null`;
     unless ( $manda_url_duck eq "OK" )
          {
          print "No se ha podido conectar a duckdns\n";
         }
     }    
if ( -f $fich_ip)
     {
     open (FICHERO,"$fich_ip") or die "No existe ".$fich_ip;
     while (<FICHERO>)
     {
          #print "la direccion ip es: $_";
          $ip_guardada = $_;
          #print "la ip es guardada es:$ip_guardada\n";
     }
     if ($ip_actual eq $ip_guardada)
         {
               print "la ip es la misma, no hacemos nada\n";
               manda_duck;
          }
     else
         {
               print "la ip no es la misma, por lo que lanzamos el curl al duckdns\n";
               #Guardamos la nueva ip en el fichero $fich_ip2, despues borramos el fichero antiguo y renombramos el fich_ip2 a fich_ip
               open (FICHERO2, ">$fich_ip2");
               print FICHERO2 $ip_actual;
               close FICHERO2;
               unlink($fich_ip);
               rename("$fich_ip2", "$fich_ip");
               manda_duck;
          }
     close FICHERO;
    }
print "la ip actual es: $ip_actual\n";
print "la ip guardad es: $ip_guardada\n";
