����  -� 
SourceFile 4/CFIDE/administrator/cftags/resources/monitor_en.cfm cfmonitor_en2ecfm224105656  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CALLER   	   BSUCCESS   	    com.macromedia.SourceModTime  [�;� pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	  1 	ISO8859_1 3 setPageEncoding (Ljava/lang/String;)V 5 6 !coldfusion/runtime/NeoPageContext 8
 9 7 3class$coldfusion$tagext$lang$ProcessingDirectiveTag Ljava/lang/Class; -coldfusion.tagext.lang.ProcessingDirectiveTag = forName %(Ljava/lang/String;)Ljava/lang/Class; ? @ java/lang/Class B
 C A ; <	  E _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; G H
  I -coldfusion/tagext/lang/ProcessingDirectiveTag K _setCurrentLineNo (I)V M N
  O setSuppresswhitespace (Z)V Q R
 L S 	hasEndTag U R coldfusion/tagext/GenericTag W
 X V 
doStartTag ()I Z [
 L \ $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag _ ^ <	  a coldfusion/tagext/io/SilentTag c
 d \ 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; f g
  h doAfterBody j [
 X k _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; m n
  o doEndTag q [ #javax/servlet/jsp/tagext/TagSupport s
 t r doCatch (Ljava/lang/Throwable;)V v w
 X x 	doFinally z 
 X { 	__HTSWT_0 Lcoldfusion/util/FastHashtable; } ~	   java/lang/String � ID � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I � �
  � ColdFusion Administrator � write � 6 java/io/Writer �
 � � $Server has been updated successfully � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � 7Invalid snapshot file or snapshot file does not exist : � \
Flash remoting should be enabled to run either of Server Monitor or Multiserver Monitor.
 � %Server Monitoring &gt; Server Monitor ��
The Server Monitor is an Adobe Flash application that provides information about ColdFusion server operation. To use the Server Monitor, you must have Adobe Flash Player 9 installed.<br>
<br>
Use the buttons at the top of the Server Monitor to do the following:
&nbsp;&nbsp;&nbsp;&nbsp;<table cellpadding="0" cellspacing="0">
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Start Monitoring - Turns on all monitoring.</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Start Profiling - Turns on monitoring of all tags, functions, and query execution times.</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Start Memory Tracking - Turns on tracking of memory by different scopes. If Profiling is also on, tracks memory used by individual tags, functions, and queries.</td></tr>
</table>
<br>
Memory usage information displayed in the Server Monitor is estimated and may vary from actual memory usage. Use the information as an indicator rather than an absolute measure.<br>
 � D
Click the button on the right to launch the Server Monitor ...
   � Launch Server Monitor � *Server Monitoring &gt; Multiserver Monitor �H
The Multiserver Monitor is an Adobe Flash application that you can use to remotely monitor multiple ColdFusion instances. To use the Multiserver Monitor, you must have Adobe Flash Player 9 installed.<br>
<br>
Use the tabs at the top of the Multiserver Monitor to do the following:
&nbsp;&nbsp;&nbsp;&nbsp;<table cellpadding="0" cellspacing="0">
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Quick View - Displays the status of all registered servers in an icon view format.</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Detailed View - Displays the status of all registered servers in a tabular format.</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Add Server - Displays the registration panel for adding new servers.</td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;Errors - Displays the last connection error for each registered server.</td></tr>
</table>
 � G
Click the button on the right to launch the Multiserver Monitor ...
 � Launch Multiserver Monitor � Server Manager � �
The Server Manager is an AIR application which allows management of multiple servers.
You can download this application from the <a href="http://www.adobe.com/go/cf_downloads"> ColdFusion downloads</a> page.
<br>
 � M
Click the button on the right to launch the ColdFusion Server Manager ...
 � Launch Server Manager � �
                  This content requires the Adobe Flash Player. <a href=http://www.adobe.com/go/getflash/>Get Flash
                 � Monitoring Settings � Server Monitoring &gt; Settings � Enable Monitoring � c
When checked, indicates that monitoring is enabled. 
If unchecked, it will disable monitoring.
 � Enable Profiling � a
When checked, indicates that profiling is enabled. 
If unchecked, it will disable profiling.
 � Enable Memory Tracking � m
When checked, indicates that memory tracking is enabled. 
If unchecked, it will disable memory tracking.
 � Monitoring Server Settings � Enable Monitoring Server � �
When checked, indicates that separate monitoring server is enabled. 
If unchecked, it will disable separate monitoring server.
 � Monitoring Server Port  � SThere was an error while setting up the server. Please check logs for more details. � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � <	  � coldfusion/tagext/io/OutputTag �
 � \ 2
Unable to update template handler information.
 � CFCATCH � MESSAGE � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String; � �
  � <br />
 � DETAIL �
 � k coldfusion/tagext/QueryLoop �
 � r
 � x
 � { false � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
  � coldfusion/runtime/SwitchTable
 	 MS_MONITORINGSERVER_ENABLE_TIP addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;
	 MS_ERROR_TMPUPD SERVERMONITOR REMOTEMONITOR LAUNCH_SMANAGER MS_PAGENAME MS_MONITORINGSERVER_ENABLE 	LAUNCH_SM LAUNCH_MULTISERVER_MONITOR SERVERMANAGER ALTERNATECONTENT_CF MONITORINGSETTINGS_HEADER 
LAUNCH_MSM! MEMORYTRACKING_ENABLE_TIP# IMPORTANT_NOTICE% MEMORYTRACKING_ENABLE' CLICK_NORMAL) LAUNCH_SERVER_MONITOR+ INVALIDSNAPSHOTFILE- MS_PROFILING_ENABLE_TIP/ MS_MONITOR_ENABLE1 CLICK_RETURN3 SUBMIT_CHANGES5 MS_MONITOR_ENABLE_TIP7 LAUNCH_SERVER_MANAGER9 ALERT; MONITORING-SERVER-PORT= MONITORINGSERVERSETTINGS_HEADER? PAGEHEADER_CLIENTVARS1_MULTIA MS_PROFILING_ENABLEC DEFAULT_PAGENAMEE ERROR_SETTINGSG STATMESSI FLASH_REMOTING_DISABLEDK PAGEHEADER_CLIENTVARS3M PAGEHEADER_CLIENTVARS2O PAGEHEADER_CLIENTVARS1Q 
S _whitespace %(Ljava/io/Writer;Ljava/lang/String;)VUV
 W
 L x
 L { metaData Ljava/lang/Object;[\	 ] &coldfusion/runtime/AttributeCollection_ java/lang/Objecta ([Ljava/lang/Object;)V c
`d getMetadata ()Ljava/lang/Object; this Lcfmonitor_en2ecfm224105656; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective2 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode2 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 t20 t21 t22 t23 LineNumberTable java/lang/Throwable� <clinit> 1                      ; <    ^ <    } ~    � <   [\    fg k   "     �^�   j       hi      k   ]     +*+,� **+,� � **+,� � **+,� � !�   j        +hi     +lm    +no  pg k  �    �*� (� .L*� 2N*� (4� :*� F-� J� L:*� P� T� Y� ]Y6�t*� b� J� d:*� P� Y� eY6� /*+� iL� l���� � :� �:	*+� pL�	� u� :
� &�@
�� � #:� y� � :� �:� |�� �**� � �Y�S� �� ��  �       $   �   �   �   �   �   �   �   �   �   �   �          (  1  :  C  L  U  ^  g  p  y  �  �  �  �  �  �  �  �  �  �  �  �+�� ��+�� ��+�� ��+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ��~+�� ��u+�� ��l+�� ��c+�� ��Z+�� ��Q+�� ��H+�� ��?+ö ��6+Ŷ ��-+Ƕ ��$+ɶ ��+˶ ��+Ͷ ��	+϶ �� +Ѷ �� �+Ӷ �� �+ն �� �+׶ �� �*� �� J� �:* �� P� Y� �Y6� k+� �+* �� P**� � �Y�SY�S� �� � � �+� �+* �� P**� � �Y�SY�S� �� � � �+� �� ����� �� :� &� z�� � #:� �� � :� �:� ��� *� !��� *+T�X� l���� u� :� #�� � #:�Y� � :� �:�Z��  e z }� } � }� Z � �� � � �� Z � �� � � �� � � �� � � ���fr�lor��f��lo��r~������ 5 ��� �f��l������� 5 ��� �f��l��������������� j   �   �hi    �qr   �s\   � / 0   �tu   �vw   �xy   �zw   �{|   �}\ 	  �~\ 
  �|   ��|   ��\   ���   ��w   ��\   ��|   ��|   ��\   ��\   ��|   ��|   ��\ �   G @  �  �  �  � � � � � � �  � "� $� &� *� ,� 9� =� ? A M Q S& U/ [8 _A aJ eS g\ ie kn mw r� t� y� {� �� �� �� �� �� �� �� �� �� �� �� �� �� �* �* �* �* �* �* �* �* �" �� �� �� �� �� �� �� �� �� � �         k   #     *� 
�   j       hi   �  k  q    S>� D� F`� D� bڸ D� ܻY�!�
$�

�
�
�
�
 �
�
�
�
�
 �
"�
$�
&�
(�
*�
,�
.�
0�
2�
4�
6�
8�
:�
<�
>"�
@�
B�
D�
F�
H#�
J�
L�
N�
P�
R	�
� ��`Y�b�e�^�   j      Shi         "    #