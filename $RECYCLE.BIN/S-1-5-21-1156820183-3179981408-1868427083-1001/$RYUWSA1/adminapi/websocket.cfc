����  - 
SourceFile /CFIDE/adminapi/websocket.cfc *cfwebsocket2ecfc1359814186$funcGETPROPERTY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - PROPERTYNAME / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 
	         ; _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V = >
   ? _setCurrentLineNo (I)V A B
   C 	component E CFIDE.adminapi.accessmanager G CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; I J coldfusion/runtime/CFPage L
 M K set (Ljava/lang/Object;)V O P coldfusion/runtime/Variable R
 S Q 
		 U _get &(Ljava/lang/String;)Ljava/lang/Object; W X
   Y checkAdminRoles [ java/lang/Object ] coldfusion.serversettings _ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; a b
   c 	
			 e 	__HTSWT_0 Lcoldfusion/util/FastHashtable; g h	  i  java/lang/String l _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; n o
   p _String &(Ljava/lang/Object;)Ljava/lang/String; r s coldfusion/runtime/Cast u
 v t Trim &(Ljava/lang/String;)Ljava/lang/String; x y
 M z __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I | }
   ~ 	VARIABLES � WEBSOCKETSERVICE � _resolve � o
   � isWebSocketServiceEnabled � isProxyEnabled � isNormalPortListenerEnabled � getPort � getMaxFrameSize � isFlashFallBackEnabled � isClusterEnabled � getMulticastPort � isSSLEnabled � 
getSSLPort � getKeyStorePath � getKeyStorePassword � coldfusion/runtime/SwitchTable �
 � 	 ENABLESECUREWEBSOCKET � addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable; � �
 � � MULTICASTPORT � PORT � ENABLEWEBSOCKETSERVER � ENABLENORMALPORTLISTENER � STARTFLASHPOLICYSERVER � KEYSTOREPATH � MAXDATASIZE � ENABLEPROXYPORT � KEYSTOREPASSWORD � SSLPORT � ENABLEWEBSOCKETCLUSTER � getProperty � metaData Ljava/lang/Object; � �	  � any � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � 2Returns the value of a WebSocket property setting. � 
Parameters � REQUIRED � Yes � HINT ��<br><br>Valid Properties are:
			<UL>
			<LI>EnableWebSocketServer</LI>
			<LI>EnableProxyPort</LI>
            <LI>EnableNormalPortListener</LI>
			<LI>Port</LI>
			<LI>MaxDataSize</LI>
			<LI>StartFlashPolicyServer</LI>
			<LI>EnableWebSocketCluster</LI>
			<LI>MulticastPort</LI>
			<LI>EnableSecureWebSocket</LI>
			<LI>SSLPort</LI>
			<LI>KeyStorePath</LI>
			<LI>KeyStorePassword</LI>            
			</UL> � NAME � propertyName � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this ,Lcfwebsocket2ecfc1359814186$funcGETPROPERTY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       g h    � �   	  � �  �   "     � ð    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     Ű    �        � �    � �  �   (     
� mY0S�    �       
 � �    � �  �  �    �+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::-<� @
-/� D-FH� N� T-V� @-0� D--� Z\� ^Y`S� dW-f� @� j-4� D-k� mY0S� q� w� {� �     �          @   c   �   �   �   �    5  X  {  �  �-7� D--�� mY�S� ��� ^� d���-;� D--�� mY�S� ��� ^� d��a-?� D--�� mY�S� ��� ^� d��>-C� D--�� mY�S� ��� ^� d��-G� D--�� mY�S� ��� ^� d�� �-K� D--�� mY�S� ��� ^� d�� �-O� D--�� mY�S� ��� ^� d�� �-S� D--�� mY�S� ��� ^� d�� �-W� D--�� mY�S� ��� ^� d�� l-Z� D--�� mY�S� ��� ^� d�� I-]� D--�� mY�S� ��� ^� d�� &-`� D--�� mY�S� ��� ^� d�� -V� @�    �   z   � � �    � � �   � � �   � � �   � � �   � �    � �   � + ,   �    �  	  �  
  � /   � p    D / M / M / O / O / L / L / L / L / D / D / f 0 f 0 t 0 t 0 e 0 e 0 e 0 e 0 � 4 � 4 � 4 � 4 � 4 � 4 � 6 � 7 � 7 � 7 � 7 � 7 8 : ; ; ; ; ;' <* >0 ?0 ?0 ?0 ?0 ?J @M BS CS CS CS CS Cm Dp Fv Gv Gv Gv Gv G� H� J� K� K� K� K� K� L� N� O� O� O� O� O� P� R� S� S� S� S� S� T� V W W W W W X Y% Z% Z% Z% Z% Z? [B \H ]H ]H ]H ]H ]b ^e _k `k `k `k `k `� a � 4 � 1     �   #     *� 
�    �        � �      �   �     ٻ �Y� ��� ��� ��� ��� ��� ��� ��
� ��� ��� ��� ��	� ��� �� j� �Y� ^Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� ^Y� �Y� ^Y�SY�SY�SY�SY�SY�S� �SS� � ñ    �       � � �    �  �   !     ǰ    �        � �        ����  - 
SourceFile /CFIDE/adminapi/websocket.cfc *cfwebsocket2ecfc1359814186$funcSETPROPERTY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - PROPERTYNAME / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 PROPERTYVALUE ; 
	         = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
   A _setCurrentLineNo (I)V C D
   E 	component G CFIDE.adminapi.accessmanager I CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _get &(Ljava/lang/String;)Ljava/lang/Object; W X
   Y checkAdminRoles [ java/lang/Object ] coldfusion.serversettings _ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; a b
   c 

			
			 e 	__HTSWT_1 Lcoldfusion/util/FastHashtable; g h	  i  java/lang/String l _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; n o
   p _String &(Ljava/lang/Object;)Ljava/lang/String; r s coldfusion/runtime/Cast u
 v t Trim &(Ljava/lang/String;)Ljava/lang/String; x y
 O z __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I | }
   ~ 	VARIABLES � WEBSOCKETSERVICE � _resolve � o
   � setWebSocketServiceEnabled � setProxyEnabled � setNormalPortListenerEnabled � setPort � setMaxFrameSize � setFlashFallBackEnabled � setClusterEnabled � setMulticastPort � setSSLEnabled � 
setSSLPort � setKeyStorePath � setKeyStorePassword � coldfusion/runtime/SwitchTable �
 � 	 ENABLESECUREWEBSOCKET � addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable; � �
 � � MULTICASTPORT � PORT � ENABLEWEBSOCKETSERVER � ENABLENORMALPORTLISTENER � STARTFLASHPOLICYSERVER � KEYSTOREPATH � MAXDATASIZE � ENABLEPROXYPORT � KEYSTOREPASSWORD � SSLPORT � ENABLEWEBSOCKETCLUSTER � 
	 � setProperty � metaData Ljava/lang/Object; � �	  � any � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � /Sets the value of a WebSocket property setting. � 
Parameters � REQUIRED � Yes � HINT ��<br><br>Valid Properties are:
			<UL>
			<LI>EnableWebSocketServer</LI>
			<LI>EnableProxyPort</LI>
            <LI>EnableNormalPortListener</LI>
			<LI>Port</LI>            
			<LI>MaxDataSize</LI>
			<LI>StartFlashPolicyServer</LI>
			<LI>EnableWebSocketCluster</LI>
			<LI>MulticastPort</LI>
			<LI>EnableSecureWebSocket</LI>
			<LI>SSLPort</LI>
			<LI>KeyStorePath</LI>
			<LI>KeyStorePassword</LI>
			</UL> � NAME � propertyName � ([Ljava/lang/Object;)V  �
 � � (Value to set for the specified property. � propertyValue � getMetadata ()Ljava/lang/Object; this ,Lcfwebsocket2ecfc1359814186$funcSETPROPERTY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       g h    � �   	  � �  �   "     � Ű    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ǰ    �        � �    � �  �   -     � mY0SY<S�    �        � �    � �  �  D    �+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::*<� 6� ::->� B
-|� F-HJ� P� V->� B-}� F--� Z\� ^Y`S� dW-f� B� j- �� F-k� mY0S� q� w� {� �    �          ?   u   �   �    M  �  �  �  %  [  �- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d��U- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d��- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d���- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d���- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d��}- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d��G- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d��- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d�� �- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d�� �- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d�� o- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d�� 9- �� F--�� mY�S� ��� ^Y-k� mY<S� qS� d�� -�� B�    �   �   � � �    � � �   �  �   �   �   �   � �   � + ,   �    �  	  �  
  � /   � ; 	  " �   j T | ] | ] | _ | _ | \ | \ | \ | \ | T | T | v } v } � } � } u } u } u } u } � � � � � � � � � � � � � � � � � � � � � � � � � �' �* �I �I �1 �1 �1 �1 �1 �] �` � � �g �g �g �g �g �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �! �! �	 �	 �	 �	 �	 �5 �8 �W �W �? �? �? �? �? �k �n �� �� �u �u �u �u �u �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �/ �/ � � � � � �C �F �e �e �M �M �M �M �M �y � � � �      �   #     *� 
�    �        � �   
   �  $    � �Y� ��� ��� ��� ��� ��� ��� ��
� ��� ��� ��� ��	� ��� �� j� �Y� ^Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� ^Y� �Y� ^Y�SY�SY�SY�SY�SY�S� �SY� �Y� ^Y�SY�SY�SY�SY�SY�S� �SS� � ű    �       � �    �  �   !     ɰ    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/websocket.cfc cfwebsocket2ecfc1359814186  coldfusion/runtime/CFComponent  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   REQUEST Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   FACTORY   	   com.macromedia.SourceModTime  [�;�� pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	  # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	  - Cp1252 / setPageEncoding (Ljava/lang/String;)V 1 2 !coldfusion/runtime/NeoPageContext 4
 5 3 LOCALE 7 REQUEST.LOCALE 9 _setCurrentLineNo (I)V ; <
  = java ? java.util.Locale A CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; C D coldfusion/runtime/CFPage F
 G E 
getDefault I java/lang/Object K _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; M N
  O getLanguage Q checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V S T
  U 	VARIABLES W java/lang/String Y  coldfusion.server.ServiceFactory [ _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V ] ^
  _ WEBSOCKETSERVICE a _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; c d
  e getWebsocketService g setProperty Lcoldfusion/runtime/UDFMethod; *cfwebsocket2ecfc1359814186$funcSETPROPERTY k
 l 	 i j	  n SETPROPERTY p registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V r s
  t getProperty *cfwebsocket2ecfc1359814186$funcGETPROPERTY w
 x 	 v j	  z GETPROPERTY | metaData Ljava/lang/Object; ~ 	  � &coldfusion/runtime/AttributeCollection � _implicitMethods Ljava/util/Map; � �	  � displayname � 	websocket � extends � base � hint � Manages websocket settings. � Name � 	Functions �	 l �	 x � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this Lcfwebsocket2ecfc1359814186; LocalVariableTable Code _setImplicitMethods (Ljava/util/Map;)V implicitMethods varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; 
getExtends ()Ljava/lang/String; registerUDFs runPage out Ljavax/servlet/jsp/JspWriter; value LineNumberTable _getImplicitMethods ()Ljava/util/Map; <clinit> 1                 i j    v j    ~    
 � �   	  � �  �   "     � ��    �        � �    � �  �   -     +� ��    �        � �      � �      �   Q     *+,� **+,� � **+,� � �    �         � �      � �     � �   � �  �   !     ��    �        � �    �   �   1     *q� o� u*}� {� u�    �        � �    � �  �  Z 	    �*� $� *L*� .N*� $0� 6**� 8:*� >**� >**� >*@B� HJ� L� PR� L� P� V*X� ZYS*� >*@\� H� `*X� ZYbS*� >***� � fh� L� P� `�    �   *    � � �     � � �    � �     � + ,  �   �     4  4  6  6  3  3  ,  ,  %  %  %  %  c  c  e  e  b  b  b  b  P  P  �  �          m  m        �   #     *� 
�    �        � �    � �  �   "     � ��    �        � �    �   �   � 	    h� lY� m� o� xY� y� {� �Y
� LY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� LY� �SY� �SS� �� ��    �       h � �   �     V j V j \  \            