}<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Exemplo de navegacao por teclas -->
<ncl id="proyectFinal" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<ruleBase>
			<rule id="en" var="system.language" value="en" comparator="eq"/>
			<rule id="int" var="service.interactivity" value="true" comparator="eq"/> 
			<!--Parte del primer menumenu-->
			<rule id="ruinfo" var="service.currentFocus" value="3" comparator="eq"/>
			<rule id="ruOpc" var="service.currentFocus" comparator="eq" value="4"/>
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
				<region id="ropc" left="5.75%" top="88.94%" width="17.72%" height="10.62%" zIndex="4"/>
				<region id="rup" left="29.23%" top="88.94%" width="17.72%" height="10.62%" zIndex="4"/>
				<region id="rok" left="52.82%" top="88.94%" width="17.72%" height="10.62%" zIndex="4"/>
				<region id="rback" left="76.17%" top="88.94%" width="17.72%" height="10.62%" zIndex="4"/>					
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
			<importBase documentURI="NuevoConectorBase.ncl" alias="conectorExterno"/>
		</connectorBase>	
			
	</head>

	<body>
		<!--Conexion con la Base de Datos-->
		<media id="conexionBD" src="script/anuncioM.lua"/>
		
		<!--Puerto principal donde inicia toda la interaccion-->
		<port id="entry" component="videoIni"/>
		<!--Estilo Css para Ginga NCL-->
		<port id="estilo" component="estilocss"/>
		<!--Agrega imagen de fondo-->
		<media id="background" src="media/header-bg.jpg" descriptor="backgroundDesc"/>
		<!--Agrega estilos css-->
		<media id="estilocss" src="css/estilo.css" type="text/css"/>
		
		<!--Agrega video de inicio de la interaccion-->
		<media id="videoIni" src="media/Angular.mp4" descriptor="videoDesc"/>
		<!--media id="videoIni" src="script/conexion.lua" descriptor="conexionBD"/-->
		
		<!--Primera parte que se mostrara en la tv como incio con el video de interactividad-->
		<context id="primeraParte">
			<!--Variable global-->
			<media id="varGlobal" type="application/x-ginga-settings">
				<!--Inicio del servicio de interactividad cuando sea verdadera-->
				<property name="service.interactivity" value="true"/>
				<property name="service.currentFocus"/>
			</media>
			<!--Inicializando con el video desde la base de datos-->
			<media id="videoInicio" refer="videoIni" instance="instSame"/>
			<!--Enlace para iniciar con la interaccion-->				
			<link id="linkInteraccion1" xconnector="conectorExterno#onBeginSet_varStart">
				<!--Al empezar iniciar con el video-->
				<bind role="onBegin" component="videoInicio"/>
				<!--Seguido del boton rojo de interaccion-->
				<bind role="start" component="menu1"/>
				<bind role="set" component="varGlobal" interface="service.interactivity">
					<bindParam name="var" value="true"/>
				</bind>	
			</link>
			
			<!--Contexto menu dentro del contexto de inicio que define el menu de informacion para poder interactuar con la app-->
			<context id="menu1">
				<port id="menuInf" component="infMenu"/>
				<port id="menuImg" component="botonRojo"/>
				
				<media id="infMenu" src="media/menu.html" descriptor="infDes"/>
				<media id="botonRojo" src="media/infored.jpg" descriptor="imgDes">
					<property name="transparency" value="50%"/>
				</media>
			</context>
		</context>
					
		<!--Inicia la interaccion con la tv-->
		<context id="segundaParte">
		<!--Reusamos el video refiriendonos al video inicial de reproduccion en el mismo
		instante de la reproduccion-->
			<media id="reusaAnimacion" refer="videoIni" instance="instSame">
				<!--indica una propiedad que sera manipulada por otros-->
				<property name="bounds"/>
			</media>
			<media id="reusoGlobalVar" refer="varGlobal" instance="instSame"/>
			<!--Boton de interactividad para mostrar informacion -->
			<media id="botonRed" src="media/infored.jpg" descriptor="imgDes"/>
			<media id="formulario" src="media/formulario.html" type="text/html" descriptor="formDesc"/>
			<media id="linkimagen" src="media/linkIma.html" type="text/html" descriptor="linkDesc"/>
						
			<link  id="lIcon" xconnector="conectorExterno#onBeginVarStart">
				<bind role="onBegin" component="reusaAnimacion"/>
				<bind role="var" component="reusoGlobalVar" interface="service.interactivity"/>			
				<bind role="start" component="botonRed"/>			
			</link>	
			
			<!--Lo que pasa cuando se presiona el boton rojo-->
			<link  id="linkParte2" xconnector="conectorExterno#onKeySelectionStopSet_varStart">
				<bind role="onSelection" component="botonRed">
					<bindParam name="keyCode" value="RED"/>
				</bind>	
				
				<bind role="start" component="linkimagen"/>
				<bind role="start" component="formulario"/>
				<!--Se le dice al video que se redimensione-->
				<bind role="set" component="reusaAnimacion" interface="bounds">
					<bindParam name="var" value="2.93%, 5.42%, 41.20%, 38.75%"/>
				</bind>	
				<bind role="stop" component="botonRed"/>
			</link>
			
			<link id="lFormFocus" xconnector="conectorExterno#onBeginSet_var">
				<bind role="onBegin" component="formulario"/>
				<bind role="set" component="reusoGlobalVar" interface="service.currentFocus">
					<bindParam name="var" value="1"/>
				</bind>
			</link>		
			
			<link id="lEndForm" xconnector="conectorExterno#onEndSet_var">
				<bind role="onEnd" component="formulario"/>
				<bind role="set" component="reusaAnimacion" interface="bounds">
					<bindParam name="var" value="0,0,222.22%,222.22%"/>
				</bind>	
			</link>	 
			
		</context>
		
		<context id="menu">
				<port id="pOpc" component="opcion"/>
				<port id="pUp" component="up"/>
				<port id="pDown" component="down"/>
				<port id="pBack" component="back"/>
				
				<media id="opcion" src="media/red.png"/>
					
				<media id="up" src="media/red.png"/>
				<media id="down" src="media/red.png" />
				<media id="back" src="media/red.png"/>
		</context>
		
		
		<link  id="menuLink" xconnector="conectorExterno#onBeginStart_delay">
			<bind role="onBegin" component="segundaParte"/>						
			<bind role="start" component="menu">
				<bindParam name="delay" value="5s"/>
			</bind>				
		</link>		
	</body>
</ncl>