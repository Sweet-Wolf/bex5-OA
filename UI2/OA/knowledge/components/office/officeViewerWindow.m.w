<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:62px;top:88px;"
    onLoad="modelLoad"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver1" onReceive="windowReceiver1Receive"/>
    <div xid="ovParent" style="height:100%;width:100%;">
    <div id="ov" style="border:10px solid black;width:500px;height:500px"/>
  </div>
</div>
