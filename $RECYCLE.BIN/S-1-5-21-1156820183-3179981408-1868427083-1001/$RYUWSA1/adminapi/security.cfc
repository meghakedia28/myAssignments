����  - � 
SourceFile /CFIDE/adminapi/security.cfc 'cfsecurity2ecfc497454422$funcDELETEUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USERNAME 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 9 :
  ; 
        
         = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
 " A _setCurrentLineNo (I)V C D
 " E 	component G CFIDE.adminapi.accessmanager I CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S 		                    
		 W java Y  coldfusion.server.ServiceFactory [ getSecurityService ] java/lang/Object _ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; a b
 " c 
		 e _get &(Ljava/lang/String;)Ljava/lang/Object; g h
 " i checkRootAdminUser k 

		 m deleteAuthorizedUser o  java/lang/String r _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; t u
 " v LOGAUDIT x logaudit z msg | java/lang/StringBuffer ~  removed the user  � (Ljava/lang/String;)V  �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
  � . � toString ()Ljava/lang/String; � �
 ` � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 7 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � 
deleteUser � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � Removes the user. � 
Parameters � REQUIRED � true � HINT � -Specifies the username of the user to delete. � NAME � username � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this )Lcfsecurity2ecfc497454422$funcDELETEUSER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� sY2S�    �       
 � �    � �  �  �    B+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*2� 8� <:->� B
-	�� F-HJ� P� V-X� B-	�� F--	�� F-Z\� P^� `� d� V-f� B-	�� F--� jl� `� dW-n� B-	�� F-- � jp� `Y-q� sY2S� wS� dW-f� B-	�� F-y� j{-� 7Y� sY}S� `Y� Y�� �-q� sY2S� w� �� ��� �� �S� �� �W-�� B�    �   �   B � �    B � �   B � �   B � �   B � �   B � �   B � �   B - .   B  �   B  � 	  B  � 
  B  �   B 1 �  �   � 9  	� L	� V	� V	� X	� X	� U	� U	� U	� U	� L	� L	� h	� z	� z	� |	� |	� y	� y	� q	� q	� q	� q	� h	� h	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	�	�	�	�	�	�	�	�	�(	�(	�
	�
	� �	� �	� �	� �	�     �   #     *� 
�    �        � �    �   �   �     �� �Y� `Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� `Y� �Y� `Y�SY�SY�SY�SY�SY�S� �SS� ȳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 1cfsecurity2ecfc497454422$funcDISABLESECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ disableSecureProfile ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s ]Disables secure profile and reverts all required settings from secure value to default value. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this 3Lcfsecurity2ecfc497454422$funcDISABLESECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-K� :-<>� D� J-2� 6-M� :--� NP� R� VW-N� :--N� :-XZ� D\� R� V� J-O� :-- � N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   J < K E K E K G K G K D K D K D K D K < K < K ^ M ^ M ] M ] M ] M n N ~ N ~ N � N � N } N } N v N v N v N v N n N � O � O � O � O � O � O � O ] L     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcENABLERDSSERVLET  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   WEBX  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 true 7 set (Ljava/lang/Object;)V 9 : coldfusion/runtime/Variable <
 = ;   ? 

		 A *coldfusion/runtime/TransientVariableHolder C &(Lcoldfusion/runtime/NeoPageContext;)V  E
 D F 
			 H _setCurrentLineNo (I)V J K
 " L GetPageContext %()Lcoldfusion/runtime/NeoPageContext; N O coldfusion/runtime/CFPage Q
 R P 
getRequest T java/lang/Object V _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; X Y
 " Z getRealPath \ /WEB-INF ^ _String &(Ljava/lang/Object;)Ljava/lang/String; ` a coldfusion/runtime/Cast c
 d b web.xml f concat &(Ljava/lang/String;)Ljava/lang/String; h i java/lang/String k
 l j 
FileExists (Ljava/lang/String;)Z n o
 R p 
				 r PATH t _set '(Ljava/lang/String;Ljava/lang/Object;)V v w
 " x java/lang/StringBuffer z SERVER | 
COLDFUSION ~ ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � (Ljava/lang/String;)V  �
 { � FS � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 { � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 W � 	
		
			 � path � 	IsDefined � o
 R � 
				
				 � DISABLERDSSERVLET � _get � �
 " � disableRDSServlet � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � K
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 " � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � WEBXML � XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList; � 
 R LEN web-app _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
 "	 _Map #(Ljava/lang/Object;)Ljava/util/Map;
 d XMLCHILDREN 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 " ArrayLen (Ljava/lang/Object;)I
 R _Object (D)Ljava/lang/Object;
 d xmlChildren _Xml 0(Ljava/lang/Object;)Lcoldfusion/xml/XmlNodeList;
 d  servlet-mapping" 
XmlElemNew L(Lcoldfusion/xml/XmlNodeList;Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList;$%
 R& _arraySetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V()
 "* 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;,
 "- _LhsResolve/
 "0 12 servlet-name4 :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V(6
 "7 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;9
 ": XMLTEXT< 
RDSServlet> _structSetAt@6
 "A 2C url-patternE /CFIDE/main/ide.cfmG doAfterBodyI �
 �J doEndTagL �
 �M doCatch (Ljava/lang/Throwable;)VOP
 �Q 	doFinallyS 
 �T WRITEV outputX ToStringZ a
 R[ \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �]
 "^ 	setOutput` :
 �a falsec 

			
			e unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;gh coldfusion/runtime/NeoExceptionj
ki t0 [Ljava/lang/String; Anyomn	 q findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ist
ku CFCATCHw bindy w
 Dz unbind| 
 D} 
	 enableRDSServlet� metaData Ljava/lang/Object;��	 � boolean� &coldfusion/runtime/AttributeCollection� name� access� private� 
returntype� hint� 1Enables the servlet that performs RDS processing.� 
Parameters� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcENABLERDSSERVLET; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; lock22  Lcoldfusion/tagext/lang/LockTag; mode22 I file21 Lcoldfusion/tagext/io/FileTag; t16 t17 t18 Ljava/lang/Throwable; t19 t20 lock24 mode24 file23 t24 t25 t26 t27 t28 t29 #Lcoldfusion/runtime/AbortException; t30 Ljava/lang/Exception; __cfcatchThrowable3 t32 t33 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   mn   ��   	 �� �   "     ���   �       ��   � � �   "     ��   �       ��   � � �         �   �       ��   � � �   "     ��   �       ��   �� �   #     � l�   �       ��   �� �  q 
 "  �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
8� >-2� 6@� >-B� 6� DY-� &� G:-I� 6-�� M--�� M--�� M--�� M-� SU� W� []� WY_S� [� eg� m� q� ]-s� 6-u-�� M--�� M--�� M-� SU� W� []� WY_S� [� eg� m� y-I� 6� �-�� M-� {Y-}� lYSY�S� �� e� �-�� �� e� ��� �-�� �� e� ��� �-�� �� e� �g� �� �� q� m-s� 6-u� {Y-}� lYSY�S� �� e� �-�� �� e� ��� �-�� �� e� ��� �-�� �� e� �g� �� �� y-I� 6-�� 6-�� M-�� ���-�� 6-�� M-�� ��-� W� �W-�� 6-� �� �� �:-�� M¶ �Ƕ �� �� �� �Y6�>-ٶ 6-� �� �� �:-�� M� ���-u� �� e� �� �� �� �� �� �� :����-ٶ 6-�� M--�� �� e�� >--�� M-- �
�� lYS���c�� y- � WYSYSY-� �S-�� M-- � ��!#�'�+-- � WYSYSY-� �S�.�� lYS�1� WY3S-�� M-- � ��!5�'�8--- � WYSYSY-� �S�.�� lYS�13�;�� lY=S?�B-- � WYSYSY-� �S�.�� lYS�1� WYDS-�� M-- � ��!F�'�8--- � WYSYSY-� �S�.�� lYS�1D�;�� lY=SH�B-s� 6�K����N� :� &���� � #:�R� � :� �:�U�-s� 6-� �� �� �:-�� M¶ �Ƕ �� �� �� �Y6� �-ٶ 6-� �� �� �:-�� MW� ���-u� �� e� �� ��Y-�� M-- � ��\�_�b� �� �� �� :� K� ��-s� 6�K��x�N� :� &� ��� � #:�R� � :� �:�U�-I� 6� -s� 6
d� >-I� 6-f� 6� d� j:�:�l:�r�v�    7           x�{-s� 6
d� >-I� 6� �� � : �  �:!�~�!-2� 6-� ��-�� 6� !G�����������G������������������������������������������������� g������������� g�	���	���	���	��	� g�Z���Z���Z���Z��Z�WZ�Z_Z� �  V "  ���    ���   ���   ���   ���   ���   ���   � - .   � �   � � 	  � � 
  � �   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���    ��� !�  v  � <� >� >� >� >� <� <� K� M� M� M� M� K� K� �� �� �� �� �� �� ~� ~� ~� ~� �� �� ~� ~� ~� ~� v� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������0�0�0�0�<�<�A�A�A�A�M�M�R�R�R�R�^�^�������{�{�{�{�������������������������������������w�w�w�w�t�t�� v���������������������.�.�5�5�r�r�}�}�}�}�����Z�������������������������������������������������������+�+�+�+�4�4�*�*�*�*��G�G�M�M�S�S�=�=�t�t�����������������=������������������������������������������������� � � � �)�)�������=�=�C�C�I�I�3�3�d�d�w�w�w�w�2������������,�,�8�8�8�8�W�W�V�V�V�V��������������������@�@�@�@�>�>� Z�s�s�s�s�s�    �   #     *� 
�   �       ��   �  �   �     |�� �� �ܸ �� �� lYpS�r��Y� WY�SY�SY�SY�SYYSYdSY�SY�SY�SY	�SY
�SY� WS�����   �       |��   � � �   "     d�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcSETALLOWEDIPADDRESSES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   IPUTILS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! IPLIST # MGR % IPADDR ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 DEBUGIP 9 string ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? 3coldfusion/tagext/validation/CFTypeValidatorFactory C STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; E F	 D G _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; I J
  K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 * Q _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y set (Ljava/lang/Object;)V ] ^ coldfusion/runtime/Variable `
 a _   c 
        	 e 	component g CFIDE.adminapi.accessmanager i CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; k l
 [ m _get &(Ljava/lang/String;)Ljava/lang/Object; o p
 * q checkRootAdminUser s java/lang/Object u _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; w x
 * y java {  coldfusion.server.ServiceFactory } getSecurityService  
		
		 � -coldfusion.servicelayer.ExposedServiceManager � getInstance � _autoscalarize � p
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 [ � I � 1 � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 * � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 [ � *coldfusion/runtime/TransientVariableHolder � &(Lcoldfusion/runtime/NeoPageContext;)V  �
 � � VALIDATEDIPADDR � getExpandedIPNValidate � IPVALID � true � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � any � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � ex � bind � �
 � � false � unbind � 
 � � _boolean (Ljava/lang/Object;)Z � �
 � � getAllowedIPList � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 [ � (J)Z � �
 � � _Object (Z)Ljava/lang/Object; � �
 � � setAllowedIPList � 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message  	INVALIDIP concat �
 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 *	 
setMessage �
 � 	hasEndTag (Z)V
 � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
 * _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; �
 � ArrayLen (Ljava/lang/Object;)I
 [ (I)Ljava/lang/Object; �!
 �" _compare '(Ljava/lang/Object;Ljava/lang/Object;)D$%
 *& LOGAUDIT( logaudit* msg, java/lang/StringBuffer. d added a list of one or more client IP addresses that should be allowed to invoke exposed services: 0  �
/2  _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;56
 *7 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;9:
/; .= toString ()Ljava/lang/String;?@
 vA )([Ljava/lang/Object;[Ljava/lang/Object;)V C
 AD 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;FG
 *H 
	J setAllowedIPAddressesL metaData Ljava/lang/Object;NO	 P voidR &coldfusion/runtime/AttributeCollectionT nameV accessX publicZ output\ 
returntype^ hint` aSets a list of one or more client IP addresses that should be allowed to invoke exposed services.b 
Parametersd REQUIREDf Yesh TYPEj HINTl List of IP addresses.n NAMEp debugipr ([Ljava/lang/Object;)V t
Uu getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcSETALLOWEDIPADDRESSES; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t17 ,Lcoldfusion/runtime/TransientVariableHolder; t18 #Lcoldfusion/runtime/AbortException; t19 Ljava/lang/Exception; __cfcatchThrowable7 Ljava/lang/Throwable; t21 t22 throw54 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable !coldfusion/runtime/AbortException� java/lang/Exception� java/lang/Throwable� <clinit> 	getOutput 1       � �    � �   NO   	 wx |   "     �Q�   {       yz   }@ |   "     M�   {       yz   ~ |         �   {       yz   �@ |   "     S�   {       yz   �� |   (     
� �Y:S�   {       
yz   �� |       �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:<� B� H� L:-N� R-	�� V-� \� b-N� Rd� b-f� R-	�� V-hj� n� b-N� R-	�� V-- � rt� v� zW-N� R-	�� V--	�� V-|~� n�� v� z� b-�� R-	�� V-|�� n� b
-	�� V--&� r�� v� z� b-	�� V-:� �� �� �� b-��� ���-	�� V-$-�� �� �� �� �� b� �Y-� .� �:-�-	�� V--� r�� vY-(� �S� z� �-��� �� U� [:�:� �:� �� ª      (           �� �-�ɶ �� �� � :� �:� ̩-�� �Y� Й :W-	�� V-	�� V--"� r�� v� z� �-�� �� �� օ� ��� ݸ Й N-	�� V--"� r�� vY-	�� V-	�� V--"� r�� v� z� �-�� �� �� �S� zW� c-�� �� ��� U-� �� �� �:-	�� V�� ��-� �� �-(� �� ����
���� �-�-�� ��c�� �-�� �-	�� V-$� �� �#�'�t|���-N� R-	�� V-)� r+-� AY� �Y-S� vY�/Y1�3-4� �Y:S�8� ��<>�<�BS�E�IW-K� R� ~���~���~����������� {   �   �yz    ���   ��O   ���   ���   ���   ��O   � 5 6   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � 9�   ���   ���   ���   ���   ���   ��O   ��� �  J �  	� o	� y	� y	� x	� x	� x	� x	� o	� o	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� 	�
	�
	�	�	�		�		�		�		� 	�	�	�	�	�	�	�	�	�9	�9	�9	�9	�9	�9	�9	�9	�0	�K	�K	�K	�K	�H	�_	�_	�\	�\	�\	�\	�\	�\	�\	�\	�S	��	��	��	��	��	��	��	��	�~	��	��	��	��	��	��	��	��	��	��	�q	�
	�
	�
	�
	�'	�'	�&	�&	�&	�&	�9	�9	�9	�9	�&	�&	�&	�&	�&	�&	�&	�&	�
	�
	�\	�\	�y	�y	�x	�x	�x	�x	��	��	��	��	�x	�x	�[	�[	�[	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	�
	�	�	�	�	�	�	�	�	�	�	��	�	�	� 	� 	� 	� 	�	�	�H	� 	�I	�I	�l	�l	�r	�r	�r	�r	�r	�r	��	��	�h	�h	�I	�I	�I	�I	�    |   #     *� 
�   {       yz   �  |   �     �� �Y�S� �� �� �UY� vYWSYMSYYSY[SY]SY�SY_SYSSYaSY	cSY
eSY� vY�UY� vYgSYiSYkSY<SYmSYoSYqSYsS�vSS�v�Q�   {       �yz   �@ |   !     ɰ   {       yz        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcGETALLEXPOSEDSERVICES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ checkRootAdminUser ] getAllExposedServices _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g &coldfusion/runtime/AttributeCollection i name k 
Parameters m ([Ljava/lang/Object;)V  o
 j p getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcGETALLEXPOSEDSERVICES; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       e f     r s  w   "     � h�    v        t u    x y  w   !     `�    v        t u    z {  w   #     � d�    v        t u    | }  w  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--� \^� T� XW-L� 6-�� :-- � \`� T� X�-b� 6�    v   z    � t u     � ~     � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� ��     w   #     *� 
�    v        t u    �   w   C     %� jY� TYlSY`SYnSY� TS� q� h�    v       % t u        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcENABLESECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ enableSecureProfile ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s @Enables secure profile and applies all required settings for it. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcENABLESECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-B� :-<>� D� J-2� 6-D� :--� NP� R� VW-E� :--E� :-XZ� D\� R� V� J-F� :-- � N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   A < B E B E B G B G B D B D B D B D B < B < B ^ D ^ D ] D ] D ] D n E ~ E ~ E � E � E } E } E v E v E v E v E n E � F � F � F � F � F � F � F ] C     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc497454422$funcGETWEBINFDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 
		 * _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V , -
  . %class$coldfusion$tagext$lang$ParamTag Ljava/lang/Class; coldfusion.tagext.lang.ParamTag 2 forName %(Ljava/lang/String;)Ljava/lang/Class; 4 5 java/lang/Class 7
 8 6 0 1	  : _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; < =
  > coldfusion/tagext/lang/ParamTag @ _setCurrentLineNo (I)V B C
  D sep F setName (Ljava/lang/String;)V H I
 A J cfparam L default N java P java.lang.System R CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; T U coldfusion/runtime/CFPage W
 X V getProperty Z java/lang/Object \ file.separator ^ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ` a
  b _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; d e
  f 
setDefault (Ljava/lang/Object;)V h i
 A j 	hasEndTag (Z)V l m coldfusion/tagext/GenericTag o
 p n _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z r s
  t DIR v GetPageContext %()Lcoldfusion/runtime/NeoPageContext; x y
 X z getServletContext | getRealPath ~ 	/WEB-INF/ � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
  � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 X � Right '(Ljava/lang/String;I)Ljava/lang/String; � �
 X � SEP � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
  � concat � � java/lang/String �
 � � 
	 � getWebInfDirectory � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � Returns full path for WEB-INF � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc497454422$funcGETWEBINFDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; param30 !Lcoldfusion/tagext/lang/ParamTag; LineNumberTable <clinit> 	getOutput 1       0 1    � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   #     � ��    �        � �    � �  �  � 
   %+� � :+� ,� :	-� � %:-� ):-+� /-� ;� ?� A:
-�� E
G� K
MO-�� E--�� E-QS� Y[� ]Y_S� c� g� k
� q
� u� �-+� /-w-�� E--�� E--�� E-� {}� ]� c� ]Y�S� c� �-�� E-�� E-w� �� �� �� �-�� �� ��~� -w-w� �� �-�� �� �� �� �-w� ��-�� /�    �   p   % � �    % � �   % � �   % � �   % � �   % � �   % � �   % & '   %  �   %  � 	  % � � 
 �   � ?  � D� D� _� _� a� a� ^� ^� n� n� V� V� V� V� ,� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������ �� �� �� �� �� ������� ��     �   #     *� 
�    �        � �    �   �   n     P3� 9� ;� �Y
� ]Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ]S� �� ��    �       P � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc497454422$funcGETUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   U  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! USER # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 USERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 

		  I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 & M _setCurrentLineNo (I)V O P
 & Q 	StructNew !()Lcoldfusion/util/FastHashtable; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 W e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 & q _get &(Ljava/lang/String;)Ljava/lang/Object; s t
 & u checkRootAdminUser w arguments.username y 	IsDefined (Ljava/lang/String;)Z { |
 W } getAuthorizedUser  String �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � JavaCast 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 W � true � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � PASSWORD � DESCRIPTION � 	ENABLEDDS � FILEPERMISSIONS � SERVICES � EXPOSEDSERVICES � 
user.roles � ROLES � _autoscalarize � t
 & � getAuthorizedUsers � 
	  � getUser � metaData Ljava/lang/Object; � �	  � struct � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � :Get all users or get single user by specifying a username. � 
Parameters � REQUIRED � TYPE � HINT � -Specifies the username of the user to return. � NAME � username � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc497454422$funcGETUSER; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� �Y6S�    �       
 � �    � �  �  �    ,+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:-J� N
-	B� R� X� ^-	C� R� X� ^-	D� R-`b� f� ^-	E� R--	E� R-hj� fl� n� r� ^-	G� R-- � vx� n� rW-	I� R-z� ~�6-	K� R--"� v�� nY-	K� R-�-�� �Y6S� �� �SY�S� r� ^-� �Y6S-$� �Y6S� �� �-� �Y�S-$� �Y�S� �� �-� �Y�S-$� �Y�S� �� �-� �Y�S-$� �Y�S� �� �-� �Y�S-$� �Y�S� �� �-� �Y�S-$� �Y�S� �� �-	R� R-�� ~� !-� �Y�S-$� �Y�S� �� �-� ��� -	[� R--"� v�� n� r�-�� N�    �   �   , � �    , � �   , � �   , � �   , � �   , � �   , � �   , 1 2   ,  �   ,  � 	  ,  � 
  ,  �   , ! �   , # �   , 5 �  �  � q  	> _	B h	B h	B h	B h	B _	B n	C w	C w	C w	C w	C n	C }	D �	D �	D �	D �	D �	D �	D �	D �	D }	D �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	E �	G �	G �	G �	G �	G �	I �	I �	I �	I �	K �	K �	K �	K 	K 	K �	K �	K	K	K �	K �	K �	K �	K �	K*	L*	L*	L*	L	LH	MH	MH	MH	M<	Mf	Nf	Nf	Nf	NZ	N�	O�	O�	O�	Ox	O�	P�	P�	P�	P�	P�	Q�	Q�	Q�	Q�	Q�	R�	R�	R�	R�	T�	T�	T�	T�	T�	R 	W 	W 	W 	W 	W	[	[	[	[	[	[	[ �	I _	A     �   #     *� 
�    �        � �    �   �   �     �� �Y� nY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� nY� �Y� nY�SY�SY�SY8SY�SY�SY�SY�S� �SS� ճ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcSETUSERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRDSSecurityEnabled s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z LOGAUDIT | logaudit ~ msg � isapplication �  changed RDS password. � true � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseRDSPassword � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether RDS security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcSETUSERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  �    #+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--� pr� h� lW- �� N-- � pt� hY-u� wY2S� {S� lW-`� J- Ķ N-}� p-� 9Y� wY�SY�S� hY�SY�S� �� �W-�� J�    �   �   # � �    # � �   # � �   # � �   # � �   # � �   # � �   # - .   #  �   #  � 	  #  � 
  #  �   # 1 �  �   � 0   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
 �
 � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  -W 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcGETDISABLEDCFTAGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   	ADISABLED  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  AENABLEDTAGS ! ACCESSMANAGER # AENABLED % ANEWENABLED ' SECURITY ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] 

         a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 _ i java k  coldfusion.server.ServiceFactory m getSecurityService o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 . u _get &(Ljava/lang/String;)Ljava/lang/Object; w x
 . y checkAdminRoles { Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary } false  java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � x
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 _ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � ARRAYPOS � GETTAGPERMISSIONPOSITION � getTagPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � TARGET � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 _ � *- � 	_contains '(Ljava/lang/String;Ljava/lang/String;)Z � �
 . � RemoveChars ((Ljava/lang/String;II)Ljava/lang/String; � �
 _  ListToArray $(Ljava/lang/String;)Ljava/util/List;
 _ _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase
 asc 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z
 _  
	 getDisabledCFTags metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name access public  output" hint$ AReturns an array of tags that have been disabled for the sandbox.& 
Parameters( REQUIRED* true, HINT. ESpecifies the sandbox directory for which disabled tags are returned.0 NAME2 	directory4 ([Ljava/lang/Object;)V 6
7 getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcGETDISABLEDCFTAGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw31 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       9: >   "     ��   =       ;<   ?@ >   "     �   =       ;<   AB >         �   =       ;<   CD >   (     
� �Y>S�   =       
;<   EF >  � 
   +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V-J� N-�� Z-� `� V-J� N-�� Z-� `� V-J� N
-�� Z-� `� V-J� N-�� Z-� `� V-J� N-�� Z-� `� V-b� N-�� Z-df� j� V-J� N- � Z-- � Z-ln� jp� r� v� V-J� N-� Z--$� z|� rY~SY�S� vW-J� N-� Z--*� �Y�S� �-,� �� �� �-�� �Y>S� �� �� ��� G-� �� �� �:-� Z�� ���-�� �� ��� Ŷ �� �� Й �-	� Z--*� �Y�S� �� rY-,� �SY->� �S� Ӹ ׶ V-�-� Z-۶ z�-� rY-,� �SY->� �S� � �-�-- -ٶ �� � �� �Y�S� �� �-� �� ��� � C-� Z-� �� �� ��� �� '
-� Z-� Z-� �� ���� V-� Z-� ��	�W-� ��-� N�   =   �   ;<    GH   I   JK   LM   NO   P    9 :    Q    Q 	   Q 
   Q    !Q    #Q    %Q    'Q    )Q    +Q    =Q   RS T   �  � |� ~� ~� ~� ~� |� |� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������������$ 6 6 8 8 5 5 - - - - $ $ YYggllXXXX������������������������				$	$							�	>>MMVV>>>>4jjffffc�������������������������������������������������������    >   #     *� 
�   =       ;<   U  >   �     ��� �� ��Y
� rYSYSYSY!SY#SY�SY%SY'SY)SY	� rY�Y� rY+SY-SY/SY1SY3SY5S�8SS�8��   =       �;<   V@ >   !     ��   =       ;<        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcISLOGINUSERIDREQUIRED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SECURITY  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 
		 / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 java 9  coldfusion.server.ServiceFactory ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? getSecurityService C java/lang/Object E _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; G H
   I set (Ljava/lang/Object;)V K L coldfusion/runtime/Variable N
 O M _get &(Ljava/lang/String;)Ljava/lang/Object; Q R
   S isAdminUserIdRequired U 
	 W java/lang/String Y isLoginUserIdRequired [ metaData Ljava/lang/Object; ] ^	  _ false a &coldfusion/runtime/AttributeCollection c name e access g public i output k hint m �Checks whether or not a user id is required in addition to a password in order to login. If this returns true, a user id must be passed to the login function in addition to a password. o 
Parameters q ([Ljava/lang/Object;)V  s
 d t getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcISLOGINUSERIDREQUIRED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ] ^     v w  {   "     � `�    z        x y    | }  {   !     \�    z        x y    ~   {         �    z        x y    � �  {   #     � Z�    z        x y    � �  {  ^     �+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-r� 8--r� 8-:<� BD� F� J� P-0� 4-s� 8--� TV� F� J�-X� 4�    z   p    � x y     � � �    � � ^    � � �    � � �    � � �    � � ^    � + ,    �  �    �  � 	   �  � 
 �   V    q 4 r D r D r F r F r C r C r < r < r < r < r 4 r 4 r f s f s e s e s e s e s e s     {   #     *� 
�    z        x y    �   {   f     H� dY
� FYfSY\SYhSYjSYlSYbSYnSYpSYrSY	� FS� u� `�    z       H x y    � }  {   !     b�    z        x y        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc497454422$funcCHECKADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C get (I)Ljava/lang/Object; E F
 9 G ISHASHED I false K put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; M N
 9 O boolean Q BOOL_VALIDATOR S >	 < T _validateArgWithValidator V B
  W 

         Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 " ] _setCurrentLineNo (I)V _ `
 " a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h coldfusion/runtime/CFPage j
 k i set (Ljava/lang/Object;)V m n coldfusion/runtime/Variable p
 q o 
		 s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 "  _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � checkRootAdminUser � checkAdminPassword �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Checks admin password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � ;Set it to true if the password sent is already hashed once. � no � DEFAULT � isHashed � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc497454422$funcCHECKADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y2SYJS�    �        � �    � �  �  u    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:� H� JL� PW*JR� :� U� X:-Z� ^
- �� b-df� l� r-t� ^- �� b-- �� b-vx� lz� |� �� r-t� ^- �� b--� ��� |� �W- �� b-- � ��� |Y-�� �Y2S� �SY-�� �YJS� �S� ��-�� ^�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �    I �  �   � ,   � U � U � v � � � � � � � � �  �  �  �  � v � v � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y
� |Y�SY�SY�SY�SY�SYLSY�SY�SY�SY	� |Y� �Y� |Y�SY�SY�SY4SY�SY�SY�SY�S� �SY� �Y
� |Y�SY�SY�SY�SY�SYRSY�SYLSY�SY	�S� �SS� �� ��    �       � � �    � �  �   !     L�    �        � �        ����  -C 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcGETSECUREDIPPORTS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SOCKETARRAY  ACCESSMANAGER ! SECURITY # I % WEBAPP ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 	DIRECTORY 9 getVariable  (I)Lcoldfusion/runtime/Variable; ; < %coldfusion/runtime/ArgumentCollection >
 ? = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		 E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 * I / K set (Ljava/lang/Object;)V M N coldfusion/runtime/Variable P
 Q O _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y 1 ] 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 [ e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 * q _get &(Ljava/lang/String;)Ljava/lang/Object; s t
 * u checkAdminRoles w Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary y false { java/lang/String } CONTEXTS  _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � _autoscalarize � t
 * � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 * � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 * � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 [ � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � java.net.SocketPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 * � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � TARGET � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 [ � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 [ � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 * � 
	 � getSecuredIPPorts  metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name access
 public output hint 2Returns an array of secured ports for the sandbox. 
Parameters REQUIRED true HINT ESpecifies the sandbox directory for which secured ports are returned. NAME 	directory  ([Ljava/lang/Object;)V "
# getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcGETSECUREDIPPORTS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw48 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       %& *   "     ��   )       '(   +, *   "     �   )       '(   -. *         �   )       '(   /0 *   (     
� ~Y:S�   )       
'(   12 *  s    [+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:� @� D:-F� JL� R
-� V-� \� R- � V-� \� R^� R-"� V-`b� f� R-#� V--#� V-hj� fl� n� r� R-%� V--"� vx� nYzSY|S� rW-'� V--$� ~Y�S� �-(� �� �� �-�� ~Y:S� �� �� ��� G-� �� �� �:-)� V�� ���-�� �� ��� �� �� �� ̙ �
--� V--$� ~Y�S� �� nY-(� �SY-:� �S� ϸ Ӷ R^� R� l---&� �� ָ �� ~Y�S� �ݸ ��� 3-5� V- � �� �---&� �� ָ �� ~Y�S� ۸ �W-&� �� �c� � R-&� �-1� V-� �� �� �� ��t|���s- � ��-�� J�   )   �   ['(    [34   [5   [67   [89   [:;   [<   [ 5 6   [ =   [ = 	  [ = 
  [ =   [ !=   [ #=   [ %=   [ '=   [ 9=   [>? @  J �   l n n n n l s } } | | | | s �  �  �  �  �  �  �  �  �! �! �! �! �! �! �" �" �" �" �" �" �" �" �" �" �# �# �# �# �# �# �# �# �# �# �# �# �% �% �% �% �% �% �% �% �% �' �''' �' �' �' �''''' �' �' �' �' �' �'W)W)W)W)4) �'�-�-�-�-�-�-�-�-�-�-�-�-x-�1�1�1�1�1�3�3�3�3�3�3�5�5�5�5�5�5�5�5�5�5�5�311111111111#1#101010101#1#1�1J9J9J9J9J9 l    *   #     *� 
�   )       '(   A  *   �     ��� �� ��Y
� nY	SYSYSYSYSY|SYSYSYSY	� nY�Y� nYSYSYSYSYSY!S�$SS�$��   )       �'(   B, *   !     |�   )       '(        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcGETUSEADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SECURITY  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 
		 / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 java 9  coldfusion.server.ServiceFactory ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? getSecurityService C java/lang/Object E _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; G H
   I set (Ljava/lang/Object;)V K L coldfusion/runtime/Variable N
 O M _get &(Ljava/lang/String;)Ljava/lang/Object; Q R
   S isAdminSecurityEnabled U 
	 W java/lang/String Y getUseAdminPassword [ metaData Ljava/lang/Object; ] ^	  _ false a &coldfusion/runtime/AttributeCollection c name e access g public i output k hint m =Checks whether ColdFusion Administrator security is required. o 
Parameters q ([Ljava/lang/Object;)V  s
 d t getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcGETUSEADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ] ^     v w  {   "     � `�    z        x y    | }  {   !     \�    z        x y    ~   {         �    z        x y    � �  {   #     � Z�    z        x y    � �  {  b     �+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-� 8--� 8-:<� BD� F� J� P-0� 4-� 8--� TV� F� J�-X� 4�    z   p    � x y     � � �    � � ^    � � �    � � �    � � �    � � ^    � + ,    �  �    �  � 	   �  � 
 �   Z     4  D  D  F  F  C  C  <  <  <  <  4  4  f  f  e  e  e  e  e  e      {   #     *� 
�    z        x y    �   {   f     H� dY
� FYfSY\SYhSYjSYlSYbSYnSYpSYrSY	� FS� u� `�    z       H x y    � }  {   !     b�    z        x y        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc *cfsecurity2ecfc497454422$funcSETRDSENABLED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ENABLED 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsEnabled s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z ACTION |   ~ _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 " � _boolean (Ljava/lang/Object;)Z � � coldfusion/runtime/Cast �
 � � enabled � disabled � LOGAUDIT � logaudit � msg � java/lang/StringBuffer �   � (Ljava/lang/String;)V  �
 � � _autoscalarize � n
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � �  RDS security. � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � (Specifies whether RDS is enabled or not. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this ,Lcfsecurity2ecfc497454422$funcSETRDSENABLED; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  *    d+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-� N-PR� X� ^-`� J-� N--� N-bd� Xf� h� l� ^-`� J-� N--� pr� h� lW-� N-- � pt� hY-u� wY2S� {S� lW-}� �-u� wY2S� {� �� -}�� �� -}�� �-`� J-� N-�� p�-� 9Y� wY�S� hY� �Y�� �-}� �� �� ��� �� �S� �� �W-�� J�    �   �   d � �    d � �   d � �   d � �   d � �   d � �   d � �   d - .   d  �   d  � 	  d  � 
  d  �   d 1 �  �  * J    O Y Y [ [ X X X X O O k } }   | | t t t t k k � � � � � � � � � � � � � � � � � � � �
 �
 �
 �
 �
 � �99>>>>>>JJ55     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� ݳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcVALIDATEDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   NEWDIR  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 	DIRECTORY / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 
		 ; _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V = >
   ? _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; A B
   C set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 

		 K _setCurrentLineNo (I)V M N
   O _String &(Ljava/lang/Object;)Ljava/lang/String; Q R coldfusion/runtime/Cast T
 U S Trim &(Ljava/lang/String;)Ljava/lang/String; W X coldfusion/runtime/CFPage Z
 [ Y Right '(Ljava/lang/String;I)Ljava/lang/String; ] ^
 [ _ /* a _compare '(Ljava/lang/Object;Ljava/lang/String;)D c d
   e concat g X java/lang/String i
 j h Left l ^
 [ m / o 	
	 q validateDirectory s metaData Ljava/lang/Object; u v	  w false y &coldfusion/runtime/AttributeCollection { java/lang/Object } name  access � private � output � hint � 8Ensure that the directory starts with / and ends with /* � 
Parameters � REQUIRED � true � HINT � &Specifies the directory to be secured. � NAME � 	directory � ([Ljava/lang/Object;)V  �
 | � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcVALIDATEDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       u v     � �  �   "     � x�    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   (     
� jY0S�    �       
 � �    � �  �  `     �+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::-<� @
-0� D� J-L� @-Ӷ P-Ӷ P-0� D� V� \� `b� f�� 
-0� D� Vb� k� J-ٶ P-� D� V� np� f�� 
p-� D� V� k� J-� D�-r� @�    �   z    � � �     � � �    � � v    � � �    � � �    � � �    � � v    � + ,    �  �    �  � 	   �  � 
   � / �  �   � >  � D� F� F� F� F� D� D� e� e� e� e� e� e� e� e� q� q� e� e� u� u� �� �� �� �� �� �� �� �� �� �� � e� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� e�     �   #     *� 
�    �        � �    �   �   �     u� |Y
� ~Y�SYtSY�SY�SY�SYzSY�SY�SY�SY	� ~Y� |Y� ~Y�SY�SY�SY�SY�SY�S� �SS� �� x�    �       u � �    � �  �   !     z�    �        � �        ����  -l 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc497454422$funcGETDISABLEDDATASOURCES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLDSNS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # I % WEBAPP ' DB ) coldfusion/runtime/CfJspPage + pageContext #Lcoldfusion/runtime/NeoPageContext; - .	 , / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	 , 9 	DIRECTORY ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E 
		 G _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V I J
 , K / M set (Ljava/lang/Object;)V O P coldfusion/runtime/Variable R
 S Q _setCurrentLineNo (I)V U V
 , W ArrayNew (I)Ljava/util/List; Y Z coldfusion/runtime/CFPage \
 ] [   _ 1 a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 ] i java k  coldfusion.server.ServiceFactory m getSecurityService o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 , u _get &(Ljava/lang/String;)Ljava/lang/Object; w x
 , y checkAdminRoles { Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary } false  CFIDE.adminapi.datasource � getDatasources � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 ] � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � _autoscalarize � x
 , � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 , � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 ] � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 , � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 , � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 , � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 , � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � #coldfusion.sql.DataSourcePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 , � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � TARGET � * � 	StructNew !()Lcoldfusion/util/FastHashtable; � �
 ] � StructDelete � �
 ] � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; �
 � ArrayLen (Ljava/lang/Object;)I
 ] (I)Ljava/lang/Object; �
 �	 '(Ljava/lang/Object;Ljava/lang/Object;)D �
 , StructKeyList #(Ljava/util/Map;)Ljava/lang/String;
 ] ListToArray $(Ljava/lang/String;)Ljava/util/List;
 ] _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase asc 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z
 ]  
	" getDisabledDatasources$ metaData Ljava/lang/Object;&'	 ( array* &coldfusion/runtime/AttributeCollection, name. access0 public2 output4 
returntype6 hint8 IReturns an array of data sources that have been disabled for the sandbox.: 
Parameters< REQUIRED> true@ HINTB MSpecifies the sandbox directory for which disabled data sources are returned.D NAMEF 	directoryH ([Ljava/lang/Object;)V J
-K getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc497454422$funcGETDISABLEDDATASOURCES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw41 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   &'   	 MN R   "     �)�   Q       OP   ST R   "     %�   Q       OP   UV R         �   Q       OP   WT R   "     +�   Q       OP   XY R   (     
� �Y<S�   Q       
OP   Z[ R  �    S+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :-� 0� 6:-� ::*<� B� F:-H� LN� T-L� X-� ^� T
`� T`� Tb� T-Q� X-df� j� T-R� X--R� X-ln� jp� r� v� T-T� X--"� z|� rY~SY�S� vW-V� X-d�� j� T
-W� X-W� X--*� z�� r� v� �� T-Y� X--$� �Y�S� �-(� �� �� �-�� �Y<S� �� �� ��� G-� �� �� �:-[� X�� ���-ɶ �� ��� Ͷ �� �� ؙ �-`� X--$� �Y�S� �� rY-(� �SY-<� �S� ۸ �� Tb� T� �-- -&� �� ޸ �� �Y�S� �� ��~�� �Y� � .W-- -&� �� ޸ �� �Y�S� ��� ��~�� �� � 
-i� X� �� T� �� ]-- -&� �� ޸ �� �Y�S� �� ��� 7-n� X--� �� �-- -&� �� ޸ �� �Y�S� � �� �W-&� �� c�� T-&� �-c� X- � ���
��t|����
-q� X-q� X--� �� ���� T-r� X-� ���!W-� ��-#� L�   Q   �   SOP    S\]   S^'   S_`   Sab   Scd   Se'   S 7 8   S f   S f 	  S f 
  S f   S !f   S #f   S %f   S 'f   S )f   S ;f   Sgh i  � �  H tK vK vK vK vK tK {L �L �L �L �L �L �L {L �M �M �M �M �M �M �N �N �N �N �N �N �O �O �O �O �O �O �Q �Q �Q �Q �Q �Q �Q �Q �Q �Q �R �R �R �R �R �R �R �R �R �R �R �R �T �T �T �T �T �T �T �T �TVVVVVVVV �V!W!W W W W W W WW>Y>YMYMY>Y>Y>Y>YYYYYYYYY=Y=Y=Y=Y=Y=Y�[�[�[�[s[=Y�`�`�`�`�`�`�`�`�`�`�`�`�`�c�c�c�c�c�f�f�f�fff�f�f�f�f/f/f+f+fGfGf+f+f+f+f�f�fdidididi[ijjtltlplpl�l�l�n�n�n�n�n�n�n�n�n�n�n�n�nplpl�f�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�c�cqqqqqqqqqqqqq.r.r.r.r7r7r:r:r.r.r.rAsAsAsAsAs tJ    R   #     *� 
�   Q       OP   j  R   �     ��� �� ��-Y� rY/SY%SY1SY3SY5SY�SY7SY+SY9SY	;SY
=SY� rY�-Y� rY?SYASYCSYESYGSYIS�LSS�L�)�   Q       �OP   kT R   !     ��   Q       OP        ����  -. 
SourceFile /CFIDE/adminapi/security.cfc cfsecurity2ecfc497454422  coldfusion/runtime/CFComponent  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   REQUEST Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   THIS   	   FACTORY   	    LICENSE " " 	  $ FS & & 	  ( com.macromedia.SourceModTime  [�;�~ pageContext #Lcoldfusion/runtime/NeoPageContext; - .	  / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	  9 Cp1252 ; setPageEncoding (Ljava/lang/String;)V = > !coldfusion/runtime/NeoPageContext @
 A ? LOCALE C REQUEST.LOCALE E _setCurrentLineNo (I)V G H
  I java K java.util.Locale M CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; O P coldfusion/runtime/CFPage R
 S Q 
getDefault U java/lang/Object W _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; Y Z
  [ getLanguage ] checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V _ `
  a  coldfusion.server.ServiceFactory c set (Ljava/lang/Object;)V e f coldfusion/runtime/Variable h
 i g _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; k l
  m getLicenseService o java.io.File q _Map #(Ljava/lang/Object;)Ljava/util/Map; s t coldfusion/runtime/Cast v
 w u java/lang/String y SEPARATORCHAR { _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; } ~
   	VARIABLES � 
LOCALEFILE � java/lang/StringBuffer � resources/adminapi_ �  >
 � � 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; } �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 w � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .cfm � toString ()Ljava/lang/String; � �
 X � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � USERNAMEPASSWORDDELIM � | � E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � "coldfusion/tagext/lang/ImportedTag � l10n � /CFIDE/adminapi/customtags � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � id � sandbox_not_found � var � file � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � sandbox not found. � write � > java/io/Writer �
 � � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � sandbox_already_exists � sandbox already exists.  cannot_delete_system_sandboxes *Not authorized to delete system sandboxes. wrong_port_type Awrong port type, valid options are: single, higher, lower, range. security_invalidfunction
 ?This function can not be added to the restricted function list. security_invalidTag 5This tag can not be added to the restricted tag list. error_invalidDirectory =Invalid Directory, please check your directory and try again. db_not_found Database not found. badIP Invalid IP address. 	invalidip Invalid IP Address:  wrongSeedLength" (Seed must be beween 8 and 500 characters$ _factor2 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;&'
 ( _factor3*'
 + _factor4-'
 . _factor50'
 1 _factor63'
 4 _factor76'
 7 deleteDisabledDatasource Lcoldfusion/runtime/UDFMethod; 5cfsecurity2ecfc497454422$funcDELETEDISABLEDDATASOURCE;
< 	9:	 > DELETEDISABLEDDATASOURCE@ registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)VBC
 D setSecuritySandbox /cfsecurity2ecfc497454422$funcSETSECURITYSANDBOXG
H 	F:	 J SETSECURITYSANDBOXL setDisabledCFTag -cfsecurity2ecfc497454422$funcSETDISABLEDCFTAGO
P 	N:	 R SETDISABLEDCFTAGT setRdsSecurityEnabled 2cfsecurity2ecfc497454422$funcSETRDSSECURITYENABLEDW
X 	V:	 Z SETRDSSECURITYENABLED\ 
deleteUser 'cfsecurity2ecfc497454422$funcDELETEUSER_
` 	^:	 b 
DELETEUSERd checkRdsPassword -cfsecurity2ecfc497454422$funcCHECKRDSPASSWORDg
h 	f:	 j CHECKRDSPASSWORDl getUseAdminPassword 0cfsecurity2ecfc497454422$funcGETUSEADMINPASSWORDo
p 	n:	 r GETUSEADMINPASSWORDt getEnableSandboxSecurity 5cfsecurity2ecfc497454422$funcGETENABLESANDBOXSECURITYw
x 	v:	 z GETENABLESANDBOXSECURITY| setAdminPassword -cfsecurity2ecfc497454422$funcSETADMINPASSWORD
� 	~:	 � SETADMINPASSWORD� setRDSPassword +cfsecurity2ecfc497454422$funcSETRDSPASSWORD�
� 	�:	 � SETRDSPASSWORD� isRAMAllFiles *cfsecurity2ecfc497454422$funcISRAMALLFILES�
� 	�:	 � ISRAMALLFILES� getAllAdminRoles -cfsecurity2ecfc497454422$funcGETALLADMINROLES�
� 	�:	 � GETALLADMINROLES� getAllExposedServices 2cfsecurity2ecfc497454422$funcGETALLEXPOSEDSERVICES�
� 	�:	 � GETALLEXPOSEDSERVICES� deleteDisabledCFTag 0cfsecurity2ecfc497454422$funcDELETEDISABLEDCFTAG�
� 	�:	 � DELETEDISABLEDCFTAG� setDisabledDatasource 2cfsecurity2ecfc497454422$funcSETDISABLEDDATASOURCE�
� 	�:	 � SETDISABLEDDATASOURCE� deleteDisabledCFFunction 5cfsecurity2ecfc497454422$funcDELETEDISABLEDCFFUNCTION�
� 	�:	 � DELETEDISABLEDCFFUNCTION� setRdsEnabled *cfsecurity2ecfc497454422$funcSETRDSENABLED�
� 	�:	 � SETRDSENABLED� disableRDSServlet .cfsecurity2ecfc497454422$funcDISABLERDSSERVLET�
� 	�:	 � DISABLERDSSERVLET� getUseSingleRDSPassword 4cfsecurity2ecfc497454422$funcGETUSESINGLERDSPASSWORD�
� 	�:	 � GETUSESINGLERDSPASSWORD� setUseRDSPassword .cfsecurity2ecfc497454422$funcSETUSERDSPASSWORD�
� 	�:	 � SETUSERDSPASSWORD� setDisabledCFFunction 2cfsecurity2ecfc497454422$funcSETDISABLEDCFFUNCTION�
� 	�:	 � SETDISABLEDCFFUNCTION� 
formatPort 'cfsecurity2ecfc497454422$funcFORMATPORT�
� 	�:	 � 
FORMATPORT� setAllowConcurrentAdminLogin 9cfsecurity2ecfc497454422$funcSETALLOWCONCURRENTADMINLOGIN�
� 	�:	 � SETALLOWCONCURRENTADMINLOGIN� isSecureProfile ,cfsecurity2ecfc497454422$funcISSECUREPROFILE�
� 	�:	 � ISSECUREPROFILE� setSecuredFolder -cfsecurity2ecfc497454422$funcSETSECUREDFOLDER�
  	�:	  SETSECUREDFOLDER getDisabledDatasources 3cfsecurity2ecfc497454422$funcGETDISABLEDDATASOURCES
 	:	 
 GETDISABLEDDATASOURCES validateDirectory .cfsecurity2ecfc497454422$funcVALIDATEDIRECTORY
 	:	  VALIDATEDIRECTORY setUseSingleRDSPassword 4cfsecurity2ecfc497454422$funcSETUSESINGLERDSPASSWORD
 	:	  SETUSESINGLERDSPASSWORD getDisabledCFTags .cfsecurity2ecfc497454422$funcGETDISABLEDCFTAGS
  	:	 " GETDISABLEDCFTAGS$ "getAllSecureProfileSettingsInArray ?cfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGSINARRAY'
( 	&:	 * "GETALLSECUREPROFILESETTINGSINARRAY, getEnableRDS )cfsecurity2ecfc497454422$funcGETENABLERDS/
0 	.:	 2 GETENABLERDS4 getDefaultSecuritySandbox 6cfsecurity2ecfc497454422$funcGETDEFAULTSECURITYSANDBOX7
8 	6:	 : GETDEFAULTSECURITYSANDBOX< isInternalSandBox .cfsecurity2ecfc497454422$funcISINTERNALSANDBOX?
@ 	>:	 B ISINTERNALSANDBOXD deleteSecuredFolder 0cfsecurity2ecfc497454422$funcDELETESECUREDFOLDERG
H 	F:	 J DELETESECUREDFOLDERL getAllSecureProfileSettings 8cfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGSO
P 	N:	 R GETALLSECUREPROFILESETTINGST createDefaultSandboxes 3cfsecurity2ecfc497454422$funcCREATEDEFAULTSANDBOXESW
X 	V:	 Z CREATEDEFAULTSANDBOXES\ isAllowConcurrentAdminLogin 8cfsecurity2ecfc497454422$funcISALLOWCONCURRENTADMINLOGIN_
` 	^:	 b ISALLOWCONCURRENTADMINLOGINd disableSecureProfile 1cfsecurity2ecfc497454422$funcDISABLESECUREPROFILEg
h 	f:	 j DISABLESECUREPROFILEl deleteAllowedIPAddresses 5cfsecurity2ecfc497454422$funcDELETEALLOWEDIPADDRESSESo
p 	n:	 r DELETEALLOWEDIPADDRESSESt setSeed $cfsecurity2ecfc497454422$funcSETSEEDw
x 	v:	 z SETSEED| getDisabledCFFunctions 3cfsecurity2ecfc497454422$funcGETDISABLEDCFFUNCTIONS
� 	~:	 � GETDISABLEDCFFUNCTIONS� getUser $cfsecurity2ecfc497454422$funcGETUSER�
� 	�:	 � GETUSER� enableSecureProfile 0cfsecurity2ecfc497454422$funcENABLESECUREPROFILE�
� 	�:	 � ENABLESECUREPROFILE� enableRDSServlet -cfsecurity2ecfc497454422$funcENABLERDSSERVLET�
� 	�:	 � ENABLERDSSERVLET� getCFIDEDirectory .cfsecurity2ecfc497454422$funcGETCFIDEDIRECTORY�
� 	�:	 � GETCFIDEDIRECTORY� getWebInfDirectory /cfsecurity2ecfc497454422$funcGETWEBINFDIRECTORY�
� 	�:	 � GETWEBINFDIRECTORY� setUser $cfsecurity2ecfc497454422$funcSETUSER�
� 	�:	 � SETUSER� getSecuredIPPorts .cfsecurity2ecfc497454422$funcGETSECUREDIPPORTS�
� 	�:	 � GETSECUREDIPPORTS� setSecuredIPPort -cfsecurity2ecfc497454422$funcSETSECUREDIPPORT�
� 	�:	 � SETSECUREDIPPORT� getTagPermissionPosition 5cfsecurity2ecfc497454422$funcGETTAGPERMISSIONPOSITION�
� 	�:	 � GETTAGPERMISSIONPOSITION� getFunctionPermissionPosition :cfsecurity2ecfc497454422$funcGETFUNCTIONPERMISSIONPOSITION�
� 	�:	 � GETFUNCTIONPERMISSIONPOSITION� setAllowedIPAddresses 2cfsecurity2ecfc497454422$funcSETALLOWEDIPADDRESSES�
� 	�:	 � SETALLOWEDIPADDRESSES� getSecurableCFFunctions 4cfsecurity2ecfc497454422$funcGETSECURABLECFFUNCTIONS�
� 	�:	 � GETSECURABLECFFUNCTIONS� isLoginUserIdRequired 2cfsecurity2ecfc497454422$funcISLOGINUSERIDREQUIRED�
� 	�:	 � ISLOGINUSERIDREQUIRED� deleteSecuritySandbox 2cfsecurity2ecfc497454422$funcDELETESECURITYSANDBOX�
� 	�:	 � DELETESECURITYSANDBOX� getSecuritySandboxes 1cfsecurity2ecfc497454422$funcGETSECURITYSANDBOXES�
� 	�:	 � GETSECURITYSANDBOXES� getAllRuntimePermissions 5cfsecurity2ecfc497454422$funcGETALLRUNTIMEPERMISSIONS�
  	�:	  GETALLRUNTIMEPERMISSIONS setDefaultFilePermission 5cfsecurity2ecfc497454422$funcSETDEFAULTFILEPERMISSION
 	:	 
 SETDEFAULTFILEPERMISSION checkAdminPassword /cfsecurity2ecfc497454422$funcCHECKADMINPASSWORD
 	:	  CHECKADMINPASSWORD getUseRDSPassword .cfsecurity2ecfc497454422$funcGETUSERDSPASSWORD
 	:	  GETUSERDSPASSWORD getSecurableCFTags /cfsecurity2ecfc497454422$funcGETSECURABLECFTAGS
  	:	 " GETSECURABLECFTAGS$ getSecuredFolders .cfsecurity2ecfc497454422$funcGETSECUREDFOLDERS'
( 	&:	 * GETSECUREDFOLDERS, setUseAdminPassword 0cfsecurity2ecfc497454422$funcSETUSEADMINPASSWORD/
0 	.:	 2 SETUSEADMINPASSWORD4 setLoginUserIdRequired 3cfsecurity2ecfc497454422$funcSETLOGINUSERIDREQUIRED7
8 	6:	 : SETLOGINUSERIDREQUIRED< setEnableSandboxSecurity 5cfsecurity2ecfc497454422$funcSETENABLESANDBOXSECURITY?
@ 	>:	 B SETENABLESANDBOXSECURITYD setEnableRDS )cfsecurity2ecfc497454422$funcSETENABLERDSG
H 	F:	 J SETENABLERDSL deleteSecuredIPPort 0cfsecurity2ecfc497454422$funcDELETESECUREDIPPORTO
P 	N:	 R DELETESECUREDIPPORTT getAllowedIPList -cfsecurity2ecfc497454422$funcGETALLOWEDIPLISTW
X 	V:	 Z GETALLOWEDIPLIST\ metaData Ljava/lang/Object;^_	 ` _implicitMethods Ljava/util/Map;bc	 d displaynamef securityh extendsj basel hintn -Manages passwords, RDS, and sandbox security.p Namer 	Functionst	<`	H`	``	P`	X`	h`	p`	x`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	 `	�`	`	`	`	 `	(`	0`	8`	@`	H`	P`	X`	``	h`	p`	�`	x`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	�`	`	 `	�`	 `	`	`	(`	0`	@`	8`	P`	H`	X` getMetadata ()Ljava/lang/Object; this Lcfsecurity2ecfc497454422; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs __factorParent out Ljavax/servlet/jsp/JspWriter; value _setImplicitMethods implicitMethods 
getExtends runPage LineNumberTable module1 $Lcoldfusion/tagext/lang/ImportedTag; mode1 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module2 mode2 t14 t15 t16 t17 t18 t19 module3 mode3 t22 t23 t24 t25 t26 t27 module4 mode4 t30 t31 t32 t33 t34 t35 module5 mode5 t38 t39 t40 t41 t42 t43 module6 mode6 t46 t47 t48 t49 t50 t51 module7 mode7 t54 t55 t56 t57 t58 t59 module8 mode8 t62 t63 t64 t65 t66 t67 module9 mode9 t70 t71 t72 t73 t74 t75 module10 mode10 t78 t79 t80 t81 t82 t83 module11 mode11 t86 t87 t88 t89 t90 t91 java/lang/Throwable) _getImplicitMethods ()Ljava/util/Map; <clinit> 1     L                 "     &     � �   9:   F:   N:   V:   ^:   f:   n:   v:   ~:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   :   :   :   :   &:   .:   6:   >:   F:   N:   V:   ^:   f:   n:   v:   ~:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   �:   :   :   :   :   &:   .:   6:   >:   F:   N:   V:   ^_   
bc    �� �   "     �a�   �       ��      �   u     C*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )�   �        C��     C��    C��  �  �  �    �*A�?�E*M�K�E*U�S�E*]�[�E*e�c�E*m�k�E*u�s�E*}�{�E*����E*����E*����E*����E*����E*����E*����E*����E*ŲöE*Ͳ˶E*ղӶE*ݲ۶E*��E*���E*���E*����E*��E*��E*��E*��E*%�#�E*-�+�E*5�3�E*=�;�E*E�C�E*M�K�E*U�S�E*]�[�E*e�c�E*m�k�E*u�s�E*}�{�E*����E*����E*����E*����E*����E*����E*����E*����E*ŲöE*Ͳ˶E*ղӶE*ݲ۶E*��E*���E*���E*����E*��E*��E*��E*��E*%�#�E*-�+�E*5�3�E*=�;�E*E�C�E*M�K�E*U�S�E*]�[�E�   �      ���      �   #     *� 
�   �       ��   3' �   >     *�   �   *    ��     � 8    ��    �_  6' �   >     *�   �   *    ��     � 8    ��    �_  � � �   -     +�e�   �       ��     �c  � � �   "     m�   �       ��   �� �   �     `*� 0� 6L*� :N*� 0<� B*-+�)� �*-+�,� �*-+�/� �*-+�2� �*-+�5� �*-+�8� ��   �   *    `��     `��    `�_    ` 7 8 �       -' �   >     *�   �   *    ��     � 8    ��    �_  0' �   >     *�   �   *    ��     � 8    ��    �_  &' �  (  \  
<**� DF*� J**� J**� J*LN� TV� X� \^� X� \� b*� !*	� J*Ld� T� j*� %*
� J***� !� np� X� \� j*� )**� J*Lr� T� x� zY|S� �� j*�� zY�S� �Y�� �*� zYDS� �� �� ��� �� �� �**� � zY�S�� �*� �+� �� �:*� J���� �� �Y� XY�SY�SY�SY�SY�SY*�� zY�S� �S� ϶ �� �� �Y6� 5*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:		� �� � :
� 
�:� ��*� �+� �� �:*� J���� �� �Y� XY�SY�SY�SY�SY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:� �� � :� �:� ��*� �+� �� �:*� J���� �� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,� �� ���� � :� �:*,� �M�� �� :� #�� � #:� �� � :� �:� ��*� �+� �� �:*� J���� �� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �� �� �Y6� 6*,� �M,	� �� ���� � :� �:*,� �M�� �� : � # �� � #:!!� �� � :"� "�:#� ��#*� �+� �� �:$*� J$���� �$� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �$� �$� �Y6%� 6*$%,� �M,� �$� ���� � :&� &�:'*%,� �M�'$� �� :(� #(�� � #:)$)� �� � :*� *�:+$� ��+*� �+� �� �:,*� J,���� �,� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �,� �,� �Y6-� 6*,-,� �M,� �,� ���� � :.� .�:/*-,� �M�/,� �� :0� #0�� � #:1,1� �� � :2� 2�:3,� ��3*� �+� �� �:4*� J4���� �4� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �4� �4� �Y65� 6*45,� �M,� �4� ���� � :6� 6�:7*5,� �M�74� �� :8� #8�� � #:949� �� � ::� :�:;4� ��;*� �+� �� �:<*� J<���� �<� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �<� �<� �Y6=� 6*<=,� �M,� �<� ���� � :>� >�:?*=,� �M�?<� �� :@� #@�� � #:A<A� �� � :B� B�:C<� ��C*� �	+� �� �:D*� JD���� �D� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �D� �D� �Y6E� 6*DE,� �M,� �D� ���� � :F� F�:G*E,� �M�GD� �� :H� #H�� � #:IDI� �� � :J� J�:KD� ��K*� �
+� �� �:L*� JL���� �L� �Y� XY�SYSY�SYSY�SY*�� zY�S� �S� ϶ �L� �L� �Y6M� 6*LM,� �M,!� �L� ���� � :N� N�:O*M,� �M�OL� �� :P� #P�� � #:QLQ� �� � :R� R�:SL� ��S*� �+� �� �:T*� JT���� �T� �Y� XY�SY#SY�SY#SY�SY*�� zY�S� �S� ϶ �T� �T� �Y6U� 6*TU,� �M,%� �T� ���� � :V� V�:W*U,� �M�WT� �� :X� #X�� � #:YTY� �� � :Z� Z�:[T� ��[*� XHcf*fkf*=��*���*=��*���*���*���*;>*>C>*^j*dgj*^y*dgy*jvy*y~y*�**�8D*>AD*�8S*>AS*DPS*SXS*���*���*�**�-*-**-*-2-*���*���*���*���*��*��*�**���*���*}��*���*}��*���*���*���*c�*���*X��*���*X��*���*���*���*>Z]*]b]*3}�*���*3}�*���*���*���*58*8=8*Xd*^ad*Xs*^as*dps*sxs*�		*			*�	3	?*	9	<	?*�	3	N*	9	<	N*	?	K	N*	N	S	N*	�	�	�*	�	�	�*	�

*


*	�

)*


)*

&
)*
)
.
)* �  � \  
<��    
<� 8   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_   
<�� 	  
<�� 
  
<�_   
<��   
<��   
<��   
<�_   
<�_   
<��   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_   
<��   
<��   
<�_   
<��   
<��   
<��   
<�_   
<�_    
<�� !  
<�� "  
<�_ #  
<�� $  
<�� %  
<�� &  
<�_ '  
<�_ (  
<�� )  
<�� *  
<�_ +  
<�� ,  
<�� -  
<�� .  
<�_ /  
<�_ 0  
<�� 1  
<�� 2  
< _ 3  
<� 4  
<� 5  
<� 6  
<_ 7  
<_ 8  
<� 9  
<� :  
<_ ;  
<	� <  
<
� =  
<� >  
<_ ?  
<_ @  
<� A  
<� B  
<_ C  
<� D  
<� E  
<� F  
<_ G  
<_ H  
<� I  
<� J  
<_ K  
<� L  
<� M  
<� N  
<_ O  
<_ P  
<� Q  
<� R  
< _ S  
<!� T  
<"� U  
<#� V  
<$_ W  
<%_ X  
<&� Y  
<'� Z  
<(_ [�  z �                              E 	 E 	 G 	 G 	 D 	 D 	 D 	 D 	 : 	 Z 
 Z 
 Y 
 Y 
 Y 
 Y 
 O 
 z  z  |  |  y  y  r  r  r  r  n  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  :     ! ! ! !  � � � � � � � � � � � � � � � � � � � � � � � � � � � d p p { { � � � � > K K V V a a a a  & & 1 1 < < < < �         � � � � � � � � � � � � � � � � � � � 	� 	� 	� 	� 	� 	� 	� 	� 	_  +, �   "     �e�   �       ��   -  �   	   ��� �� ��<Y�=�?�HY�I�K�PY�Q�S�XY�Y�[�`Y�a�c�hY�i�k�pY�q�s�xY�y�{��Y������Y������Y������Y������Y������Y������Y������Y������Y���û�Y�ɳ˻�Y�ѳӻ�Y�ٳۻ�Y����Y����Y����Y����� Y���Y�	��Y���Y��� Y�!�#�(Y�)�+�0Y�1�3�8Y�9�;�@Y�A�C�HY�I�K�PY�Q�S�XY�Y�[�`Y�a�c�hY�i�k�pY�q�s�xY�y�{��Y������Y������Y������Y������Y������Y������Y������Y������Y���û�Y�ɳ˻�Y�ѳӻ�Y�ٳۻ�Y����Y����Y����Y����� Y���Y�	��Y���Y��� Y�!�#�(Y�)�+�0Y�1�3�8Y�9�;�@Y�A�C�HY�I�K�PY�Q�S�XY�Y�[� �Y
� XYgSYiSYkSYmSYoSYqSYsSYiSYuSY	D� XY�vSY�wSY�xSY�ySY�zSY�{SY�|SY�}SY�~SY	�SY
��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY��SY ��SY!��SY"��SY#��SY$��SY%��SY&��SY'��SY(��SY)��SY*��SY+��SY,��SY-��SY.��SY/��SY0��SY1��SY2��SY3��SY4��SY5��SY6��SY7��SY8��SY9��SY:��SY;��SY<��SY=��SY>��SY?��SY@��SYA��SYB��SYC��SS� ϳa�   �      ���  �  " �������	�	�11 � � � �! ! (�(�/ �/ �6 �6 �=�=�D�D�K�K�RzRzYwYw`�`�g g nXnXu[u[| �| �� �� ������ ,� ,�K�K� 8� 8�H�H����� �� ������ \� \��������������� S� S�t�t� #� #� J� J	�	�"" � �	>	> A A$�$�+�+�2�2�9	`9	`@@G�G�N=N=U	U	\	�\	�c�c�j"j"q qq qxWxW77��������� �� �� �� ��(�(� e� e����� v� v�����D�D�	��	� *' �   >     *�   �   *    ��     � 8    ��    �_        *    +����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcGETALLADMINROLES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ checkRootAdminUser ] getAllAdminRoles _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g &coldfusion/runtime/AttributeCollection i name k 
Parameters m ([Ljava/lang/Object;)V  o
 j p getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcGETALLADMINROLES; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       e f     r s  w   "     � h�    v        t u    x y  w   !     `�    v        t u    z {  w   #     � d�    v        t u    | }  w  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--� \^� T� XW-L� 6-�� :-- � \`� T� X�-b� 6�    v   z    � t u     � ~     � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� ��     w   #     *� 
�    v        t u    �   w   C     %� jY� TYlSY`SYnSY� TS� q� h�    v       % t u        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcSETSECUREDIPPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  SUCCESS ! ACCESSMANAGER # SECURITY % I ' WEBAPP ) ARRAYPOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G IP I PORT K get (I)Ljava/lang/Object; M N
 C O PORTTYPE Q single S put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; U V
 C W 
		 Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 . ] / _ set (Ljava/lang/Object;)V a b coldfusion/runtime/Variable d
 e c true g _setCurrentLineNo (I)V i j
 . k ArrayNew (I)Ljava/util/List; m n coldfusion/runtime/CFPage p
 q o 0 s 	StructNew !()Lcoldfusion/util/FastHashtable; u v
 q w 1 y 	component { CFIDE.adminapi.accessmanager } CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;  �
 q � java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � single,higher,lower,range �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 q � _boolean (J)Z � �
 � � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � WRONG_PORT_TYPE � _autoscalarize � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � Len (Ljava/lang/Object;)I � �
 q � BADIP � CONTEXTS � _resolve � �
 . � _arrayGetAt � V
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 q � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 q � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 .  CLASS 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 . java.net.SocketPermission _compare '(Ljava/lang/Object;Ljava/lang/String;)D	

 . TARGET * _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int �
 � ArrayDeleteAt (Ljava/util/List;I)Z
 q _double (Ljava/lang/Object;)D
 � _Object (D)Ljava/lang/Object; !
 �" ArrayLen$ �
 q%  N
 �' '(Ljava/lang/Object;Ljava/lang/Object;)D	)
 .* java/lang/StringBuffer,  �
-. :0 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;23
-4 
FORMATPORT6 
formatPort8 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;:;
 .< toString ()Ljava/lang/String;>?
 �@ _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)VBC
 .D ACTIONF connect,resolveH ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)ZJK
 qL _LhsResolveN �
 .O _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)VQR
 .S LOGAUDITU logauditW msgY  restricted the ip address [ : that cf tags can access in the sandbox for the directory ] ._ )([Ljava/lang/Object;[Ljava/lang/Object;)V a
 Cb b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;:d
 .e 	
	g setSecuredIPPorti metaData Ljava/lang/Object;kl	 m falseo &coldfusion/runtime/AttributeCollectionq names accessu publicw outputy hint{ DRestrict the IP addresses and ports that ColdFusion tags can access.} 
Parameters REQUIRED� HINT� NSpecifies the sandbox directory for which the IP address and port are secured.� NAME� 	directory� ([Ljava/lang/Object;)V �
r� %Specifies the IP address to restrict.� Specifies the port to restrict.� DEFAULT� �Specifies the port type:<ul><li>single - Single port</li><li>higher - The specified port and higher</li><li>lower - The specified port and lower</li><li>range - Specified range of ports</li></ul>� portType� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcSETSECUREDIPPORT; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw49 !Lcoldfusion/tagext/lang/ThrowTag; throw50 throw51 LineNumberTable <clinit> 	getOutput 1       � �   kl    �� �   "     �n�   �       ��   �? �   "     j�   �       ��   �� �         �   �       ��   �� �   7     � �Y>SYJSYLSYRS�   �       ��   �� �      �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:*L� D� H:� P� RT� XW� D:-Z� ^`� fh� f-E� l-� r� ft� f
-H� l� x� fz� f-K� l-|~� �� f-L� l--L� l-��� ��� �� �� f-M� l--$� ��� �Y�S� �W-O� l�-�� �YRS� �� �� ��� ��� G-� �� �� �:-Q� l�� ���-Ͷ и ��� Զ �� �� ߙ �-T� l-�� �YJS� �� ㅸ ��� G-� �� �� �:-V� l�� ���-� и ��� Զ �� �� ߙ �-Y� l--&� �Y�S� �-*� и �� �-�� �Y>S� �� �� ��� G-� �� �� �:-[� l�� ���-�� и ��� Զ �� �� ߙ �-_� l--&� �Y�S� �� �Y-*� �SY->� �S� �� �� fz� f� �-- -(� ж� �� �YS���� I-- -(� ж� �� �YS���� !-i� l-- � и-(� и�W-(� иc�#� f-(� �-c� l- � и&�(�+�t|���[z� f� �-- -(� ж� �� �YS���� �-- -(� ж� �� �YS��-Y-J� и ��/1�5-t� l-7� �9-� �Y-L� �SY-R� �S�=� ��5�A�+�~�� !-v� l-- � и-(� и�W-(� иc�#� f-(� �-p� l- � и&�(�+�t|���-� �YS�E-� �YS�-Y-J� и ��/1�5-}� l-7� �9-� �Y-L� �SY-R� �S�=� ��5�A�E-� �YGSI�E-� l- � и-� иMW-&� �Y�S�P� �Y-*� �SY->� �S- � иT-Z� ^-�� l-V� �X-� CY� �YZS� �Y�-Y\�/-�� �YJS� �� ��5^�5-�� �Y>S� �� ��5`�5�AS�c�fW-h� ^�   �   �   ���    ���   ��l   ���   ���   ���   ��l   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   � K�   � Q�   ���   ���   ��� �  .K  = �A �A �C �C �C �C �C �C �D �D �D �D �D �D �E �E �E �E �E �E �E �E �F �F �F �F �F �F �H �H �H �H �H �H �I �I �I �I �I �I �K �K �K K K �K �K �K �K �KLLLLLLLLLLLL5M5MCMCM4M4M4MQOQOSOSOSOSOQOQOQOQOQOQO�Q�QqQQO�T�T�T�T�T�T�T�T�V�V�V�T#Y#Y2Y2Y#Y#Y#Y#Y>Y>Y>Y>Y"Y"Y"Y"Y"Y"Y{[{[{[{[X["Y�_�_�_�_�_�_�_�_�_�_�_�_�_�c�c�c�c�c�e�e�e�e�e�e
g
ggg#g#g6i6i6i6i?i?i?i?i5i5i5ig�eNcNcNcNcWcWcNcNcNcNcLc_c_clclclclc_c_c�c�p�p�p�p�p�r�r�r�r�r�r�t�t�t�t�t�t�t�t�t�t�t�ttttt�t�t�t�t�t�t�t�t3v3v3v3v<v<v<v<v2v2v2v�t�rKpKpKpKpTpTpKpKpKpKpIp\p\pipipipip\p\p�p�|�|�|�|�|�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�}�~�~�~�~�~






��2�2�;�;�B�B�B�B�� �BZ�Z�}�}���������������������������������y�y�Z�Z�Z�Z�    �   #     *� 
�   �       ��   �  �  K    -�� �� ��rY
� �YtSYjSYvSYxSYzSYpSY|SY~SY�SY	� �Y�rY� �Y�SYhSY�SY�SY�SY�S��SY�rY� �Y�SYhSY�SY�SY�SYJS��SY�rY� �Y�SYhSY�SY�SY�SYLS��SY�rY� �Y�SYpSY�SYTSY�SY�SY�SY�S��SS���n�   �      -��   �? �   "     p�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc497454422$funcCREATEDEFAULTSANDBOXES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 

         / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 _setCurrentLineNo (I)V 5 6
   7 	component 9 CFIDE.adminapi.accessmanager ; CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; = > coldfusion/runtime/CFPage @
 A ? set (Ljava/lang/Object;)V C D coldfusion/runtime/Variable F
 G E 
		 I _get &(Ljava/lang/String;)Ljava/lang/Object; K L
   M checkAdminRoles O java/lang/Object Q coldfusion.sandboxsecurity S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
   W *coldfusion/runtime/TransientVariableHolder Y &(Lcoldfusion/runtime/NeoPageContext;)V  [
 Z \ SETSECURITYSANDBOX ^ setSecuritySandbox ` /* b 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; d e
   f unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; h i coldfusion/runtime/NeoException k
 l j t0 [Ljava/lang/String; java/lang/String p any r n o	  t findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I v w
 l x ex z bind '(Ljava/lang/String;Ljava/lang/Object;)V | }
 Z ~ unbind � 
 Z � GETCFIDEDIRECTORY � getCFIDEDirectory � t1 � o	  � GETWEBINFDIRECTORY � getWebInfDirectory � t2 � o	  � LOGAUDIT � logaudit � %coldfusion/runtime/ArgumentCollection � msg �  created default sandboxes. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 � � b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; d �
   � 
		
	 � createDefaultSandboxes � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � jCreates the default sandboxes needed to secure the ColdFusion Administrator and the WEB-INF system folder. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc497454422$funcCREATEDEFAULTSANDBOXES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t11 ,Lcoldfusion/runtime/TransientVariableHolder; t12 #Lcoldfusion/runtime/AbortException; t13 Ljava/lang/Exception; __cfcatchThrowable4 Ljava/lang/Throwable; t15 t16 t17 t18 t19 __cfcatchThrowable5 t21 t22 t23 t24 t25 __cfcatchThrowable6 t27 t28 LineNumberTable !coldfusion/runtime/AbortException � java/lang/Exception � java/lang/Throwable � <clinit> 	getOutput 1       n o    � o    � o    � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   #     � q�    �        � �    � �  �  � 
   Y+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4
-u� 8-:<� B� H-J� 4-v� 8--� NP� RYTS� XW-J� 4� ZY-� $� ]:-y� 8-_� Na-� RYcS� gW� J� P:�:� m:� u� y�              {� � �� � :� �:� ��� ZY-� $� ]:-~� 8-_� Na-� RY-~� 8-�� N�-� R� gS� gW� L� R:�:� m:� �� y�                {� � �� � :� �:� ��� ZY-� $� ]:-�� 8-_� Na-� RY-�� 8-�� N�-� R� gS� gW� L� R:�:� m:� �� y�                {� � �� � :� �:� ��-J� 4-�� 8-�� N�-� �Y� qY�S� RY�S� �� �W-�� 4�  � � � � � � � � � � � � � � � � � � � �47 �4< �4u �7ru �uzu ���� ���� ���	 ��	 �		 �  �  $   Y � �    Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y + ,   Y  �   Y  � 	  Y  � 
  Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �   Y � �  �   � 9  t 4u >u >u @u @u =u =u =u =u 4u 4u Xv Xv fv fv Wv Wv Wv Wv �y �y �y �y �y �y �y ux~~~~~~~~~ �}�������������������� uw)�)�E�E�)�)�)�)�     �   #     *� 
�    �        � �    �   �   �     x� qYsS� u� qYsS� �� qYsS� �� �Y� RY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� RS� �� ��    �       x � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcDELETEDISABLEDCFFUNCTION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! AENABLEDCFFUNCTIONS # 	TARGETPOS % SECURITY ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I FUNCTIONNAME K 
		
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ _setCurrentLineNo (I)V ] ^
 0 _ ArrayNew (I)Ljava/util/List; a b coldfusion/runtime/CFPage d
 e c GETDISABLEDCFFUNCTIONS g _get &(Ljava/lang/String;)Ljava/lang/Object; i j
 0 k getDisabledCFFunctions m java/lang/Object o _autoscalarize q j
 0 r 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; t u
 0 v _List $(Ljava/lang/Object;)Ljava/util/List; x y coldfusion/runtime/Cast {
 | z ArrayToList $(Ljava/util/List;)Ljava/lang/String; ~ 
 e � 1 �   � 0 � 

         � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 e � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � GETSECURABLECFFUNCTIONS � getSecurableCFFunctions �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 | � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 e � _boolean (J)Z � �
 | � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDFUNCTION � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � CONTEXTS � _resolve � �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 | � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 e � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 e  GETFUNCTIONPERMISSIONPOSITION getFunctionPermissionPosition 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 0 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �	
 0
 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 Left '(Ljava/lang/String;I)Ljava/lang/String;
 e *- RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 e _Object (I)Ljava/lang/Object;
 | _int (Ljava/lang/Object;)I !
 |" ListDeleteAt$
 e% ListLen (Ljava/lang/String;)I'(
 e) (Ljava/lang/Object;D)D+
 0, concat &(Ljava/lang/String;)Ljava/lang/String;./
 �0 _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V23
 04 _LhsResolve6 �
 07 _arraySetAt93
 0: LOGAUDIT< logaudit> msg@ java/lang/StringBufferB  removed a function D  �
CF append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;HI
CJ F from the list of disabled functions in the sandbox for the directory L .N toString ()Ljava/lang/String;PQ
 pR )([Ljava/lang/Object;[Ljava/lang/Object;)V T
 EU b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; tW
 0X 	
	Z deleteDisabledCFFunction\ metaData Ljava/lang/Object;^_	 ` voidb falsed &coldfusion/runtime/AttributeCollectionf nameh accessj publicl outputn 
returntypep hintr ERemove a function from the list of disabled functions in the sandbox.t 
Parametersv REQUIREDx truez HINT| BSpecifies the sandbox directory for which the function is enabled.~ NAME� 	directory� ([Ljava/lang/Object;)V �
g� -Specifies the name of the function to enable.� functionName� getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcDELETEDISABLEDCFFUNCTION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw39 !Lcoldfusion/tagext/lang/ThrowTag; throw40 LineNumberTable <clinit> 	getOutput 1       � �   ^_   	 �� �   "     �a�   �       ��   �Q �   "     ]�   �       ��   �� �         �   �       ��   �Q �   "     c�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R-�� `-� f� Z-\� R-�� `-�� `-h� ln-� pY-@� sS� w� }� �� Z-\� R�� Z-\� R
�� Z-\� R�� Z-\� R�� Z-�� R-�� `-��� �� Z-\� R-�� `--�� `-��� ��� p� �� Z-\� R-�� `--"� l�� pY�S� �W-N� R-�� `-�� `-�� `-�� l�-� p� w� }� �-�� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-�� `��-ж s� �� Զ �� �� � �-\� R-N� R-�� `--(� �Y�S� �-,� s� � �-�� �Y@S� �� �� ��� G-� �� �� �:-�� `�� ���-�� s� ��� Զ �� �� � �-�� `--(� �Y�S� �� pY-,� sSY-@� sS� ��� Z-Ķ `-� l-� pY-,� sSY-@� sS� w� Z
-- -.� s�� �� �YS�� Z-� s��� � �-̶ `-� s� ����� �-ж `-� s� ��� Z-Ѷ `-*� s� �-L� s� �� ��� Z-Ҷ `-*� s� �-&� s�#�&� Z-ֶ `-*� s� ��*��-�� 
� Z� %
� Z
-� s� �-*� s� ��1� Z� 
� Z-- -.� s�� �� �YS-� s�5-(� �Y�S�8� pY-,� sSY-@� sS- � s�;-\� R-� `-=� l?-� EY� �YAS� pY�CYE�G-�� �YLS� �� ��KM�K-�� �Y@S� �� ��KO�K�SS�V�YW-[� R�   �   �   ��    ��   �_   ��   ��   ��   �_    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �7  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ����������������#�%�%�%�%�#�#�2�<�<�>�>�;�;�;�;�2�2�N�`�`�b�b�_�_�W�W�W�W�N�N�����������������������������������������������������������������E�E�T�T�E�E�E�E�`�`�`�`�D�D�D�D�D�D���������z�D���������������������������������������������,�,�(�(�(�(�&�G�G�M�M�b�b�b�b�k�k�b�b�o�o�������������������������z���������������������������������������������������������������������������������������������������*�*�*�*�(�b�b�G�4�4�I�I�I�I�0�R�R�g�g�p�p�w�w�w�w�R�D�����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� ³ ĻgY� pYiSY]SYkSYmSYoSYeSYqSYcSYsSY	uSY
wSY� pY�gY� pYySY{SY}SYSY�SY�S��SY�gY� pYySY{SY}SY�SY�SY�S��SS���a�   �       ���   �Q �   "     e�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcDISABLERDSSERVLET  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   WEBX  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 true 7 set (Ljava/lang/Object;)V 9 : coldfusion/runtime/Variable <
 = ;   ? 

		 A *coldfusion/runtime/TransientVariableHolder C &(Lcoldfusion/runtime/NeoPageContext;)V  E
 D F 

			
			 H _setCurrentLineNo (I)V J K
 " L GetPageContext %()Lcoldfusion/runtime/NeoPageContext; N O coldfusion/runtime/CFPage Q
 R P 
getRequest T java/lang/Object V _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; X Y
 " Z getRealPath \ /WEB-INF ^ _String &(Ljava/lang/Object;)Ljava/lang/String; ` a coldfusion/runtime/Cast c
 d b web.xml f concat &(Ljava/lang/String;)Ljava/lang/String; h i java/lang/String k
 l j 
FileExists (Ljava/lang/String;)Z n o
 R p 
				 r PATH t _set '(Ljava/lang/String;Ljava/lang/Object;)V v w
 " x 
			 z java/lang/StringBuffer | SERVER ~ 
COLDFUSION � ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � (Ljava/lang/String;)V  �
 } � FS � _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 } � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 W � 

			 � path � 	IsDefined � o
 R � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � K
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 " � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � WEBXML � XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList; � �
 R � I � 1 � web-app � servlet-mapping � _arrayGetAt 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; 
 " _Map #(Ljava/lang/Object;)Ljava/util/Map;
 d XMLNAME 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �

 " _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 " XMLCHILDREN _resolve

 " 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; 
 " XMLTEXT 
RDSServlet _List $(Ljava/lang/Object;)Ljava/util/List;
 d _int (Ljava/lang/Object;)I!"
 d# ArrayDeleteAt (Ljava/util/List;I)Z%&
 R' _double (Ljava/lang/Object;)D)*
 d+ _Object (D)Ljava/lang/Object;-.
 d/ ArrayLen1"
 R2 (I)Ljava/lang/Object;-4
 d5 '(Ljava/lang/Object;Ljava/lang/Object;)D7
 "8 doAfterBody: �
 �; doEndTag= �
 �> doCatch (Ljava/lang/Throwable;)V@A
 �B 	doFinallyD 
 �E 
						G WRITEI outputK ToStringM a
 RN \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �P
 "Q 	setOutputS :
 �T falseV unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;XY coldfusion/runtime/NeoException[
\Z t0 [Ljava/lang/String; Any`^_	 b findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ide
\f CFCATCHh bindj w
 Dk unbindm 
 Dn 
	p disableRDSServletr metaData Ljava/lang/Object;tu	 v booleanx &coldfusion/runtime/AttributeCollectionz name| access~ private� 
returntype� hint� 2Disables the servlet that performs RDS processing.� 
Parameters� ([Ljava/lang/Object;)V �
{� getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcDISABLERDSSERVLET; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; lock18  Lcoldfusion/tagext/lang/LockTag; mode18 file17 Lcoldfusion/tagext/io/FileTag; t16 t17 t18 Ljava/lang/Throwable; t19 t20 lock20 mode20 file19 t24 t25 t26 t27 t28 t29 #Lcoldfusion/runtime/AbortException; t30 Ljava/lang/Exception; __cfcatchThrowable2 t32 t33 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   ^_   tu   	 �� �   "     �w�   �       ��   � � �   "     s�   �       ��   � � �         �   �       ��   � � �   "     y�   �       ��   �� �   #     � l�   �       ��   �� �   
 "  �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
8� >-2� 6@� >-B� 6� DY-� &� G:-I� 6-^� M--^� M--^� M--^� M-� SU� W� []� WY_S� [� eg� m� q� ]-s� 6-u-_� M--_� M--_� M-� SU� W� []� WY_S� [� eg� m� y-{� 6� �-`� M-� }Y-� lY�SY�S� �� e� �-�� �� e� ��� �-�� �� e� ��� �-�� �� e� �g� �� �� q� m-s� 6-u� }Y-� lY�SY�S� �� e� �-�� �� e� ��� �-�� �� e� ��� �-�� �� e� �g� �� �� y-{� 6-�� 6-d� M-�� ��5-s� 6-� �� �� �:-e� M�� ��� �� �� �� �Y6��-ζ 6-� �� �� �:-f� M׶ ���-u� �� e� � �� �� �� �� � :�v��-ζ 6-h� M--� �� e� �� >-��� y� �-- � WY�SY�SY-�� �S��� lY	S����� �--- � WY�SY�SY-�� �S��� lYS����� lYS���� 2-o� M-- � WY�SY�S�� -�� ��$�(W� L-�-�� ��,c�0� y-�� �-i� M- � WY�SY�S��3�6�9�t|���-s� 6�<��f�?� :� &���� � #:�C� � :� �:�F�-ζ 6-� �� �� �:-v� M�� ��� �� �� �� �Y6� �-H� 6-� �� �� �:-w� MJ� ���-u� �� e� � ��L-w� M-- � ��O�R�U� �� �� � :� K� ��-ζ 6�<��w�?� :� &� ��� � #:�C� � :� �:�F�-{� 6� -s� 6
W� >-{� 6-{� 6� f� l:�:�]:�c�g�      9           i�l-s� 6
W� >-{� 6� �� � : �  �:!�o�!-2� 6-� ��-q� 6� !'�����������'�������������������C�����������C����������	� g�F���F���F���F��CF� g�K���K���K���K��CK� g����������������C��F������� �  V "  ���    ���   ��u   ���   ���   ���   ��u   � - .   � �   � � 	  � � 
  � �   ���   ���   �� �   ���   ��u   ��u   ���   ���   ��u   ���   �� �   ���   ��u   ��u   ���   ���   ��u   ���   ���   ���   ���    ��u !�  � �  X <Y >Y >Y >Y >Y <Y <Y KZ MZ MZ MZ MZ KZ KZ �^ �^ �^ �^ �^ �^ ~^ ~^ ~^ ~^ �^ �^ ~^ ~^ ~^ ~^ v^ v^ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_````0`0`0`0`<`<`A`A`A`A`M`M`R`R`R`R`^`^```````{a{a{a{a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�awawawawatata` v^�d�d�d�deeeeRfRf]f]f]f]fofof:f�h�h�h�h�h�h�h�h�h�i�i�i�i�i�k�k�k�k�k�k�k�k�k�kmmmmmm�m�m'm'm�m�m<m<mXoXo]o]oOoOoOoOofofofofoNoNoNosp�m�kyiyiyiyi�i�iyiyiyiyivi�i�i�i�i�i�i�i�i�i�i�i�i�i�g�e*v*v1v1vowow{w{w{w{w�w�w�w�w�w�wWwv*z*z*z*z(z(z y�d�}�}�}�}�}�} Z\����������    �   #     *� 
�   �       ��   �  �   �     |�� �� �Ѹ �� �� lYaS�c�{Y� WY}SYsSYSY�SYLSYWSY�SYySY�SY	�SY
�SY� WS���w�   �       |��   � � �   "     W�   �       ��        ����  -# 
SourceFile /CFIDE/adminapi/security.cfc 1cfsecurity2ecfc497454422$funcGETSECURITYSANDBOXES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # WEBAPP % coldfusion/runtime/CfJspPage ' pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	 ( + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	 ( 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 
		 = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
 ( A / C set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _setCurrentLineNo (I)V K L
 ( M 	StructNew !()Lcoldfusion/util/FastHashtable; O P coldfusion/runtime/CFPage R
 S Q ArrayNew (I)Ljava/util/List; U V
 S W 	component Y CFIDE.adminapi.accessmanager [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 S _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 ( k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 ( o checkAdminRoles q Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary s false u java/lang/String w CONTEXTS y _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; { |
 ( } _autoscalarize  n
 ( � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 S � arguments.directory � 	IsDefined (Ljava/lang/String;)Z � �
 S � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � /* � StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Z � �
 S � 	DIRECTORY � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 S � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 ( � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 ( � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 ( �  _resolveAndAutoscalarize � |
 ( � _arraySetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 ( � 
	 � getSecuritySandboxes � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � 6Returns all security sandboxes or a specified sandbox. � 
Parameters � REQUIRED � HINT � !Sandbox directory to be returned. � NAME � 	directory  ([Ljava/lang/Object;)V 
 � getMetadata ()Ljava/lang/Object; this 3Lcfsecurity2ecfc497454422$funcGETSECURITYSANDBOXES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw25 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �    � �     
   "     � �   	           
   !     �   	           
         �   	           
   (     
� xY�S�   	       
    
  �    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :-� ,� 2:-� 6:� <:->� BD� J
-ڶ N� T� J-۶ N-� X� J-ݶ N-Z\� `� J-޶ N--޶ N-bd� `f� h� l� J-߶ N--"� pr� hYtSYvS� lW-� N-$� xYzS� ~-&� �� �� �� J-� N-�� ��� ,-� N-- � �� ��� �W- � ��� �-� N--$� xYzS� ~-&� �� �� �-�� �� �� �� 4--$� xYzS� ~� hY-&� �SY-�� �S� �� J� G-� �� �� �:-� N�� ���-ȶ �� ��� ̶ �� �� י �-� hY-�� xY�S� �S-� N- � �� �� �-� ��-� B�   	   �           �             �    3 4         	    
       !    #    %    �        �  � \� ^� ^� ^� ^� \� c� l� l� l� l� c� r� |� |� {� {� {� {� r� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��������������(�(�*�*����/�/�/�/�/�A�A�P�P�A�A�A�A�\�\�\�\�@�@�n�n���������m�m�m�m�k�����������@����� � � � � � ��������� \�    
   #     *� 
�   	          !  
   �     ~�� �� �� �Y
� hY�SY�SY�SY�SY�SYvSY�SY�SY�SY	� hY� �Y� hY�SYvSY�SY�SY�SYS�SS�� �   	       ~   " 
   !     v�   	               ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcISINTERNALSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 	DIRECTORY * getVariable  (I)Lcoldfusion/runtime/Variable; , - %coldfusion/runtime/ArgumentCollection /
 0 . _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 2 3
  4 
		 6 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 8 9
  : _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; < =
  > _setCurrentLineNo (I)V @ A
  B GETCFIDEDIRECTORY D _get F =
  G getCFIDEDirectory I java/lang/Object K 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; M N
  O _compare '(Ljava/lang/Object;Ljava/lang/Object;)D Q R
  S _Object (Z)Ljava/lang/Object; U V coldfusion/runtime/Cast X
 Y W _boolean (Ljava/lang/Object;)Z [ \
 Y ] GETWEBINFDIRECTORY _ getWebInfDirectory a true c false e 
	 g java/lang/String i isInternalSandBox k metaData Ljava/lang/Object; m n	  o &coldfusion/runtime/AttributeCollection q name s access u public w output y hint { 9Returns true if the sandbox directory is CFIDE or WEB-INF } 
Parameters  REQUIRED � HINT � 'Specifies the directory of the sandbox. � NAME � 	directory � ([Ljava/lang/Object;)V  �
 r � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcISINTERNALSANDBOX; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       m n     � �  �   "     � p�    �        � �    � �  �   !     l�    �        � �    � �  �         �    �        � �    � �  �   (     
� jY+S�    �       
 � �    � �  �  �     �+� � :+� ,� :	-� � %:-� ):*+� 1� 5:
-7� ;-+� ?-�� C-E� HJ-� L� P� T�~�� ZY� ^� -W-+� ?-�� C-`� Hb-� L� P� T�~�� Z� ^� 	d�� f�-h� ;�    �   p    � � �     � � �    � � n    � � �    � � �    � � �    � � n    � & '    �  �    �  � 	   � * � 
 �   � #  � <� <� I� I� I� I� <� <� <� <� m� m� z� z� z� z� m� m� m� m� <� <� �� �� �� �� �� �� �� �� �� �� <� <�     �   #     *� 
�    �        � �    �   �   �     u� rY
� LYtSYlSYvSYxSYzSYfSY|SY~SY�SY	� LY� rY� LY�SYdSY�SY�SY�SY�S� �SS� �� p�    �       u � �    � �  �   !     f�    �        � �        ����  -# 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc497454422$funcSETSEED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  
SEEDLENGTH ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SEED 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E 

         G _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V I J
 $ K _setCurrentLineNo (I)V M N
 $ O 	component Q CFIDE.adminapi.accessmanager S CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; U V coldfusion/runtime/CFPage X
 Y W set (Ljava/lang/Object;)V [ \ coldfusion/runtime/Variable ^
 _ ] 
		 a java c  coldfusion.server.ServiceFactory e getSecurityService g java/lang/Object i _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; k l
 $ m LOGAUDIT o _get &(Ljava/lang/String;)Ljava/lang/Object; q r
 $ s logaudit u java/lang/String w msg y $ has set the ColdFusion server seed. { )([Ljava/lang/Object;[Ljava/lang/Object;)V  }
 ; ~ 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 $ � checkRootAdminUser �  _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � Len (Ljava/lang/Object;)I � �
 Y � _Object (I)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _autoscalarize � r
 $ �@        _compare (Ljava/lang/Object;D)D � �
 $ � (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �@@      %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � WRONGSEEDLENGTH � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 $ � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ � setSeed � 
		
	 � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint �  Sets the ColdFusion server seed. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Server seed. � NAME � seed  ([Ljava/lang/Object;)V 
 � getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc497454422$funcSETSEED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw12 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �    � �     
   "     � �   	           
   !     ۰   	           
         �   	           
   (     
� xY4S�   	       
    
  �    �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:-H� L
- �� P-RT� Z� `-b� L- �� P-- �� P-df� Zh� j� n� `-b� L- �� P-p� tv-� ;Y� xYzS� jY|S� � �W-b� L- �� P--� t�� j� nW- �� P-�� xY4S� �� �� �� `-"� � �� ��|� �Y� �� W-"� � �� ��t|� �� �� G-� �� �� �:- �� P�� ���-ƶ �� ��� ζ �� �� ٙ �- �� P-- � t�� jY-�� xY4S� �S� nW-ݶ L�   	   �   �    �   � �   �   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   �    2 L   � W � a � a � c � c � ` � ` � ` � ` � W � W � s � � � � � � � � � � � � � | � | � | � | � s � s � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �* �* �0 �0 �* �* �* �* � � �h �h �E � �� �� �� �� �� �� �� � � �    
   #     *� 
�   	          !  
   �     ��� �� �� �Y
� jY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� jY� �Y� jY�SY�SY�SY6SY�SY�SY�SYS�SS�� �   	       �   " 
   !     �   	               ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcSETADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C get (I)Ljava/lang/Object; E F
 9 G ISHASHED I false K put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; M N
 9 O boolean Q BOOL_VALIDATOR S >	 < T _validateArgWithValidator V B
  W 

         Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 " ] _setCurrentLineNo (I)V _ `
 " a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h coldfusion/runtime/CFPage j
 k i set (Ljava/lang/Object;)V m n coldfusion/runtime/Variable p
 q o 
		 s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 "  _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � checkRootAdminUser � setAdminPassword �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 " � _autoscalarize � �
 " � LOGAUDIT � logaudit � msg �  changed admin password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � +Sets the ColdFusion Administrator password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � ;Set it to true if the password sent is already hashed once. � no � DEFAULT � isHashed � getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcSETADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y2SYJS�    �        � �    � �  �  �    I+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:� H� JL� PW*JR� :� U� X:-Z� ^
- �� b-df� l� r-t� ^- �� b-- �� b-vx� lz� |� �� r-t� ^- �� b--� ��� |� �W- �� b-- � ��� |Y-�� �Y2S� �SY-J� �S� �W-t� ^- �� b-�� ��-� 9Y� �Y�S� |Y�S� �� �W-�� ^�    �   �   I � �    I � �   I � �   I � �   I � �   I � �   I � �   I - .   I  �   I  � 	  I  � 
  I  �   I 1 �   I I �  �   � 2   � U � U � v � � � � � � � � �  �  �  �  � v � v � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �5 �5 � � � � �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y
� |Y�SY�SY�SY�SY�SYLSY�SY�SY�SY	� |Y� �Y� |Y�SY�SY�SY4SY�SY�SY�SY�S� �SY� �Y
� |Y�SY�SY�SY�SY�SYRSY�SYLSY�SY	�S� �SS� ȳ ��    �       � � �    � �  �   !     L�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcGETUSERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] :coldfusion.serversettings,coldfusion.serversettingssummary _ false a isRDSSecurityEnabled c 
	 e java/lang/String g getUseRDSPassword i metaData Ljava/lang/Object; k l	  m &coldfusion/runtime/AttributeCollection o name q access s public u output w hint y HChecks whether a Remote Development Services (RDS) password is required. { 
Parameters } ([Ljava/lang/Object;)V  
 p � getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcGETUSERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       k l     � �  �   "     � n�    �        � �    � �  �   !     j�    �        � �    � �  �         �    �        � �    � �  �   #     � h�    �        � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
- �� :-<>� D� J-L� 6- �� :-- �� :-NP� DR� T� X� J-L� 6- �� :--� \^� TY`SYbS� XW- �� :-- � \d� T� X�-f� 6�    �   z    � � �     � � �    � � l    � � �    � � �    � � �    � � l    � - .    �  �    �  � 	   �  � 
   �  �  �   � *   � < � F � F � H � H � E � E � E � E � < � < � X � j � j � l � l � i � i � a � a � a � a � X � X � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   f     H� pY
� TYrSYjSYtSYvSYxSYbSYzSY|SY~SY	� TS� �� n�    �       H � �    � �  �   !     b�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc :cfsecurity2ecfc497454422$funcGETFUNCTIONPERMISSIONPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  APOS ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 WEBAPP 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ; <
  = 	DIRECTORY ? 
		 A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 $ E _setCurrentLineNo (I)V G H
 $ I ArrayNew (I)Ljava/util/List; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S 0 W java Y  coldfusion.server.ServiceFactory [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 O _ getSecurityService a java/lang/Object c _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; e f
 $ g 

		 i java/lang/String k CONTEXTS m _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; o p
 $ q _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; s t
 $ u _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; w x
 $ y 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; { |
 O } I  1 � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; w �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � %coldfusion.runtime.FunctionPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 O � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � 
	 � getFunctionPermissionPosition � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � 4Returns the index in the function permissions array. � 
Parameters � REQUIRED � true � HINT � DSpecifies the name of the web application using the secured sandbox. � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � @Specifies the sandbox directory for which the index is returned. � 	directory � getMetadata ()Ljava/lang/Object; this <Lcfsecurity2ecfc497454422$funcGETFUNCTIONPERMISSIONPOSITION; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � lY4SY@S�    �        � �    � �  �  �    y+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*4� :� >:*@� :� >:-B� F
-	 � J-� P� V-B� FX� V-B� F-	"� J--	"� J-Z\� `b� d� h� V-j� F
-	&� J-- � lYnS� r� dY-4� vSY-@� vS� z� ~� V-��� �� H---�� v� �� �� lY�S� ��� ��� -�� v� V-�-�� v� �c� �� �-�� v-	(� J-� v� �� �� ��t|����-"� v�-�� F�    �   �   y � �    y � �   y � �   y � �   y � �   y � �   y � �   y / 0   y  �   y  � 	  y  � 
  y  �   y ! �   y 3 �   y ? �  �  Z V  	 d	  n	  n	  m	  m	  m	  m	  d	  d	  }	! 	! 	! 	! 	! }	! }	! �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	" �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	& �	( �	( �	( �	( �	( 	+ 	+ �	+ �	+	+	+$	-$	-$	-$	-"	- �	+0	(0	(0	(0	(9	(9	(0	(0	(0	(0	(-	(A	(A	(N	(N	(N	(N	(A	(A	( �	(h	1h	1h	1h	1h	1 �	$     �   #     *� 
�    �        � �    �   �   �     �� �Y
� dY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� dY� �Y� dY�SY�SY�SY�SY�SY�S� �SY� �Y� dY�SY�SY�SY�SY�SY�S� �SS� ֳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcCHECKRDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q checkRdsPassword s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z 
	 | metaData Ljava/lang/Object; ~ 	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Checks RDS password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Administrator password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcCHECKRDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ~      � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  "     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--� pr� h� lW- �� N-- � pt� hY-u� wY2S� {S� l�-}� J�    �   �    � � �     � � �    � �     � � �    � � �    � � �    � �     � - .    �  �    �  � 	   �  � 
   �  �    � 1 �  �   � (   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y
� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc ,cfsecurity2ecfc497454422$funcISSECUREPROFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkAdminRoles O java/lang/Object Q :coldfusion.serversettings,coldfusion.serversettingssummary S false U _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; W X
 " Y java [  coldfusion.server.ServiceFactory ] getSecurityService _ isSecureProfile a 
	 c java/lang/String e metaData Ljava/lang/Object; g h	  i &coldfusion/runtime/AttributeCollection k name m access o public q output s hint u <Checks whether secure profile is selected while installation w 
Parameters y ([Ljava/lang/Object;)V  {
 l | getMetadata ()Ljava/lang/Object; this .Lcfsecurity2ecfc497454422$funcISSECUREPROFILE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       g h     ~   �   "     � j�    �        � �    � �  �   !     b�    �        � �    � �  �         �    �        � �    � �  �   #     � f�    �        � �    � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-9� :-<>� D� J-2� 6-;� :--� NP� RYTSYVS� ZW-<� :--<� :-\^� D`� R� Z� J-=� :-- � Nb� R� Z�-d� 6�    �   z    � � �     � � �    � � h    � � �    � � �    � � �    � � h    � - .    �  �    �  � 	   �  � 
   �  �  �   � )   8 < 9 E 9 E 9 G 9 G 9 D 9 D 9 D 9 D 9 < 9 < 9 ^ ; ^ ; l ; l ; q ; q ; ] ; ] ; ] ; x < � < � < � < � < � < � < � < � < � < � < x < � = � = � = � = � = � = � = ] :     �   #     *� 
�    �        � �    �   �   f     H� lY
� RYnSYbSYpSYrSYtSYVSYvSYxSYzSY	� RS� }� j�    �       H � �    � �  �   !     V�    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcDELETESECUREDFOLDER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  SECURITY ! VFSFILEFACTORY # PERMISSIONCLASS % WEBAPP ' VFILE ) coldfusion/runtime/CfJspPage + pageContext #Lcoldfusion/runtime/NeoPageContext; - .	 , / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	 , 9 	DIRECTORY ; getVariable  (I)Lcoldfusion/runtime/Variable; = > %coldfusion/runtime/ArgumentCollection @
 A ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E FOLDER G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 , M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 , Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] 	component a CFIDE.adminapi.accessmanager c CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; e f
 _ g java i  coldfusion.server.ServiceFactory k getSecurityService m java/lang/Object o _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; q r
 , s false u   w coldfusion.vfs.VFSFileFactory y _get &(Ljava/lang/String;)Ljava/lang/Object; { |
 , } checkAdminRoles  coldfusion.sandboxsecurity � checkIfVFile � _autoscalarize � |
 , � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 , � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 _ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 , � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 , � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 , � _boolean (Ljava/lang/Object;)Z � �
 � � coldfusion.vfs.VFilePermission � getFileObject � getAbsolutePath � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 , � java.io.FilePermission � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 , � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � I � 1 � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 , � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 , � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 , � _Object (Z)Ljava/lang/Object; 
 � TARGET _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int (Ljava/lang/Object;)I

 � ArrayDeleteAt (Ljava/util/List;I)Z
 _ _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; 
 � ArrayLen
 _ (I)Ljava/lang/Object; 
 � _LhsResolve �
 ,  _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V"#
 ,$ LOGAUDIT& logaudit( msg* java/lang/StringBuffer,  made folder .  �
-0 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;23
-4 / inaccessible in the sandbox for the directory 6 .8 toString ()Ljava/lang/String;:;
 p< )([Ljava/lang/Object;[Ljava/lang/Object;)V >
 A? 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;AB
 ,C 	
	E deleteSecuredFolderG metaData Ljava/lang/Object;IJ	 K voidM &coldfusion/runtime/AttributeCollectionO nameQ accessS publicU outputW 
returntypeY hint[ 1Makes a folder inaccessible to a secured sandbox.] 
Parameters_ REQUIREDa truec HINTe ?Specifies the sandbox directory for which a folder is disabled.g NAMEi 	directoryk ([Ljava/lang/Object;)V m
Pn 9Specifies the path of the folder to be made inaccessible.p folderr getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcDELETESECUREDFOLDER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw47 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   IJ   	 tu y   "     �L�   x       vw   z; y   "     H�   x       vw   {| y         �   x       vw   }; y   "     N�   x       vw   ~ y   -     � �Y<SYHS�   x       vw   �� y  j    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :-� 0� 6:-� ::*<� B� F:*H� B� F:-J� NP� V
-� Z-� `� V-� Z-bd� h� V-�� Z--�� Z-jl� hn� p� t� Vv� Vx� V-� Z-jz� h� V-� Z-- � ~�� pY�S� tW-� Z--$� ~�� pY-H� �S� t� V-�� Z--"� �Y�S� �-(� �� �� �-�� �Y<S� �� �� ��� G-� �� �� �:-�� Z�� ���-Ŷ �� ��� ɶ �� �� ԙ �-*� �� ؙ Vڶ V-�� �YHS-�� Z--�� Z--$� ~�� pY-�� �YHS� �S� t�� p� t� � 
� V
-� Z--"� �Y�S� �� pY-(� �SY-<� �S� � � V-�� � �---�� �� �� �� �Y�S� �-&� �� ��~��Y� ؙ <W---�� �� �� �� �YS� �-�� �YHS� �� ��~��� ؙ !-� Z--� ��	-�� ���W-�-�� ��c�� �-�� �-� Z-� ���� ��t|���6-"� �Y�S�!� pY-(� �SY-<� �S-� ��%-J� N-� Z-'� ~)-� AY� �Y+S� pY�-Y/�1-�� �YHS� �� ��57�5-�� �Y<S� �� ��59�5�=S�@�DW-F� N�   x   �   �vw    ���   ��J   ���   ���   ���   ��J   � 7 8   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � ;�   � G�   ��� �  � �  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���� �� �� ����,�,������A�A�P�P�A�A�A�A�\�\�\�\�@�@�@�@�@�@���������v�@���������������������������������������**??HH)))))) [[[[Xg
g
c
c


c
c
c
c
�
�
�
�
�
�
�
�
�
�
c
c
�����������c
���������				X00EENNUUUU0 ��mm��������������������mmmm    y   #     *� 
�   x       vw   �  y   �     ��� �� ��PY� pYRSYHSYTSYVSYXSYvSYZSYNSY\SY	^SY
`SY� pY�PY� pYbSYdSYfSYhSYjSYlS�oSY�PY� pYbSYdSYfSYqSYjSYsS�oSS�o�L�   x       �vw   �; y   !     v�   x       vw        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc497454422$funcSETLOGINUSERIDREQUIRED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ISUSERIDREQUIRED 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		
         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAdminUserIdRequired s _autoscalarize u n
 " v 
		
	 x java/lang/String z setLoginUserIdRequired | metaData Ljava/lang/Object; ~ 	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � 4Sets whether or not a user id is required for login. � 
Parameters � REQUIRED � true � TYPE � NAME � isUserIdRequired � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc497454422$funcSETLOGINUSERIDREQUIRED; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       ~      � �  �   "     � ��    �        � �    � �  �   !     }�    �        � �    � �  �         �    �        � �    � �  �   (     
� {Y2S�    �       
 � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-y� N-PR� X� ^-`� J-z� N--z� N-bd� Xf� h� l� ^-`� J-{� N--� pr� h� lW-`� J-|� N-- � pt� hY-2� wS� lW-y� J�    �   �    � � �     � � �    � �     � � �    � � �    � � �    � �     � - .    �  �    �  � 	   �  � 
   �  �    � 1 �  �   � '   v O y X y X y Z y Z y W y W y W y W y O y O y j z z z z z | z | z y z y z r z r z r z r z j z j z � { � { � { � { � { � { � | � | � | � | � | � | � | � |     �   #     *� 
�    �        � �    �   �   �     u� �Y
� hY�SY}SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�S� �SS� �� ��    �       u � �    � �  �   !     ��    �        � �        ����  -  
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcSETDISABLEDDATASOURCE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLDSNS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # DISABLEDDSNS % ADDDB ' WEBAPP ) DB + KEY - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I 
DATASOURCE K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W _setCurrentLineNo (I)V [ \
 0 ] ArrayNew (I)Ljava/util/List; _ ` coldfusion/runtime/CFPage b
 c a true e   g GETDISABLEDDATASOURCES i _get &(Ljava/lang/String;)Ljava/lang/Object; k l
 0 m getDisabledDatasources o java/lang/Object q _autoscalarize s l
 0 t 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; v w
 0 x 	component z CFIDE.adminapi.accessmanager | CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ~ 
 c � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 c � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 c � CFIDE.adminapi.datasource � getDatasources � <<All Datasources>> � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 0 � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � DB_NOT_FOUND � I � ArrayLen (Ljava/lang/Object;)I � �
 c � (I)Ljava/lang/Object; � �
 � � _set '(Ljava/lang/String;Ljava/lang/Object;)V
 0 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 0 CLASS 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �

 0 #coldfusion.sql.DataSourcePermission _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int �
 � ArrayDeleteAt (Ljava/util/List;I)Z
 c _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; �
 � (Ljava/lang/Object;D)D �!
 0" 1$ StructDelete& �
 c' '(Ljava/lang/Object;Ljava/lang/Object;)D �)
 0* ListToArray $(Ljava/lang/String;)Ljava/util/List;,-
 c. java/util/List0 iterator ()Ljava/util/Iterator;2314 java/lang/Integer6 getClass ()Ljava/lang/Class;89
 r: isArray ()Z<=
 �> coldfusion/sql/QueryTable@ class$coldfusion$sql$QueryTable coldfusion.sql.QueryTableCB �	 E _cast 7(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;GH
 �I getMetaData ()Ljava/sql/ResultSetMetaData;KL
AM getRowVector ()Ljava/util/Vector;OP coldfusion/sql/imq/imqTableR
SQ absolute (I)ZUV
AW java/util/MapY keySet ()Ljava/util/Set;[\Z] java/util/Set_`4 java/util/Iteratorb next ()Ljava/lang/Object;decf coldfusion/sql/imq/Rowh getColumnList ()[Ljava/lang/String;jk
Al _queryRowDataToStruct T(Ljava/lang/Object;[Ljava/lang/String;Ljava/lang/Object;)Lcoldfusion/runtime/Struct;no
 0p relativerV
As 
PERMISSIONu 	StructNew !()Lcoldfusion/util/FastHashtable;wx
 cy _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V{|
 0} TARGET ACTION� ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z��
 c� hasNext�=c� _LhsResolve� �
 0� _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V��
 0� LOGAUDIT� logaudit� msg� java/lang/StringBuffer�  disables use of datasource �  �
�� append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;��
�� " in the sandbox for the directory � .� toString ()Ljava/lang/String;��
 r� )([Ljava/lang/Object;[Ljava/lang/Object;)V �
 E� b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; v�
 0� 	
	� setDisabledDatasource� metaData Ljava/lang/Object;��	 � void� &coldfusion/runtime/AttributeCollection� name� access� public� output� 
returntype� hint� -Disables use of a data source in the sandbox.� 
Parameters� REQUIRED� HINT� FSpecifies the sandbox directory for which the data source is disabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
�� 1Specifies the name of the data source to disable.� 
datasource� getMetadata this 4Lcfsecurity2ecfc497454422$funcSETDISABLEDDATASOURCE; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw42 !Lcoldfusion/tagext/lang/ThrowTag; throw43 t23 Ljava/util/Iterator; t24 Lcoldfusion/sql/QueryTable; t25 #Lcoldfusion/sql/QueryTableMetaData; t26 LineNumberTable <clinit> 	getOutput 1       � �   B �   ��   	 �e �   "     ���   �       ��   �� �   "     ��   �       ��   �� �         �   �       ��   �� �   "     ��   �       ��   �k �   -     � �Y@SYLS�   �       ��   �� �  i    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-|� ^-� d� Zf� Z
h� Z-� ^-j� np-� rY-@� uS� y� Zh� Zh� Z-�� ^-{}� �� Z-�� ^--�� ^-��� ��� r� �� Z-�� ^--"� n�� rY�S� �W-�� ^--$� �Y�S� �-*� u� �� �-�� �Y@S� �� �� ��� G-� �� �� �:-�� ^�� ���-Ͷ u� ��� Ѷ �� �� ܙ �-�� ^--$� �Y�S� �� rY-*� uSY-@� uS� ߸ � Z-�� ^-{� �� Z
-�� ^-�� ^--,� n�� r� �� � Z-L� u� ��~� �Y� �� /W-�� ^--� u� �-�� �YLS� �� �� ��� � �� G-� �� �� �:-�� ^�� ���-�� u� ��� Ѷ �� �� ܙ �-�-�� ^- � u� �� �� ]-- -�� u�� �� �Y	S�� ��� !-�� ^-- � u�-�� u��W-�-�� u�g� �-�� u�#����-�� �YLS� �� ���-�%�� ;-�� ^--� u� �-&-�� u�� ��(W-�-�� u�c� �-�� u-�� ^-&� u� �� �+�t|����-�� ^--� u� �-�� �YLS� �� ��(W:::-� u:� �� � ��/�5 :� ��7� � ��/�5 :���� �;�?� ��5 :����1� ��5 :����A� -�F�J�A:�N:�T�5 :�XW��~� ��^ �a :� ��g :� ��i� �m�q:�tW� Z-v-�� ^�z�-v� �Y	S�~-v� �Y�S-.� u�~-v� �Y�Sh�~-�� ^- � u�-v� u��W�� ��\� � 
�XW-$� �Y�S��� rY-*� uSY-@� uS- � u��-N� R-�� ^-�� n�-� EY� �Y�S� rY��Y���-�� �YLS� �� ������-�� �Y@S� �� ��������S����W-�� R�   �     ��    ��   ��   ��   ��   ��   ��    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   ��   ��   ��   ��   �� �  "H  w �{ �{ �{ �{ �{ �{ �| �| �| �| �| �| �| �| �} �} �} �} �} �} �~ �~ �~ �~ �~ �~ � � � � � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���������
�
�
�
��.�.�<�<�-�-�-�K�K�Z�Z�K�K�K�K�f�f�f�f�J�J�J�J�J�J�����������J�������������������������������������!�!� � � � � � ��6�6�<�<�6�6�6�6�X�X�X�X�a�a�a�a�W�W�W�W�W�W�W�W�6�6�������6����������������������������������������*�*�*�*�3�3�*�*�*�*�'�;�;�A�A���J�J�Y�Y�f�f�f�f�c�w�w�w�w�������������v�v�v���������������������������������������c������������������������������������������������3�3�3�3�%�?�?�?�?�H�H�?�?�?���J�m�m�����������������m� �z��������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� �� �D� ��F��Y� rY�SY�SY�SY�SY�SYfSY�SY�SY�SY	�SY
�SY� rY��Y� rY�SYfSY�SY�SY�SY�S��SY��Y� rY�SYfSY�SY�SY�SY�S��SS�׳��   �       ���   �� �   !     f�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcSETDISABLEDCFFUNCTION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! 	TARGETPOS # SECURITY % I ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I FUNCTIONNAME K 

				
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ 1 ] _setCurrentLineNo (I)V _ `
 0 a ArrayNew (I)Ljava/util/List; c d coldfusion/runtime/CFPage f
 g e   i 0 k 

         m 	component o CFIDE.adminapi.accessmanager q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; s t
 g u java w  coldfusion.server.ServiceFactory y getSecurityService { java/lang/Object } _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;  �
 0 � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFFUNCTIONS � getSecurableCFFunctions � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayToList $(Ljava/util/List;)Ljava/lang/String; � �
 g �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 g � _boolean (J)Z � �
 � � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDFUNCTION � _autoscalarize � �
 0 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 g � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 0 � CONTEXTS � _resolve � �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 g � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; �
 0 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object;
 g GETFUNCTIONPERMISSIONPOSITION getFunctionPermissionPosition
 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 0 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 0 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 *- LCase �
 g concat �
 � Left '(Ljava/lang/String;I)Ljava/lang/String; !
 g" RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;$%
 g& _Object (I)Ljava/lang/Object;()
 �* (Ljava/lang/Object;D)D,
 0- 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;/0
 g1 :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V �3
 04 _LhsResolve6 �
 07 _arraySetAt93
 0: LOGAUDIT< logaudit> msg@ java/lang/StringBufferB   disabled the use of a function D  �
CF append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;HI
CJ  in the sandbox for directory L .N toString ()Ljava/lang/String;PQ
 ~R )([Ljava/lang/Object;[Ljava/lang/Object;)V T
 EU b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �W
 0X 
	Z setDisabledCFFunction\ metaData Ljava/lang/Object;^_	 ` voidb falsed &coldfusion/runtime/AttributeCollectionf nameh accessj publicl outputn 
returntypep hintr .Disables the use of a function in the sandbox.t 
Parametersv REQUIREDx truez HINT| MSpecifies the sandbox directory for which the specified function is disabled.~ NAME� 	directory� ([Ljava/lang/Object;)V �
g� "Specifies the function to disable.� functionName� getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcSETDISABLEDCFFUNCTION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw37 !Lcoldfusion/tagext/lang/ThrowTag; throw38 LineNumberTable <clinit> 	getOutput 1       � �   ^_   	 �� �   "     �a�   �       ��   �Q �   "     ]�   �       ��   �� �         �   �       ��   �Q �   "     c�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R^� Z-\� R-a� b-� h� Z-\� R^� Z-\� R
j� Z-\� Rl� Z-\� Rj� Z-n� R-f� b-pr� v� Z-\� R-g� b--g� b-xz� v|� ~� �� Z-\� R-h� b--"� ��� ~Y�S� �W-�� R-j� b-j� b-j� b-�� ��-� ~� �� �� �-�� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-k� b��-˶ θ �� Ҷ �� �� �� �-\� R-�� R-�� �Y@S-n� b-�� �Y@S� �� �� � �-�� R-q� b--&� �Y�S� �-,� θ � �-�� �Y@S� �� �� ��� H-� �� �� �:-s� b�� ���- � θ ��� Ҷ �� �� �� �-w� b--&� �Y�S� �� ~Y-,� �SY-@� �S��� Z-{� b-	� �-� ~Y-,� �SY-@� �S� �� Z
-- -.� ζ� �� �YS�� Z-� ���� 9
� Z
-� θ �-�� b-L� θ ���� Z� �-�� b-� θ ��#��� �-�� b-� θ ��'� Z-�� b-*� θ �-�� b-L� θ ��� ��+� Z-$� ��.�� .
-�� b-� θ �-�� b-L� θ ���2� Z-- -.� ζ� �� �YS-� ζ5-&� �Y�S�8� ~Y-,� �SY-@� �S- � θ;-\� R-�� b-=� �?-� EY� �YAS� ~Y�CYE�G-�� �YLS� �� ��KM�K-�� �Y@S� �� ��KO�K�SS�V�YW-[� R�   �   �   ��    ��   �_   ��   ��   ��   �_    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �7  [ �_ �_ �_ �_ �_ �_ �_ �` �` �` �` �` �` �` �a �a �a �a �a �a �a �a �a �b �b �b �b �b �b �b �c �c �c �c �c �c �c �d �d �d �d �d �d �d �e �e �e �e �e �e �efffffffffff#g5g5g7g7g4g4g,g,g,g,g#g#gXhXhfhfhWhWhWhWh�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�j�k�k�k�k�k�j%n%n%n%n%n%n%n%nnnMqMq\q\qMqMqMqMqhqhqhqhqLqLqLqLqLqLq�s�s�s�s�sLq�w�w�w�w�w�w�w�w�w�w�w�w�w{{{{"{"{{{{{�{5|5|1|1|1|1|/|PPVVc�c�c�c�a�k�k�k�k�{�{�{�{�{�{�{�{�k�k�k�k�i����������������������������������������������������������������������������������������������������������������P5�5�J�J�J�J�1�S�S�h�h�q�q�x�x�x�x�S�Lp����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� �� ��gY� ~YiSY]SYkSYmSYoSYeSYqSYcSYsSY	uSY
wSY� ~Y�gY� ~YySY{SY}SYSY�SY�S��SY�gY� ~YySY{SY}SY�SY�SY�S��SS���a�   �       ���   �Q �   "     e�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcSETRDSSECURITYENABLED  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsSecurityEnabled s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z ACTION |   ~ _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 " � _boolean (Ljava/lang/Object;)Z � � coldfusion/runtime/Cast �
 � � enabled � disabled � LOGAUDIT � logaudit � msg � java/lang/StringBuffer �   � (Ljava/lang/String;)V  �
 � � _autoscalarize � n
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � �  RDS security. � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether RDS security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � Specify true or false. � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcSETRDSSECURITYENABLED; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  *    d+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- ɶ N-PR� X� ^-`� J- ʶ N-- ʶ N-bd� Xf� h� l� ^-`� J- ̶ N--� pr� h� lW- Ͷ N-- � pt� hY-u� wY2S� {S� lW-}� �-u� wY2S� {� �� -}�� �� -}�� �-`� J- ض N-�� p�-� 9Y� wY�S� hY� �Y�� �-}� �� �� ��� �� �S� �� �W-�� J�    �   �   d � �    d � �   d � �   d � �   d � �   d � �   d � �   d - .   d  �   d  � 	  d  � 
  d  �   d 1 �  �  * J   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �9 �9 �> �> �> �> �> �> �J �J �5 �5 � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� ߳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc497454422$funcSETUSESINGLERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USESINGLERDSPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k 
		
		 m _get &(Ljava/lang/String;)Ljava/lang/Object; o p
 " q checkRootAdminUser s setUseSingleRdsPassword u  java/lang/String x _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; z {
 " | LOGAUDIT ~ logaudit � msg � java/lang/StringBuffer � & changed using single RDS password to  � (Ljava/lang/String;)V  �
 � � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � . � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseSingleRDSPassword � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � VSets whether or not to allow a user id in addition to a password for logging in to RDS � 
Parameters � REQUIRED � true � TYPE � NAME � useSingleRDSPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc497454422$funcSETUSESINGLERDSPASSWORD; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   (     
� yY2S�    �       
 � �    � �  �  �    =+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- � N-PR� X� ^-`� J- � N-- � N-bd� Xf� h� l� ^-n� J- � N--� rt� h� lW- �� N-- � rv� hY-w� yY2S� }S� lW-`� J- � N-� r�-� 9Y� yY�S� hY� �Y�� �-w� yY2S� }� �� ��� �� �S� �� �W-�� J�    �   �   = � �    = � �   = � �   = � �   = � �   = � �   = � �   = - .   =  �   =  � 	  =  � 
  =  �   = 1 �  �   � 8   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �	 �	 � � � � � � �# �# � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     u� �Y
� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�S� �SS� ȳ ��    �       u � �    � �  �   !     ��    �        � �        ����  - 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc497454422$funcGETSECURABLECFTAGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ATAGS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 	
		
	 	 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C 

         G 	component I CFIDE.adminapi.accessmanager K CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; M N
 ? O 
		 Q _get &(Ljava/lang/String;)Ljava/lang/Object; S T
 " U checkAdminRoles W java/lang/Object Y coldfusion.sandboxsecurity [ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ] ^
 " _ _autoscalarize a T
 " b _List $(Ljava/lang/Object;)Ljava/util/List; d e coldfusion/runtime/Cast g
 h f 	CFContent j ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z l m
 ? n CFDirectory p CFFile r CFObject t 
CFRegistry v 	CFExecute x CFFtp z CFMail | CFLog ~ CFCollection � CFCookie � CFHTTP � CFHTTPParam � CFIndex � CFLDAP � CFInvoke � 
CFSchedule � CFSearch � CFTransaction � CFPOP � CFQuery � CFInsert � CFUpdate � CFStoredProc � CFGridUpdate � 
CFDocument � CFReport � CFThread � CFImage � CFFeed � CFExchangeConnection � CFExchangeCalendar � CFExchangeMail � CFExchangeContact � CFExchangeTask � CFPdf � CFPrint � CFDBInfo � CFObjectCache � CFSharepoint � CFSpreadSheet � CFCache � CFIMAP � CFFileUpload � CFExchangeConversation � CFExchangeFolder � CFWebSocket � CFHtmlToPdf � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 ? � 
	 � java/lang/String � getSecurableCFTags � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � #Returns an array of securable tags. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc497454422$funcGETSECURABLECFTAGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ߰    �        � �    � �  �   !     ۰    �        � �    � �  �         �    �        � �    �   �   #     � ٰ    �        � �     �  �    �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-ʶ :-� @� F-H� 6-˶ :-JL� P� F-R� 6-̶ :-- � VX� ZY\S� `W-R� 6-϶ :-� c� ik� oW-ж :-� c� iq� oW-Ѷ :-� c� is� oW-Ҷ :-� c� iu� oW-Ӷ :-� c� iw� oW-Զ :-� c� iy� oW-ն :-� c� i{� oW-ֶ :-� c� i}� oW-׶ :-� c� i� oW-ڶ :-� c� i�� oW-۶ :-� c� i�� oW-ܶ :-� c� i�� oW-ݶ :-� c� i�� oW-޶ :-� c� i�� oW-߶ :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW-�� :-� c� i�� oW- � :-� c� i�� oW-� :-� c� iø oW-� :-� c� iŸ oW-� :-� c� iǸ oW-� :-� c� iɸ oW-� :-� c� i˸ oW-
� :-� c� i͸ oW-� :-� c� i�Ѹ �W-� c�-׶ 6�    �   z   � � �    �   � �   �   �	   �
   � �   � - .   �    �  	  �  
  �    z�  � <� F� F� E� E� E� E� <� <� U� _� _� a� a� ^� ^� ^� ^� U� U� y� y� �� �� x� x� x� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!�*�*�!�!�!�7�7�7�7�@�@�7�7�7�M�M�M�M�V�V�M�M�M�c�c�c�c�l�l�c�c�c�y�y�y�y�����y�y�y��������������������������������������������������������������������������������������������������������������������)�)�)�)�2�2�)�)�)�?�?�?�?�H�H�?�?�?�U�U�U�U�^�^�U�U�U�k�k�k�k�t�t�k�k�k��������������������������������������������������������������������������������������������������������������������������$�$����1�1�1�1�:�:�1�1�1�G�G�G�G�P�P�G�G�G�]�]�]�]�f�f�]�]�]�s�s�s�s�|�|�s�s�s��������������������������������������������������������������������������������������������������� � ����������������# # # # , , # # # 9999BB999OOOOXXOOOeeeenneee{{{{��{{{����������
�
�
�
�
�
�
�
�
���������������� ��     �   #     *� 
�    �        � �      �   f     H� �Y
� ZY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ZS� �� ߱    �       H � �    �  �   !     �    �        � �        ����  -< 
SourceFile /CFIDE/adminapi/security.cfc 6cfsecurity2ecfc497454422$funcGETDEFAULTSECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLRUNTIMEPERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  K ! WEBAPP # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 	DIRECTORY 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; = >
  ? 

         A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 & E _setCurrentLineNo (I)V G H
 & I 	component K CFIDE.adminapi.accessmanager M CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; O P coldfusion/runtime/CFPage R
 S Q set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ / ] _get &(Ljava/lang/String;)Ljava/lang/Object; _ `
 & a checkAdminRoles c java/lang/Object e coldfusion.sandboxsecurity g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 & k PERMISSIONS m ArrayNew (I)Ljava/util/List; o p
 S q _set '(Ljava/lang/String;Ljava/lang/Object;)V s t
 & u INTERNAL w ISINTERNALSANDBOX y isInternalSandBox { _autoscalarize } `
 & ~ 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 & � 
PERMISSION � 	StructNew !()Lcoldfusion/util/FastHashtable; � �
 S � java/lang/String � CLASS � java.io.SerializablePermission � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � TARGET � * � ACTION �   � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 S � java.util.PropertyPermission � 
read,write � java.net.NetPermission � java.sql.SQLPermission �  java.security.SecurityPermission � java.net.SocketPermission � connect,resolve � _factor1 j(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;Lcoldfusion/runtime/CFPage;)Ljava/lang/Object; � �
  � _boolean (Ljava/lang/Object;)Z � �
 � � java.lang.RuntimePermission � #coldfusion.sql.DataSourcePermission � java.io.FilePermission � <<ALL FILES>> � read,write,execute,delete � coldfusion.vfs.VFilePermission � ram:///- � ram:/// � %coldfusion.runtime.FunctionPermission � _factor0 � �
  � *-createobject(java) � GETALLRUNTIMEPERMISSIONS � getAllRuntimePermissions � 1 � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 S � (I)Ljava/lang/Object; � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 & � #java.lang.reflect.ReflectPermission � &coldfusion.tagext.GenericTagPermission � 'coldfusion.tagext.lang.ModulePermission � 
	 � getDefaultSecuritySandbox � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection  name access private output hint
 1Create the default structure for a blank sandbox. 
Parameters REQUIRED true HINT 'Specifies the directory of the sandbox. NAME 	directory ([Ljava/lang/Object;)V 
 getMetadata ()Ljava/lang/Object; this 8Lcfsecurity2ecfc497454422$funcGETDEFAULTSECURITYSANDBOX; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; __factorParent out Ljavax/servlet/jsp/JspWriter; 
parentPage Lcoldfusion/runtime/CFPage; value LineNumberTable runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance __arguments 'Lcoldfusion/runtime/ArgumentCollection; Lcoldfusion/runtime/Variable; <clinit> 	getOutput 1       � �   
   $   "     � ��   #       !"   %& $   !     ��   #       !"   '( $         �   #       !"   )* $   (     
� �Y6S�   #       
!"    � � $  �    -�-� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-� J-n� � �-�� � �W-�-� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-� J-n� � �-�� � �W-�-� J� �� v-�� �Y�S�� �-�� �Y�Sö �-�� �Y�SŶ �-� J-n� � �-�� � �W-�-�� J� �� v-�� �Y�SǶ �-�� �Y�Sɶ �-�� �Y�SŶ �-�� J-n� � �-�� � �W-�-�� J� �� v-�� �Y�SǶ �-�� �Y�S˶ �-�� �Y�SŶ �- � J-n� � �-�� � �W-�-� J� �� v-�� �Y�SͶ �-�� �Y�S�� �-�� �Y�S�� �-�   #   4   !"    + 2   ,-   ./   0 � 1  � � 
� 
� 
� 
�  � � � � � � -� -� -� -� !� >� >� >� >� 2� J� J� J� J� S� S� J� J� J� g� g� g� g� ]� y� y� y� y� m� �� �� �� �� ~� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!��3�3�3�3�'�D�D�D�D�8�U�U�U�U�I�a�a�a�a�j�j�a�a�a�~�~�~�~�t�������������������������������� � � � � � � � � ���������������  � � $  �    -�-�� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-�� J-n� � �-�� � �W-�-�� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ö J-n� � �-�� � �W-�-Ŷ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ɶ J-n� � �-�� � �W-�-˶ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-϶ J-n� � �-�� � �W-�-Ѷ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-ն J-n� � �-�� � �W-�-׶ J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-�   #   4   !"    + 2   ,-   ./   0 � 1  � � 
� 
� 
� 
�  � � � � � � -� -� -� -� !� >� >� >� >� 2� J� J� J� J� S� S� J� J� J� g� g� g� g� ]� y� y� y� y� m� �� �� �� �� ~� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �����������!�!�!�!��3�3�3�3�'�D�D�D�D�8�U�U�U�U�I�a�a�a�a�j�j�a�a�a�~�~�~�~�t������������������������������������������������������������������������������������ 23 $   
   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*6� <� @:-B� F-�� J-LN� T� Z-\� F^� Z-�� J-- � bd� fYhS� lW-n-�� J-� r� v-x-�� J-z� b|-� fY-6� S� �� v*-� �� �-۶ J-n� � �-�� � �W-x� � �� /*-� �� �-� J-n� � �-�� � �W�'-�-� J� �� v-�� �Y�SͶ �-�� �Y�SҶ �-�� �Y�S�� �-� J-n� � �-�� � �W
-� J-Զ b�-� f� �� Zض Z� }-�-� J� �� v-�� �Y�S�� �-�� �Y�S--"� � ܶ �-�� �Y�S�� �-� J-n� � �-�� � �W-"� � �c� � Z-"� -� J-� � � � ��t|���b-�-� J� �� v-�� �Y�S� �-�� �Y�S�� �-�� �Y�S�� �-#� J-n� � �-�� � �W-�-&� J� �� v-�� �Y�S� �-�� �Y�S�� �-�� �Y�S�� �-*� J-n� � �-�� � �W-�--� J� �� v-�� �Y�S�� �-�� �Y�S�� �-�� �Y�S�� �-1� J-n� � �-�� � �W-n� �-�� F�   #   �   �!"    �45   �6 �   �./   �78   �,-   �0 �   � 1 2   � 9   � 9 	  � 9 
  � 9   � !9   � #9   � 59 1  � �  � \� f� f� h� h� e� e� e� e� \� \� x� z� z� z� z� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��((????5QQQQEbbbbVssssg���������������������������������    �!!!!**!!!!22????22� ��ccccYu u u u i �!�!�!�!z!�"�"�"�"�"�#�#�#�#�#�#�#�#�#�&�&�&�&�&�'�'�'�'�'�(�(�(�(�(�)�)�)�)�) * * * *	*	* * * *-----/./././.#.@/@/@/@/4/Q0Q0Q0Q0E0]1]1]1]1f1f1]1]1]1p3p3p3p3p3 x�    $   #     *� 
�   #       !"   :  $   �     ��Y
� fYSY�SYSYSY	SY�SYSYSYSY	� fY�Y� fYSYSYSYSYSYS�SS�� ��   #       �!"   ;& $   !     ��   #       !"        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcGETENABLESANDBOXSECURITY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] 
enterprise _ Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary a false c 
		
		 e java/lang/String g SANDBOXSECURITYENABLED i _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; k l
 " m 
	 o getEnableSandboxSecurity q metaData Ljava/lang/Object; s t	  u &coldfusion/runtime/AttributeCollection w name y access { public } output  hint � +Checks whether sandbox security is enabled. � 
Parameters � ([Ljava/lang/Object;)V  �
 x � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcGETENABLESANDBOXSECURITY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       s t     � �  �   "     � v�    �        � �    � �  �   !     r�    �        � �    � �  �         �    �        � �    � �  �   #     � h�    �        � �    � �  �  B     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-<>� D� J-L� 6-�� :--�� :-NP� DR� T� X� J-L� 6-�� :--� \^� TY`S� XW-L� 6-�� :--� \^� TYbSYdS� XW-f� 6- � hYjS� n�-p� 6�    �   z    � � �     � � �    � � t    � � �    � � �    � � �    � � t    � - .    �  �    �  � 	   �  � 
   �  �  �   � 0  � <� F� F� H� H� E� E� E� E� <� <� X� j� j� l� l� i� i� a� a� a� a� X� X� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��     �   #     *� 
�    �        � �    �   �   f     H� xY
� TYzSYrSY|SY~SY�SYdSY�SY�SY�SY	� TS� �� v�    �       H � �    � �  �   !     d�    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc )cfsecurity2ecfc497454422$funcGETENABLERDS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   SUCCESS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  WEBX ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 
		 3 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 5 6
 $ 7 false 9 set (Ljava/lang/Object;)V ; < coldfusion/runtime/Variable >
 ? =   A 

         C _setCurrentLineNo (I)V E F
 $ G 	component I CFIDE.adminapi.accessmanager K CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; M N coldfusion/runtime/CFPage P
 Q O _get &(Ljava/lang/String;)Ljava/lang/Object; S T
 $ U checkRootAdminUser W java/lang/Object Y _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; [ \
 $ ] checkAdminRoles _ 
standalone a *coldfusion/runtime/TransientVariableHolder c &(Lcoldfusion/runtime/NeoPageContext;)V  e
 d f 
			 h GetPageContext %()Lcoldfusion/runtime/NeoPageContext; j k
 Q l 
getRequest n getRealPath p /WEB-INF r _String &(Ljava/lang/Object;)Ljava/lang/String; t u coldfusion/runtime/Cast w
 x v web.xml z concat &(Ljava/lang/String;)Ljava/lang/String; | } java/lang/String 
 � ~ 
FileExists (Ljava/lang/String;)Z � �
 Q � 
				 � PATH � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � java/lang/StringBuffer � SERVER � 
COLDFUSION � ROOTDIR � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � (Ljava/lang/String;)V  �
 � � FS � _autoscalarize � T
 $ � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � wwwroot � WEB-INF � toString ()Ljava/lang/String; � �
 Z � 

			 � path � 	IsDefined � �
 Q � $class$coldfusion$tagext$lang$LockTag Ljava/lang/Class; coldfusion.tagext.lang.LockTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/LockTag � 
rdsservlet � setName � �
 � � 	EXCLUSIVE � setType � �
 � � 
setTimeout � F
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 
					 � "class$coldfusion$tagext$io$FileTag coldfusion.tagext.io.FileTag � � �	  � coldfusion/tagext/io/FileTag � READ � 	setAction � �
 � � cffile � file � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 $ � setFile � �
 � � webxml � setVariable � �
 � � setAddnewline � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � 
 $ WEBXML XmlParse 0(Ljava/lang/String;)Lcoldfusion/xml/XmlNodeList;
 Q I	 1 web-app servlet-mapping _arrayGetAt 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
 $ _Map #(Ljava/lang/Object;)Ljava/util/Map;
 x XMLNAME 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �
 $ _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 $  XMLCHILDREN" _resolve$
 $% 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;'
 $( XMLTEXT* 
RDSServlet, true. _double (Ljava/lang/Object;)D01
 x2 _Object (D)Ljava/lang/Object;45
 x6 ArrayLen (Ljava/lang/Object;)I89
 Q: (I)Ljava/lang/Object;4<
 x= '(Ljava/lang/Object;Ljava/lang/Object;)D?
 $@ doAfterBodyB �
 �C doEndTagE �
 �F doCatch (Ljava/lang/Throwable;)VHI
 �J 	doFinallyL 
 �M 
						O WRITEQ outputS ToStringU u
 QV \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; �X
 $Y 	setOutput[ <
 �\ unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;^_ coldfusion/runtime/NeoExceptiona
b` t0 [Ljava/lang/String; Anyfde	 h findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ijk
bl CFCATCHn bindp �
 dq unbinds 
 dt 
	v getEnableRDSx metaData Ljava/lang/Object;z{	 | boolean~ &coldfusion/runtime/AttributeCollection� name� access� public� 
returntype� hint� Checks whether RDS is enabled.� 
Parameters� ([Ljava/lang/Object;)V �
�� getMetadata ()Ljava/lang/Object; this +Lcfsecurity2ecfc497454422$funcGETENABLERDS; LocalVariableTable Code getName 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t13 ,Lcoldfusion/runtime/TransientVariableHolder; lock14  Lcoldfusion/tagext/lang/LockTag; mode14 file13 Lcoldfusion/tagext/io/FileTag; t17 t18 t19 Ljava/lang/Throwable; t20 t21 lock16 mode16 file15 t25 t26 t27 t28 t29 t30 #Lcoldfusion/runtime/AbortException; t31 Ljava/lang/Exception; __cfcatchThrowable0 t33 t34 LineNumberTable java/lang/Throwable� !coldfusion/runtime/AbortException� java/lang/Exception� <clinit> 	getOutput 1       � �    � �   de   z{   	 �� �   "     �}�   �       ��   � � �   "     y�   �       ��   � � �         �   �       ��   � � �   "     �   �       ��   �� �   #     � ��   �       ��   �� �  � 
 #  +� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:-4� 8
:� @-4� 8B� @-D� 8-� H-JL� R� @-4� 8-� H-- � VX� Z� ^W-4� 8-� H-- � V`� ZYbS� ^W-4� 8� dY-� (� g:-i� 8-� H--� H--� H--� H-� mo� Z� ^q� ZYsS� ^� y{� �� �� ]-�� 8-�-� H--� H--� H-� mo� Z� ^q� ZYsS� ^� y{� �� �-i� 8� �- � H-� �Y-�� �Y�SY�S� �� y� �-�� �� y� ��� �-�� �� y� ��� �-�� �� y� �{� �� �� �� m-�� 8-�� �Y-�� �Y�SY�S� �� y� �-�� �� y� ��� �-�� �� y� ��� �-�� �� y� �{� �� �� �-i� 8-�� 8-$� H-�� ��!-�� 8-� �� �� �:-%� Hȶ �Ͷ �� �� �� �Y6��-߶ 8-� �� �� �:-&� H� ���-�� �� y� � ��� �� �� ��� :�b��-߶ 8-(� H--� �� y�� @-
� �� �--"� ZYSYSY-
� �S��� �YS��!�� a---"� ZYSYSY-
� �S��� �Y#S�&�)�� �Y+S�-�!�� 
/� @� Q-
-
� ��3c�7� �-
� �-)� H-"� ZYSYS��;�>�A�t|���-�� 8�D��z�G� :� &���� � #:�K� � :� �:�N�-߶ 8-� �� �� �:-6� Hȶ �Ͷ �� �� �� �Y6� �-P� 8-� �� �� �:-7� HR� ���-�� �� y� � ��T-7� H--"� ��W�Z�]� �� ��� :� K� ��-߶ 8�D��w�G� :� &� ��� � #:�K� � :� �:�N�-i� 8� -�� 8
:� @-i� 8-i� 8� e� k:�:�c:  �i�m�      8           o �r-�� 8
:� @-i� 8� �� � :!� !�:"�u�"-4� 8-� ��-w� 8� !��?��3?�9<?���N��3N�9<N�?KN�NSN��J�>J�DGJ��Y�>Y�DGY�JVY�Y^Y� �����3��9��>��D��� �����3��9��>��D��� �����3��9��>��D����������� �  ` #  ��    ��   �{   ��   ��   ��   �{    / 0    �    � 	   � 
   �    !�   ��   ��   �	   ��   �{   �{   ��   ��   �{   ��   �	   ��   �{   �{   ��   ��   �{   ��   ��   ��    �� !  �{ "�     D F F F F D D S U U U U S S b l l n n k k k k b b � � � � � � � � � � � � � � � � � � � � � � � � � � � �BB::WW2222``2222((    � � � � � � � � � � � � � � � � � � { { { { z z �!�!�!�!�!�!�!�!
!
!!!!!!! ! ! ! !,!,!�!�!�!�!�!�!z  �O$O$N$N$w%w%~%~%�&�&�&�&�&�&�&�&�&(((((((((#)#)#)#))6+6+<+<+B+B+,+,+]+]+s-s-y-y---i-i-�-�-h-h-�-�-�/�/�/�/�/�0h-,+�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�)�))'_%66�6�6�7�7�7�7�7�7�7�7�7�7�7�7�7g6::::}:}:u9N$�=�=�=�=�=�= �
@
@
@
@
@    �   #     *� 
�   �       ��   �  �   �     {�� �� �� �� �� �YgS�i��Y� ZY�SYySY�SY�SYTSY:SY�SYSY�SY	�SY
�SY� ZS���}�   �       {��   � � �   !     :�   �       ��        ����  -J 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcGETSECUREDFOLDERS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   AFILES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! SECURITY # I % WEBAPP ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 	DIRECTORY 9 getVariable  (I)Lcoldfusion/runtime/Variable; ; < %coldfusion/runtime/ArgumentCollection >
 ? = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 
		 E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 * I / K set (Ljava/lang/Object;)V M N coldfusion/runtime/Variable P
 Q O _setCurrentLineNo (I)V S T
 * U ArrayNew (I)Ljava/util/List; W X coldfusion/runtime/CFPage Z
 [ Y 1 ] 	component _ CFIDE.adminapi.accessmanager a CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; c d
 [ e java g  coldfusion.server.ServiceFactory i getSecurityService k java/lang/Object m _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; o p
 * q _get &(Ljava/lang/String;)Ljava/lang/Object; s t
 * u checkAdminRoles w Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary y false { java/lang/String } CONTEXTS  _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � _autoscalarize � t
 * � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 * � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 [ � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 * � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 * � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 * � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 [ � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � java.io.FilePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 * � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � coldfusion.vfs.VFilePermission � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 [ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 [ � (I)Ljava/lang/Object; � �
 �  '(Ljava/lang/Object;Ljava/lang/Object;)D �
 * 
	 getSecuredFolders metaData Ljava/lang/Object;	
	  &coldfusion/runtime/AttributeCollection name access public output hint 4Returns an array of secured folders for the sandbox. 
Parameters REQUIRED true HINT! GSpecifies the sandbox directory for which secured folders are returned.# NAME% 	directory' ([Ljava/lang/Object;)V )
* getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcGETSECUREDFOLDERS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw45 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   	
    ,- 1   "     ��   0       ./   23 1   "     �   0       ./   45 1         �   0       ./   67 1   (     
� ~Y:S�   0       
./   89 1  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:*:� @� D:-F� JL� R-,� V-� \� R
--� V-� \� R^� R-/� V-`b� f� R-0� V--0� V-hj� fl� n� r� R-2� V--"� vx� nYzSY|S� rW-4� V--$� ~Y�S� �-(� �� �� �-�� ~Y:S� �� �� ��� G-� �� �� �:-6� V�� ���-�� �� ��� �� �� �� ̙ �-;� V--$� ~Y�S� �� nY-(� �SY-:� �S� ϸ Ӷ R^� R� �-- -&� �� ָ �� ~Y�S� �ݸ ��~�� �Y� � .W-- -&� �� ָ �� ~Y�S� �� ��~�� � � #-C� V-� �� �- -&� �� ָ �W-&� �� �c� �� R-&� �->� V- � �� ����t|���G-� ��-� J�   0   �   �./    �:;   �<
   �=>   �?@   �AB   �C
   � 5 6   � D   � D 	  � D 
  � D   � !D   � #D   � %D   � 'D   � 9D   �EF G  � �  ( l+ n+ n+ n+ n+ l+ s, }, }, |, |, |, |, s, �- �- �- �- �- �- �- �- �. �. �. �. �. �. �/ �/ �/ �/ �/ �/ �/ �/ �/ �/ �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �0 �2 �2 �2 �2 �2 �2 �2 �2 �2 �4 �444 �4 �4 �4 �44444 �4 �4 �4 �4 �4 �4W6W6W6W646 �4�;�;�;�;�;�;�;�;�;�;�;�;x;�>�>�>�>�>�A�A�A�A�A�A�A�A�A�A�A�A�A�AAA�A�A�A�A�A�A#C#C#C#C/C/C,C,C#C#C#C�A>>>>>>>>G>G>>>>>>>>><>O>O>\>\>\>\>O>O>�>vGvGvGvGvG l*    1   #     *� 
�   0       ./   H  1   �     ��� �� ��Y
� nYSYSYSYSYSY|SYSYSYSY	� nY�Y� nYSY SY"SY$SY&SY(S�+SS�+��   0       �./   I3 1   !     |�   0       ./        ����  -  
SourceFile /CFIDE/adminapi/security.cfc )cfsecurity2ecfc497454422$funcSETENABLERDS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - FLAG / boolean 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 3coldfusion/tagext/validation/CFTypeValidatorFactory 9 BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ; <	 : = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ? @
  A 

         C _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V E F
   G _setCurrentLineNo (I)V I J
   K 	component M CFIDE.adminapi.accessmanager O CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; Q R coldfusion/runtime/CFPage T
 U S set (Ljava/lang/Object;)V W X coldfusion/runtime/Variable Z
 [ Y 
		 ] _get &(Ljava/lang/String;)Ljava/lang/Object; _ `
   a checkRootAdminUser c java/lang/Object e _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; g h
   i checkAdminRoles k 
standalone m *coldfusion/runtime/TransientVariableHolder o &(Lcoldfusion/runtime/NeoPageContext;)V  q
 p r _autoscalarize t `
   u _boolean (Ljava/lang/Object;)Z w x coldfusion/runtime/Cast z
 { y ENABLERDSSERVLET } enableRDSServlet  
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
   � DISABLERDSSERVLET � disableRDSServlet � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � any � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � ex � bind '(Ljava/lang/String;Ljava/lang/Object;)V � �
 p � unbind � 
 p � 
	 � setEnableRDS � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � +Specifies whether to enable or disable RDS. � 
Parameters � REQUIRED � true � TYPE � HINT � Specify true or false. � NAME � flag � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this +Lcfsecurity2ecfc497454422$funcSETENABLERDS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; t13 #Lcoldfusion/runtime/AbortException; t14 Ljava/lang/Exception; __cfcatchThrowable1 Ljava/lang/Throwable; t16 t17 LineNumberTable !coldfusion/runtime/AbortException � java/lang/Exception � java/lang/Throwable � <clinit> 	getOutput 1       � �    � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� �Y0S�    �       
 � �    � �  �  �    T+� � :+� ,� :	+� :
-� $� *:-� .:*02� 8� >� B:-D� H
-F� L-NP� V� \-^� H-G� L--� bd� f� jW-^� H-H� L--� bl� fYnS� jW-^� H� pY-� $� s:-0� v� |� %-M� L-~� b�-� f� �W� -Q� L-�� b�-� f� �W� M� S:�:� �:� �� ��                  �� �� �� � :� �:� ��-�� H�  � � � � � � � � � �9 � �69 �9>9 �  �   �   T � �    T � �   T � �   T � �   T � �   T � �   T � �   T + ,   T  �   T  � 	  T  � 
  T / �   T � �   T � �   T � �   T � �   T � �   T � �  �   � )  D GF QF QF SF SF PF PF PF PF GF GF kG kG jG jG jG jG �H �H �H �H �H �H �H �H �K �K �M �M �M �M �M �Q �Q �Q �Q �Q �K �J �I     �   #     *� 
�    �        � �    �   �   �     �� �Y�S� �� �Y� fY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� fY� �Y� fY�SY�SY�SY2SY�SY�SY�SY�S� �SS� ҳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 8cfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ getAllSecureProfileSettings ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s )Returns all settings from Secure Profile. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this :Lcfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-T� :-<>� D� J-2� 6-V� :--� NP� R� VW-W� :--W� :-XZ� D\� R� V� J-X� :-- � N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   S < T E T E T G T G T D T D T D T D T < T < T ^ V ^ V ] V ] V ] V n W ~ W ~ W � W � W } W } W v W v W v W v W n W � X � X � X � X � X � X � X ] U     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcGETALLRUNTIMEPERMISSIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ALLRUNTIMEPERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K _get &(Ljava/lang/String;)Ljava/lang/Object; M N
 " O checkAdminRoles Q java/lang/Object S coldfusion.sandboxsecurity U _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; W X
 " Y ArrayNew (I)Ljava/util/List; [ \
 C ] _autoscalarize _ N
 " ` _List $(Ljava/lang/Object;)Ljava/util/List; b c coldfusion/runtime/Cast e
 f d getClassLoader h ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z j k
 C l setContextClassLoader n  enableContextClassLoaderOverride p createSecurityManager r getenv.* t shutdownHooks v modifyThread x 
stopThread z getProtectionDomain | readFileDescriptor ~ writeFileDescriptor � accessClassInPackage.* � defineClassInPackage.* � accessDeclaredMembers � queuePrintJob � getStackTrace � "setDefaultUncaughtExceptionHandler � preferences � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 C � 
	 � java/lang/String � getAllRuntimePermissions � metaData Ljava/lang/Object; � �	  � array � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � $Get array of all runtime permissions � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcGETALLRUNTIMEPERMISSIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   #     � ��    �        � �    � �  �      ;+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6-8� :-<>� D� J-L� 6-;� :-- � PR� TYVS� ZW
-=� :-� ^� J->� :-� a� gi� mW-?� :-� a� go� mW-@� :-� a� gq� mW-A� :-� a� gs� mW-B� :-� a� gu� mW-C� :-� a� gw� mW-D� :-� a� gy� mW-E� :-� a� g{� mW-F� :-� a� g}� mW-G� :-� a� g� mW-H� :-� a� g�� mW-I� :-� a� g�� mW-J� :-� a� g�� mW-K� :-� a� g�� mW-L� :-� a� g�� mW-M� :-� a� g�� mW-N� :-� a� g�� mW-O� :-� a� g�� mW-Q� :-� a� g��� �W-� a�-�� 6�    �   z   ; � �    ; � �   ; � �   ; � �   ; � �   ; � �   ; � �   ; - .   ;  �   ;  � 	  ;  � 
  ;  �  �  : �  7 <8 F8 F8 H8 H8 E8 E8 E8 E8 <8 <8 `; `; n; n; _; _; _; u= = = ~= ~= ~= ~= u= �> �> �> �> �> �> �> �> �> �? �? �? �? �? �? �? �? �? �@ �@ �@ �@ �@ �@ �@ �@ �@ �A �A �A �A �A �A �A �A �A �B �B �B �B �B �B �B �B �B �C �C �C �CCC �C �C �CDDDDDDDDD'E'E'E'E0E0E'E'E'E=F=F=F=FFFFF=F=F=FSGSGSGSG\G\GSGSGSGiHiHiHiHrHrHiHiHiHIIII�I�IIII�J�J�J�J�J�J�J�J�J�K�K�K�K�K�K�K�K�K�L�L�L�L�L�L�L�L�L�M�M�M�M�M�M�M�M�M�N�N�N�N�N�N�N�N�NOOOOOOOOOQQQQ"Q"Q$Q$QQQQ*S*S*S*S*S _9     �   #     *� 
�    �        � �    �   �   r     T� �Y� TY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� TS� �� ��    �       T � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcDELETEDISABLEDDATASOURCE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   	DSNEXISTS  ACCESSMANAGER ! ADDWILDCARD # SECURITY % I ' WEBAPP ) APOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
DATASOURCE I 
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 . O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U _setCurrentLineNo (I)V Y Z
 . [ ArrayNew (I)Ljava/util/List; ] ^ coldfusion/runtime/CFPage `
 a _   c 1 e true g false i 	component k CFIDE.adminapi.accessmanager m CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; o p
 a q java s  coldfusion.server.ServiceFactory u getSecurityService w java/lang/Object y _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; { |
 . } _get &(Ljava/lang/String;)Ljava/lang/Object;  �
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 a � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 a � <<All Datasources>> � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � ArrayLen (Ljava/lang/Object;)I � �
 a � _Object (I)Ljava/lang/Object; � �
 � � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � #coldfusion.sql.DataSourcePermission � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � _int � �
 � � ArrayDeleteAt (Ljava/util/List;I)Z � �
 a � _double (Ljava/lang/Object;)D
 � (D)Ljava/lang/Object; �
 � (Ljava/lang/Object;D)D �
 .	 
PERMISSION 	StructNew !()Lcoldfusion/util/FastHashtable;
 a _set '(Ljava/lang/String;Ljava/lang/Object;)V
 . _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V
 . TARGET * ACTION ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z 
 a! '(Ljava/lang/Object;Ljava/lang/Object;)D �#
 .$ _boolean (Ljava/lang/Object;)Z&'
 �( GETDISABLEDDATASOURCES* getDisabledDatasources, 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;./
 .0 (J)Z&2
 �3 _LhsResolve5 �
 .6 _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V89
 .: LOGAUDIT< logaudit> msg@ java/lang/StringBufferB  removed a datasource D  �
CF append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;HI
CJ G from the list of disabled datasource in the sandbox for the directory L .N toString ()Ljava/lang/String;PQ
 zR )([Ljava/lang/Object;[Ljava/lang/Object;)V T
 CU b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;.W
 .X 
	Z deleteDisabledDatasource\ metaData Ljava/lang/Object;^_	 ` voidb &coldfusion/runtime/AttributeCollectiond namef accessh publicj outputl 
returntypen hintp LRemoves a data source from the list of disabled data sources in the sandbox.r 
Parameterst REQUIREDv HINTx ESpecifies the sandbox directory for which the data source is enabled.z NAME| 	directory~ ([Ljava/lang/Object;)V �
e� 0Specifies the name of the data source to enable.� 
datasource� getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcDELETEDISABLEDDATASOURCE; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw44 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   ^_   	 �� �   "     �a�   �       ��   �Q �   "     ]�   �       ��   �� �         �   �       ��   �Q �   "     c�   �       ��   �� �   -     � �Y>SYJS�   �       ��   �� �      �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:-L� PR� X
-�� \-� b� Xd� Xf� Xh� Xj� X-ƶ \-ln� r� X-Ƕ \--Ƕ \-tv� rx� z� ~� X-ɶ \--"� ��� zY�S� ~W-˶ \--&� �Y�S� �-*� �� �� �-�� �Y>S� �� �� ��� G-� �� �� �:-Ͷ \�� ���-Ƕ �� ��� ˶ �� �� ֙ �
-Ѷ \--&� �Y�S� �� zY-*� �SY->� �S� ٸ ݶ X-�� �YJS� �߸ ��� �-׶ \-� �� � � X� Z---(� �� � �� �Y�S� ��� ��� !-ܶ \--� �� �-(� �� �� W-(� ��g�� X-(� ��
����--� \��-� �Y�S��-� �YS�-� �YSd�-� \-� �� �-� ��"W�zf� X� {---(� �� � �� �Y�S� ��� ��� B---(� �� � �� �YS� �-�� �YJS� ��%�~�� 
h� X-(� ��c�� X-(� �-� \-� �� � �%�t|���d- � ��)�� t--�� \��-� �Y�S��-� �YS-�� �YJS� ��-� �YSd�-�� \-� �� �-� ��"W-� \-� \-+� �--� zY-�� �Y>S� �S�1� 煸4�� 
h� Xf� X� k---(� �� � �� �Y�S� ��� ��� 2---(� �� � �� �YS� �� ��� 
j� X-(� ��c�� X-(� �-� \-� �� � �%�t|���t-$� ��)� h--� \��-� �Y�S��-� �YS�-� �YSd�-� \-� �� �-� ��"W-&� �Y�S�7� zY-*� �SY->� �S-� ��;-L� P-!� \-=� �?-� CY� �YAS� zY�CYE�G-�� �YJS� �� ��KM�K-�� �Y>S� �� ��KO�K�SS�V�YW-[� P�   �   �   ���    ���   ��_   ���   ���   ���   ��_   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   ��� �  *�  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������ � � ���-�-�����9�9�9�9�������v�v�v�v�S��������������������������������������������������������1�1�1�1�:�:�:�:�0�0�0��I�I�I�I�R�R�I�I�I�I�G�Z�Z�`�`���t�t�t�t�i���������z���������������������������������������������������������������������;�;�;�;�9����B�B�B�B�K�K�B�B�B�B�@�S�S�`�`�`�`�S�S���z�z�z�z�z�z�����������������������������������������������������������z�99997@@@@>LLHHddrrnn�������nH�������������������>��������((((4444==444���HH]]ffmmmmH ���!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!    �   #     *� 
�   �       ��   �  �   �     ��� �� ��eY� zYgSY]SYiSYkSYmSYjSYoSYcSYqSY	sSY
uSY� zY�eY� zYwSYhSYySY{SY}SYS��SY�eY� zYwSYhSYySY�SY}SY�S��SS���a�   �       ���   �Q �   !     j�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcSETENABLESANDBOXSECURITY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ENABLE 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkAdminRoles q %enterprise,coldfusion.sandboxsecurity s setSandboxSecurityEnabled u  java/lang/String x _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; z {
 " | _boolean (Ljava/lang/Object;)Z ~  coldfusion/runtime/Cast �
 � � CREATEDEFAULTSANDBOXES � createDefaultSandboxes � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � 
		
	 � setEnableSandboxSecurity � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � -Specifies whether to enable sandbox security. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � enable � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcSETENABLESANDBOXSECURITY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� yY2S�    �       
 � �    � �  �  �    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-ƶ N-PR� X� ^-`� J-Ƕ N--Ƕ N-bd� Xf� h� l� ^-`� J-ȶ N--� pr� hYtS� lW-`� J-ʶ N-- � pv� hY-w� yY2S� }S� lW-w� yY2S� }� �� -Ͷ N-�� p�-� h� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � 1  � O� Y� Y� [� [� X� X� X� X� O� O� k� }� }� � � |� |� t� t� t� t� k� k� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ������� �� ��     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc ?cfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGSINARRAY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ "getAllSecureProfileSettingsInArray ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s )Returns all settings from Secure Profile. u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this ALcfsecurity2ecfc497454422$funcGETALLSECUREPROFILESETTINGSINARRAY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-]� :-<>� D� J-2� 6-_� :--� NP� R� VW-`� :--`� :-XZ� D\� R� V� J-a� :-- � N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   \ < ] E ] E ] G ] G ] D ] D ] D ] D ] < ] < ] ^ _ ^ _ ] _ ] _ ] _ n ` ~ ` ~ ` � ` � ` } ` } ` v ` v ` v ` v ` n ` � a � a � a � a � a � a � a ] ^     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcSETUSEADMINPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USEADMINPASSWORD 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAdminSecurityEnabled s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z LOGAUDIT | logaudit ~ msg �  enabled using admin password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setUseAdminPassword � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � @Specifies whether ColdFusion Administrator security is required. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � useAdminPassword � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcSETUSEADMINPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  i    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-g� N-PR� X� ^-`� J-h� N--h� N-bd� Xf� h� l� ^-`� J-j� N--� pr� h� lW-k� N-- � pt� hY-u� wY2S� {S� lW-`� J-n� N-}� p-� 9Y� wY�S� hY�S� �� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � .   e O g X g X g Z g Z g W g W g W g W g O g O g j h z h z h | h | h y h y h r h r h r h r h j h j h � j � j � j � j � j � k � k � k � k � k � k � k � i � n � n � n � n � n � n � n � n     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcSETSECUREDFOLDER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACT ! ACCESSMANAGER # ADDNEWFOLDER % SECURITY ' VFSFILEFACTORY ) PERMISSIONCLASS + WEBAPP - FILEPOS / VFILE 1 coldfusion/runtime/CfJspPage 3 pageContext #Lcoldfusion/runtime/NeoPageContext; 5 6	 4 7 getOut ()Ljavax/servlet/jsp/JspWriter; 9 : javax/servlet/jsp/JspContext <
 = ; parent Ljavax/servlet/jsp/tagext/Tag; ? @	 4 A 	DIRECTORY C getVariable  (I)Lcoldfusion/runtime/Variable; E F %coldfusion/runtime/ArgumentCollection H
 I G _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; K L
  M FOLDER O get (I)Ljava/lang/Object; Q R
 I S FILEREAD U true W put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; Y Z
 I [ 	FILEWRITE ] FILEEXECUTE _ 
FILEDELETE a 
		 c _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V e f
 4 g / i set (Ljava/lang/Object;)V k l coldfusion/runtime/Variable n
 o m _setCurrentLineNo (I)V q r
 4 s ArrayNew (I)Ljava/util/List; u v coldfusion/runtime/CFPage x
 y w 	StructNew !()Lcoldfusion/util/FastHashtable; { |
 y } 0    � false � java � coldfusion.vfs.VFSFileFactory � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 y � 	component � CFIDE.adminapi.accessmanager �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 4 � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 4 � checkIfVFile � _autoscalarize � �
 4 � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 4 � _arrayGetAt � Z
 4 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 4 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 y � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 4 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 4 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 4 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 4 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 y � TARGET � <<ALL FILES>> � _set '(Ljava/lang/String;Ljava/lang/Object;)V � 
 4 _boolean (Ljava/lang/Object;)Z
 � coldfusion.vfs.VFilePermission getFileObject	 getAbsolutePath _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V
 4 ram:///- java.io.FilePermission _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 4 _Object (Z)Ljava/lang/Object;
 � ISRAMALLFILES isRAMAllFiles 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;!"
 4# I% 1' 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �)
 4* CLASS, 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �.
 4/ '(Ljava/lang/Object;Ljava/lang/Object;)D1
 42 _List $(Ljava/lang/Object;)Ljava/util/List;45
 �6 _int (Ljava/lang/Object;)I89
 �: ArrayDeleteAt (Ljava/util/List;I)Z<=
 y> _double (Ljava/lang/Object;)D@A
 �B (D)Ljava/lang/Object;D
 �E ArrayLenG9
 yH R
 �J readL ,N 
ListAppend J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;PQ
 yR writeT executeV deleteX ACTIONZ _arraySetAt\
 4] ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z_`
 ya (Ljava/lang/Object;D)Dc
 4d _LhsResolvef �
 4g :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V\i
 4j 
	l setSecuredFoldern metaData Ljava/lang/Object;pq	 r voidt &coldfusion/runtime/AttributeCollectionv namex accessz public| output~ 
returntype� hint� 2Makes a folder accessible for the secured sandbox.� 
Parameters� REQUIRED� HINT� @Specifies the sandbox directory for which the folder is enabled.� NAME� 	directory� ([Ljava/lang/Object;)V �
w� 9Specifies the directory path of the folder to be enabled.� folder� DEFAULT� Allow read permission.� fileRead� Allow write permission.� 	fileWrite� Allow execute permission.� fileExecute� Allow delete permission.� 
fileDelete� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcSETSECUREDFOLDER; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw46 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   pq   	 �� �   "     �s�   �       ��   �� �   "     o�   �       ��   �� �         �   �       ��   �� �   "     u�   �       ��   �� �   B     $� �YDSYPSYVSY^SY`SYbS�   �       $��   �� �  �    	+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :+0� :+2� :-� 8� >:-� B:*D� J� N:*P� J� N:� T� VX� \W� J:� T� ^X� \W� J:� T� `X� \W� J:� T� bX� \W� J:-d� hj� p-T� t-� z� p
-U� t� ~� p�� p�� pX� p�� p�� p-[� t-��� �� p-]� t-��� �� p-^� t--^� t-��� ��� �� �� p-a� t--*� ��� �Y-P� �S� �� p-c� t--$� ��� �Y�S� �W-e� t--(� �Y�S� �-.� �� �� �-�� �YDS� �� �� ��� G-� �� �� �:-g� tض ���-� �� �ظ � �� �� � �-k� t--(� �Y�S� �� �Y-.� �SY-D� �S� �� �� p-���-2� ��� b� p-�� �YPS-p� t--p� t--*� �
� �Y-�� �YPS� �S� �� �� ��-��� � p-�� �YPS� ����~�Y�� 7W-y� t-� � -� �Y-�� �YPS� �S�$�����0-&(�� �-- -&� ��+� �� �Y-S�0-,� ��3�~�� �-2� �Y�� =W-�� t-� � -� �Y-- -&� ��+� �� �Y�S�0S�$�� %-�� t-- � ��7-&� ��;�?W� I-- -&� ��+� �� �Y�S�0���� "-�� t-- � ��7-&� ��;�?W-&-&� ��Cc�F�-&� �-|� t- � ��I�K�3�t|����-V� ��� !-�� t-"� �� �MO�S� p-^� ��� !-�� t-"� �� �UO�S� p-`� ��� !-�� t-"� �� �WO�S� p-b� ��� !-�� t-"� �� �YO�S� p-� �Y-S-,� ��-� �Y�S-�� �YPS� ��-� �Y[S-"� ��-&(�� �-- -&� ��+� �� �Y-S�0-,� ��3�~��Y�� <W-- -&� ��+� �� �Y�S�0-�� �YPS� ��3�~���� $- � �Y-&� �S-� ��^�� p-&-&� ��Cc�F�-&� �-�� t- � ��I�K�3�t|���.-&� ��� -�� t- � ��7-� ��bW�=-&-�� t- � ��I�K��-- -&� ��+� �� �Y-S�0-,� ��3�~�� �-2� ��� d-�� t-� � -� �Y-- -&� ��+� �� �Y�S�0S�$�� "-�� t-- � ��7-&� ��;�?W� Z-- -&� ��+� �� �Y�S�0-�� �YPS� ��3�~�� "-�� t-- � ��7-&� ��;�?W-&-&� ��Cg�F�-&� ��e����-V� ��� !-Ķ t-"� �� �MO�S� p-^� ��� !-ƶ t-"� �� �UO�S� p-`� ��� !-ȶ t-"� �� �WO�S� p-b� ��� !-ʶ t-"� �� �YO�S� p-� �Y-S-,� ��-� �Y�S-�� ��-� �Y[S-"� ��-϶ t- � ��7-� ��bW-(� �Y�S�h� �Y-.� �SY-D� �S- � ��k-m� h�   �     	��    	��   	�q   	��   	��   	��   	�q   	 ? @   	 �   	 � 	  	 � 
  	 �   	 !�   	 #�   	 %�   	 '�   	 )�   	 +�   	 -�   	 /�   	 1�   	 C�   	 O�   	 U�   	 ]�   	 _�   	 a�   	�� �  	�`  K �N �N �O �O �P �P �Q �QSSSSSST%T%T$T$T$T$TT,U5U5U5U5U,U;V=V=V=V=V;VBWDWDWDWDWBWIXKXKXKXKXIXPYRYRYRYRYPYWZYZYZYZYZWZ^[h[h[j[j[g[g[g[g[^[r]|]|]~]~]{]{]{]{]r]�^�^�^�^�^�^�^�^�^�^�^�^�a�a�a�a�a�a�a�a�a�c�c�c�c�c�c�c�e�eee�e�e�e�eeeee�e�e�e�e�e�eMgMgMgMg*g�exkxk�k�k�k�kwkwkwkwkwkwknk�l�l�l�l�l�m�m�o�o�o�o�o�p�p�p�p�p�p�p�p�p�p�pqqqqquuuuu�m!y!y0y0y!y!y!y!yKyKy\y\yKyKyKyKyKyKyKyKy!y!y�|�|�|�|}|�~�~�~�~�~�~�~�~�������������������������������������������-�-�)�)�F�F�X�X�X�X�a�a�a�a�W�W�W�)�)����~s|s|s|s|}|}|s|s|s|s|o|�|�|�|�|�|�|�|�|}|������������������������������������������������������������������������"�"�������+�+�@�@�@�@�I�I�L�L�@�@�@�@�7�+�b�b�b�b�U�w�w�w�w�k���������������������������������������������������������������+�+�3�3�3�3�"�>�>�>�>�<���G�G�G�G�Q�Q�G�G�G�G�C�Y�Y�g�g�g�g�Y�Y�������������������������������������������������������������
�
�����
�
�J�J�J�J�S�S�S�S�I�I�I�
�h�h�d�d�����d�d�����������������������d��������������������������������������������������������������������� � � � �)�)�,�,� � � � ���5�5�J�J�J�J�S�S�V�V�J�J�J�J�A�5�_�_�t�t�t�t�}�}�����t�t�t�t�k�_�������������������������������������������������!y��������	�	�		�		�		�		���R    �   #     *� 
�   �       ��   �  �  �    �ȸ γ лwY� �YySYoSY{SY}SYSY�SY�SYuSY�SY	�SY
�SY� �Y�wY� �Y�SYXSY�SY�SY�SY�S��SY�wY� �Y�SYXSY�SY�SY�SY�S��SY�wY� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY�wY� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY�wY� �Y�SY�SY�SYXSY�SY�SY�SY�S��SY�wY� �Y�SY�SY�SYXSY�SY�SY�SY�S��SS���s�   �      ���   �� �   !     ��   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc $cfsecurity2ecfc497454422$funcSETUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / USERNAME 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C PASSWORD E get (I)Ljava/lang/Object; G H
 9 I DESCRIPTION K   M put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; O P
 9 Q _validateArgWithValidator S B
  T ROLES V _setCurrentLineNo (I)V X Y
 " Z ArrayNew (I)Ljava/util/List; \ ] coldfusion/runtime/CFPage _
 ` ^ array b ARRAY_VALIDATOR d >	 < e ALLOWRDSACCESS g false i boolean k BOOL_VALIDATOR m >	 < n ALLOWADMINACCESS p ALLOWADMINAPIACCESS r SERVICES t 	ENABLEDDS v FILEPERMISSIONS x ISHASHED z 

         | _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ~ 
 " � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 ` � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 " � 
		
		 � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 " � checkRootAdminUser � 
		
		
		 � _autoscalarize � �
 " � ArrayLen (Ljava/lang/Object;)I � �
 ` � 1 � _double (Ljava/lang/String;)D � � coldfusion/runtime/Cast �
 � � _Object (D)Ljava/lang/Object; � �
 � � I � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 " � 
			 � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 " � IsSimpleValue (Ljava/lang/Object;)Z � �
 ` � 
				 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/ThrowTag � 2The roles argument can contain only simple values. � 
setMessage (Ljava/lang/String;)V � �
 � � cfadminapivalidationerror � setType � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " � 
		 � CFLOOP � checkRequestTimeout � �
 " � _checkCondition (DDD)Z � �
 " � 

		 � setAuthorizedUser �  java/lang/String _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;
 " LOGAUDIT logaudit
 msg java/lang/StringBuffer  added/edited user   �
 _String &(Ljava/lang/Object;)Ljava/lang/String;
 � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;
 . toString ()Ljava/lang/String;
 �  )([Ljava/lang/Object;[Ljava/lang/Object;)V "
 9# 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;%&
 "' 		
	) setUser+ metaData Ljava/lang/Object;-.	 / void1 &coldfusion/runtime/AttributeCollection3 name5 access7 public9 output; 
returntype= hint? Add or Update a new user.A 
ParametersC REQUIREDE trueG TYPEI HINTK %Specifies the username for this user.M NAMEO usernameQ ([Ljava/lang/Object;)V S
4T %Specifies the password for this user.V passwordX $Specifies a description of the user.Z DEFAULT\ description^ %Administrative roles assigned to user` [runtime expression]b rolesd =Specifies whether or not RDS access is allowed for this user.f allowrdsaccessh XSpecifies whether or not CF Administrator and Admin API access is allowed for this user.j allowadminaccessl CSpecifies whether or not Admin API access is allowed for this user.n allowadminapiaccessp $Services  user is allowed to access.r servicest !datasources to allowed to access.v 	enableddsx Files to allowed to access.z filepermissions| ;Set it to true if the password sent is already hashed once.~ isHashed� getMetadata ()Ljava/lang/Object; this &Lcfsecurity2ecfc497454422$funcSETUSER; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t23 D t25 t27 t29 throw53 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   -.   	 �� �   "     �0�   �       ��   � �   "     ,�   �       ��   �� �         �   �       ��   � �   "     2�   �       ��   �� �   `     B�Y2SYFSYLSYWSYhSYqSYsSYuSYwSY	ySY
{S�   �       B��   �� �  �    �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:*F4� :� @� D:� J� LN� RW*L4� :� @� U:� J� W-	d� [-� a� RW*Wc� :� f� U:� J� hj� RW*hl� :� o� U:� J� qj� RW*ql� :� o� U:� J� sj� RW*sl� :� o� U:� J� u-	h� [-� a� RW*uc� :� f� U:� J� w-	i� [-� a� RW*wc� :� f� U:	� J� y-	j� [-� a� RW*yc	� :� f� U:
� J� {j� RW*{l
� :� o� U:-}� �
-	l� [-��� �� �-}� �-	m� [--	m� [-��� ��� �� �� �-�� �-	o� [--� ��� �� �W-�� �9-	r� [-W� �� ��9�� �9� �:-�+� �:� �� �-�� �-	s� [-W-�� �� ĸ ��� G-ʶ �-� �� �� �:-	t� [޶ �� �� �� � �-�� �-� �c\9� �:� ��� �� ���o-�� �-	y� [-- � � � �Y-�Y2S�SY-�YFS�SY-�YLS�SY-�YqS�SY-�YhS�SY-�YsS�SY-�YwS�SY-�YyS�SY-�YWS�SY	-�YuS�SY
-�Y{S�S� �W-� �-	�� [-	� �-� 9Y�YS� �Y�Y�-�Y2S�����!S�$�(W-*� ��   �     ���    ���   ��.   ���   ���   ���   ��.   � - .   � �   � � 	  � � 
  � �   � 1�   � E�   � K�   � V�   � g�   � p�   � r�   � t�   � v�   � x�   � z�   ���   ���   ���   ���   ��� �  & �  	` h	c h	c �	d �	d �	d �	d �	d �	d �	e �	e �	f �	f	g	g@	h@	h?	h?	h?	h?	hs	is	ir	ir	ir	ir	i�	j�	j�	j�	j�	j�	j�	k�	k�	l�	l�	l�	l�	l�	l�	l�	l�	l�	l�	l	m!	m!	m#	m#	m 	m 	m	m	m	m	m	m	mD	oD	oC	oC	oC	oC	of	rf	rf	rf	rf	rf	rr	rr	r�	s�	s�	s�	s�	s�	s�	s�	s�	s�	s�	t�	t�	t�	t�	t�	s$	r\	r7	y7	yG	yG	yZ	zZ	zm	{m	{�	|�	|�	}�	}�	~�	~�	�	�	��	��	��	��	��	�
	�
	�6	y6	y6	y6	x.	�.	�Q	�Q	�W	�W	�W	�W	�W	�W	�m	�m	�M	�M	�.	�.	�.	�.	�    �   #     *� 
�   �       ��   �  �  �    �θ Գ ֻ4Y� �Y6SY,SY8SY:SY<SYjSY>SY2SY@SY	BSY
DSY� �Y�4Y� �YFSYHSYJSY4SYLSYNSYPSYRS�USY�4Y� �YFSYHSYJSY4SYLSYWSYPSYYS�USY�4Y
� �YLSY[SYFSYjSYJSY4SY]SYNSYPSY	_S�USY�4Y
� �YLSYaSYFSYjSYJSYcSY]SYcSYPSY	eS�USY�4Y
� �YLSYgSYFSYjSYJSYlSY]SYjSYPSY	iS�USY�4Y
� �YLSYkSYFSYjSYJSYlSY]SYjSYPSY	mS�USY�4Y
� �YLSYoSYFSYjSYJSYlSY]SYjSYPSY	qS�USY�4Y
� �YLSYsSYFSYjSYJSYcSY]SYcSYPSY	uS�USY�4Y
� �YLSYwSYFSYjSYJSYcSY]SYcSYPSY	yS�USY	�4Y
� �YLSY{SYFSYjSYJSYcSY]SYcSYPSY	}S�USY
�4Y
� �YLSYSYFSYjSYJSYlSY]SYjSYPSY	�S�USS�U�0�   �      ���   � �   !     j�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc497454422$funcGETUSESINGLERDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 

         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K java M  coldfusion.server.ServiceFactory O getSecurityService Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ checkAdminRoles ] :coldfusion.serversettings,coldfusion.serversettingssummary _ false a getUseSingleRdsPassword c 
	 e java/lang/String g getUseSingleRDSPassword i metaData Ljava/lang/Object; k l	  m boolean o &coldfusion/runtime/AttributeCollection q name s access u public w output y 
returntype { hint } ^Indicates whether or not a user is is required in addition to a password for logging in to RDS  
Parameters � ([Ljava/lang/Object;)V  �
 r � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc497454422$funcGETUSESINGLERDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       k l   	  � �  �   "     � n�    �        � �    � �  �   !     j�    �        � �    � �  �         �    �        � �    � �  �   !     p�    �        � �    � �  �   #     � h�    �        � �    � �  �       �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
- ݶ :-<>� D� J-L� 6- ޶ :-- ޶ :-NP� DR� T� X� J-L� 6- � :--� \^� TY`SYbS� XW- � :-- � \d� T� X�-f� 6�    �   z    � � �     � � �    � � l    � � �    � � �    � � �    � � l    � - .    �  �    �  � 	   �  � 
   �  �  �   � *   � < � F � F � H � H � E � E � E � E � < � < � X � j � j � l � l � i � i � a � a � a � a � X � X � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   r     T� rY� TYtSYjSYvSYxSYzSYbSY|SYpSY~SY	�SY
�SY� TS� �� n�    �       T � �    � �  �   !     b�    �        � �        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcDELETESECUREDIPPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  SUCCESS ! ACCESSMANAGER # ADDWILDCARD % SECURITY ' I ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G IP I PORT K get (I)Ljava/lang/Object; M N
 C O PORTTYPE Q single S put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; U V
 C W 
		 Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 . ] / _ set (Ljava/lang/Object;)V a b coldfusion/runtime/Variable d
 e c true g _setCurrentLineNo (I)V i j
 . k ArrayNew (I)Ljava/util/List; m n coldfusion/runtime/CFPage p
 q o 	StructNew !()Lcoldfusion/util/FastHashtable; s t
 q u 1 w 	component y CFIDE.adminapi.accessmanager { CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; } ~
 q  java �  coldfusion.server.ServiceFactory � getSecurityService � java/lang/Object � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _autoscalarize � �
 . � _arrayGetAt � V
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 q � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 q � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � java.net.SocketPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � TARGET � java/lang/StringBuffer �  �
 � � : � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;
 � 
FORMATPORT 
formatPort 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;	

 . toString ()Ljava/lang/String;
 � '(Ljava/lang/Object;Ljava/lang/Object;)D �
 . _List $(Ljava/lang/Object;)Ljava/util/List;
 � _int (Ljava/lang/Object;)I
 � ArrayDeleteAt (Ljava/util/List;I)Z
 q _double (Ljava/lang/Object;)D !
 �" _Object (D)Ljava/lang/Object;$%
 �& ArrayLen(
 q)$ N
 �+ false- _boolean (Ljava/lang/Object;)Z/0
 �1 _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V34
 .5 *7 ACTION9 connect,resolve; ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z=>
 q? _LhsResolveA �
 .B _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)VDE
 .F LOGAUDITH logauditJ msgL  removed a IP N F from the list of disabled functions in the sandbox for the directory P .R )([Ljava/lang/Object;[Ljava/lang/Object;)V T
 CU b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;	W
 .X 	
	Z deleteSecuredIPPort\ metaData Ljava/lang/Object;^_	 ` &coldfusion/runtime/AttributeCollectionb named accessf publich outputj hintl ?Removes a specified IP address and port from restricted status.n 
Parametersp REQUIREDr HINTt ESpecifies the sandbox directory for which the restriction is removed.v NAMEx 	directoryz ([Ljava/lang/Object;)V |
c}  Specifies the target IP address. Specifies the target port.� DEFAULT� �Specifies the port type:<ul><li>single - Single port</li><li>higher - The specified port and higher</li><li>lower - The specified port and lower</li><li>range - Specified range of ports</li></ul>� portType� getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcDELETESECUREDIPPORT; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw52 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �   ^_    �� �   "     �a�   �       ��   � �   "     ]�   �       ��   �� �         �   �       ��   �� �   7     � �Y>SYJSYLSYRS�   �       ��   �� �  	�    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:*L� D� H:� P� RT� XW� D:-Z� ^`� fh� f-�� l-� r� f
-�� l� v� fx� fh� f-�� l-z|� �� f-�� l--�� l-��� ��� �� �� f-�� l--$� ��� �Y�S� �W-�� l--(� �Y�S� �-,� �� �� �-�� �Y>S� �� �� ��� G-� �� �� �:-�� lȶ ���-Զ �� �ȸ ض �� �� � �-�� l--(� �Y�S� �� �Y-,� �SY->� �S� � � fx� f� �-- -*� �� �� �� �Y�S� ��� ��� �-- -*� �� �� �� �Y�S� � �Y-J� �� �� � �-�� l-� �-� �Y-L� �SY-R� �S�� �����~�� !-�� l-- � ��-*� ���W-*� ��#c�'� f-*� �-�� l- � ��*�,��t|���x� f� G-- -*� �� �� �� �Y�S� ��� ��� .� f� =-*� ��#c�'� f-*� �-�� l- � ��*�,��t|����-&� ��2� S-� �Y�S��6-� �Y�S8�6-� �Y:S<�6-�� l- � ��-� ��@W-(� �Y�S�C� �Y-,� �SY->� �S- � ��G-Z� ^-Ŷ l-I� �K-� CY� �YMS� �Y� �YO� �-�� �YJS� �� ��Q�-�� �Y>S� �� ��S��S�V�YW-[� ^�   �   �   ���    ���   ��_   ���   ���   ���   ��_   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   � K�   � Q�   ��� �  Z  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� �� ��������������5�5�C�C�4�4�4�R�R�a�a�R�R�R�R�m�m�m�m�Q�Q�Q�Q�Q�Q�����������Q������������������������������������)�)�7�7�3�3�S�S�S�S�_�_�l�l�}�}�����l�l�l�l�O�O�3�3�����������������������3�������������������������������������������������������#�#�/�/�/�/�-�5��:�:�:�:�C�C�:�:�:�:�8�K�K�X�X�X�X�K�K���r�r���������~���������������������������������������r����������������������� ����.�.�4�4�4�4�4�4�I�I�O�O�O�O�O�O�d�d�*�*�����    �   #     *� 
�   �       ��   �  �  K    -�� �� ��cY
� �YeSY]SYgSYiSYkSY.SYmSYoSYqSY	� �Y�cY� �YsSYhSYuSYwSYySY{S�~SY�cY� �YsSYhSYuSY�SYySYJS�~SY�cY� �YsSYhSYuSY�SYySYLS�~SY�cY� �YsSY.SY�SYTSYuSY�SYySY�S�~SS�~�a�   �      -��   � �   "     .�   �       ��        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcSETDISABLEDCFTAG  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! 	TARGETPOS # SECURITY % 
TARGETTEMP ' WEBAPP ) ARRAYPOS + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G TAG I 
		
		
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 . O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U 
		 Y _setCurrentLineNo (I)V [ \
 . ] ArrayNew (I)Ljava/util/List; _ ` coldfusion/runtime/CFPage b
 c a 1 e   g 0 i 

         k 	component m CFIDE.adminapi.accessmanager o CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; q r
 c s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 .  
		        
		 � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 . � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFTAGS � getSecurableCFTags � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � ArrayToList $(Ljava/util/List;)Ljava/lang/String; � �
 c �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 c � _boolean (J)Z � �
 � � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDTAG � _autoscalarize � �
 . � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � 

	
	
		 � CONTEXTS � _resolve � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 c � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 c  GETTAGPERMISSIONPOSITION getTagPermissionPosition 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 . 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �	
 .
 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 . *- LCase &(Ljava/lang/String;)Ljava/lang/String;
 c concat
 � Left '(Ljava/lang/String;I)Ljava/lang/String;
 c RemoveChars ((Ljava/lang/String;II)Ljava/lang/String; 
 c! _Object (I)Ljava/lang/Object;#$
 �% (Ljava/lang/Object;D)D'
 .( 
ListAppend 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;*+
 c, _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V./
 .0 _LhsResolve2 �
 .3 _arraySetAt5/
 .6 LOGAUDIT8 logaudit: msg< java/lang/StringBuffer>  disabled use of a tag @  �
?B append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;DE
?F  in the sandbox for directory H .J toString ()Ljava/lang/String;LM
 |N )([Ljava/lang/Object;[Ljava/lang/Object;)V P
 CQ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �S
 .T 
	V setDisabledCFTagX metaData Ljava/lang/Object;Z[	 \ void^ false` &coldfusion/runtime/AttributeCollectionb named accessf publich outputj 
returntypel hintn %Disables use of a tag in the sandbox.p 
Parametersr REQUIREDt truev HINTx HSpecifies the sandbox directory for which the specified tag is disabled.z NAME| 	directory~ ([Ljava/lang/Object;)V �
c� Specifies the tag to disable.� tag� getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcSETDISABLEDCFTAG; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw32 !Lcoldfusion/tagext/lang/ThrowTag; throw33 LineNumberTable <clinit> 	getOutput 1       � �   Z[   	 �� �   "     �]�   �       ��   �M �   "     Y�   �       ��   �� �         �   �       ��   �M �   "     _�   �       ��   �� �   -     � �Y>SYJS�   �       ��   �� �  
�    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:*J� D� H:-L� PR� X-Z� P-6� ^-� d� X-Z� Pf� X-Z� P
h� X-Z� Pj� X-Z� Ph� X-l� P-;� ^-np� t� X-Z� P-<� ^--<� ^-vx� tz� |� �� X-�� P->� ^--"� ��� |Y�S� �W-�� P-@� ^-@� ^-@� ^-�� ��-� |� �� �� �-�� �YJS� �� �� ��� ��� O-�� P-� �� �� �:-A� ^��-˶ θ �� Ҷ �� �� �� �-Z� P-� P-F� ^--&� �Y�S� �-*� θ � �-�� �Y>S� �� �� ��� G-� �� �� �:-H� ^�� ���-�� θ ��� Ҷ �� �� �� �-L� ^--&� �Y�S� �� |Y-*� �SY->� �S� ��� X-P� ^-� �-� |Y-*� �SY->� �S� �� X
-- -,� ζ� �� �YS�� X-� ���� 9
� X
-� θ �-W� ^-J� θ ���� X� �-Y� ^-� θ ����� �-[� ^-� θ ��"� X-\� ^-(� θ �-\� ^-J� θ ��� ��&� X-$� ��)�� B-a� ^-(� θ �-a� ^-J� θ ���-� X
-(� θ ��� X-- -,� ζ� �� �YS-� ζ1-&� �Y�S�4� |Y-*� �SY->� �S- � θ7-Z� P-m� ^-9� �;-� CY� �Y=S� |Y�?YA�C-�� �YJS� �� ��GI�G-�� �Y>S� �� ��GK�G�OS�R�UW-W� P�   �   �   ���    ���   ��[   ���   ���   ���   ��[   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   � I�   ���   ��� �  �1  1 �5 �5 �5 �5 �5 �5 �5 �6 �6 �6 �6 �6 �6 �6 �6 �6 �7 �7 �7 �7 �7 �7 �7 �8 �8 �8 �8 �8 �8 �8 �9 �9 �9 �9 �9 �9 �9 �: �: �: �: �: �: �: �; �; �; �; �; �; �; �; �; �; �;<<< < <<<<<<<<<A>A>O>O>@>@>@>@>s@s@s@s@s@s@s@s@s@s@�@�@�@�@s@s@s@s@s@s@�A�A�A�A�As@FFFFFFFFFFFFFFFFFF[H[H[H[H8HF�L�L�L�L�L�L�L�L�L�L�L�L|L�P�P�P�P�P�P�P�P�P�P�P�Q�Q�Q�Q�Q�Q�QTTTTVVVVV W W W W0W0W0W0W0W0W0W0W W W W WWLYLYLYLYUYUYLYLYYYYYm[m[m[m[v[v[w[w[m[m[m[m[d[�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\~\�^�^�^�^�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�a�b�b�b�b�b�b�b�b�b�b�b�^LYLYT�g�ggggg�gkk1k1k:k:kAkAkAkAkkEYmYm|m|m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�m�mxmxmYmYmYmYm    �   #     *� 
�   �       ��   �  �   �     ��� �� ��cY� |YeSYYSYgSYiSYkSYaSYmSY_SYoSY	qSY
sSY� |Y�cY� |YuSYwSYySY{SY}SYS��SY�cY� |YuSYwSYySY�SY}SY�S��SS���]�   �       ���   �M �   "     a�   �       ��        ����  -4 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcDELETEALLOWEDIPADDRESSES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  IPLIST ! IPADDR # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 DEBUGIP 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 & M _setCurrentLineNo (I)V O P
 & Q ArrayNew (I)Ljava/util/List; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [   _ 	
     		 a 	component c CFIDE.adminapi.accessmanager e CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; g h
 W i _get &(Ljava/lang/String;)Ljava/lang/Object; k l
 & m checkRootAdminUser o java/lang/Object q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; s t
 & u java w  coldfusion.server.ServiceFactory y getSecurityService { 
			 } _autoscalarize  l
 & � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
 W � I � 1 � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 & � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 W � POS � getAllowedIPList � ListFind '(Ljava/lang/String;Ljava/lang/String;)I � �
 W � _Object (I)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � setAllowedIPList � _int (Ljava/lang/Object;)I � �
 � � ListDeleteAt '(Ljava/lang/String;I)Ljava/lang/String; � �
 W � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen � �
 W � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 & � LOGAUDIT � logaudit � java/lang/String � msg � java/lang/StringBuffer � d deleted list of one or more client IP addresses that should be allowed to invoke exposed services:  � (Ljava/lang/String;)V  �
 � �  _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � . � toString ()Ljava/lang/String; � �
 r � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 = � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 & � 	
	 � deleteAllowedIPAddresses � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint aRemoves an IP address from client IP addresses that should be allowed to invoke exposed services. 
Parameters REQUIRED Yes	 TYPE HINT List of IP addresses to remove. NAME debugip ([Ljava/lang/Object;)V 
 � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcDELETEALLOWEDIPADDRESSES; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	     "     � �              �    !     �                        �             ! �    !     �             "#    (     
� �Y6S�          
   $%   S    Y+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:-J� N-	Ŷ R-� X� ^-J� N`� ^-b� N
-	Ƕ R-df� j� ^-J� N-	ȶ R--� np� r� vW-J� N-	ɶ R--	ɶ R-xz� j|� r� v� ^-~� N-	˶ R-6� �� �� �� ^-��� �� �-	ζ R-"-�� �� �� �� �� ^-�-	϶ R-	϶ R-- � n�� r� v� �-$� �� �� �� �� �-�� �� �� K-	Ҷ R-- � n�� rY-	Ҷ R-	Ҷ R-- � n�� r� v� �-�� �� �� �S� vW-�-�� �� �c� �� �-�� �-	̶ R-"� �� �� �� ��t|��� -J� N-	ֶ R-Ŷ n�-� =Y� �Y�S� rY� �YϷ �-�� �Y6S� ׸ �� �ݶ ۶ �S� � �W-� N�      �   Y    Y&'   Y( �   Y)*   Y+,   Y-.   Y/ �   Y 1 2   Y 0   Y 0 	  Y 0 
  Y 0   Y !0   Y #0   Y 50 1  J �  	� _	� i	� i	� h	� h	� h	� h	� _	� _	� x	� z	� z	� z	� z	� x	� x	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�C	�C	�B	�B	�B	�B	�U	�U	�U	�U	�B	�B	�B	�B	�1	�g	�g	�{	�{	��	��	��	��	��	��	��	��	��	��	��	��	�z	�z	�z	�g	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	��	�	� �	�	�	�%	�%	�*	�*	�*	�*	�*	�*	�?	�?	�!	�!	�	�	�	�	�       #     *� 
�             2     �     �� �Y� rY�SY�SY�SY�SY�SY�SY SY�SYSY	SY
SY� rY� �Y� rYSY
SYSY8SYSYSYSYS�SS�� �          �   3 �    !     ��                  ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 'cfsecurity2ecfc497454422$funcFORMATPORT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   NEWPORT  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - PORT / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 7 8
  9 PORTTYPE ; 
		 = _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V ? @
   A _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; C D
   E set (Ljava/lang/Object;)V G H coldfusion/runtime/Variable J
 K I range M _compare '(Ljava/lang/Object;Ljava/lang/String;)D O P
   Q _setCurrentLineNo (I)V S T
   U [0-9].[0-9]. W _String &(Ljava/lang/Object;)Ljava/lang/String; Y Z coldfusion/runtime/Cast \
 ] [ REFind :(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Integer; _ ` coldfusion/runtime/CFPage b
 c a _boolean (Ljava/lang/Object;)Z e f
 ] g - i   k all m Replace \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String; o p
 c q Val (Ljava/lang/String;)D s t
 c u _Object (D)Ljava/lang/Object; w x
 ] y higher { (D)Ljava/lang/String; Y }
 ] ~ concat &(Ljava/lang/String;)Ljava/lang/String; � � java/lang/String �
 � � lower � 
	 � 
formatPort � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � java/lang/Object � name � access � private � hint � +Format a port based on the specified range. � 
Parameters � REQUIRED � Yes � HINT � Specifies the port number. � NAME � port � ([Ljava/lang/Object;)V  �
 � � USpecifies the range designation:<ul><li>single</li><li>higher</li><li>lower</li></ul> � portType � getMetadata ()Ljava/lang/Object; this )Lcfsecurity2ecfc497454422$funcFORMATPORT; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � �Y0SY<S�    �        � �    � �  �      y+� � :+� ,� :	+� :
-� $� *:-� .:*0� 6� ::*<� 6� ::->� B
-0� F� L-<� FN� R�� [-ڶ VX-0� F� ^� d� h� 
-0� F� L� .
-߶ V-߶ V-0� F� ^jln� r� v� z� L� �-<� F|� R�� 6
-� V-� V-0� F� ^jln� r� v� j� �� L� a-<� F�� R�� 6
j-� V-� V-0� F� ^jln� r� v� � �� L� 
-� V-0� F� ^� v� z� L-� F�-�� B�    �   �   y � �    y � �   y � �   y � �   y � �   y � �   y � �   y + ,   y  �   y  � 	  y  � 
  y / �   y ; �  �  � |  � T� V� V� V� V� T� _� _� e� e� v� v� x� x� x� x� �� �� v� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
�
�����,�,�,�,�5�5�7�7�9�9�,�,�,�,�,�,�,�,������V�V�V�V�V�V�V�V�M�
�
� �� �� _�h�h�h�h�h� T�     �   #     *� 
�    �        � �    �   �   �     �� �Y� �Y�SY�SY�SY�SY�SY�SY�SY� �Y� �Y� �Y�SY�SY�SY�SY�SY�S� �SY� �Y� �Y�SY�SY�SY�SY�SY�S� �SS� �� ��    �       � � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc *cfsecurity2ecfc497454422$funcISRAMALLFILES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( PATH * getVariable  (I)Lcoldfusion/runtime/Variable; , - %coldfusion/runtime/ArgumentCollection /
 0 . _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; 2 3
  4 
			 6 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 8 9
  : _setCurrentLineNo (I)V < =
  > _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; @ A
  B _String &(Ljava/lang/Object;)Ljava/lang/String; D E coldfusion/runtime/Cast G
 H F Trim &(Ljava/lang/String;)Ljava/lang/String; J K coldfusion/runtime/CFPage M
 N L set (Ljava/lang/Object;)V P Q coldfusion/runtime/Variable S
 T R ram:///- V _compare '(Ljava/lang/Object;Ljava/lang/String;)D X Y
  Z _Object (Z)Ljava/lang/Object; \ ]
 H ^ _boolean (Ljava/lang/Object;)Z ` a
 H b ram://- d true f false h 	
	 j java/lang/String l isRAMAllFiles n metaData Ljava/lang/Object; p q	  r boolean t &coldfusion/runtime/AttributeCollection v java/lang/Object x name z access | private ~ output � 
returntype � hint � -Checks if the argument is ram:///- or ram://- � 
Parameters � REQUIRED � HINT � "specifies the path to the ram file � NAME � path � ([Ljava/lang/Object;)V  �
 w � getMetadata ()Ljava/lang/Object; this ,Lcfsecurity2ecfc497454422$funcISRAMALLFILES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       p q   	  � �  �   "     � s�    �        � �    � �  �   !     o�    �        � �    � �  �         �    �        � �    � �  �   !     u�    �        � �    � �  �   (     
� mY+S�    �       
 � �    � �  �  �     �+� � :+� ,� :	-� � %:-� ):*+� 1� 5:
-7� ;
-ڶ ?-+� C� I� O� U-+� CW� [�~�� _Y� c� W-+� Ce� [�~�� _� c� 	g�� i�-k� ;�    �   p    � � �     � � �    � � q    � � �    � � �    � � �    � � q    � & '    �  �    �  � 	   � * � 
 �   � (  � E� E� E� E� E� E� E� E� <� T� T� Z� Z� T� T� T� T� p� p� v� v� p� p� p� p� T� T� �� �� �� �� �� �� �� �� �� �� T� <�     �   #     *� 
�    �        � �    �   �   �     �� wY� yY{SYoSY}SYSY�SYiSY�SYuSY�SY	�SY
�SY� yY� wY� yY�SYgSY�SY�SY�SY�S� �SS� �� s�    �       � � �    � �  �   !     i�    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcGETTAGPERMISSIONPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   PERMISSIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  APOS ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 WEBAPP 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ; <
  = 	DIRECTORY ? 
		 A _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V C D
 $ E _setCurrentLineNo (I)V G H
 $ I ArrayNew (I)Ljava/util/List; K L coldfusion/runtime/CFPage N
 O M set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S 0 W java Y  coldfusion.server.ServiceFactory [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 O _ getSecurityService a java/lang/Object c _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; e f
 $ g 

		 i java/lang/String k CONTEXTS m _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; o p
 $ q _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; s t
 $ u _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; w x
 $ y 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; { |
 O } I  1 � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 $ � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; w �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � &coldfusion.tagext.GenericTagPermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _double (Ljava/lang/Object;)D � �
 � � _Object (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 O � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � 
	 � getTagPermissionPosition � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � private � output � hint � +Returns the index in the permissions array. � 
Parameters � REQUIRED � true � HINT � DSpecifies the name of the web application using the secured sandbox. � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � @Specifies the sandbox directory for which the index is returned. � 	directory � getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcGETTAGPERMISSIONPOSITION; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   -     � lY4SY@S�    �        � �    � �  �  �    y+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*4� :� >:*@� :� >:-B� F
-�� J-� P� V-B� FX� V-B� F-�� J--�� J-Z\� `b� d� h� V-j� F
-	� J-- � lYnS� r� dY-4� vSY-@� vS� z� ~� V-��� �� H---�� v� �� �� lY�S� ��� ��� -�� v� V-�-�� v� �c� �� �-�� v-	� J-� v� �� �� ��t|����-"� v�-�� F�    �   �   y � �    y � �   y � �   y � �   y � �   y � �   y � �   y / 0   y  �   y  � 	  y  � 
  y  �   y ! �   y 3 �   y ? �  �  Z V  � d� n� n� m� m� m� m� d� d� }� � � � � }� }� �� �� �� �� �� �� �� �� �� �� �� �� �� �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 	 	 �	 �			$	
$	
$	
$	
"	
 �	0	0	0	0	9	9	0	0	0	0	-	A	A	N	N	N	N	A	A	 �	h	h	h	h	h	 �	      �   #     *� 
�    �        � �    �   �   �     �� �Y
� dY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� dY� �Y� dY�SY�SY�SY�SY�SY�S� �SY� �Y� dY�SY�SY�SY�SY�SY�S� �SS� ֳ ��    �       � � �    � �  �   !     ��    �        � �        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 9cfsecurity2ecfc497454422$funcSETALLOWCONCURRENTADMINLOGIN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / ADMINCONCLOGIN 1 boolean 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setAllowConcurrentAdminLogin s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z LOGAUDIT | logaudit ~ msg � java/lang/StringBuffer � * set concurrent login sessions allowed to  � (Ljava/lang/String;)V  �
 � � _autoscalarize � n
 " � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � . � toString ()Ljava/lang/String; � �
 h � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � metaData Ljava/lang/Object; � �	  � void � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � USpecifies whether concurrent login sessions are allowed for ColdFusion Administrator. � 
Parameters � REQUIRED � Yes � TYPE � HINT � True or False � NAME � adminconclogin � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this ;Lcfsecurity2ecfc497454422$funcSETALLOWCONCURRENTADMINLOGIN; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �   	  � �  �   "     � ��    �        � �    � �  �   !     t�    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  �    .+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
-.� N-PR� X� ^-`� J-/� N--/� N-bd� Xf� h� l� ^-`� J-1� N--� pr� h� lW-2� N-- � pt� hY-u� wY2S� {S� lW-`� J-5� N-}� p-� 9Y� wY�S� hY� �Y�� �-2� �� �� ��� �� �S� �� �W-�� J�    �   �   . � �    . � �   . � �   . � �   . � �   . � �   . � �   . - .   .  �   .  � 	  .  � 
  .  �   . 1 �  �   � 8   , O . X . X . Z . Z . W . W . W . W . O . O . j / z / z / | / | / y / y / r / r / r / r / j / j / � 1 � 1 � 1 � 1 � 1 � 2 � 2 � 2 � 2 � 2 � 2 � 2 � 0 � 5 � 5 5 5 5 5 5 5 5 5 5 5 � 5 � 5 � 5 � 5 � 5 � 5     �   #     *� 
�    �        � �    �   �   �     �� �Y� hY�SYtSY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� ϳ ��    �       � � �    � �  �   !     ��    �        � �        ����  -y 
SourceFile /CFIDE/adminapi/security.cfc 5cfsecurity2ecfc497454422$funcSETDEFAULTFILEPERMISSION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  NEWDIR ! ACCESSMANAGER # SECURITY % I ' WILDCARDFOUND ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y ArrayNew (I)Ljava/util/List; [ \ coldfusion/runtime/CFPage ^
 _ ] false a 	StructNew !()Lcoldfusion/util/FastHashtable; c d
 _ e _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; g h
 . i 1 k 

         m 	component o CFIDE.adminapi.accessmanager q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; s t
 _ u java w  coldfusion.server.ServiceFactory y getSecurityService { java/lang/Object } _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;  �
 . � _get � h
 . � checkAdminRoles � coldfusion.sandboxsecurity � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 _ � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � Trim &(Ljava/lang/String;)Ljava/lang/String; � �
 _ � Right '(Ljava/lang/String;I)Ljava/lang/String; � �
 _ � \ � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � FILESEP � java.lang.System � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � getProperty � file.separator � concat � �
 � � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � CLASS � _resolveAndAutoscalarize 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � java.io.FilePermission � TARGET � <<ALL FILES>> � _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 . � true � :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 . � - � ACTION � read,write,execute,delete � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 _ � _double (Ljava/lang/Object;)D � �
 � � (D)Ljava/lang/Object; � �
 � � ArrayLen (Ljava/lang/Object;)I � �
 _ � (I)Ljava/lang/Object; � �
 � � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 . � DIRECTORYPERMISSIONEXISTS  '(Ljava/lang/String;I)Ljava/lang/Object; g
 . LICENSE getAppServerPlatform APPSERVER_SUNONE	 � �
 . ROOT_WEBINF_DIR GetPageContext %()Lcoldfusion/runtime/NeoPageContext;
 _ getServletContext getRealPath WEB-INF java/lang/StringBuffer (Ljava/lang/String;)V 
 FS append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; !
" classes$ toString ()Ljava/lang/String;&'
 ~( read* lib, _LhsResolve. �
 ./ _arraySetAt1 �
 .2 
	4 setDefaultFilePermission6 metaData Ljava/lang/Object;89	 : void< &coldfusion/runtime/AttributeCollection> name@ accessB privateD outputF 
returntypeH hintJ IRemoves the wildcard and sets the permission for only the defined folder.L 
ParametersN REQUIREDP HINTR .Specifies the directory to receive permission.T NAMEV 	directoryX ([Ljava/lang/Object;)V Z
?[ getMetadata ()Ljava/lang/Object; this 7Lcfsecurity2ecfc497454422$funcSETDEFAULTFILEPERMISSION; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1      89   	 ]^ b   "     �;�   a       _`   c' b   "     7�   a       _`   de b         �   a       _`   f' b   "     =�   a       _`   gh b   (     
� �Y>S�   a       
_`   ij b  � 	   �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V-J� N-Z� Z-� `� V-J� Nb� V-J� N
-\� Z� f� V-J� N->� j� V-J� Nl� V-n� N-_� Z-pr� v� V-J� N-`� Z--`� Z-xz� v|� ~� �� V-J� N-a� Z--$� ��� ~Y�S� �W-J� N-d� Z--&� �Y�S� �� ~Y-,� jSY->� jS� �� �� V-h� Z-h� Z->� j� �� �� ��� ��~�� �Y� �� 0W-h� Z-h� Z->� j� �� �� �P� ��~�� �� �� -j� Z->� j� �� �� V� R-�-m� Z-x�� v� �-o� Z->� j� �� �-o� Z--�� ��� ~Y�S� �� �� Ķ Vl� V� �-- -(� j� Ǹ �� �Y�S� �Ӹ ��� �-- -(� j� Ǹ �� �Y�S� �׸ ��� �-- -(� j� Ǹ �� �Y�S-"� j� �ݶ V
-|� Z� f� V-� �Y�SӶ �-� �Y�S-"� j� �� Ķ �-� �Y�S� �-�� Z- � j� �-� j� �W-(� j� �c� �� V-(� j-s� Z- � j� �� �� ��t|����-b� �l� V� p-- -(� j� Ǹ �� �Y�S� �Ӹ ��� =-- -(� j� Ǹ �� �Y�S� �-"� j� ��~�� -ݶ �� 7-( �� �X-(� j-�� Z- � j� �� �� ��t|���o-*� j� ��� �Y� �� W-� j� ��� �� �� �
-�� Z� f� V-� �Y�SӶ �-� �Y�S-"� j� �-� �Y�S� �-�� Z- � j� �-� j� �W
-�� Z� f� V-� �Y�SӶ �-� �Y�S-"� j� �� Ķ �-� �Y�S� �-�� Z- � j� �-� j� �W-�� Z--� �� ~� �-� �Y
S�� ��~��k--�� Z--�� Z--�� Z-�� ~� �� ~YS� �� �
-�� Z� f� V-� �Y�SӶ �-� �Y�S�Y-� j� ��-� j� ��#%�#�)� �-� �Y�S+� �-�� Z- � j� �-� j� �W
-�� Z� f� V-� �Y�SӶ �-� �Y�S�Y-� j� ��-� j� ��#%�#-� j� ��#�#�)� �-� �Y�S+� �-�� Z- � j� �-� j� �W
-�� Z� f� V-� �Y�SӶ �-� �Y�S�Y-� j� ��-� j� ��#-�#�)� �-� �Y�S+� �-�� Z- � j� �-� j� �W
-�� Z� f� V-� �Y�SӶ �-� �Y�S�Y-� j� ��-� j� ��#-�#-� j� ��#�#�)� �-� �Y�S+� �-ö Z- � j� �-� j� �W-&� �Y�S�0� ~Y-,� jSY->� jS- � j�3-5� N�   a   �   �_`    �kl   �m9   �no   �pq   �rs   �t9   � 9 :   � u   � u 	  � u 
  � u   � !u   � #u   � %u   � 'u   � )u   � +u   � =u v  	&I  W |Y ~Y ~Y ~Y ~Y |Y |Y �Z �Z �Z �Z �Z �Z �Z �Z �Z �[ �[ �[ �[ �[ �[ �[ �\ �\ �\ �\ �\ �\ �\ �] �] �] �] �] �] �] �^ �^ �^ �^ �^ �^ �^ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_ �_`````````````=a=aKaKa<a<a<a<addddydyd�d�dcdcdcdcdcdcdZd�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�h�hjjjjjjjj�jmm m mmmmmm1o1o1o1o1o1o1o1oEoEoSoSoDoDoDoDo1o1o1o1o(o�hdsdsdsdsbspupululu�u�u�w�w�w�w�w�w�y�y�y�y�y�y�y�z�z�z�z�z�|�|�|�|�|�}�}�}�}�}*�*�*�*��6�6�6�6�?�?�6�6�6��wluKsKsKsKsTsTsKsKsKsKsIs\s\sisisisis\s\sbs����������������������������������������������������������������������������������������*�*�*�*�*�*�*�*�@�@�@�@�@�@�@�@�*�*�^�^�^�^�U�p�p�p�p�d���������u���������������������������������������������������������������������������������
�
�
�
���
�
�
�*�%�%�$�$�6�6�$�$�n�n�f�f�����^�^�^�^�S����������������������������������������������������������������������������������,�,�,�,� �A�A�A�A�N�N�N�N�[�[�a�a�a�a�n�n�=�=�=�=�1���������y������������������������������������������������������������������������������������0�0�0�0�'�B�B�B�B�6�W�W�W�W�d�d�d�d�q�q�w�w�w�w�����S�S�S�S�G�����������������������������$�����������������������Zb    b   #     *� 
�   a       _`   w  b   �     ��?Y� ~YASY7SYCSYESYGSYbSYISY=SYKSY	MSY
OSY� ~Y�?Y� ~YQSY�SYSSYUSYWSYYS�\SS�\�;�   a       �_`   x' b   !     b�   a       _`        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 0cfsecurity2ecfc497454422$funcDELETEDISABLEDCFTAG  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACCESSMANAGER ! AENABLEDCFFUNCTIONS # 	TARGETPOS % SECURITY ' 
TARGETTEMP ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I TAG K 
		
		
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 0 Q / S set (Ljava/lang/Object;)V U V coldfusion/runtime/Variable X
 Y W 
		 [ _setCurrentLineNo (I)V ] ^
 0 _ ArrayNew (I)Ljava/util/List; a b coldfusion/runtime/CFPage d
 e c GETDISABLEDCFTAGS g _get &(Ljava/lang/String;)Ljava/lang/Object; i j
 0 k getDisabledCFTags m java/lang/Object o _autoscalarize q j
 0 r 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; t u
 0 v _List $(Ljava/lang/Object;)Ljava/util/List; x y coldfusion/runtime/Cast {
 | z ArrayToList $(Ljava/util/List;)Ljava/lang/String; ~ 
 e � 1 �   � 

         � 	component � CFIDE.adminapi.accessmanager � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 e � java �  coldfusion.server.ServiceFactory � getSecurityService � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � checkAdminRoles � coldfusion.sandboxsecurity � 
		
		 � GETSECURABLECFTAGS � getSecurableCFTags �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 | � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I � �
 e � _boolean (J)Z � �
 | � 
			 � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � cfthrow � message � SECURITY_INVALIDTAG � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage (Ljava/lang/String;)V � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � CONTEXTS � _resolve � �
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 | � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 e � throw � setCalledName � �
 � � SANDBOX_NOT_FOUND � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 e  GETTAGPERMISSIONPOSITION getTagPermissionPosition 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 0 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; �	
 0
 * _compare '(Ljava/lang/Object;Ljava/lang/String;)D
 0 Left '(Ljava/lang/String;I)Ljava/lang/String;
 e *- RemoveChars ((Ljava/lang/String;II)Ljava/lang/String;
 e _Object (I)Ljava/lang/Object;
 | _int (Ljava/lang/Object;)I !
 |" ListDeleteAt$
 e% ListLen (Ljava/lang/String;)I'(
 e) (Ljava/lang/Object;D)D+
 0, concat &(Ljava/lang/String;)Ljava/lang/String;./
 �0 _structSetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V23
 04 _LhsResolve6 �
 07 _arraySetAt93
 0: LOGAUDIT< logaudit> msg@ java/lang/StringBufferB  removed tag D  �
CF append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;HI
CJ = from the list of disabled tags in the sandbox for directory L .N toString ()Ljava/lang/String;PQ
 pR )([Ljava/lang/Object;[Ljava/lang/Object;)V T
 EU b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; tW
 0X 
	Z deleteDisabledCFTag\ metaData Ljava/lang/Object;^_	 ` voidb falsed &coldfusion/runtime/AttributeCollectionf nameh accessj publicl outputn 
returntypep hintr <Removes a tag from the list of disabled tags in the sandbox.t 
Parametersv REQUIREDx truez HINT| =Specifies the sandbox directory for which the tag is enabled.~ NAME� 	directory� ([Ljava/lang/Object;)V �
g� ,Specifies the name of the tag to be enabled.� tag� getMetadata ()Ljava/lang/Object; this 2Lcfsecurity2ecfc497454422$funcDELETEDISABLEDCFTAG; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw34 !Lcoldfusion/tagext/lang/ThrowTag; throw35 LineNumberTable <clinit> 	getOutput 1       � �   ^_   	 �� �   "     �a�   �       ��   �Q �   "     ]�   �       ��   �� �         �   �       ��   �Q �   "     c�   �       ��   �� �   -     � �Y@SYLS�   �       ��   �� �  
�    +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:*L� F� J:-N� RT� Z-\� R-� `-� f� Z-\� R-�� `-�� `-h� ln-� pY-@� sS� w� }� �� Z-\� R�� Z-\� R
�� Z-\� R�� Z-\� R�� Z-�� R-�� `-��� �� Z-\� R-�� `--�� `-��� ��� p� �� Z-\� R-�� `--"� l�� pY�S� �W-�� R-�� `-�� `-�� `-�� l�-� p� w� }� �-�� �YLS� �� �� ��� ��� O-�� R-� �� �� �:-�� `��-ж s� �� Զ �� �� � �-\� R-\� R-�� `--(� �Y�S� �-,� s� � �-�� �Y@S� �� �� ��� G-� �� �� �:-�� `�� ���-�� s� ��� Զ �� �� � �-�� `--(� �Y�S� �� pY-,� sSY-@� sS� ��� Z-�� `-� l-� pY-,� sSY-@� sS� w� Z
-- -.� s�� �� �YS�� Z-� s��� � �-�� `-� s� ����� �-�� `-� s� ��� Z-�� `-*� s� �-L� s� �� ��� Z-�� `-*� s� �-&� s�#�&� Z-�� `-*� s� ��*��-�� 
� Z� %
� Z
-� s� �-*� s� ��1� Z� 
� Z-- -.� s�� �� �YS-� s�5-(� �Y�S�8� pY-,� sSY-@� sS- � s�;-\� R-�� `-=� l?-� EY� �YAS� pY�CYE�G-�� �YLS� �� ��KM�K-�� �Y@S� �� ��KO�K�SS�V�YW-[� R�   �   �   ��    ��   �_   ��   ��   ��   �_    ; <    �    � 	   � 
   �    !�    #�    %�    '�    )�    +�    -�    ?�    K�   ��   �� �  �7  z �~ �~ �~ �~ �~ �~ �~ � � � � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ����������������#�%�%�%�%�#�#�2�<�<�>�>�;�;�;�;�2�2�N�`�`�b�b�_�_�W�W�W�W�N�N�����������������������������������������������������������������E�E�T�T�E�E�E�E�`�`�`�`�D�D�D�D�D�D���������z�D���������������������������������������������,�,�(�(�(�(�&�G�G�M�M�b�b�b�b�k�k�b�b�o�o�������������������������z���������������������������������������������������������������������������������������������������*�*�*�*�(�b�b�G�4�4�I�I�I�I�0�R�R�g�g�p�p�w�w�w�w�R�D�����������������������������������������������������    �   #     *� 
�   �       ��   �  �   �     ��� ³ ĻgY� pYiSY]SYkSYmSYoSYeSYqSYcSYsSY	uSY
wSY� pY�gY� pYySY{SY}SYSY�SY�S��SY�gY� pYySY{SY}SY�SY�SY�S��SS���a�   �       ���   �Q �   "     e�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc -cfsecurity2ecfc497454422$funcGETALLOWEDIPLIST  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
	         1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G 
		 K _get &(Ljava/lang/String;)Ljava/lang/Object; M N
 " O checkRootAdminUser Q java/lang/Object S _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; U V
 " W java Y  coldfusion.server.ServiceFactory [ getSecurityService ] getAllowedIPList _ 
	 a java/lang/String c metaData Ljava/lang/Object; e f	  g false i &coldfusion/runtime/AttributeCollection k name m access o public q output s hint u XReturns a list of client IP addresses that should be allowed to invoke exposed services. w 
Parameters y ([Ljava/lang/Object;)V  {
 l | getMetadata ()Ljava/lang/Object; this /Lcfsecurity2ecfc497454422$funcGETALLOWEDIPLIST; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       e f     ~   �   "     � h�    �        � �    � �  �   !     `�    �        � �    � �  �         �    �        � �    � �  �   #     � d�    �        � �    � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-	�� :-<>� D� J-L� 6-	�� :--� PR� T� XW-L� 6-	�� :--	�� :-Z\� D^� T� X� J-L� 6-	�� :-- � P`� T� X�-b� 6�    �   z    � � �     � � �    � � f    � � �    � � �    � � �    � � f    � - .    �  �    �  � 	   �  � 
   �  �  �   � &  	� <	� F	� F	� H	� H	� E	� E	� E	� E	� <	� <	� `	� `	� _	� _	� _	� _	� x	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� x	� x	� �	� �	� �	� �	� �	� �	� �	�     �   #     *� 
�    �        � �    �   �   f     H� lY
� TYnSY`SYpSYrSYtSYjSYvSYxSYzSY	� TS� }� h�    �       H � �    � �  �   !     j�    �        � �        ����  - y 
SourceFile /CFIDE/adminapi/security.cfc .cfsecurity2ecfc497454422$funcGETCFIDEDIRECTORY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   ! javax/servlet/jsp/JspContext #
 $ " parent Ljavax/servlet/jsp/tagext/Tag; & '	  ( 
		 * _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V , -
  . _setCurrentLineNo (I)V 0 1
  2 /CFIDE/ 4 
ExpandPath &(Ljava/lang/String;)Ljava/lang/String; 6 7 coldfusion/runtime/CFPage 9
 : 8 
	 < java/lang/String > getCFIDEDirectory @ metaData Ljava/lang/Object; B C	  D false F &coldfusion/runtime/AttributeCollection H java/lang/Object J name L access N private P output R hint T Returns full path for CFIDE V 
Parameters X ([Ljava/lang/Object;)V  Z
 I [ getMetadata ()Ljava/lang/Object; this 0Lcfsecurity2ecfc497454422$funcGETCFIDEDIRECTORY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       B C     ] ^  b   "     � E�    a        _ `    c d  b   !     A�    a        _ `    e f  b         �    a        _ `    g h  b   #     � ?�    a        _ `    i j  b   �  
   D+� � :+� ,� :	-� � %:-� ):-+� /-�� 3-5� ;�-=� /�    a   f 
   D _ `     D k l    D m C    D n o    D p q    D r s    D t C    D & '    D  u    D  u 	 v   & 	  � 4� 4� 3� 3� 3� 3� 3� 3�     b   #     *� 
�    a        _ `    w   b   f     H� IY
� KYMSYASYOSYQSYSSYGSYUSYWSYYSY	� KS� \� E�    a       H _ `    x d  b   !     G�    a        _ `        ����  -� 
SourceFile /CFIDE/adminapi/security.cfc 2cfsecurity2ecfc497454422$funcDELETESECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   THISAPP  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   AC  ACCESSMANAGER ! SECURITY # THISAPPCONTEXT % THISPATLIST ' THISDIR ) WEBAPP + coldfusion/runtime/CfJspPage - pageContext #Lcoldfusion/runtime/NeoPageContext; / 0	 . 1 getOut ()Ljavax/servlet/jsp/JspWriter; 3 4 javax/servlet/jsp/JspContext 6
 7 5 parent Ljavax/servlet/jsp/tagext/Tag; 9 :	 . ; 	DIRECTORY = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G 
	
		 I _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V K L
 . M / O set (Ljava/lang/Object;)V Q R coldfusion/runtime/Variable T
 U S _setCurrentLineNo (I)V W X
 . Y _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; [ \
 . ] _String &(Ljava/lang/Object;)Ljava/lang/String; _ ` coldfusion/runtime/Cast b
 c a Trim &(Ljava/lang/String;)Ljava/lang/String; e f coldfusion/runtime/CFPage h
 i g   k 	component m CFIDE.adminapi.accessmanager o CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; q r
 i s java u  coldfusion.server.ServiceFactory w getSecurityService y java/lang/Object { _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 .  _get � \
 . � checkAdminRoles � coldfusion.sandboxsecurity �  java/lang/String � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 . � /* � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 . � _Object (Z)Ljava/lang/Object; � �
 c � _boolean (Ljava/lang/Object;)Z � �
 c � GETCFIDEDIRECTORY � getCFIDEDirectory � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 . � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 . � GETWEBINFDIRECTORY � getWebInfDirectory � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 . � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � CANNOT_DELETE_SYSTEM_SANDBOXES � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 . � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 . � CONTEXTS � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 c � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 i � _resolve � �
 . � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 . � IsStruct � �
 i � RESULT � StructDelete %(Ljava/util/Map;Ljava/lang/String;Z)Z � �
 i � _set '(Ljava/lang/String;Ljava/lang/Object;)V � �
 . � SANDBOX_NOT_FOUND � security.constraints � 	IsDefined (Ljava/lang/String;)Z � �
 i � CONSTRAINTS THISAPPCONST StructKeyArray +(Ljava/util/Map;)Lcoldfusion/runtime/Array;
 i I	 1 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 . url-pattern-list 9(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; �
 . D _int (Ljava/lang/Object;)I
 c , 	ListGetAt 9(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
 i ListDeleteAt!
 i" _arraySetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V$%
 .& _double (Ljava/lang/Object;)D()
 c* (D)Ljava/lang/Object; �,
 c- ListLen (Ljava/lang/String;)I/0
 i1 (I)Ljava/lang/Object; �3
 c4 Len6
 i7 (Ljava/lang/Object;D)D �9
 .: � �
 i< ArrayLen>
 i? 
		A LOGAUDITC logauditE msgG java/lang/StringBufferI 9 removed security sandbox restrictions for the directory K  �
JM append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;OP
JQ .S toString ()Ljava/lang/String;UV
 |W )([Ljava/lang/Object;[Ljava/lang/Object;)V Y
 CZ b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �\
 .] 
	_ deleteSecuritySandboxa metaData Ljava/lang/Object;cd	 e voidg truei &coldfusion/runtime/AttributeCollectionk namem accesso publicq outputs 
returntypeu hintw 6Removes security sandbox restrictions for a directory.y 
Parameters{ REQUIRED} HINT >Specifies the directory of the security sandbox to be removed.� NAME� 	directory� ([Ljava/lang/Object;)V �
l� getMetadata ()Ljava/lang/Object; this 4Lcfsecurity2ecfc497454422$funcDELETESECURITYSANDBOX; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw28 !Lcoldfusion/tagext/lang/ThrowTag; throw29 LineNumberTable <clinit> 	getOutput 1       � �   cd   	 �� �   "     �f�   �       ��   �V �   "     b�   �       ��   �� �         �   �       ��   �V �   "     h�   �       ��   �� �   (     
� �Y>S�   �       
��   �� �  �    �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :-� 2� 8:-� <:*>� D� H:-J� NP� V
-'� Z-,� ^� d� j� V-(� Z->� ^� d� j� Vl� Vl� Vl� V-,� Z-np� t� V--� Z---� Z-vx� tz� |� �� V-/� Z--"� ��� |Y�S� �W-�� �Y>S� ��� ��~�� �Y� �� 6W-�� �Y>S� �-2� Z-�� ��-� |� �� ��~�� �Y� �� 6W-�� �Y>S� �-3� Z-�� ��-� |� �� ��~�� �� �� G-� �� �� �:-5� Z�� ���-˶ ^� d�� ϶ �� �� ڙ �-;� Z--$� �Y�S� �� �-� ^� d� � �-=� Z-$� �Y�S� �-� ^� � � �-$� �Y�S� �-� ^� � V-�-@� Z--&� ^� �-*� ^� d� �� �� �-� ^� ��� G-� �� �� �:-D� Z�� ���-�� ^� d�� ϶ �� �� ڙ �-J� Z-�� �w-L� Z-$� �YS� �� �Z-N� Z--$� �YS� �� �-� ^� d� �0--$� �YS� �-� ^� � �-Q� Z--� ^� �� V-
� ���-U� Z-- -
� ^��� ��-W� Z--- -
� ^��� �� �b-� |Y- -
� ^�SYS�� V-� �� �-]� Z-(� ^� d-� ^�� -*� ^� ��~�� R-_� Z-(� ^� d-� ^��#� V-� |Y- -
� ^�SYS-(� ^�'� _--� ^�+c�.� �-� ^-[� Z-� |Y- -
� ^�SYS�� d�2�5� ��t|���--f� Z-f� Z-(� ^� d� j�8�5�;�� )-h� Z--� ^� �- -
� ^�� d�=W-
-
� ^�+c�.� �-
� ^-S� Z- � ^�@�5� ��t|���$-B� N-q� Z-D� �F-� CY� �YHS� |Y�JYL�N-�� �Y>S� �� d�RT�R�XS�[�^W-`� N�   �   �   ���    ���   ��d   ���   ���   ���   ��d   � 9 :   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � =�   ���   ��� �  �w  " |& ~& ~& ~& ~& |& �' �' �' �' �' �' �' �' �' �' �( �( �( �( �( �( �( �( �( �( �) �) �) �) �) �) �* �* �* �* �* �* �+ �+ �+ �+ �+ �+ �, �, �, �, �, �, �, �, �, �, �- �- �- �- �- �- �- �- �- �- �- �-	/	//////11-1-11111C2C2Y2Y2Y2Y2C2C2C2C22222}3}3�3�3�3�3}3}3}3}333�5�5�51;;;;;;;; ; ;)=)=8=8=)=)=)=)=I?I?X?X?I?I?I?I?G?o@o@o@o@x@x@x@x@�@�@n@n@n@n@d@�B�B�B�B�B�B�D�D�D�D�D�B)= ;�J�J�J�J�L�L�L�LNNNN%N%N%N%NNN8P8PHPHP8P8P8P8P4P^Q^Q^Q^Q]Q]Q]Q]QTQrSrSrSrSnS�U�U�U�U�U�U�W�W�W�W�W�W�W�W�W�W�Y�Y�Y�Y�Y�Y�Y�Y�Y�[�[�[�[�[�]�]�]�]]]]]]]�]�]]]�]�]2_2_2_2_;_;_;_;_E_E_2_2_2_2_)_[`[`h`h`l`l`l`l`N`ua�]|[|[|[|[�[�[|[|[|[|[x[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�f�f�f�f�f�f�f�f�f�fhhhhhhhhhhhhh�f�W�U'S'S'S'S1S1S'S'S'S'S#S9S9SGSGSGSGS9S9SnSN�L�J |%qqqq�q�q�q�q�q�q�q�q�q�q�q�qqqqqqqqq    �   #     *� 
�   �       ��   �  �   �     ��� �� ��lY� |YnSYbSYpSYrSYtSYjSYvSYhSYxSY	zSY
|SY� |Y�lY� |Y~SYjSY�SY�SY�SY�S��SS���f�   �       ���   �V �   "     j�   �       ��        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc +cfsecurity2ecfc497454422$funcSETRDSPASSWORD  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / PASSWORD 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C 

         E _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V G H
 " I _setCurrentLineNo (I)V K L
 " M 	component O CFIDE.adminapi.accessmanager Q CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; S T coldfusion/runtime/CFPage V
 W U set (Ljava/lang/Object;)V Y Z coldfusion/runtime/Variable \
 ] [ 
		 _ java a  coldfusion.server.ServiceFactory c getSecurityService e java/lang/Object g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 " k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 " o checkRootAdminUser q setRdsPassword s  java/lang/String v _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; x y
 " z LOGAUDIT | logaudit ~ msg �  changed RDS password. � )([Ljava/lang/Object;[Ljava/lang/Object;)V  �
 9 � 
_invokeUDF b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; � �
 " � 
	 � setRDSPassword � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � Sets the RDS password. � 
Parameters � REQUIRED � Yes � TYPE � HINT � RDS password. � NAME � password � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this -Lcfsecurity2ecfc497454422$funcSETRDSPASSWORD; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   (     
� wY2S�    �       
 � �    � �  �  o    +� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:-F� J
- �� N-PR� X� ^-`� J- �� N-- �� N-bd� Xf� h� l� ^-`� J- �� N--� pr� h� lW- �� N-- � pt� hY-u� wY2S� {S� lW-`� J- �� N-}� p-� 9Y� wY�S� hY�S� �� �W-�� J�    �   �    � �     � �    � �    � �    � �    � �    � �    - .     �     � 	    � 
    �    1 �  �   � .   � O � Y � Y � [ � [ � X � X � X � X � O � O � k � } � } �  �  � | � | � t � t � t � t � k � k � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �     �   #     *� 
�    �        � �    �   �   �     �� �Y
� hY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� hY� �Y� hY�SY�SY�SY4SY�SY�SY�SY�S� �SS� �� ��    �       � � �    � �  �   !     ��    �        � �        ����  - 
SourceFile /CFIDE/adminapi/security.cfc 4cfsecurity2ecfc497454422$funcGETSECURABLECFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
AFUNCTIONS  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   ACCESSMANAGER  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C 

         G 	component I CFIDE.adminapi.accessmanager K CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; M N
 ? O 
		 Q _get &(Ljava/lang/String;)Ljava/lang/Object; S T
 " U checkAdminRoles W java/lang/Object Y coldfusion.sandboxsecurity [ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ] ^
 " _ _autoscalarize a T
 " b _List $(Ljava/lang/Object;)Ljava/util/List; d e coldfusion/runtime/Cast g
 h f M ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z k l
 ? m CreateObject(COM) o CreateObject(CORBA) q CreateObject(Java) s CreateObject(.NET) u CreateObject(WebService) w DirectoryExists y 
ExpandPath { FileOpen } 
FileExists  FileCopy � FileMove � 
FileDelete � FileRead � 
FileUpload � FileUploadAll � 	FileWrite � FileSetAttribute � FileSetAccessmode � FileSetLastModified � GetFileInfo � DirectoryCreate � DirectoryCopy � DirectoryList � DirectoryDelete � DirectoryRename � GetDirectoryFromPath � GetFileFromPath � GetGatewayHelper � GetPrinterInfo � GetProfileString � GetTempDirectory � GetTempFile � GetTemplatePath � GetBaseTemplatePath � LoadCFObject � SaveCFObject � SendGatewayMessage � SetProfileString � CreateDynamicProxy � CacheGetAllIds � CacheGetSession � CacheRemoveAll � CacheRegionNew � CacheRegionRemove � CacheSetProperties � RemoveCachedQuery � GetCpuUsage � GetSystemFreeMemory � GetSystemTotalMemory � GetTotalSpace � GetFreeSpace � GetPageContext � 
textnocase � asc � 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z � �
 ? �  
	 � java/lang/String � getSecurableCFFunctions � metaData Ljava/lang/Object; � �	  � false � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � (Returns an array of securable functions. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 6Lcfsecurity2ecfc497454422$funcGETSECURABLECFFUNCTIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       � �     � �    "     � �                  !     �                        �              	    #     � �              
       M+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-�� :-� @� F-H� 6-�� :-JL� P� F-R� 6-�� :-- � VX� ZY\S� `W-R� 6-�� :-� c� ij� nW-�� :-� c� ip� nW-�� :-� c� ir� nW- � :-� c� it� nW-� :-� c� iv� nW-� :-� c� ix� nW-� :-� c� iz� nW-� :-� c� i|� nW-� :-� c� i~� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-	� :-� c� i�� nW-
� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW-� :-� c� i�� nW- � :-� c� i�� nW-!� :-� c� i�� nW-"� :-� c� i�� nW-#� :-� c� i�� nW-%� :-� c� i�� nW-(� :-� c� i�� nW-)� :-� c� i�� nW-*� :-� c� i¸ nW-+� :-� c� iĸ nW-,� :-� c� iƸ nW--� :-� c� iȸ nW-.� :-� c� iʸ nW-7� :-� c� i̸ nW-8� :-� c� iθ nW-9� :-� c� iи nW-:� :-� c� iҸ nW-;� :-� c� iԸ nW-<� :-� c� iָ nW->� :-� c� i�ڸ �W-� c�-� 6�      z   M     M   M �   M   M   M   M �   M - .   M    M  	  M  
  M    .  � <� F� F� E� E� E� E� <� <� U� _� _� a� a� ^� ^� ^� ^� U� U� y� y� �� �� x� x� x� x� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �  �  �  �  �  �  �  �  �  � � � � � � � � �!!!!**!!!7777@@777MMMMVVMMMccccllcccyyyy��yyy����������	�	�	�	�	�	�	�	�	�
�
�
�
�
�
�
�
�
�������������������������))))22)))????HH???UUUU^^UUUkkkkttkkk������������������������������������������������������$$1111::111GGGGPPGGG]]]]ff]]]ssss||sss���������� � � � � � � � � �!�!�!�!�!�!�!�!�!�"�"�"�"�"�"�"�"�"�#�#�#�#�#�#�#�#�#�%�%�%�% % %�%�%�%(((((((((#)#)#)#),),)#)#)#)9*9*9*9*B*B*9*9*9*O+O+O+O+X+X+O+O+O+e,e,e,e,n,n,e,e,e,{-{-{-{-�-�-{-{-{-�.�.�.�.�.�.�.�.�.�7�7�7�7�7�7�7�7�7�8�8�8�8�8�8�8�8�8�9�9�9�9�9�9�9�9�9�:�:�:�:�:�:�:�:�:�;�;�;�;;;�;�;�;<<<<<<<<<+>+>+>+>4>4>6>6>+>+>+><?<?<?<?<? ��       #     *� 
�                   f     H� �Y
� ZY�SY�SY�SY�SY�SY�SY�SY�SY�SY	� ZS� �� �          H        !     �                   ����  -z 
SourceFile /CFIDE/adminapi/security.cfc /cfsecurity2ecfc497454422$funcSETSECURITYSANDBOX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  DIR ! WEBAPP # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 	DIRECTORY 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SANDBOX I array K ARRAY_VALIDATOR M B	 @ N _validateArgWithValidator P F
  Q 
		 S _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V U V
 & W / Y set (Ljava/lang/Object;)V [ \ coldfusion/runtime/Variable ^
 _ ]  java/lang/String b _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; d e
 & f _setCurrentLineNo (I)V h i
 & j 	component l CFIDE.adminapi.accessmanager n CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; p q coldfusion/runtime/CFPage s
 t r java v  coldfusion.server.ServiceFactory x getSecurityService z java/lang/Object | _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ~ 
 & � _get &(Ljava/lang/String;)Ljava/lang/Object; � �
 & � checkAdminRoles � coldfusion.sandboxsecurity � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � DirectoryExists (Ljava/lang/String;)Z � �
 t � CONTEXTS � _resolve � e
 & � _autoscalarize � �
 & � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 t � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � arguments.sandbox � 	IsDefined � �
 t � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_ALREADY_EXISTS � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 & � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 & � GETDEFAULTSECURITYSANDBOX � getDefaultSecuritySandbox � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _LhsResolve � e
 & � _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � /* � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � GETCFIDEDIRECTORY � getCFIDEDirectory � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 & � GETWEBINFDIRECTORY  getWebInfDirectory SETDEFAULTFILEPERMISSION setDefaultFilePermission ERROR_INVALIDDIRECTORY LOGAUDIT
 logaudit msg java/lang/StringBuffer . created a security sandbox for the directory   �
 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;
 . toString ()Ljava/lang/String;
 } )([Ljava/lang/Object;[Ljava/lang/Object;)V  
 =! b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object; �#
 &$ 		
	& setSecuritySandbox( metaData Ljava/lang/Object;*+	 , void. false0 &coldfusion/runtime/AttributeCollection2 name4 access6 public8 output: 
returntype< hint> 5Creates a security sandbox for a specified directory.@ 
ParametersB REQUIREDD trueF TYPEH HINTJ Specifies a sandbox directory.L NAMEN 	directoryP ([Ljava/lang/Object;)V R
3S NoU aThe sandbox array object, which is an array of structures with each structure being a permission.W sandboxY getMetadata ()Ljava/lang/Object; this 1Lcfsecurity2ecfc497454422$funcSETSECURITYSANDBOX; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw26 !Lcoldfusion/tagext/lang/ThrowTag; throw27 LineNumberTable <clinit> 	getOutput 1       � �   *+   	 [\ `   "     �-�   _       ]^   a `   "     )�   _       ]^   bc `         �   _       ]^   d `   "     /�   _       ]^   ef `   -     � cY6SYJS�   _       ]^   gh `  	    }+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*JL� >� O� R:-T� XZ� `-a� cY6S� g� `
-�� k-mo� u� `-�� k--�� k-wy� u{� }� �� `-� k--� ��� }Y�S� �W-� k--a� cY6S� g� �� ���-� k-- � cY�S� �-$� �� �� �-"� �� �� �� �Y� �� W-� k-�� ��� �� �� Q-� �� �� �:-� kȶ ���-Զ �� �ȸ ض �� �� � ��3-� k-�� �� -a� cYJS� g� `� (-� k-� ��-� }Y-"� �S� � `- � cY�S� �� }Y-$� �SY-"� �S-J� �� �-a� cY6S� g�� ��~� �Y� �� 4W-a� cY6S� g-� k-�� ��-� }� � ��~� �Y� �� 6W-a� cY6S� g-� k-� �-� }� � ��~� �� �� &-� k-� �-� }Y-"� �S� �W� H-� �� �� �:-� kȶ ���-	� �� �ȸ ض �� �� � �-T� X-� k-� �-� =Y� cYS� }Y�Y�-a� cY6S� g� ����S�"�%W-'� X�   _   �   }]^    }ij   }k+   }lm   }no   }pq   }r+   } 1 2   } s   } s 	  } s 
  } s   } !s   } #s   } 5s   } Is   }tu   }vu w  � �  � r� t� t� t� t� r� y� {� {� {� {� y� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � � � � �&&&&



EEDDDDDDDD

xxU�����
�
�
�
�
���������������%%99OOOO9999qq����qqqq�������
��� � r�##FFLLLLLLaaBB####    `   #     *� 
�   _       ]^   x  `       ��� �� ��3Y� }Y5SY)SY7SY9SY;SY1SY=SY/SY?SY	ASY
CSY� }Y�3Y� }YESYGSYISY8SYKSYMSYOSYQS�TSY�3Y� }YESYVSYISYLSYKSYXSYOSYZS�TSS�T�-�   _       �]^   y `   "     1�   _       ]^        ����  - � 
SourceFile /CFIDE/adminapi/security.cfc 8cfsecurity2ecfc497454422$funcISALLOWCONCURRENTADMINLOGIN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ACCESSMANAGER  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SECURITY  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / 
		 1 _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 3 4
 " 5 _setCurrentLineNo (I)V 7 8
 " 9 	component ; CFIDE.adminapi.accessmanager = CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ? @ coldfusion/runtime/CFPage B
 C A set (Ljava/lang/Object;)V E F coldfusion/runtime/Variable H
 I G _get &(Ljava/lang/String;)Ljava/lang/Object; K L
 " M checkRootAdminUser O java/lang/Object Q _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; S T
 " U java W  coldfusion.server.ServiceFactory Y getSecurityService [ isAllowConcurrentAdminLogin ] 
	 _ java/lang/String a metaData Ljava/lang/Object; c d	  e false g &coldfusion/runtime/AttributeCollection i name k access m public o output q hint s 4Checks whether concurrent login sessions are allowed u 
Parameters w ([Ljava/lang/Object;)V  y
 j z getMetadata ()Ljava/lang/Object; this :Lcfsecurity2ecfc497454422$funcISALLOWCONCURRENTADMINLOGIN; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 	getOutput 1       c d     | }  �   "     � f�    �        ~     � �  �   !     ^�    �        ~     � �  �         �    �        ~     � �  �   #     � b�    �        ~     � �  �  �     �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:-2� 6
-$� :-<>� D� J-2� 6-&� :--� NP� R� VW-'� :--'� :-XZ� D\� R� V� J-(� :-- � N^� R� V�-`� 6�    �   z    � ~      � � �    � � d    � � �    � � �    � � �    � � d    � - .    �  �    �  � 	   �  � 
   �  �  �   � %   # < $ E $ E $ G $ G $ D $ D $ D $ D $ < $ < $ ^ & ^ & ] & ] & ] & n ' ~ ' ~ ' � ' � ' } ' } ' v ' v ' v ' v ' n ' � ( � ( � ( � ( � ( � ( � ( ] %     �   #     *� 
�    �        ~     �   �   f     H� jY
� RYlSY^SYnSYpSYrSYhSYtSYvSYxSY	� RS� {� f�    �       H ~     � �  �   !     h�    �        ~         ����  -W 
SourceFile /CFIDE/adminapi/security.cfc 3cfsecurity2ecfc497454422$funcGETDISABLEDCFFUNCTIONS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   TARGET  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   	ADISABLED  PERMISSIONS ! AENABLEDFUNCTIONS # ACCESSMANAGER % SECURITY ' I ) WEBAPP + ARRAYPOS - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = 	DIRECTORY ? getVariable  (I)Lcoldfusion/runtime/Variable; A B %coldfusion/runtime/ArgumentCollection D
 E C _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I 
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 0 O / Q set (Ljava/lang/Object;)V S T coldfusion/runtime/Variable V
 W U _setCurrentLineNo (I)V Y Z
 0 [ ArrayNew (I)Ljava/util/List; ] ^ coldfusion/runtime/CFPage `
 a _ 1 c   e 

         g 	component i CFIDE.adminapi.accessmanager k CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; m n
 a o java q  coldfusion.server.ServiceFactory s getSecurityService u java/lang/Object w _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; y z
 0 { _get &(Ljava/lang/String;)Ljava/lang/Object; } ~
 0  checkAdminRoles � Ucoldfusion.sandboxsecurity,coldfusion.serversettings,coldfusion.serversettingssummary � false � 
		
		 � java/lang/String � CONTEXTS � _resolve 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � _autoscalarize � ~
 0 � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � � coldfusion/runtime/Cast �
 � �  _resolveAndAutoscalarize � �
 0 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructKeyExists $(Ljava/util/Map;Ljava/lang/String;)Z � �
 a � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/ThrowTag � throw � setCalledName (Ljava/lang/String;)V � � coldfusion/tagext/GenericTag �
 � � cfthrow � message � SANDBOX_NOT_FOUND � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 0 � 
setMessage � �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 0 � 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 a � GETFUNCTIONPERMISSIONPOSITION � getFunctionPermissionPosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 0 � * � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 0 � Left '(Ljava/lang/String;I)Ljava/lang/String; � �
 a � *- � 	_contains '(Ljava/lang/String;Ljava/lang/String;)Z � �
 0 � RemoveChars ((Ljava/lang/String;II)Ljava/lang/String; � �
 a  ListToArray $(Ljava/lang/String;)Ljava/util/List;
 a _List $(Ljava/lang/Object;)Ljava/util/List;
 � 
textnocase
 asc 	ArraySort 7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Z
 a 
	 getDisabledCFFunctions metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name access public  output" hint$ FReturns an array of functions that have been disabled for the sandbox.& 
Parameters( REQUIRED* true, HINT. JSpecifies the sandbox directory for which disabled functions are returned.0 NAME2 	directory4 ([Ljava/lang/Object;)V 6
7 getMetadata ()Ljava/lang/Object; this 5Lcfsecurity2ecfc497454422$funcGETDISABLEDCFFUNCTIONS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; throw36 !Lcoldfusion/tagext/lang/ThrowTag; LineNumberTable <clinit> 	getOutput 1       � �       9: >   "     ��   =       ;<   ?@ >   "     �   =       ;<   AB >         �   =       ;<   CD >   (     
� �Y@S�   =       
;<   EF >   	   +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@� F� J:-L� PR� X-L� P-%� \-� b� X-L� P-&� \-� b� X-L� Pd� X-L� Pd� X-L� P-)� \-� b� X-L� P
f� X-h� P-+� \-jl� p� X-L� P-,� \--,� \-rt� pv� x� |� X-L� P--� \--&� ��� xY�SY�S� |W-�� P-0� \--(� �Y�S� �-,� �� �� �-�� �Y@S� �� �� ��� G-� �� �� �:-2� \�� ���-ɶ �� ��� Ͷ �� �� ؙ �-6� \--(� �Y�S� �� xY-,� �SY-@� �S� ۸ ߶ X-9� \-� ��-� xY-,� �SY-@� �S� � X
--"-.� �� � �� �YS� �� X-� �� ��� � C-?� \-� �� �� ��� �� '-C� \-C� \-� �� ���� X-E� \- � ��	�W- � ��-� P�   =   �   ;<    GH   I   JK   LM   NO   P    ; <    Q    Q 	   Q 
   Q    !Q    #Q    %Q    'Q    )Q    +Q    -Q    ?Q   RS T  " �  " �$ �$ �$ �$ �$ �$ �$ �% �% �% �% �% �% �% �% �% �& �& �& �& �& �& �& �& �& �' �' �' �' �' �' �' �( �( �( �( �( �( �( �) �) �) �) �) �) �) �) �) �* �* �* �* �* �* �*+++++++++++',9,9,;,;,8,8,0,0,0,0,',',\-\-j-j-o-o-[-[-[-[-�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�0�2�2�2�2�2�0	6	666'6'6666666�6@9@9O9O9X9X9@9@9@9@979k;k;g;g;g;g;e;�<�<�<�<�?�?�?�?�?�?�?�?�?�?�?�?�?�?�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�C�?�?�<�E�E�E�E�E�E�E�E�E�E�E�F�F�F�F�F�/    >   #     *� 
�   =       ;<   U  >   �     ��� �� ��Y
� xYSYSYSY!SY#SY�SY%SY'SY)SY	� xY�Y� xY+SY-SY/SY1SY3SY5S�8SS�8��   =       �;<   V@ >   !     ��   =       ;<        