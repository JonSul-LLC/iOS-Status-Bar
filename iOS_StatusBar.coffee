###
iOS Status Bar 1.02
Created by Jonathan Sullivan on July 26th, 2017
www.twitter.com/JonSul_LLC
###
class iOS_StatusBar extends Layer
	#Options:
	constructor: (@options={}) ->
		@options.width = Screen.width
		@options.height = 20
		@options.statusBarColor ?= "white"
		@options.blurColor ?= "black"
		@options.blurLevel ?= 0
		@options.blurOpacity ?= .5
		@options.backgroundColor ?= null
		@options.showRealTime ?= true
		@options.batteryLevel?= 20
		@options.signalLevel?= 100
		super @options
		#Objects:
		blurOverlay = new Layer
			width: Screen.width
			height: 20
			backgroundColor: @options.blurColor
			opacity: @options.blurOpacity
			visible: false
			parent: @
		blur = new Layer
			width: Screen.width
			height: 20
			backgroundColor: null
			visible: false
			parent: @
		bars = []
		signalBars = new Layer
			name: "signalBars"
			x: 6
			y: Align.center
			width: 15
			height: 10
			scale: 1
			parent: @
			backgroundColor: null
		for i in [0..3]
			bars.push new Layer
				name: "bar"+(i+1)
				parent: signalBars
				x: 0+(i*4.2)
				y: 6-(i*2)
				width: 3
				height: 4+(i*2)
				borderRadius: 1
				backgroundColor: @options.statusBarColor
		battery = new Layer
			name: "battery"
			parent: @
			width: 26.5
			height: 11
			x: Screen.width-26.5-5
			y: Align.center(.4)
			backgroundColor: null
		batteryOutline = new Layer
			name: "batteryOutline"
			parent: battery
			x: 0
			y: Align.center
			width: 24
			height: 11
			backgroundColor: null
			borderRadius: 3
			borderColor: @options.statusBarColor
			opacity: .4
			borderWidth: 1
		batteryFill = new Layer
			name: "batteryFill"
			parent: battery
			x: 2
			y: Align.center
			width: (@options.batteryLevel/5)
			height: 7
			backgroundColor: @options.statusBarColor
			borderRadius: 1.5
		batteryTip = new Layer
			name: "batteryTip"
			parent: battery
			x:25
			y: 3.2
			width: 1.5
			height: 4
			opacity: .4
			backgroundColor: @options.statusBarColor
			style:
				"borderRadius": "0 50px 50px 0px"
		statusBarTimeLabel = new TextLayer
			name: "timeLabel"
			text: "9:41 AM"
			fontFamily: "-apple-system"
			fontSize: 12
			fontWeight: 600
			textAlign: "center"
			letterSpacing:.7
			parent: @
			color: @options.statusBarColor
			x: Align.center
			y: Align.center
		#Functions:
		getTime = ->
			date = new Date()
			m = date.getMinutes()
			h = date.getHours()
			if m <= 9
				m = "0"+m
			if h <= 11
				if h is 0
					statusBarTimeLabel.text = 12+":"+m+" AM"
				else
					statusBarTimeLabel.text = h+":"+m+" AM"
			if h > 11
				if h > 12
					h = h - 12
				statusBarTimeLabel.text = h+":"+m+" PM"
			statusBarTimeLabel.x=Align.center
		#Controls:
		if @options.blurLevel > 0
			blurOverlay.visible = true
			blur.visible = true
			blur.style = '-webkit-backdrop-filter': 'blur('+@options.blurLevel+'px)'
		if @options.batteryLevel < 91
			batteryFill.borderRadius = 0
			print Screen.width
			if Screen.width > 375
				batteryFill.style =
					"borderRadius": "4px 0 0 4px"
			else
				batteryFill.style =
					"borderRadius": "2px 0 0 2px"
		if @options.batteryLevel <= 20
			batteryFill.backgroundColor = "#FF3932"
		if @options.signalLevel < 25
			bars[3].opacity = .2
			bars[2].opacity = .2
			bars[1].opacity = .2
		if @options.signalLevel > 25 && @options.signalLevel <= 50
			bars[3].opacity = .2
			bars[2].opacity = .2
		if @options.signalLevel > 50 && @options.signalLevel < 75
			bars[3].opacity = .2
		if @options.showRealTime is true
			getTime()
			Utils.interval 1,->
				getTime()
module.exports = iOS_StatusBar
