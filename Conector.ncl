<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated	by NCL Eclipse -->
<ncl id="causalConnBase" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase>
			<!--inicio de la accion-->			
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<!--la accion para el rol inicio-->
				<simpleAction role="start" max="unbounded" qualifier="par"/>
				
		</causalConnector>
			
			<!--inicio de un medio con retardo de x tiempo-->
		<causalConnector id="onBeginStart_delay">				
			<connectorParam name="delay"/>			
			<simpleCondition role="onBegin"/>				
			<simpleAction role="start" delay="$delay" max="unbounded" qualifier="par"/>
		</causalConnector>
			
		<!--accion al terminar el media-->
		<causalConnector id="onEndStop">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop" max="unbounded" qualifier="par"/>
		</causalConnector>
		
		<!--accion que se llevara a cabo cuando se haga un set en un variable-->
		<causalConnector id="onBeginSet_varStart">
			<connectorParam name="var"/>
			<simpleCondition role="onBegin"/>
			<compoundAction operator="seq">
				<simpleAction role="set" value="$var"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>
			</compoundAction>	
		</causalConnector>
		
		<!--accion que se llevara  cabo cuando la variable inicializada termine-->			
		<causalConnector id="onKeySelectionStopSet_varStart">
			<connectorParam name="var"/>
			<connectorParam name="keyCode"/>					
			<simpleCondition role="onSelection" key="$keyCode"/>
			<compoundAction operator="seq">
				<simpleAction role="stop" max="unbounded" qualifier="par"/>	
				<simpleAction role="set" value="$var"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>									
			</compoundAction>				
		</causalConnector>
		
		<!--cuando la variable set termine-->	
		<causalConnector id="onEndSet_var">
			<connectorParam name="var"/>
			<simpleCondition role="onEnd"/>
			<simpleAction role="set" value="$var"/>				
		</causalConnector>
		
		<!--accion al parar la seleccion de un boton-->	
		<causalConnector id="onKeySelectionStopStart">
			<connectorParam name="keyCode"/>				
			<simpleCondition role="onSelection" key="$keyCode"/>
			<compoundAction operator="seq">
				<simpleAction role="stop" max="unbounded" qualifier="par"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>					
			</compoundAction>	
		</causalConnector>
		
		<!--accion al parar el inicio de un evento seleccionado-->
		<causalConnector id="onSelectionStopStart">
			<simpleCondition role="onSelection"/>
			<compoundAction operator="seq">
				<simpleAction role="stop" max="unbounded" qualifier="par"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>					
			</compoundAction>	
		</causalConnector>
			
			<causalConnector id="onKeySelectionSet_var">
				<connectorParam name="keyCode"/>
				<connectorParam name="var"/>									
				<simpleCondition role="onSelection" key="$keyCode"/>
				<simpleAction role="set" value="$var"/>				
			</causalConnector>
			
			<causalConnector id="onBeginVarStart">
				<compoundCondition operator="and">
					<simpleCondition role="onBegin"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="var" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="true"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start"/>
			</causalConnector>	
			
			<causalConnector id="onBeginStartSet_var_delay_duration">
				<connectorParam name="var"/>
				<connectorParam name="delay"/>				
				<connectorParam name="duration"/>
				<simpleCondition role="onBegin"/>
				<compoundAction operator="seq">
					<simpleAction role="start"/>
					<simpleAction role="set" value="$var" delay="$delay" duration="$duration"/>
				</compoundAction>	
			</causalConnector>
			
			<causalConnector id="onSelectionSet_varStop">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var" 
					max="unbounded" qualifier="par"/>
					<simpleAction role="stop"/>	
				</compoundAction>				
			</causalConnector>
			
			<causalConnector id="onSelection_orSet_varStopStart">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection" qualifier="or" max="unbounded"/>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var" 
					max="unbounded" qualifier="par"/>
					<simpleAction role="stop"/>
					<simpleAction role="start"/>
				</compoundAction>
			</causalConnector>
			
			
			<causalConnector id="onBeginSet_var">
				<connectorParam name="var"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="set" value="$var"/>				
			</causalConnector>
			
			<causalConnector id="onEndSet_varStop_delay">
				<connectorParam name="var"/>
				<simpleCondition role="onEnd"/>
				<compoundAction operator="seq">
				    <simpleAction role="set" value="$var"/>				
					<simpleAction role="stop" max="unbounded" qualifier="par" delay="3s"/>
				</compoundAction>
			</causalConnector>
			
			<causalConnector id="onEndStop_delay">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop" max="unbounded" qualifier="par" delay="3s"/>
			</causalConnector>
			
			<causalConnector id="onOrSelectionSetStop">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection" qualifier="or" max="unbounded"/>
				<compoundAction operator="seq">
					<simpleAction role="set" value="$var" max="unbounded" qualifier="par"/>
					<simpleAction role="stop"/>
				</compoundAction>
			</causalConnector>
			
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>
			</causalConnector>
		<causalConnector id="onKeySelectionStartStop">
			<connectorParam name="aKey"/>
			<simpleCondition role="onSelection" key="#aKey" />
			<compoundAction operator="par">
				<simpleAction role="start" max="unbounded" qualifier="par"/>
				<simpleAction role="stop" max="unbounded" qualifier="par"/>
			</compoundAction>
		</causalConnector>
		</connectorBase>
	</head>
</ncl>

