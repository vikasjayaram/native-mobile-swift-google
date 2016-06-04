# Auth0 + iOS + API Seed

This is the seed project you need to use if you're going to create an app that will use Auth0, iOS with Swift and an API that you're going to be developing. That API can be in any language.

## Configuring the example

You must set your Auht0 `ClientId` and `Tenant` in this sample so that it works. For that, just open the `SwiftSample/Info.plist` file and replace the `{CLIENT_ID}` and `{TENANT}` fields with your account information.

## Running the example

In order to run the project, you need to have `XCode` installed.
Once you have that, just clone the project and run the following:

1. `pod install`
2. `open SwiftSample.xcworkspace`
3. Configure A0GoogleAuthenticator like this in MyApplication.swift
```
        let google = A0GoogleAuthenticator.newAuthenticator()
        lock.registerAuthenticators([google])
```
## Google Client ID Configuration

Add the following to the Info.plist file of your project

```
		<dict>
			<key>CFBundleTypeRole</key>
			<string>None</string>
			<key>CFBundleURLName</key>
			<string>google</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>com.googleusercontent.apps.GOOGLE_CLIENT_ID</string>
			</array>
		</dict>

```
Enjoy your iOS app now :).
