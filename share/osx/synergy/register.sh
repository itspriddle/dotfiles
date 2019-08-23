SERIAL="$1"

/usr/libexec/PlistBuddy -c "Add :serialKey string $SERIAL" ~/Library/Preferences/com.http-symless-com.Synergy.plist
