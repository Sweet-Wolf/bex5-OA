<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/car/process/dialog/parent/listSingleTemplete.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

   <div xid="mainData" columns="fStatusName,fCode,fName,fKind,fOriginValue,fRemainValue,fRemark" concept="OA_AS_Card" orderBy="fCode:asc"  xui:update-mode="merge"/>
   <reader xid="default1" action="/OA/car/logic/action/queryASCardAction"  xui:update-mode="merge"/>
    <column label="序号" name="carsNO" xid="column7_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fStatusName" xid="column3_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fCode" xid="column1_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fName" xid="column2_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fKind" xid="column4_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fOriginValue" xid="column5_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fRemainValue" xid="column6_4" xui:parent="columns1" xui:update-mode="insert" />
    <column name="fRemark" xid="column1_5" xui:parent="columns1" xui:update-mode="insert" />

</div>