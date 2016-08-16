all:
	candle ./base.xml -ext WixUIExtension
	light ./base.wixobj -ext WixUIExtension -ext WixUtilExtension -o DynacoeToolkit.msi
	rm ./DynacoeToolkit.wixpdb
	rm ./base.wixobj 
    
