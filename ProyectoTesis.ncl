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
			<descriptor id="infDes" region="rinfo" focusIndex="2" focusBorderColor="silver">
				<descriptorParam name="background" value="white"/>
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="style" value="1"/>	
			</descriptor>
				
			<descriptor id="imgDes" region="rimg" focusIndex="2"/>
			
			<!--Parte del segundo menu-->
			<descriptor id="dopc" region="ropc" focusIndex="3" moveRight="3" moveLeft="5">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
			</descriptor>				
			<descriptor id="dup" region="rup" focusIndex="2" moveRight="4" moveLeft="2">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
			</descriptor>				
			<descriptor id="dok" region="rok">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
			</descriptor>				
			<descriptor id="dback" region="rback">
				<descriptorParam name="transparency" value="35%"/>
				<descriptorParam name="fit" value="fill"/>
			</descriptor>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="Conector.NCL" alias="conector"/>
		</connectorBase>
	</head>
	
	<body>
		<port id="entrada" component="videoIni"/>
		<media id="videoIni" src="media/Angular.mp4" descriptor="videoDesc"/>
		<context id="inicio">
			<media id="varGlobal" type="application/x-ginga-settings">
				<property name="service.interactivity" value="true"/>
				<property name="service.currentFocus"/>
			</media>
			<media id="videoInicio" refer="videoIni" instance="instSame"/>
			
			<link xconnector="conector#onBeginSet_varStart" id="interaccion1">
				<bind role="onBegin" component="videoInicio"/>
				<bind role="start" component="menu1"/>
				<bind role="set" component="varGlobal" interface="service.interactivity"/>
			</link>
			
			<context id="menu1">
				<port id="primerMenu" component="informacionMenu"/>
				<port id="imagenBoton" component="botonImg"/>
				<media id="informacionMenu" src="script/anuncioM.lua" descriptor="infDes"/>
				<media id="botonImg" src="media/infored.jpg" descriptor="imgDes">
					<property name="transparency" value="60%"/>
				</media>
			</context>			
		</context>
		
		<context id="reusoPrimeraParte">
			<media id="reusoAnimacion" refer="videoIni" instance="instSame">
				<property name="bounds"/>
			</media>
			<media id="reusoVarGlobal" refer="varGlobal" instance="instSame"/>
			
			<media id="botonRojo" src="media/infored.jpg">
				
			</media>
		</context>
	</body>
	
</ncl>