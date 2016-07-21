<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubMultySelect/pubMultySelect.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

   <div xid="main" autoLoad="true" concept="OA_BK_BookInfo"  xui:update-mode="merge"/>
    <reader action="/OA/book/logic/action/queryBKBookInfoAction" xid="default1_1" xui:parent="main" xui:update-mode="insert" />
    <filter name="filter0" xid="filter1_3" xui:parent="main" xui:update-mode="insert" >
<![CDATA[OA_BK_BookInfo.fLoanID='0']]>
</filter>
    <div class="x-pagerbar container-fluid" component="$UI/system/components/justep/pagerBar/pagerBar" data="main" xid="pagerBar1_3" xui:parent="content1" xui:update-mode="insert" >
<div class="row" xid="div1_3" >
<div class="col-sm-3" xid="div2_3" >
<div class="x-pagerbar-length" xid="div3_3" >
<label class="x-pagerlimitselect" component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" xid="pagerLimitSelect1_3" >
<span xid="span1_3" >
显示</span>
<select class="form-control input-sm" component="$UI/system/components/justep/select/select" xid="select1_3" >
<option value="10" xid="default1_3" >
10</option>
<option value="20" xid="default2_3" >
20</option>
<option value="50" xid="default3_3" >
50</option>
<option value="100" xid="default4_3" >
100</option>
</select>
<span xid="span2_3" >
条</span>
</label>
</div>
</div>
<div class="col-sm-3" xid="div4_3" >
<div class="x-pagerbar-info" xid="div5_3" >
当前显示0条，共0条</div>
</div>
<div class="col-sm-6" xid="div6_3" >
<div class="x-pagerbar-pagination" xid="div7_3" >
<ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1_3" >
<li class="prev" xid="li1_3" >
<a href="#" xid="a1_3" >
<span aria-hidden="true" xid="span3_3" >
«</span>
<span class="sr-only" xid="span4_3" >
Previous</span>
</a>
</li>
<li class="next" xid="li2_3" >
<a href="#" xid="a2_3" >
<span aria-hidden="true" xid="span5_3" >
»</span>
<span class="sr-only" xid="span6_3" >
Next</span>
</a>
</li>
</ul>
</div>
</div>
</div>
</div>
    <column name="fBooksNumber" xid="column1_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBooksName" xid="column2_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBooksTypeName" xid="column3_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fBookConcern" xid="column4_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fAuthor" xid="column5_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fPageNum" xid="column6_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fPrice" xid="column7_1" xui:parent="columns2" xui:update-mode="insert" />

</div>