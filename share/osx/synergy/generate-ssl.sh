# https://github.com/shmilee/scripts/blob/c3efb6cb634a96a609b242d9cdf6c976da4d3890/synergy/mac-crypto.sh
mkdir -p ~/Library/Synergy/SSL/Fingerprints
openssl req -x509 -nodes -days 365 -subj /CN=Synergy -newkey rsa:1024 -keyout ~/Library/Synergy/SSL/Synergy.pem -out ~/Library/Synergy/SSL/Synergy.pem
openssl x509 -fingerprint -sha1 -noout -in ~/Library/Synergy/SSL/Synergy.pem > ~/Library/Synergy/SSL/Fingerprints/Local.txt
sed -e "s/.*=//" -i'' ~/Library/Synergy/SSL/Fingerprints/Local.txt
