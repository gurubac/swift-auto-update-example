# swift-auto-update-example
A quick example app made for testing Max Howell's automatic AppUpdater for Swift MacOS apps

![image](https://user-images.githubusercontent.com/59124862/212463701-2d328ecf-dadd-465f-8495-d6a5bfe3b591.png)

Dependencies:
Max's AppUpdater https://github.com/mxcl/AppUpdater

My release repo (source of the app releases) that is used in this app https://github.com/gurubac/releasetest/releases

Quick tips: 

Tagname of release should be in this format - ```1.3.0```

Important: Compress your .app file into a zip, upload as name reponame-semanticVersion for example ```releasetest-1.3.0```

If you upload a dmg instead, the AppUpdater code will fail at the ```compactMap { downloadedAppBundle in Bundle(url: downloadedAppBundle)``` step. 
