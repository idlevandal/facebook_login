# facebook_login_app

Facebook login Flutter iOS

Facebook Developers
Create new app in https://developers.facebook.com/

Create New App => select ‘Business’, click Continue
App Display Name (can contain fb or facebook etc)

Settings => Basic to get App ID & App Secret
Settings => Advanced to get Client Token

Create project with Swift support (final page when creating new project in Android studio)

Flutter Installation
iOS Installation flutter_facebook_auth
https://facebook.meedu.app/#/ios

**Important!!!!!
Put CFBundleURLTypes configuration at END of <dict> in Info.plist

Make sure to prefix app-id with fb in CFBundleURLSchemas (see below) but NOT in FacebookAppID key.
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>fb{your-app-id}</string> // <= IMPORTANT
    </array>
  </dict>
</array>

Get user information
https://facebook.meedu.app/#/user-information

Complete example
https://facebook.meedu.app/#/example

