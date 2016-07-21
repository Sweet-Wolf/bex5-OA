<model xmlns="http://www.justep.com/model">
	<config name="messageConfig" value="">
		<item name="items">
		    <item name="wait">
				<item name="process" value="/SA/task/taskView/taskViewProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="queryWaitMessageAction"/>
			</item>
			<item name="submit">
				<item name="process" value="/SA/task/taskView/taskViewProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="querySubmitMessageAction"/>
			</item>
			<item name = "news">
				<item name="process" value="/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess"/>
				<item name="activity" value="knowledgeNewsMobileActivity"/>
				<item name="action" value="newsPortalAction"/>
			</item>
			
			<item name = "notice">
				<item name="process" value="/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess"/>
				<item name="activity" value="knowledgeNoticeMobileActivity"/>
				<item name="action" value="noticePortalAction"/>
			</item>
			
			
			<item name = "doc">
				<item name="process" value="/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess"/>
				<item name="activity" value="knowledgeDocMobileActivity"/>
				<item name="action" value="publishPortalAction"/>
			</item>

			<item name = "schedule">
			   <item name="process" value="/OA/schedule/process/mobileSechedule/mobileSecheduleProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="schedulePortalAction"/>
				
			</item>
			
			<item name = "mobileReadDoc">
			   <item name="process" value="/OA/doc/process/mobileReadDocQuery/mobileReadDocQueryProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="mobileReadDocPortalAction"/>
				
			</item>
			
			<item name = "mobileDocDeal">
			   <item name="process" value="/OA/doc/process/mobileDocDeal/mobileDocDealProcess"/>
				<item name="activity" value="mainActivity"/>
				<item name="action" value="mobileDocDealPortalAction"/>
				
			</item>
			
		</item>
	</config>  
</model>