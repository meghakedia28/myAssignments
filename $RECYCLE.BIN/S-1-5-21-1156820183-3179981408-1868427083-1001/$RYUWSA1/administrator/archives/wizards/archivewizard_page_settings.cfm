����  -� 
SourceFile E/CFIDE/administrator/archives/wizards/archivewizard_page_settings.cfm ,cfarchivewizard_page_settings2ecfm1924394919  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   ARCHIVENAME Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   SETTINGSLIST   	   DESELECT_ALL   	    FORM " " 	  $ DESELECTSERVER & & 	  ( 	ISSAFEURL * * 	  , ISSERVERMONITORINGAVAILABLE . . 	  0 	ASETTINGS 2 2 	  4 SELECTSERVER 6 6 	  8 SELECTALLSETTINGS : : 	  < REQUEST > > 	  @ 	URLENCHAR B B 	  D GETADMINVARIANT F F 	  H DESELECTALLSETTINGS J J 	  L 
SELECT_ALL N N 	  P SETTING R R 	  T GETCSRFTOKEN V V 	  X com.macromedia.SourceModTime  [�;�	 pageContext #Lcoldfusion/runtime/NeoPageContext; ] ^	  _ getOut ()Ljavax/servlet/jsp/JspWriter; a b javax/servlet/jsp/JspContext d
 e c parent Ljavax/servlet/jsp/tagext/Tag; g h	  i Cp1252 k setPageEncoding (Ljava/lang/String;)V m n !coldfusion/runtime/NeoPageContext p
 q o 'class$coldfusion$tagext$lang$IncludeTag Ljava/lang/Class; !coldfusion.tagext.lang.IncludeTag u forName %(Ljava/lang/String;)Ljava/lang/Class; w x java/lang/Class z
 { y s t	  } _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag;  �
  � !coldfusion/tagext/lang/IncludeTag � _setCurrentLineNo (I)V � �
  � controludfs.cfm � setTemplate � n
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � LOCALE � REQUEST.LOCALE � en � checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V � �
  � java/lang/String � 
LOCALEFILE � java/lang/StringBuffer � resources/archives_ �  n
 � � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 � � .cfm � toString ()Ljava/lang/String; � � java/lang/Object �
 � � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � WHERETO � FORM.WHERETO �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z � �
  � CAR � ARCHIVES � _resolve � �
  � URL � _arrayGetAt 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; � �
  � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � BASICSETTINGS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
  � clear � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z � �
  � _autoscalarize 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � �
  � ListToArray $(Ljava/lang/String;)Ljava/util/List; � �
  � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray; � �
 � � setArray !(Lcoldfusion/runtime/FastArray;)V � � coldfusion/runtime/Variable �
 � � addAll  _get �
  selectAllSettings 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;
 	 deSelectAllSettings NEXTSTEP FORM.NEXTSTEP _Object (Z)Ljava/lang/Object;
 � _boolean (Ljava/lang/Object;)Z
 � 	isSafeURL 'class$coldfusion$tagext$net$LocationTag !coldfusion.tagext.net.LocationTag t	  !coldfusion/tagext/net/LocationTag  setAddtoken" �
!# 
cflocation% url' _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;)*
 + setUrl- n
!. (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTag10 t	 3 "coldfusion/tagext/lang/ImportedTag5 l10n7 ../../cftags/9 admin; setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V=>
6? &coldfusion/runtime/AttributeCollectionA idC archive_arsetE varG titleI ([Ljava/lang/Object;)V K
BL setAttributecollection (Ljava/util/Map;)VNO  coldfusion/tagext/lang/ModuleTagQ
RP 
doStartTag ()ITU
RV 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;XY
 Z Archive Settings\ write^ n java/io/Writer`
a_ doAfterBodycU
Rd _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;fg
 h doEndTagjU #javax/servlet/jsp/tagext/TagSupportl
mk doCatch (Ljava/lang/Throwable;)Vop
Rq 	doFinallys 
Rt archivewizard_header.cfmv 
select_allx 
Select Allz deselect_all| Deselect All~ $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� t	 � coldfusion/tagext/io/OutputTag�
�V M

<table border="0" cellpadding="1" cellspacing="0" width="100%" bgcolor="#� 
GRAYMEDIUM�3"><tr><td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="white">
<tr valign="top">
	<td height="350">
		<table border="0" cellpadding="0" cellspacing="0" width="20" bgcolor="#888885"><tr><td>
		<table border="0" cellpadding="0" cellspacing="1" width="20">
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#888885"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		<tr bgcolor="#FFFFFF"><td height="20">&nbsp;</td></tr>
		</table>
		</td></tr></table>
	</td>

	<td width="20" nowrap>&nbsp;</td>
	<td width="100%"><br />

<table border="0" cellpadding="0" cellspacing="0" width="100%">
� � �
 � _List $(Ljava/lang/Object;)Ljava/util/List;��
 �� ArrayToList $(Ljava/util/List;)Ljava/lang/String;��
 � set (Ljava/lang/Object;)V��
 �� 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag�� t	 � #coldfusion/tagext/html/form/FormTag� editForm�= n
�� POST� 	setMethod� n
�� cfform� action� CGI� SCRIPT_NAME� ?archivename=� URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;��
 � 	setAction� n
��
�V �
<tr >
	<td>
	<table border="0" cellpadding="0" cellspacing="1" width="100%">
	<tr>
	<td class="cellBlueTopAndBottom" ><input type=submit value="� >" name="selectserver" class="buttn"><input type=submit value="� m" name="deselectserver" class="buttn"></td>
	</tr>
	</table></td>
</tr>
<tr>
	<td height="20" bgcolor="#� 	GRAYLIGHT� S" class="cellBlueTopAndBottom">
	<font class="label">&nbsp; <b class="form-title">� l10n_archset� General Server Settings� �</b></font></td>
</tr>
	<tr>
		<td>
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
			<tr >
				<td width="20" height="20" nowrap bgcolor="#� 	BLUELIGHT� E" class="cellBlueTopAndBottom">&nbsp;</td>
				<th nowrap bgcolor="#� 7" class="cellBlueTopAndBottom"><p class="label">&nbsp; � name� Name� 1 &nbsp;</p></th>
				<th width="100%" bgcolor="#� description� Description� � &nbsp;</p></th>
			</tr>
			<tr >
				<td align="center" class="cell3BlueSides">
					<input type="checkbox" name="setting" value="Server_Settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� ')"
							� server_settings� ListFindNoCase '(Ljava/lang/String;Ljava/lang/String;)I��
 � (J)Z�
 �� checked� � id="server_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="server_settings">� settings� Settings� _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;��
 � �</label> &nbsp;</p></td>
				<td class="cellRightAndBottomBlueSide"><table border="0" cellpadding="7" cellspacing="0"><tr><td>
				<p class="label">
				� server_settings_examples� �Examples: limit the number of simultaneously processed requests; timeout requests
				after X seconds.  See the Settings section of the ColdFusion Administrator for more
				details. �
				</p></td></tr></table></td>
			</tr>
			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Caching" onclick="setFormValue('archivewizard_page_settings.cfm?archivename= Caching z id="caching">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="caching"> caching	 �</label></p></td>
				<td  class="cellRightAndBottomBlueSide"><table border="0" cellpadding="7" cellspacing="0"><tr><td>
				<p class="label">
				 caching_examples }Examples: set template cache size; limit the maximum number of cached queries. See the Caching section
				for more details. �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Basic_Security" onclick="setFormValue('archivewizard_page_settings.cfm?archivename= Basic_Security � id="basic_security">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="basic_security"> basic_security Basic Security _factor1�
  basic_security_examples �Examples: enable and assign ColdFusion Administrator/Studio passwords; restrict use of certain tags. See the
				Basic Security section for more details.  �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Variables" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=" 	Variables$ ~ id="variables">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="variables">& 	variables( variables_examples* YExamples: enable client and memory variables. See the Variables section for more details., 2
				</p></td></tr></table></td>
			</tr>

			. getAdminVariant0 
standalone2 _compare '(Ljava/lang/Object;Ljava/lang/String;)D45
 6 jrun8 �
			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Java" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=: Java< t id="java">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="java">> java_jvm@ Java and JVMB java_examplesD �Examples: specify the JVM location; specify JVM arguments. For more information, see the online Help for the Java &amp; JVM page.F /<br>
				<br>
				<font color="993300">
				H java_warningJ �<b>WARNING:</b> The Java settings contain system-specific paths that are used to start ColdFusion. If you deploy these settings to another machine and the paths are invalid, ColdFusion will fail to start.L =
				</font>
				</p></td></tr></table></td>
			</tr>
			N _factor2P�
 Q �
			

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Logging" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=S LoggingU z id="logging">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="logging">W loggingY logging_examples[ �Examples: set the server administrator e-mail address; log the names of pages that take over a
				specified length of time to return. See the Logging section for more details.] �
				</p></td></tr></table></td>
			</tr>

			<tr >
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Mail" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=_ Maila t id="mail">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="mail">c maile mail_examplesg {Examples: specify the mail server; log all e-mail messages sent by ColdFusion. See the Mail section
				 for more details.i _factor3k�
 l �
				 </p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Debugging" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=n 	Debuggingp ~ id="debugging">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="debugging">r 
debugging1t debugging_examplesv �Examples: display the names and values of all CGI, URL, form, and cookie variables; display
				detailed processing time; See the Debugging section for more details.x �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="Charting" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=z Charting| | id="charting">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="charting">~ 	debugging� charting_examples� fExamples: How many charts to cache,  maximum number of charting threads, cache location, type of cache� _factor4��
 � �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="customtags" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� 
customtags� � id="customtags">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� customtagpaths� Custom Tag Paths� customtagpaths_examples� &Examples: The custom tag path settings� �
				</p></td></tr></table></td>
			</tr>

			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="watch" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� watch� { id="watch">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� watcher� Watcher Settings� watcher_examples� jExamples: Causes ColdFusion to watch its configuration files and automatically reload them if they change.� _factor5��
 � 0
				</p></td></tr></table></td>
			</tr>
			� IsServerMonitoringAvailable� �
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="monitoring" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� 
monitoring� � id="monitoring">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� Server Monitor Settings� monitoring_examples� !Examples: Server monitor Settings� �
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="probe" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� probe� { id="probe">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� System Probes� probe_examples� {Examples: System probes can monitor the health of a web application by checking the contents of a URL at a regular interval� _factor6��
 � �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="updates" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� updates� } id="updates">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="customtags">� Update Settings� updates_examples� RExamples: Update site URL, auto check for updates, update email notifications etc.� �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="websocket_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� websocket_settings� � id="websocket_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="websocket_settings">� 
websockets� Web Sockets� LExamples: Update websocket properties like sockettime, port maxframesize etc� _factor7��
 � �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="webservice_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� webservice_settings� � id="webservice_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="webservice_settings">� 
webservice� Web Service� Examples: Web Services Version� �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="pdfservice_settings" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� pdfservice_settings� � id="pdfservice_settings">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="pdfservice_settings">� 
pdfservice� PDF Service� ?Examples: Enable using webkit implementation for PDF conversion� _factor8��
 � �
				</p></td></tr></table></td>
			</tr>
			<tr>
				<td align="center" class="cell3BlueSides"><input type="checkbox" name="setting" value="remoteinspection" onclick="setFormValue('archivewizard_page_settings.cfm?archivename=� remoteinspection� � id="remoteinspection">
				</td>
				<td nowrap class="cellRightAndBottomBlueSide"><p class="label">&nbsp; <label for="remoteinspection"> remoteinspect Remote Inspection Settings ,Examples: Enable Remote Inspection settings  x
				</p></td></tr></table></td>
			</tr>
			</table>
		</td>
	</tr>
<input type="hidden" name="csrftoken" value="	 getcsrftoken ARCHIVETABKEYNAME �">
<input type="Hidden" name="whereto" value="archivewizard_page_settings.cfm">
<input type="Hidden" name="nextStep" value="archivewizard_page_todolist.cfm?archivename= f">
<input type="Hidden" name="previousStep" value="archivewizard_page_scheduledtasks.cfm?archivename= ">

�d
�k
�q
�t _factor9�
  h
	</table>
				<br><br><br>
</td><td width="20" nowrap>&nbsp;</td></tr></table>
</td></tr></table>

�d coldfusion/tagext/QueryLoop
 k
 q
�t 	_factor10$�
 % archivewizard_footer.cfm' metaData Ljava/lang/Object;)*	 + getMetadata ()Ljava/lang/Object; this .Lcfarchivewizard_page_settings2ecfm1924394919; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; value include0 #Lcoldfusion/tagext/lang/IncludeTag; 	location2 #Lcoldfusion/tagext/net/LocationTag; module3 $Lcoldfusion/tagext/lang/ImportedTag; mode3 I t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 include4 module5 mode5 t17 t18 t19 t20 t21 t22 module6 mode6 t25 t26 t27 t28 t29 t30 output48  Lcoldfusion/tagext/io/OutputTag; mode48 t33 t34 t35 t36 t37 LineNumberTable java/lang/Throwabled module41 mode41 t6 t7 module42 mode42 t14 t15 t16 module43 mode43 t23 t24 module44 mode44 t31 t32 form47 %Lcoldfusion/tagext/html/form/FormTag; mode47 module45 mode45 module46 mode46 module33 mode33 module34 mode34 module35 mode35 module36 mode36 module37 mode37 module38 mode38 module39 mode39 module40 mode40 module7 mode7 module8 mode8 module9 mode9 module10 mode10 module11 mode11 module12 mode12 module13 mode13 module14 mode14 runPage 	include49 module25 mode25 module26 mode26 module27 mode27 module28 mode28 module29 mode29 module30 mode30 module31 mode31 module32 mode32 module15 mode15 module16 mode16 module17 mode17 module18 mode18 module19 mode19 t38 t39 t40 t41 t42 t43 module20 mode20 t46 t47 t48 t49 t50 t51 <clinit> module21 mode21 module22 mode22 module23 mode23 module24 mode24 1                      "     &     *     .     2     6     :     >     B     F     J     N     R     V     s t    t   0 t   � t   � t   )*    -. 2   "     �,�   1       /0      2       �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y�   1        �/0     �34    �56     2   #     *� 
�   1       /0   $� 2  
  &  B*� ~+� �� �:*� ��� �� �� �� �**� A���� �*?� �Y�S� �Y�� �*?� �Y�S� �� �� ��� �� �� �**� %�ɶ ͙�*� �***?� �Y�SY�S� �*�� �YS� �� ڸ �� �Y�S� ��� �� �W**� U� � t*� 5*� �**� U� � �� �� �� �*� �***?� �Y�SY�S� �*�� �YS� �� ڸ �� �Y�S� �� �Y**� 5� �S� �W**� 9� � +*� �**� =�*� �Y**� � �S�
W� �**� )� � +*"� �**� M�*� �Y**� � �S�
W� �**� %� ͸Y�� 0W*%� �**� -�*� �Y*#� �YS� �S�
�� O*�+� ��!:*&� ��$&(*#� �YS� �� ��,�/� �� �� �*�4+� ��6:*+� �8:<�@�BY� �YDSYFSYHSYJS�M�S� ��WY6� 6*,�[M,]�b�e���� � :� �:	*,�iM�	�n� :
� #
�� � #:�r� � :� �:�u�*� ~+� �� �:*,� �w� �� �� �� �*�4+� ��6:*.� �8:<�@�BY� �YDSYySYHSYyS�M�S� ��WY6� 6*,�[M,{�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�*�4+� ��6:*/� �8:<�@�BY� �YDSY}SYHSY}S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�*��0+� ���:*1� �� ���Y6 � &*,�� :!� D!�,�b�����!� :"� #"�� � #:##�"� � :$� $�:%�#�%*�  ���e���e���e���e���e���e���e���e���e���e���e���e���e���e���e���eTpsesxseI��e���eI��e���e���e���e�� e� e e��/e�/e/e ,/e/4/e 1  ~ &  B/0    B7 h   B89   B:*   B;<   B=>   B?@   BAB   BCD   BE* 	  BF* 
  BGD   BHD   BI*   BJ<   BK@   BLB   BMD   BN*   BO*   BPD   BQD   BR*   BS@   BTB   BUD   BV*   BW*   BXD   BYD   BZ*   B[\   B]B    B^* !  B_* "  B`D #  BaD $  Bb* %c  > �           4  4  I  I  N  N  N  N  c  c  E  E  E  E  9  9  o  o  o  o  s  s  u  u  n  n  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  � 	 	 3 3  �  �  �  �  � A A A A @ @ Q Q c c Q Q Q Q t  t  t  t  s  s  � "� "� "� "� "� "� "� !� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� %� % & & & &� &� %� $s  @  n r +r +~ +~ += + , , ,e .e .q .q .0 .- /- /9 /9 /� /� 1 �� 2  4  $  �,�b,*#� �*�� �YS� �� �**� E� � ����b,�b*$� �**� � � ��텸� 
,�b,�b*�4)+� ��6:*&� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4*+� ��6:*)� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b,*-� �*�� �YS� �� �**� E� � ����b,�b*.� �**� � � ��텸� 
,�b,�b*�4++� ��6:*0� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4,+� ��6:*3� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � �e � e � �e � eee|��e���eq��e���eq��e���e���e���e���e���e���e���e���e���e���e���ec�e���eX��e���eX��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   �f@   �gB   �hD   �i*   �C*   �ED 	  �FD 
  �G*   �j@   �kB   �lD   �m*   �n*   �MD   �ND   �O*   �o@   �pB   �RD   �q*   �r*   �UD   �VD   �W*   �s@   �tB   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8 # # # # !# !# !# !# # # # # # @$ @$ @$ @$ K$ K$ @$ @$ @$ �& �& f&a)a)*)�-�-�-�-----�-�-�-�-�-'.'.'.'.2.2.'.'.'.�0�0M0H3H33 � 2  	�  %  �,��b,*?� �Y�S� �� ��b,��b*� *P� �**?� �Y�SY�S� �*�� �YS� �� ڸ �� �Y�S��������*,���*��/+� ���:*Q� ���������� �Y*�� �Y�S� �� �� ��� �*Q� �*�� �YS� �� �**� E� � ���� �� ��,��� ���Y6��*,�[M*,��� :�r���*,�� :�[���*,�R� :�D�|�*,�m� :	�-�e	�*,��� :
��N
�*,��� :���7�*,��� :�� �*,��� :�Ѩ	�*,��� :�����,��b,*7� �*�� �YS� �� �**� E� � ����b,�b*8� �**� � � � �텸� 
,�b,�b*�4-� ��6:*:� �8:<�@�BY� �YDSYS�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� )������ � #:�r� � :� �:�u�,�b*�4.� ��6:*=� �8:<�@�BY� �YDSY S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� )� �#�� � #:�r� � :� �:�u�,
�b,*C� �**� Y�*� �Y*?� �YS� �S�
� ��b,�b,*E� �*�� �YS� �� �**� E� � ����b,�b,*F� �*�� �YS� �� �**� E� � ����b,�b����� � :� �: *,�iM� �� :!� #!�� � #:""�� � :#� #�:$��$*� 9���e���e���e���e���e���e���e���ee��e���eZ��e���eZ��e���e���e���e#�e):�e@Q�eWh�en�e���e���e���e���e���e���e���e���e �#�e):�e@Q�eWh�en�e���e���e���e���e���e���e���e���e �#�e):�e@Q�eWh�en�e���e���e���e���e���e���e���e���e���e���e 1  t %  �/0    �7 h   �89   �:*   �wx   �yB   �h*   �i*   �C*   �E* 	  �F* 
  �G*   �H*   �I*   �l*   �z@   �{B   �MD   �N*   �O*   �PD   �QD   �R*   �|@   �}B   �UD   �V*   �W*   �XD   �YD   �Z*   �uD   �v*    �^* !  �_D "  �`D #  �a* $c  � k  3  3  3  3  3 0 P 0 P D P D P / P / P / P / P / P / P / P / P % P % P � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q � Q�7�7�7�77777�7�7�7�7�7!8!8!8!8,8,8!8!8!8::G:J=J==�C�C�C�C�C�C�C�C�C E E E E2E2E2E2E E E E EERFRFRFRFdFdFdFdFRFRFRFRFJF v Q �� 2  v  $  �,��b* �� �**� 1��*� ��
���,��b,* �� �*�� �YS� �� �**� E� � ����b,�b* �� �**� � � ���텸� 
,�b,��b*�4!+� ��6:* �� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4"+� ��6:* � �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,��b,��b,*� �*�� �YS� �� �**� E� � ����b,�b*� �**� � � ���텸� 
,�b,��b*�4#+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4$+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,öb�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � �e �*e$'*e �9e$'9e*69e9>9e���e���e���e���e���e���e���e��e���e���e�ee�'e'e$'e','e���e���e���e���e���e���e���e���e 1  j $  �/0    �7 h   �89   �:*   �~@   �B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � =  �  �  �  � 6 � 6 � 6 � 6 � H � H � H � H � 6 � 6 � 6 � 6 � . � g � g � g � g � r � r � g � g � g � � � � � � �� � Q   �$$$$6666$$$$UUUU``UUU��{vv? �� 2  4  $  �,ȶb,*� �*�� �YS� �� �**� E� � ����b,�b*� �**� � � �ʸ텸� 
,�b,̶b*�4%+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,ζb�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4&+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,Ҷb�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,Զb,*� �*�� �YS� �� �**� E� � ����b,�b*� �**� � � �ָ텸� 
,�b,ضb*�4'+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,ܶb�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4(+� ��6:*� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,޶b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � �e � e � �e � eee|��e���eq��e���eq��e���e���e���e���e���e���e���e���e���e���e���ec�e���eX��e���eX��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8     ! ! ! !      @ @ @ @ K K @ @ @ � � faa*���������''''22'''��MHH �� 2  �  $  ,Ŷb,**� Q� � ��b,Ƕb,**� !� � ��b,ɶb,*?� �Y�S� �� ��b,Ͷb*�4+� ��6:*\� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,Ѷb�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,Ӷb,*?� �Y�S� �� ��b,׶b,*?� �Y�S� �� ��b,ٶb*�4+� ��6:*c� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,ݶb�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,߶b,*?� �Y�S� �� ��b,ٶb*�4	+� ��6:*d� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b,*h� �*�� �YS� �� �**� E� � ����b,�b*i� �**� � � ��텸� 
,�b,��b*�4
+� ��6:*k� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � � �e � � �e � � �e � � �e � � �e � �e���e���e���e���e���e���e���e� �e���e���ew��e���ew��e���e���e���e���e���e���e���e���e���e���e��e 1  j $  /0    7 h   89   :*   �@   �B   hD   i*   C*   ED 	  FD 
  G*   �@   �B   lD   m*   n*   MD   ND   O*   �@   �B   RD   q*   r*   UD   VD   W*   �@   �B   ZD   u*   v*    ^D !  _D "  `* #c   @  V  V  V  V  V  V  V  V  V  V 4 [ 4 [ 4 [ 4 [ 3 [ � \ � \ Q \ b b b b b3 c3 c3 c3 c2 c� c� cP c d d d d dg dg d1 d� h� h� h� h h h h h� h� h� h� h� h+ i+ i+ i+ i6 i6 i+ i+ i+ i� k� kQ k � 2  /  $  �,��b*�4+� ��6:*n� �8:<�@�BY� �YDSY S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b,*t� �*�� �YS� �� �**� E� � ����b,�b*u� �**� � � ��텸� 
,�b,�b*�4+� ��6:*w� �8:<�@�BY� �YDSY
S�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4+� ��6:*z� �8:<�@�BY� �YDSYS�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b,* �� �*�� �YS� �� �**� E� � ����b,�b* �� �**� � � ��텸� 
,�b,�b*�4+� ��6:* �� �8:<�@�BY� �YDSYS�M�S� ��WY6� 6*,�[M,�b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   X t we w | we M � �e � � �e M � �e � � �e � � �e � � �ex��e���em��e���em��e���e���e���e;WZeZ_Ze0z�e���e0z�e���e���e���e^z}e}�}eS��e���eS��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8 = n = n  n � t � t � t � t � t � t � t � t � t � t � t � t � t u u u u u u u u u] w] w' w  z  z� z� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �C �C � � �. 2   �     Z*� `� fL*� jN*� `l� r*-+�&� �*+���*� ~1-� �� �:*M� �(� �� �� �� ��   1   4    Z/0     Z89    Z:*    Z g h    Z�< c     BM BM *M   �� 2  4  $  �,o�b,* Ͷ �*�� �YS� �� �**� E� � ����b,�b* ζ �**� � � �q�텸� 
,�b,s�b*�4+� ��6:* ж �8:<�@�BY� �YDSYuS�M�S� ��WY6� 6*,�[M,q�b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4+� ��6:* Ӷ �8:<�@�BY� �YDSYwS�M�S� ��WY6� 6*,�[M,y�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,{�b,* ٶ �*�� �YS� �� �**� E� � ����b,�b* ڶ �**� � � �}�텸� 
,�b,�b*�4+� ��6:* ܶ �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,}�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4+� ��6:* ߶ �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � �e � e � �e � eee|��e���eq��e���eq��e���e���e���e���e���e���e���e���e���e���e���ec�e���eX��e���eX��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8  �  �  �  � ! � ! � ! � ! �  �  �  �  �  � @ � @ � @ � @ � K � K � @ � @ � @ � � � � � f �a �a �* �� �� �� �� � � � � �� �� �� �� �� �' �' �' �' �2 �2 �' �' �' �� �� �M �H �H � � �� 2  4  $  �,��b,* � �*�� �YS� �� �**� E� � ����b,�b* � �**� � � ���텸� 
,�b,��b*�4+� ��6:* � �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4+� ��6:* � �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,��b,* � �*�� �YS� �� �**� E� � ����b,�b* � �**� � � ���텸� 
,�b,��b*�4+� ��6:* � �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4 +� ��6:* �� �8:<�@�BY� �YDSY�S�M�S� ��WY6� 6*,�[M,��b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � �e � e � �e � eee|��e���eq��e���eq��e���e���e���e���e���e���e���e���e���e���e���ec�e���eX��e���eX��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8  �  �  �  � ! � ! � ! � ! �  �  �  �  �  � @ � @ � @ � @ � K � K � @ � @ � @ � � � � � f �a �a �* �� �� �� �� � � � � �� �� �� �� �� �' �' �' �' �2 �2 �' �' �' �� �� �M �H �H � � P� 2  
�  4  �,�b*�4+� ��6:* �� �8:<�@�BY� �YDSYS�M�S� ��WY6� 6*,�[M,!�b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,#�b,* �� �*�� �YS� �� �**� E� � ����b,�b* �� �**� � � �%�텸� 
,�b,'�b*�4+� ��6:* �� �8:<�@�BY� �YDSY)S�M�S� ��WY6� 6*,�[M,%�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4+� ��6:* �� �8:<�@�BY� �YDSY+S�M�S� ��WY6� 6*,�[M,-�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,/�b* �� �**� I�1*� ��
3�7�~��Y�� -W* �� �**� I�1*� ��
9�7�~�����,;�b,* �� �*�� �YS� �� �**� E� � ����b,�b* �� �**� � � �=�텸� 
,�b,?�b*�4+� ��6:* �� �8:<�@�BY� �YDSYAS�M�S� ��WY6� 6*,�[M,C�b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#,�b*�4+� ��6:$* �� �$8:<�@$�BY� �YDSYES�M�S$� �$�WY6%� 6*$%,�[M,G�b$�e���� � :&� &�:'*%,�iM�'$�n� :(� #(�� � #:)$)�r� � :*� *�:+$�u�+,I�b*�4+� ��6:,* �� �,8:<�@,�BY� �YDSYKS�M�S,� �,�WY6-� 6*,-,�[M,M�b,�e���� � :.� .�:/*-,�iM�/,�n� :0� #0�� � #:1,1�r� � :2� 2�:3,�u�3,O�b*� 0 Y u xe x } xe N � �e � � �e N � �e � � �e � � �e � � �e|��e���eq��e���eq��e���e���e���e@\_e_d_e5�e���e5�e���e���e���e���e���e�	ee�	$e$e!$e$)$e���e���e���e���e���e���e���e���eRnqeqvqeG��e���eG��e���e���e���e 1  
 4  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #  ��@ $  ��B %  ��D &  ��* '  ��* (  ��D )  ��D *  ��* +  ��@ ,  ��B -  ��D .  ��* /  ��* 0  ��D 1  ��D 2  ��* 3c  V U > � > �  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �a �a �* �% �% �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �! �! �! �! �3 �3 �3 �3 �! �! �! �! � �R �R �R �R �] �] �R �R �R �� �� �x �s �s �< �7 �7 �  �� � �  2   Y     ;v� |� ~� |�2� |�4�� |���� |���BY� ��M�,�   1       ;/0   k� 2  4  $  �,T�b,* �� �*�� �YS� �� �**� E� � ����b,�b* �� �**� � � �V�텸� 
,�b,X�b*�4+� ��6:* �� �8:<�@�BY� �YDSYZS�M�S� ��WY6� 6*,�[M,V�b�e���� � :� �:*,�iM��n� :� #�� � #:		�r� � :
� 
�:�u�,�b*�4+� ��6:* �� �8:<�@�BY� �YDSY\S�M�S� ��WY6� 6*,�[M,^�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,`�b,* �� �*�� �YS� �� �**� E� � ����b,�b* ¶ �**� � � �b�텸� 
,�b,d�b*�4+� ��6:* Ķ �8:<�@�BY� �YDSYfS�M�S� ��WY6� 6*,�[M,b�b�e���� � :� �:*,�iM��n� :� #�� � #:�r� � :� �:�u�,�b*�4+� ��6:* Ƕ �8:<�@�BY� �YDSYhS�M�S� ��WY6� 6*,�[M,j�b�e���� � :� �:*,�iM��n� : � # �� � #:!!�r� � :"� "�:#�u�#*�   � � �e � � �e � �e � e � �e � eee|��e���eq��e���eq��e���e���e���e���e���e���e���e���e���e���e���ec�e���eX��e���eX��e���e���e���e 1  j $  �/0    �7 h   �89   �:*   ��@   ��B   �hD   �i*   �C*   �ED 	  �FD 
  �G*   ��@   ��B   �lD   �m*   �n*   �MD   �ND   �O*   ��@   ��B   �RD   �q*   �r*   �UD   �VD   �W*   ��@   ��B   �ZD   �u*   �v*    �^D !  �_D "  �`* #c   � 8  �  �  �  � ! � ! � ! � ! �  �  �  �  �  � @ � @ � @ � @ � K � K � @ � @ � @ � � � � � f �a �a �* �� �� �� �� � � � � �� �� �� �� �� �' �' �' �' �2 �2 �' �' �' �� �� �M �H �H � �       Z    [