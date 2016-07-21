<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="$UI/OA/knowledge/process/simplePublishKnowledge/parent.w"
  component="$UI/system/components/justep/window/window" xid="window" class="window window window"
  design="device:pc">  
  <div xid="button2" xui:update-mode="delete"/>  
  <div anchor="moreBtn" class="x-popMenu" component="$UI/system/components/justep/popMenu/popMenu"
    direction="left-bottom" opacity="0" xid="moreMenu" xui:parent="window" xui:update-mode="insert"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul class="x-menu dropdown-menu x-popMenu-content" component="$UI/system/components/justep/menu/menu"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="回退" onClick="{operation:'processKW.back'}" xid="backBtn"> 
          <i xid="i1_2"/>  
          <span xid="span1_2">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="transferItem"> 
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="转发" onClick="{operation:'processKW.transfer'}" xid="transferBtn"> 
          <i xid="i2_2"/>  
          <span xid="span2_2">转发</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="暂停" onClick="{operation:'processKW.suspend'}" xid="suspendBtn"> 
          <i xid="i3_2"/>  
          <span xid="span3_2">暂停</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
          label="终止" onClick="{operation:'processKW.abort'}" xid="abortBtn"> 
          <i xid="i4_2"/>  
          <span xid="span4_2">终止</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    onClick="{'operation':'processKW.advance'}" xid="button1_1" xui:before="btnPreviewStaticPage"
    xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i1_1"/>  
    <span xid="span1_1"/> 
  </a>  
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    onClick="{'operation':'processKW.showChart'}" xid="button6_1" xui:before="btnPreviewStaticPage"
    xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i6_1"/>  
    <span xid="span6_1"/> 
  </a>  
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    onClick="{'operation':'processKW.processRecord'}" xid="button7_1" xui:before="btnPreviewStaticPage"
    xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i7_1"/>  
    <span xid="span7_1"/> 
  </a>  
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    onClick="{'operation':'processKW.customized'}" xid="button8_1" xui:before="btnPreviewStaticPage"
    xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i8_1"/>  
    <span xid="span8_1"/> 
  </a>  
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    label="更多" onClick="{operation:'moreMenu.show'}" xid="moreBtn" xui:parent="toolBar1"
    xui:update-mode="insert"> 
    <i xid="i5_2"/>  
    <span xid="span5_2">更多</span> 
  </a> 
</div>
