����  -� 
SourceFile 3/CFIDE/administrator/extensions/flexintegration.cfm cfflexintegration2ecfm290836724  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   KEYSTOREPASSWORD Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   KEYSTOREPWDLABEL   	   JR   	    FDSIP_ERROR_GET " " 	  $ I & & 	  ( CHECKCSRFTOKEN * * 	  , KEYSTOREPATHLABEL . . 	  0 IPS 2 2 	  4 BSEGMENTISINVALID 6 6 	  8 GETADMINVARIANT : : 	  < IP_ERROR_INVALID > > 	  @ CFCATCH B B 	  D GETCSRFTOKEN F F 	  H TOKEN J J 	  L FDSIP_ERROR_REMOVE N N 	  P OLDID R R 	  T IP_ERROR_ADD V V 	  X ERROR_KEYSTOREPASS Z Z 	  \ FORM ^ ^ 	  ` LOG b b 	  d SERVERIDENTITYLABEL f f 	  h AERRORMESSAGES j j 	  l REMOVE_BUTTON n n 	  p ERROR_FLEXASSEMBLER r r 	  t IDENTITY v v 	  x 	DEFAULTID z z 	  | ADMINSUBMIT ~ ~ 	  � REQUEST � � 	  � IPUTILS � � 	  � TMP � � 	  � IPINDEX � � 	  � 
ADD_BUTTON � � 	  � BERRORSEXIST � � 	  � KEYSTORE � � 	  � RESULT � � 	  � NUMSEGMENTS � � 	  � com.macromedia.SourceModTime  [�;�Y pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � %class$coldfusion$tagext$net$CookieTag Ljava/lang/Class; coldfusion.tagext.net.CookieTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/net/CookieTag � _setCurrentLineNo (I)V � �
  � 30 � 
setExpires (Ljava/lang/Object;)V � �
 � � cfcookie � value � CGI � java/lang/String � SCRIPT_NAME � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
  � setValue � �
 � � setHttpOnly (Z)V � �
 � � name � cfadmin_lastpage_ � GetAuthUser ()Ljava/lang/String; � �
   concat &(Ljava/lang/String;)Ljava/lang/String;
 � setName �
 � 	hasEndTag	 � coldfusion/tagext/GenericTag

 _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
  $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag �	  coldfusion/tagext/io/SilentTag 
doStartTag ()I
 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  LOCALE! REQUEST.LOCALE# en% checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V'(
 ) 
LOCALEFILE+ java/lang/StringBuffer- resources/extensions_/  �
.1 append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;34
.5 .cfm7 toString9 � java/lang/Object;
<: _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V>?
 @ IPLISTB FORM.IPLISTD  F falseH 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V'J
 K defaultM setO � coldfusion/runtime/VariableQ
RP _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;TU
 V getAdminVariantX 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;Z[
 \ jrun^ _compare '(Ljava/lang/Object;Ljava/lang/String;)D`a
 b &class$coldfusion$tagext$lang$ObjectTag  coldfusion.tagext.lang.ObjectTaged �	 g  coldfusion/tagext/lang/ObjectTagi createk 	setActionm �
jn javap setTyper �
js jrunx.kernel.JRunu setClassw �
jx jrz
j getServerName} _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;�
 � FORM.IDENTITY� 	defaultID� ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
 �� setArray !(Lcoldfusion/runtime/FastArray;)V��
R� REMOVE� FORM.REMOVE�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � _Object (Z)Ljava/lang/Object;��
 �� _boolean (Ljava/lang/Object;)Z��
 �� RESTRICTEDIPLIST� FORM.RESTRICTEDIPLIST� ADD� FORM.ADD� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � IPTOBEADDED� FORM.IPTOBEADDED� Trim�
 � Len (Ljava/lang/Object;)I��
 � (I)Ljava/lang/Object;��
 �� 	CSRFTOKEN� FORM.CSRFTOKEN� checkCSRFToken� _autoscalarize�U
 � DATASERVTABKEYNAME� _factor4 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � *coldfusion/runtime/TransientVariableHolder� &(Lcoldfusion/runtime/NeoPageContext;)V �
�� (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag�� �	 � "coldfusion/tagext/lang/ImportedTag� l10n� 
../cftags/� admin� :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V�
�� &coldfusion/runtime/AttributeCollection� id� error_req_keystore_pass� var� error_keystorepass� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
� ;
    You must provide a keystore file and a password
    � write� � java/io/Writer�
�� doAfterBody�
�� _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;� 
  doEndTag #javax/servlet/jsp/tagext/TagSupport
 doCatch (Ljava/lang/Throwable;)V	
�
 	doFinally 
� User  X changed Flex integration settings. The old values were Enable Flash Remoting support :  RUNTIME _resolve �
  isEnabledFlashRemoting 8, Enable Remote Adobe LiveCycle Data Management access:  isEnabledFlexDataServices ,, Enable RMI over SSL for Data Management :  isEnabledRmiSSL  ". Enable Flash Remoting support : " ENABLEFLASHREMOTING$ FORM.ENABLEFLASHREMOTING& (Z)Ljava/lang/String; �(
 �) ENABLEFLEXASSEMBLER+ FORM.ENABLEFLEXASSEMBLER- ENABLERMISSL/ FORM.ENABLERMISSL1 getDataServiceId3 '(Ljava/lang/Object;Ljava/lang/Object;)D`5
 6 setDataServiceId8 setEnableFlexDataServices: true< FORM.KEYSTOREPASSWORD> STATICPASSWORD@ setKeystorePasswordB _factor0D�
 E FORM.KEYSTOREG setKeystoreI getKeystoreK (Ljava/lang/Object;D)D`M
 N getKeystorePasswordP setEnableRmiSSLR _List $(Ljava/lang/Object;)Ljava/util/List;TU
 �V ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)ZXY
 Z setEnableFlashRemoting\ unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;^_ coldfusion/runtime/NeoExceptiona
b` t36 [Ljava/lang/String; Anyfde	 h findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ijk
bl bind '(Ljava/lang/String;Ljava/lang/Object;)Vno
�p $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTagsr �	 u coldfusion/tagext/io/OutputTagw
x error_flexassemblerz 7
					Error attempting to update settings:<br/>
					| MESSAGE~ D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; ��
 � EncodeForHTML�
 � <br/>
					� DETAIL� 
				� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 �
x� coldfusion/tagext/QueryLoop�
�
�

x unbind� 
�� _factor1��
 � #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag�� �	 � coldfusion/tagext/lang/LogTag� audit� setFile� �
�� setApplication� �
�� cflog� text� setText� �
�� 0� Java� coldfusion.util.IPAddressUtils� ipUtils� validateIPAdress� ip_error_invalid� #
				The IP you attempted to add (�) is not valid.
				IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
				or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
			� ArrayLen��
 � (D)Ljava/lang/Object;��
 �� _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V��
 � [\+[:space:]\-]*� ALL� 	REReplace� �
 � FLEXASSEMBLERIPLIST� ,� 
ListAppend J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � t37�e	 � ip_error_add� %
						The IP you attempted to add (�) is not valid.
						IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
						or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format. <br/>
						�  <br />
						� 
					� _factor2��
 �  added ip address � + where LiveCycle Data Services are running'� 1� _int��
 �� 	ListGetAt '(Ljava/lang/String;I)Ljava/lang/String;��
 � ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I��
 � ListDeleteAt��
 � _double (Ljava/lang/Object;)D� 
 � ListLen (Ljava/lang/String;)I
  t38e	  fdsip_error_remove
 
				An error occurred attempting to remove the requested IP(s).
				from the Flex Data Management configuration.<br />
				  <br />
				 
			 _factor3�
  t39e	  fdsip_error_get �
				An error occurred attempting to retrieve a list of restricted IP addresses
				from the Flex Data Management configuration.<br />
				 <br />
				 _factor5�
  cfusion!
�


 



& flex_pagename( pagename* Flex integration, 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag/. �	 1 !coldfusion/tagext/lang/IncludeTag3 ../header.cfm5 setTemplate7 �
48 )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag;: �	 = #coldfusion/tagext/html/form/FormTag? FlexA
@ cfformD actionF
@n POSTI 	setMethodK �
@L
@ ../include/buttonbar.cfmO ../include/margintop.cfmQ ../include/errors.cfmS 

<h2 class="pageHeader">U pageHeader_flexintegrationW %Data & Services &gt; Flex IntegrationY 	</h2>

[ 0
	<input type="hidden" name="csrftoken" value="] getCSRFToken_ s">	
	<p>
		<input name="EnableFlashRemoting"  type="CHECKBOX" class="text" value="true" id="EnableFlashRemoting" a checkedc +>

		<b><label for="EnableFlashRemoting">e enableFlashRemg Enable Flash Remotingi /</label></b><br>
		<font class="sentance">
		k enableFlashRem_descm �
			Lets a Flash client connect to this ColdFusion server and invoke ColdFusion Components (CFCs).
			NOTE: Disabling this feature also disables ColdFusion server monitoring and multiserver monitoring.
		o �
		</font>
	</p>
	<p>
		<input name="EnableFlexAssembler" type="CHECKBOX" class="text" value="true" id="EnableFlexAssembler" q +>

		<b><label for="EnableFlexAssembler">s enableFlexDSu 4Enable Remote Adobe LiveCycle Data Management accessw enableFlexDS_descy6
			Lets LiveCycle Data Services ES connect to this ColdFusion server through RMI
			and use CFCs to read and update data that supports a
			Flex application. If you are not using this feature, disable it.
			This does not affect LiveCycle Data Services ES integrated in to the ColdFusion installation.
		{ 4
		</font>
	</p>
	<p>
		<table>
		<tr>
			<td>} serverIdentityLabel Server Identity� _factor6��
 � -:</td>
			<td><input name="identity" title="� "  type="text" value="� EncodeForHTMLAttribute�
 � E" size="30" mansize="50" id="identity"></td>
		</tr>
		</table>
		� serverIdentity_info� �
			If you are running more than one instance of ColdFusion on this machine, you must
			configure each instance with a unique ID.
		� j
	</p>

	<p>
		<input name="EnableRmiSSL" type="CHECKBOX" class="text" value="true" id="EnableRmiSSL" � <>

		<label for="enable">
		<b><label for="EnableRmiSSL">� enablermissl� 'Enable RMI over SSL for Data Management� enablermissl_desc��
			Lets you use Secure Socket Layer (SSL) encryption for the RMI communication between Flex and ColdFusion.
			This is not required unless you are transmitting authentication information or confidential
			data between Flex and ColdFusion over an unsecured network. You must provide a keystore file and keystore password.
			For instructions on how to create a keystore file, see the online Help.
		� 0
		</font>
		<br/>
		<table>
		<tr>
			<td>� keystorePathLabel� Full path to keystore� -:</td>
			<td><input name="keystore" title="� " type="text" value="� _factor7��
 � 
ESAPIUTILS� encodeForHTMLAttributeFilePath� 9" size="50" id="keystore"></td>
		</tr>
		<tr>
			<td>� keystorePwdLabel� Keystore password� 5:</td>
			<td><input name="keystorepassword" title="� " type="password" value="� �" size="20" maxlength="50" id="keystorepassword" autocomplete="off"></td>
		</tr>
		</table>
	</p>
<br />

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� 	GRAYLIGHT� &" class="cellBlueTopAndBottom">
		<b>� selectIP� =Select IP addresses where LiveCycle Data Services are running� !</b>
	</td>
</tr>
<tr>
<td>
� fdsip_welcometext�Q
To secure the LiveCycle Data Services ES integration point,
the hosts that are allowed to perform Data Management operations are restricted.
If you are running LiveCycle Data Services ES on a different computer, specify its IP address here.
By default, only the local computer can perform Data Management operations in ColdFusion.
� �
</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<td class="cellBlueBottom">
				<label for="ipaddress">� 
ip_address� 
IP Address� �</label>
				<input type="text" maxlength="50" name="IPToBeAdded" size="20" id="ipaddress" >
		</tr>
		<tr>
			<td class="cellBlueBottom" bgcolor="#� 	BLUELIGHT� ">
				� _factor8��
 � 
add_button� Add� "
				<input type="submit" title="� " name="Add" value="  � �  " class="buttn">
			</td>
		</tr>
		</table>
		
	</td>
</tr>
</table>
<br><br>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� >" class="cellBlueTopAndBottom">
		<b><label for="removelist">� fdsviewdeleteIP� QView or Remove selected IP addresses where LiveCycle Data Services ES are running� �</label></b>
	</td>
</tr>
<tr>
	<td>
		
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<td class="cellBlueBottom">
				<select name="RestrictedIPList"  id="removelist" size="4" multiple style="width:20em">
					� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � java/util/StringTokenizer� '(Ljava/lang/String;Ljava/lang/String;)V �
�� 	nextToken� �
�� 
						<option value="� ">� </option>
					� CFLOOP� checkRequestTimeout� �
 � hasMoreTokens ()Z
� T
				</select>
			</td>
		</tr>
		<tr>
			<td class="cellBlueBottom" bgcolor="# remove_button Remove Selected	 1
				<input name="Remove"  type="submit" value=" p" class="buttn" id="removelist">
			</td>
		</tr>
		</table>
		
	</td>
</tr>
</table>
<br />
<br />

 _factor9�
  


 ../include/marginbottom.cfm 

<br><br>



@�
@
@

@ 	_factor10�
  ../footer.cfm metaData Ljava/lang/Object;!"	 # getMetadata ()Ljava/lang/Object; this !Lcfflexintegration2ecfm290836724; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; cookie0 !Lcoldfusion/tagext/net/CookieTag; silent20  Lcoldfusion/tagext/io/SilentTag; mode20 t7 t8 t9 Ljava/lang/Throwable; t10 t11 t12 t13 t14 module21 $Lcoldfusion/tagext/lang/ImportedTag; mode21 t17 t18 t19 t20 t21 t22 	include22 #Lcoldfusion/tagext/lang/IncludeTag; form46 %Lcoldfusion/tagext/html/form/FormTag; mode46 t26 	include44 t28 	include45 t30 t31 t32 t33 t34 t35 LineNumberTable java/lang/ThrowableY module36 mode36 t6 module37 mode37 t15 t16 module38 mode38 t23 t24 t25 t27 module39 mode39 	include23 	include24 	include25 module26 mode26 output43  Lcoldfusion/tagext/io/OutputTag; mode43 module40 mode40 module41 mode41 Ljava/lang/String; t40 Ljava/util/StringTokenizer; module42 mode42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 module27 mode27 module28 mode28 module29 mode29 module30 mode30 module31 mode31 t41 t42 module32 mode32 module33 mode33 module34 mode34 module35 mode35 t4 ,Lcoldfusion/runtime/TransientVariableHolder; module6 mode6 #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output8 mode8 module7 mode7 t29 !coldfusion/runtime/AbortException� java/lang/Exception� runPage 	include47 object4 "Lcoldfusion/tagext/lang/ObjectTag; log9 Lcoldfusion/tagext/lang/LogTag; log15 __cfcatchThrowable3 output19 mode19 module18 mode18 object10 output12 mode12 module11 mode11 __cfcatchThrowable1 output14 mode14 module13 mode13 <clinit> t5 __cfcatchThrowable2 output17 mode17 module16 mode16 1     1                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     � �    �   d �   � �   de   r �   � �   �e   e   e   . �   : �   !"    %& *   "     �$�   )       '(      *  �    �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��   )       �'(    �+,   �-.     *   #     *� 
�   )       '(   � *  	� 	 %  �*� �+� �� �:*� �ֶ ���*�� �Y�S� � �� � �� ����*� �*��� ���� �*�+� ��:*� ���Y6��*,� M*,��� :�����*,� � :�����*� �* � �**�� �YS�L�<���S*� G�S* � �* � �**�� �YS�Q�<�������O�� *� *�� �YAS� �S*� y* � �**�� �YS�4�<���S* � �**� =�WY*�<�]_�c�� �**� y��N�c�~���Y��� 8W**� y��"�c�~���Y��� W**� }��"�c�~����� F*� y**� }�ŶS*� �* � �**�� �YS�9�<Y**� }��S���S�#��a� � :	� 	�:
*,�M�
�� :� #�� � #:�$� � :� �:�%�*,'��*��+� ���:* �� ��������Y�<Y�SY)SY�SY+S�������Y6� 6*,� M,-�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��*�2+� ��4:* �� �6�9��� �*�>.+� ��@:* �� �B�CEG*�� �Y�S� � �� �HJ�M��NY6� �*,� M*,�� :� �� ��*,��*�2,� ��4:*�� ��9��� :� _� ��*�2-� ��4:*�� �P�9��� :� &� ^�,�����c� � :� �: *,�M� �� :!� #!�� � #:""�� � :#� #�:$��$*� ' � �BZ � �BZ �?BZBGBZ � �nZ � �nZ �bnZhknZ � �}Z � �}Z �b}Zhk}Znz}Z}�}Z�ZZ�3?Z9<?Z�3NZ9<NZ?KNZNSNZ� �ZA�ZGz�Z���Z���Z� �ZA�ZGz�Z���Z���Z� �ZA�ZGz�Z���Z���Z���Z���Z )  t %  �'(    �/ �   �01   � �"   �23   �45   �6 &   �7"   �8"   �9: 	  �;" 
  �<"   �=:   �>:   �?"   �@A   �B &   �C:   �D"   �E"   �F:   �G:   �H"   �IJ   �KL   �M &   �N"   �OJ   �P"   �QJ   �R"   �S:   �T"    �U" !  �V: "  �W: #  �d" $X  � {                    E  E  L  L  L  L  E  E     � � � � � � � � � � � � � � � � � � � � � � � �	 �	 �	 �	 �* �* �7 �7 �7 �7 �3 �3 �	 �U �U �U �U �J �J �z �z �z �z �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �% �% � � � � �  �  �� �z � j � �� �� �� �� �w �w �_ �� �� �� �� �� �� �� �� �'�'��`�`�G�� � �� *   	 $  �,*6� �**�� �Y�S���<Y**� ���S��� ��,���*��$+� ���:*9� ��������Y�<Y�SY�SY�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,**� �Ÿ ��,���,**� �Ÿ ��,���,**� �Ÿ ��,���,*�� �Y�S� � ��,���*��%+� ���:*C� ��������Y�<Y�SY�S�������Y6� 6*,� M,ö������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,Ŷ�*��&+� ���:*H� ��������Y�<Y�SY�S�������Y6� 6*,� M,ɶ������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,˶�*��'+� ���:*V� ��������Y�<Y�SY�S�������Y6� 6*,� M,϶������� � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,Ѷ�,*�� �Y�S� � ��,ն�*�   � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z���Z���Z��Z��Z��Z��ZZZz��Z���Zo��Z���Zo��Z���Z���Z���Z>Z]Z]b]Z3}�Z���Z3}�Z���Z���Z���Z )  j $  �'(    �/ �   �01   � �"   �[A   �\ &   �]:   �7"   �8"   �9: 	  �;: 
  �<"   �^A   �_ &   �?:   �`"   �a"   �C:   �D:   �E"   �bA   �c &   �H:   �d"   �e"   �f:   �N:   �g"   �hA   �i &   �R:   �S"   �T"    �U: !  �V: "  �W" #X   � . "6 "6 6 6 6 6  6 r9 r9 ~9 ~9 ;999999:::::1:1:1:1:0:GBGBGBGBFB�C�CdC_H_H(H#V#V�V�Z�Z�Z�Z�Z � *  
:  5  p*�2+� ��4:* �� �P�9��� �*�2+� ��4:* �� �R�9��� �*�2+� ��4:* �� �T�9��� �,V��*��+� ���:* �� ��������Y�<Y�SYXS�������Y6� 6*,� M,Z�������� � :	� 	�:
*,�M�
�� :� #�� � #:�� � :� �:��,\��*�v++� ��x:* �� ���yY6��*,��� :���*,��� :���*,��� :���*��(� ���:*[� ��������Y�<Y�SY�SY�SY�S�������Y6� 6*,� M,ܶ������� � :� �:*,�M��� :� &��� � #:�� � :� �:��,޶�,**� ��Ÿ ��,��,**� ��Ÿ ��,��,*�� �Y�S� � ��,��*��)� ���:*i� ��������Y�<Y�SY�S�������Y6� 6*,� M,�������� � :� �:*,�M��� : � &�� �� � #:!!�� � :"� "�:#��#,��**� 5�Ÿ �:$�:%6&*'��:'��Y$%��:(� N(��N'-�S,���,**� )�Ÿ ��,���,**� )�Ÿ ��,����� &`6&(����,��,*�� �Y�S� � ��,ն�*��*� ���:)*{� �)�����)��Y�<Y�SYSY�SYS����)�)��Y6*� 6*)*,� M,
��)������ � :+� +�:,**,�M�,)�� :-� &� �-�� � #:.).�� � :/� /�:0)��0,��,**� q�Ÿ ��,������I��� :1� #1�� � #:22��� � :3� 3�:4���4*� 2 � �ZZ �".Z(+.Z �"=Z(+=Z.:=Z=B=Z36Z6;6ZYeZ_beZYtZ_btZeqtZtytZ)EHZHMHZkwZqtwZk�Zqt�Zw��Z���Z���Z���Z���Z���Z�� Z�� Z�� Z  Zq�NZ��NZ��NZ�YNZ_kNZq�NZ�BNZHKNZq�]Z��]Z��]Z�Y]Z_k]Zq�]Z�B]ZHK]ZNZ]Z]b]Z )   5  p'(    p/ �   p01   p �"   pjJ   pkJ   plJ   pmA   pn &   p9: 	  p;" 
  p<"   p=:   p>:   p?"   pop   pq &   pC"   pD"   pE"   prA   ps &   pH:   pd"   pe"   pf:   pN:   pg"   ptA   pu &   pR:   pS"   pT"    pU: !  pV: "  pW" #  pdv $  p�v %  p & &  p  '  pwx (  pyA )  pz & *  p{: +  p|" ,  p}" -  p~: .  p: /  p�" 0  p�" 1  p�: 2  p�: 3  p�" 4X   C  �  �   � F � F � . � t � t � \ � � � � � � ��[�[�[�[�[�\�\�\�\�\�\�\�\�\�\�h�h�h�h�hii�i�s�s�s�s�t�t�t�t�t�t�t�t�t�ts�s'z'z'z'z&z|{|{�{�{D{|||||U � �� *    ,  �,^��,* �� �**� I�W`*�<Y*�� �Y�S� �S�]� ��,b��*� �**�� �YS��<����� 
,d��,f��*��+� ���:*� ��������Y�<Y�SYhS�������Y6� 6*,� M,j�������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,l��*��+� ���:*� ��������Y�<Y�SYnS�������Y6� 6*,� M,p�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,r��*� �**�� �YS��<����� 
,d��,t��*��+� ���:*� ��������Y�<Y�SYvS�������Y6� 6*,� M,x�������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,l��*��+� ���:*� ��������Y�<Y�SYzS�������Y6� 6*,� M,|�������� � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,~��*��+� ���:$*� �$�����$��Y�<Y�SY�SY�SY�S����$�$��Y6%� 6*$%,� M,���$������ � :&� &�:'*%,�M�'$�� :(� #(�� � #:)$)�� � :*� *�:+$��+*� ( � � �Z � � �Z �	ZZ �	$Z$Z!$Z$)$Z���Z���Z���Z���Z���Z���Z���Z���Z���Z���Z}��Z���Z}��Z���Z���Z���ZLhkZkpkZA��Z���ZA��Z���Z���Z���Z8;Z;@;Z[gZadgZ[vZadvZgsvZv{vZ )  � ,  �'(    �/ �   �01   � �"   ��A   �� &   �]:   �7"   �8"   �9: 	  �;: 
  �<"   ��A   �� &   �?:   �`"   �a"   �C:   �D:   �E"   ��A   �� &   �H:   �d"   �e"   �f:   �N:   �g"   ��A   �� &   �R:   �S"   �T"    �U: !  �V: "  �W" #  ��A $  �� & %  �: &  �" '  �w" (  ��: )  ��: *  �{" +X   �    �  � ! � ! �  �  �  �  �  � I I I � � xss<mm611���� �� *    $  �,**� i�Ÿ ��,���,**� i�Ÿ ��,���,*� �**� y�Ÿ ����,���*�� +� ���:*� ��������Y�<Y�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� :� #�� � #:		�� � :
� 
�:��,���*&� �**�� �YS�!�<����� 
,d��,���*��!+� ���:*)� ��������Y�<Y�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,l��*��"+� ���:*+� ��������Y�<Y�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� :� #�� � #:�� � :� �:��,���*��#+� ���:*5� ��������Y�<Y�SY�SY�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� : � # �� � #:!!�� � :"� "�:#��#,**� 1�Ÿ ��,���,**� 1�Ÿ ��,���*�   � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z � � �Z���Z���Z���Z���Z���Z���Z���Z���Z\x{Z{�{ZQ��Z���ZQ��Z���Z���Z���Z,HKZKPKZ!kwZqtwZ!k�Zqt�Zw��Z���Z )  j $  �'(    �/ �   �01   � �"   ��A   �� &   �]:   �7"   �8"   �9: 	  �;: 
  �<"   ��A   �� &   �?:   �`"   �a"   �C:   �D:   �E"   ��A   �� &   �H:   �d"   �e"   �f:   �N:   �g"   ��A   �� &   �R:   �S"   �T"    �U: !  �V: "  �W" #X   � .            4 4 4 4 4 4 4 4 , � � L&&&})})F)A+A+
+5555�5�5�5�5�5�5�6�6�6�6�6 D� *  I    �*� e*7� �*���*7� �**�� �YS��<��� ��*7� �**�� �YS��<��� ��*7� �**�� �YS�!�<��� �#�**� a%'���*��**� a,.���*��**� a02���*��S*� e**� e�ŶS*� U*9� �**�� �YS�4�<���S**� U��*_� �YwS� �7�~� _*;� �**�� �YS�9�<Y*_� �YwS� �S��W*=� �**�� �YS�;�<YIS��W**� a,.��� ]*C� �**�� �YS��<������ +*D� �**�� �YS�;�<Y=S��W� R*G� �**�� �YS��<����� +*H� �**�� �YS�;�<YIS��W**� a?����Y��� -W*_� �YS� �*�� �YAS� �7�~����� 7*N� �**�� �YS�C�<Y*_� �YS� �S��W*�   )   *   �'(    �/ �   �01   � �" X  6 �  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7   7   7   7   7  7  7  7  7 A 7 A 7  7  7  7  7 M 7 M 7 M 7 M 7  7  7  7  7 n 7 n 7  7  7  7  7 z 7 z 7 z 7 z 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7 � 7 � 7  7  7  7  7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7 � 7  7  7  7  7   7 � 7 � 7 � 7 � 7   7 9 9 9 9 � 9# :# :+ :+ :# :# :d ;d ;J ;J ;J ;� =� =~ =~ =~ =# :� A� A� A� A� A� A� A� A� A� A� C� C� C� C� C� C� D� D� D� D� D� C G GL HL H2 H2 H2 H G� AU MU MU MU MY MY M[ M[ MT MT MT MT Ml Ml M{ M{ Ml Ml Ml Ml MT MT M� N� N� N� N� NT M �� *  	�  !  ���Y*� ���:*��+� ���:*2� ��������Y�<Y�SY�SY�SY�S�������Y6� 6*,� M,��������� � :� �:*,�M��� :	� &�	�� � #:

�� � :� �:��*+,�F� :���**� a�H��� 7*Q� �**�� �YS�J�<Y*_� �Y�S� �S��W**� a02��� �*T� �*T� �**�� �YS�L�<�������O�t|��Y��� >W*T� �*T� �**�� �YS�Q�<�������O�t|����� .*U� �**�� �YS�S�<Y=S��W� 3*� �=�S*� �*X� �**� m�ŸW**� ]�Ÿ[���S� +*[� �**�� �YS�S�<YIS��W**� a%'��� 4*`� �**�� �YS�]�<Y=S��W� +*b� �**�� �YS�]�<YIS��W��:�:�c:�i�m�     �           C�q*� �=�S*�v+� ��x:*h� ���yY6�-*��� ���:*i� ��������Y�<Y�SY{SY�SY{S�������Y6� �*,� M,}��,*k� �**� E� �YS��� ����,���,*l� �**� E� �Y�S��� ����*,��������� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �:���������� :� &� f�� � #:��� � :� �:���*� �*o� �**� m�ŸW**� u�Ÿ[���S� �� � :� �: ��� *� % j � �Z � � �Z _ � �Z � � �Z _ � �Z � � �Z � � �Z � � �Zs��Z���ZhZZh&Z&Z#&Z&+&Z
ZZNZZTWZZ
iZNiZTWiZZfiZiniZ  ��� � ��� ����  ��� � ��� ����  ��Z � ��Z ���Z��ZN�ZT��Z���Z )  L !  �'(    �/ �   �01   � �"   ���   ��A   �� &   �7:   �8"   �9" 	  �;: 
  �<:   �="   �>"   �?�   �`�   ��:   ��p   �� &   ��A   �� &   �G:   �H"   �d"   �e:   �f:   �N"   �g"   �P:   ��:   �R"   �S:   �T"  X  J � C 2 C 2 O 2 O 2  2 � P � P � P � P � P � P � P � P � P � P Q Q Q Q Q � P0 S0 S0 S0 S4 S4 S7 S7 S/ S/ SL TL TL TL Tm Tm TL TL TL TL T� T� T� T� T� T� T� T� T� T� TL TL T� U� U� U� U� U� W� W� W� W� W X X X X X X X X X X� XL T@ [@ [& [& [& [/ SI _I _I _I _M _M _P _P _H _H _y `y `_ `_ `_ `� b� b� b� b� bH _ � 5� g� g� g� g� g� gL iL iX iX i� k� k� k� k� k� k� k� k� k� l� l� l� l� l� l� l� l� l i� h� o� o� o� o� o� o� o� o� o� oz oz o   1 �& *   �     R*� �� �L*� �N*� ��� �*-+�� �*�2/-� ��4:*�� � �9��� ��   )   4    R'(     R01    R �"    R � �    R�J X     :� :� "�   �� *  �    .**� �"$&�**�� �Y,S�.Y0�2*�� �Y"S� � �68�6�=�A**� aCEG�***� �I�L*� }N�S*� �**� =�WY*�<�]_�c�� g*�h+� ��j:*� �l�oq�tv�y{�|��� �*� }*� �***� !�W~�<���S**� aw���**� m*� �*������**� a������Y��� W**� a������Y��� W**� a������Y��� W**� �����Y��� EW**� a������Y��� ,W*#� �*#� �*_� �Y�S� � ��������� m*� MG�S**� a����� *� M*_� �Y�S� �S*+� �**� -�W�*�<Y**� M��SY*�� �Y�S� �S�]W*�   )   4   .'(    ./ �   .01   . �"   .�� X  b �                              "  "  (  (  (  (  >  >              K  K  K  K  O  O  R  R  U  U  J  J  J  \  \  \  \  `  `  [  [  [  j  j  j  j  f  f  v  v  v  v  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  v  �  �  �  �  �  �  �  �    �  �  �          " " " "" "" "% "% " " " " "7 "7 "7 "7 "; "; "> "> "6 "6 "6 "6 " " " " "P "P "P "P "T "T "W "W "O "O "O "O " " " " "i "i "i "i "h "h "h "h " " " " "| #| #| #| #� #� #� #� #{ #{ #{ #{ #� #� #� #� #� #� #� #� #� #� #{ #{ #{ #{ # # #� &� &� &� &� &� '� '� '� '� '� '� '� '� '� '� )� )� )� )� )� '� +� + + + + +� +� +� + " ! � *   
   �**� ���� \*+,��� �*��	+� ���:*r� ��������**� e�Ÿ �� ����� �**� a������Y��� EW**� a������Y��� ,W*v� �*v� �*_� �Y�S� � ��������� �*+,��� �*��+� ���:* �� ���������.Y�2* �� �*��6�6*_� �Y�S� � �6�6�=� ����� �**� a������Y��� W**� a��������� *+,�� ���Y*� ���:*� 5*�� �YSY�S� �S��:�:�c:		��m�   �           C	�q*� �=�S*�v+� ��x:
* Ҷ �
�
�yY6�0*��
� ���:* Ӷ ��������Y�<Y�SYSY�SYS�������Y6� �*,� M,��,* ֶ �**� E� �YS��� ����,��,* ׶ �**� E� �Y�S��� ����*,�������� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �:��
�����
��� :� &� o�� � #:
��� � :� �:
���**� m�<Y* ۶ �**� m�Ÿćc��S**� %�Ŷ˧ �� � :� �:���*� }��Z���Zr#Z #Zr2Z 2Z#/2Z272ZfZZfZ`cfZuZZuZ`cuZfruZuzuZ�����������Z��ZZ�Z`��Z���Z )     �'(    �/ �   �01   � �"   ���   ���   �]�   �7�   �8�   ��: 	  ��p 
  �� &   ��A   �� &   �?:   �`"   �a"   �C:   �D:   �E"   �F"   �G:   �H:   �d"   �e:   �f" X  r �  0  0  0  0   0   0 . r . r B r B r B r B r  r   0 e v e v e v e v i v i v l v l v d v d v d v d v ~ v ~ v ~ v ~ v � v � v � v � v } v } v } v } v � v � v � v � v � v � v � v � v � v � v } v } v } v } v d v d v � � � �  �  � � � � � � � � � � �0 �0 � � � � � � � d vQ �Q �Q �Q �U �U �X �X �P �P �P �P �j �j �j �j �n �n �q �q �i �i �i �i �P �P �P �� �� �� �� �� �� �� �� �� �� �� �� �V �V �b �b �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � �� *  
�  '  2*� ���S*� 9I�S*�h
+� ��j:*z� ���tl�o��y��|��� �*{� �***� ��W��<Y*{� �*_� �Y�S� � ��S������ *� 9=�S**� 9�Ÿ���*� �=�S*�v+� ��x:* �� ���yY6� *��� ���:* �� ��������Y�<Y�SY�SY�SY�S�������Y6� ^*,� M,���,* �� �*_� �Y�S� � ����,�������̨ � :	� 	�:
*,�M�
�� :� &� c�� � #:�� � :� �:��������� :� #�� � #:��� � :� �:���**� m�<Y* �� �**� m�Ÿćc��S**� A�Ŷ˧�*_� �Y�S* �� �*_� �Y�S� � ��GϸҶA��Y*� ���:*� 5*�� �YSY�S� �S**� 5��� D*�� �YSY�S* �� �**� 5�Ÿ �*_� �Y�S� � �ָڶA�2�8:�:�c:�ݸm�               C�q*�v+� ��x:* �� ���yY6�X*��� ���:* �� ��������Y�<Y�SY�SY�SY�S�������Y6� �*,� M,��,* �� �*_� �Y�S� � ����,��,* �� �**� E� �YS��� ����,��,* �� �**� E� �Y�S��� ����*,������w� � :� �:*,�M��� :� )� i� ��� � #:�� � :� �: �� �������� :!� &� o!�� � #:""��� � :#� #�:$���$**� m�<Y* �� �**� m�Ÿćc��S**� Y�Ŷ˧ �� � :%� %�:&���&*� 'A��Z���Z6��Z���Z6��Z���Z���Z���Z ���Z���Z���Z ��Z��Z��Z�ZZ�LOZOTOZ�u�Z{~�Z�u�Z{~�Z���Z���ZIu�Z{��Z���ZIu�Z{��Z���Z���Z���Z������ ���Z�uZ{�Z�Z$Z )  � '  2'(    2/ �   201   2 �"   2��   2�p   2� &   2�A   2� &   29: 	  2;" 
  2<"   2=:   2>:   2?"   2`"   2a:   2C:   2D"   2E�   2F�   2G�   2�:   2�p   2� &   2�A   2� &   2g:   2P"   2�"   2R:   2S:   2T"    2U" !  2V: "  2W: #  2d" $  2�: %  2" &X  � �  x  x  x  x   x   x  y  y  y  y 
 y 
 y + z + z 3 z 3 z ; z ; z C z C z  z ` { ` { w { w { w { w { w { w { _ { _ { _ { _ { _ { _ { � | � | � | � | � | � | _ { �  �  � � � � � � � � � � � � � �& �& �Z �Z �Z �Z �Z �Z �Z �Z �R � � � � �) �) �) �) �) �) �5 �5 �) �) �; �; �; �; �; �; � � �] �] �] �] �p �p �s �s �v �v �] �] �] �] �I �I �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �T �- �� �� �� �� �� �� � � �� �� � � � � � � �� �� � �I � �  �  *   �     �¸ ȳ �� ȳf� ȳhӸ ȳ�� �YgS�it� ȳv�� ȳ�� �YgS��� �YgS�	� �YgS�0� ȳ2<� ȳ>��Y�<���$�   )       �'(   � *  � 	   ,��Y*� ���:*� )�S� �*� �* �� �*�� �YSY�S� � �* �� �*_� �Y�S� � �**� )�Ÿ�������S**� ��Ÿ�� G*�� �YSY�S* �� �*�� �YSY�S� � �**� ��Ÿ���A*� )**� )�Ÿc�ǶS**� )��* �� �*_� �Y�S� � ����7�t|�����:�:�c:�	�m�   �           C�q*� �=�S*�v+� ��x:* �� ���yY6	�0*��� ���:
* �� �
�����
��Y�<Y�SYSY�SYS����
�
��Y6� �*
,� M,��,* ¶ �**� E� �YS��� ����,��,* ö �**� E� �Y�S��� ����*,��
������ � :� �:*,�M�
�� :� )� i� ��� � #:
�� � :� �:
���������� :� &� o�� � #:��� � :� �:���**� m�<Y* Ƕ �**� m�Ÿćc��S**� Q�Ŷ˧ �� � :� �:���*� �FIZINIZ�o{Zux{Z�o�Zux�Z{��Z���Zko�Zu��Z���Zko�Zu��Z���Z���Z���Z � � ZoZu�Z�ZZ )   �   ,'(    ,/ �   ,01   , �"   ,��   ,��   ,]�   ,�:   ,�p   ,� & 	  ,�A 
  ,� &   ,=:   ,>"   ,?"   ,`:   ,a:   ,C"   ,D"   ,E:   ,F:   ,G"   ,H:   ,d" X  � r  �  �  �  �  � % � % � % � % � E � E � E � E � X � X � X � X � E � E � E � E � % � % � % � % �  � o � o � � � � � � � � � � � � � � � � � � � � � � � � � } � o � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �  �  �I �I �I �I �E �E �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �v �O �� �� �� �� �� �� �� �� �� �� � � � � � � �� �� �   �       �    �