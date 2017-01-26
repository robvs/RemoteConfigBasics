//
//  RemoteConfigManager.swift
//  RemoteConfigBasics
//
//  Created by Rob Vander Sloot on 1/25/17.
//  Copyright © 2017 Random Visual. All rights reserved.
//

import Foundation


/// This is a wrapper for the handling the Firebase Remote Config framework.
final class RemoteConfigManager {
	
	/// Singleton instance of this class
	static let sharedInstance = RemoteConfigManager()
	
	/// Singleton reference to the Firebase remote config object (for convenience).
	fileprivate let firebaseRemoteConfig: FIRRemoteConfig
	
	/// Private init to support singleton pattern
	private init() {
		
		firebaseRemoteConfig = FIRRemoteConfig.remoteConfig()
		
		// Enable developer mode for demonstration purposes - we need to pull
		// the latest values multiple times an hour.
		if let remoteConfigSettings = FIRRemoteConfigSettings(developerModeEnabled: true) {
			firebaseRemoteConfig.configSettings = remoteConfigSettings
		}
		
		// Initialize the Firebase remote config instance with values from 
		// the defaults plist file.
		firebaseRemoteConfig.setDefaultsFromPlistFileName("RemoteConfigDefaults")
	}
	
	
	// MARK: - Properties used to access config values
	
	public var label1Text: String {
		guard let value = firebaseRemoteConfig["label_1"].stringValue else { return "" }
		return value
	}
	
	public var imageULRString: String {
		guard let value = firebaseRemoteConfig["image_url"].stringValue else { return "" }
		return value
	}
}


// MARK: - Public instance methods

extension RemoteConfigManager {
	
	/// Activate the last values that were fetched. If a fetch hasn't been 
	/// performed yet, the default values are used.
	public func activateLastFetch() {
		firebaseRemoteConfig.activateFetched()
	}
	
	/// Fetch the configuration values from the remote server.
	public func fetchRemoteValues() {
		
		// Do a real fetch once per minute. Note that this duration is only 
		// intended for demonstration purposes. This value should normally
		// be set to once or twice a day. Firebase will refuse the fetch
		// call if it is made too many times in one hour.
		let expirationDuration = TimeInterval(60.0)
		
		firebaseRemoteConfig.fetch(withExpirationDuration: expirationDuration) { [unowned self] (status, error) in
			
			guard status == .success else {
				let errorDescription = error != nil ? error!.localizedDescription : String(describing: status)
				print("Error fetching remote config values: \(errorDescription)")
				return
			}
			
			// Activate the newly fetched values. Normally activation would 
			// occur separately from the fetch (i.e. when foregrounding the app), 
			// but this is better for this demo
			self.firebaseRemoteConfig.activateFetched()
		}
	}
}
