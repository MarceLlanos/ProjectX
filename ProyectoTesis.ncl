<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="ProyectoTesis" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<ruleBase>
			<rule id="en" var="system.language" comparator="eq" value="en"/>
			<rule id="interaccion" var="service.interactivity" comparator="eq" value="interact"/>
			<rule id="rInfo" var="service.currentFocus" comparator="eq" value="1"/>
			<rule id="ruOpc" var="service.currentFocus" comparator="eq" value="4"/>
			<rule id="ruUp" var="service.currentFocus" comparator="eq" value="5"/>
			<rule id="ruDown" var="service.currentFocus" comparator="eq" value="6"/>
			<rule id="ruOk" var="service.currentFocus" comparator="eq" value="7"/>
		</ruleBase>
		
		<regionBase>
			<region id="backgroundReg" left="0.00%" top="0.00%" width="100%" height="100%" zIndex="1">
				<region id= "video" left="0.00%" top="0.00%" width="100%" height="100%" zIndex="2"/>
				<region id="formReg"  left="46.95%" top="5.00%" width="50.00%" height="81.46%" right="3.05%" bottom="16.67%" zIndex="3"/>
				<region id="linkReg" left="2.70%" top="47.08%" width="41.31%" height="39.17%" right="55.99%" bottom="16.67%" zIndex="3"/>
				
				<!--Parte del primer menu-->
				<region id="rinfo" left="2.93%" top="91.04%" width="87.94%" height="7.92%" right="0.00%" bottom="0.00%" zIndex="2"/>
				<region id="rimg" left="92.51%" top="91.04%" width="5.85%" height="7.71%" right="0.00%" bottom="0.00%" zIndex="3"/>
				
				<!--Parte del segundo menu-->
				<region id="ropc" left="5.75%" top="88.94%" width="17.72%" height="10.62%" zIndex="3"/>
				<region id="rup" left="29.23%" top="88.94%" width="17.72%" height="10.62%" zIndex="3"/>
				<region id="rok" left="52.82%" top="88.94%" width="17.72%" height="10.62%" zIndex="3"/>
				<region id="rback" left="76.17%" top="88.94%" width="17.72%" height="10.62%" zIndex="3"/>					
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="backgroundDesc" region="backgroundReg"/>
			<descriptor id="videoDesc" region="video" focusBorderColor="silver"/>
			<descriptor id="linkDesc" region="linkReg" focusBorderColor="silver"/>
			<descriptor id="formDesc" region="formReg" focusIndex="1" moveUp="1" moveDown="1">
				<descriptorParam name="scroll" value="automatic"/>
				<descriptorParam name="fit" value="fill"/>
			</descriptor>
				
			<!--Parte del primer menu-->
			<descriptor id="info-desc" region="region-menu" focusIndex="2" focusBorderColor="silver">
				<descriptorParam name="background" value="white"/>
				<descriptorParam name="transparency" value="15%"/>
				<descriptorParam name="style" value="1"/>	
			</descriptor>
				
			<descriptor id="button-info" region="region-info" focusIndex="1"/>
			
			<!--Parte del segundo menu-->
			<descriptor id="button-opc" region="region-opc" focusIndex="3" moveRight="3" moveLeft="5">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
				<descriptorParam name="bg-color" value="red"/>
			</descriptor>				
			<descriptor id="button-up" region="region-up" focusIndex="2" moveRight="4" moveLeft="2">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
				<descriptorParam name="bg-color" value="yellow"/>
			</descriptor>				
			<descriptor id="button-ok" region="region-ok">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
				<descriptorParam name="bg-color" value="blue"/>
			</descriptor>				
			<descriptor id="button-back" region="region-back">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
				<descriptorParam name="bg-color" value="pink"/>
			</descriptor>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="Conector.NCL" alias="conector"/>
		</connectorBase>
	</head>
	
	<body>
		<port id="begin" component="video-ini"/>
		<media id="video-ini" src="media/Angular.mp4" descriptor="video"/>
		<context id="port-begin">
			<media id="var-global" type="application/x-ginga-settings">
				<property name="service.interactivity" value="true"/>
				<property name="service.currentFocus"/>
			</media>
			<media id="video-begin" refer="video-ini" instance="instSame"/>
			
			<link xconnector="conector#onBeginSet_varStart" id="inter-ini">
				<bind role="onBegin" component="video-begin"/>
				<bind role="start" component="menu"/>
				<bind role="set" component="var-global" interface="service.interactivity"/>
			</link>
			
			<context id="menu">
				<port id="first-menu" component="menu-info"/>
				<port id="button-infor" component="button-image"/>
				<media id="menu-info" src="media/menu.png" descriptor="info-desc">
					<property name="size" value="all"/>
				</media>
					
				<media id="button-image" src="media/infored.jpg" descriptor="button-info">
					<property name="transparency" value="35%"/>
				</media>
			</context>			
		</context>
		
		<context id="first-media">
			<media id="media-tv" refer="video-ini" instance="instSame">
				<property name="bounds"/>
			</media>
			<media id="var-gl" refer="var-global" instance="instSame"/>
			<media id="button-red" src="media/infored.jpg"/>
			
		</context>
		
		<context id="second-menu">
			<port id="settings" component="media-set" />
			<port id="up-down" component="media-up"/>
			<port id="ok" component="media-ok"/>
			<port id="back" component="media-back"/>
			
			<media id="media-set" src="media/infored.jpg" descriptor="button-opc"/>
			<media id="media-up" src="media/infored.jpg" descriptor="button-up"/>
			<media id="media-ok" src="media/infored.jpg" descriptor="button-ok"/>
			<media id="media-back" src="media/infored.jpg" descriptor="button-back"/>
			
			
		</context>
		
		
	</body>
	
</ncl>