### iOS Status Bar was created to allow Framer users to easily integrate a status bar into their prototypes without doing much work.



**Setup:**

Add iOS_StatusBar.coffee to the modules folder in your project.

In Framer Studio write `iOS_StatusBar = require "iOS_StatusBar"` to include the module in your project.

Then declare a new instance of iOS_StatusBar using `coffeescript yourStatusBarName = new iOS_StatusBar`.

**Usage:**

When declaring a new instance of iOS_StatusBar you declare it along with the options you'd like:

```coffeescript
statusBar = new iOS_StatusBar
	statusBarColor: "black"
	batteryLevel: 90
	signalLevel: 50
	showRealTime: true
	blurColor: "#FBFBFB"
	blurLevel: 50
	blurOpacity: .5
```

Below is a comprehensive list of available options and their usage:

| Option | Description | Default Value |
| --- | --- | --- |
| `statusBarColor` | Sets the color of the signal bars, time & battery. | `white` |
| `backgroundColor` | Sets the background color of the status bar. | `null` |
| `blurLevel` | Sets the amount of blur, `backgroundColor` should be set to `null` if you intend to use this feature. | `0` |
| `blurColor` | Sets the color of the blur. | `black` |
| `blurOpacity` | Sets the opacity of the blur effect. | `.5` |
| `batteryLevel` | Sets the simulated battery level. | `100` |
| `batteryLevel` | Sets the simulated signal strength. | `100` |
| `showRealTime` | If set to `true` it will display the actual time, otherwise it will display 9:41 AM. | `true` |

Enjoy and please contact me if you find any issues or have a request for a new feature!
