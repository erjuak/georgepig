case $1 in
gambito)
wakeonlan 00:04:23:3f:ee:85
;;
onslaught)
wakeonlan 00:1f:c6:5f:e7:7b
;;
*)
echo "Uso: enciende.sh <hostname>"
echo "hostname <gambito> <onslaught>"
;;
esac
