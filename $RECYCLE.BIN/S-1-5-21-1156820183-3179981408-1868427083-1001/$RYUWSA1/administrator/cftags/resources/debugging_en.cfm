����  -� 
SourceFile 6/CFIDE/administrator/cftags/resources/debugging_en.cfm cfdebugging_en2ecfm1776510547  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   CALLER   	   BSUCCESS   	    com.macromedia.SourceModTime  [�;�a pageContext #Lcoldfusion/runtime/NeoPageContext; % &	  ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
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
 � � $Server has been updated successfully � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � Debug Output Settings � 2Debugging &amp; Logging &gt; Debug Output Settings � #Enable Robust Exception Information �"
Allow visitors to see the following information in the exceptions page:
<ul>
<li>Physical path of template</li>
<li>URI of template</li>
<li>Line number and line snippet</li>
<li>SQL statement used (if any)</li>
<li>Data source name (if any)</li>
<li>Java stack trace</li>
</ul>
 � Enable AJAX Debug Log Window � �
Allows display of the AJAX debug log window when the cfdebug flag is passed
in the URL. If you disable this option, the AJAX debug log window does not
display, even if the cfdebug flag is specified.
 � Enable Request Debugging Output � �
Enables the page-level debugging output on CFML pages.
Uncheck this box to override all of the settings below.
Debugging information is appended to the end of each request.
 � Custom Debugging Output � Select Debugging Output Format �K
ColdFusion offers several debugging output formats: <br />
<b>classic.cfm</b> - The format available in ColdFusion 5 and earlier. It provides a basic view and few browser restrictions. <br />
<b>dockable.cfm</b> - A dockable tree-based debugging panel. For details about the panel and browser restrictions, see the online Help. � Report Execution Times � 5Highlight templates taking longer than the following  � 1(in milliseconds) using the following output mode � summary � tree �
Execution times for templates, includes, modules, custom tags, and component method calls. Template execution times over this minimum highlight time appear in red. The default is 250 ms. ColdFusion offers the following template modes:
<br />
<b>summary</b> - A summary of each page called. Columns include Total Time, Avg Time, Count, and Template. Sorted by highest total time. <br />
<b>tree</b> - Hierarchical tree view of individual page executions. <i>Note: Processing time and output will be longer than summary.</i>
 � General Debug Information � �
Select this option to show general information about this request.
General items are ColdFusion Server Version, Template, Time Stamp, User Locale, User Agent, User IP, and Host Name.
 � Database Activity � �
Select this option to show the database activity for the SQL Query events and Stored Procedure events in the debugging output.
 � Exception Information � k
Select this option to collect all ColdFusion exceptions raised for the request in the debugging output.
 � Tracing Information � �
Select this option to show trace event information in the debugging output.
Tracing lets a developer track program flow and efficiency through the use of the CFTRACE tag.
 � Timer Information � �
Select this option to show timer event information in the debugging output.
Timers let a developer track the execution time of the code between the start and end tags of the CFTIMER tag.
 � 	Variables � T
Select this option to enable variable reporting. Select the following variables:
 � Application � Cookie � Server � CGI � Form � Session � Client � Request � URL � Enable Performance Monitoring � �
Select this option so the standard NT Performance Monitor application shows information about a running ColdFusion application server.
 � Enable Metrics Logging � <
Select this option to enable ColdFusion Metrics Logging.
 � Metrics Frequency � <
The ColdFusion Metrics will be logged at this frequency.
 � Enable CFSTAT �
The cfstat command-line utility provides real-time performance metrics for ColdFusion.
Using a socket connection to obtain metric data, cfstat displays the information
that ColdFusion writes to System Monitor without actually using the System Monitor application.
 � Connector Port � s
The cfstat command-line utility performance metrics for ColdFusion will read performance metrics for this port.
 � >For these changes to take effect, you must restart ColdFusion.  �Enabling request debugging is not recommended for secure profile. If enabled site-wide error handler will be switched to the default one. Click OK to proceed. Debugging IP Address 3Debugging &amp; Logging &gt; Debugging IP Addressesb
Specify the IP addresses that should receive debugging messages, including messages for the
AJAX Debug Log window.
To include an IP address in the list, enter the address and click Add.
To delete an IP address from the list, select the address and click Remove Selected.
When no IP addresses are selected, all users receive debugging information.
 $Select IP Addresses for Debug Output
 
IP Address Add Add Current 4View / Remove Selected IP Addresses for Debug Output Remove Selected bTo ensure that the changes that you specify on this page take effect, you must restart ColdFusion. hWarning: Specifying a debugger port that is already in use prevents the ColdFusion server from starting. Debugger Settings .Debugging &amp; Logging &gt; Debugger Settings Line Debugger Settings Allow Line Debugging  Debugger Port:" �You must specify this debugger port in the JVM settings of your application server, for example:
 <br>-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=$ , and restart the server.& (Maximum Simultaneous Debugging Sessions:( Debugging Server*The debugging server runs as a process separate from the ColdFusion Server. 
You can start, stop or restart the debugging server from this page, however, this is usually not necessary because the debug process is managed automatically when a debug session is started., Start Debugger Server. Stop Debugger Server0 Restart Debugger Server2 �Enable the Allow Line Debugging option to use the ColdFusion Debugger that runs in Eclipse(ColdFusion Builder). Specify the port and the maximum number of simultaneous debugging sessions.4 �The port number that you specifed for the debugger is currently being used, possibly by the ColdFusion debugger. If you use this port for any purpose other than debugging this ColdFusion server, enter an available port number and restart the server.6 $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag98 <	 ; coldfusion/tagext/io/OutputTag=
> \ .
Unable to update debugging settings.<br />
@ CFCATCHB MESSAGED _String &(Ljava/lang/Object;)Ljava/lang/String;FG coldfusion/runtime/CastI
JH EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String;LM
 N <br />
P DETAILR
> k coldfusion/tagext/QueryLoopU
V r
V x
> { 0
Unable to retrieve debugging settings.<br />
Z &Flash Form Compile Errors and Messages\ �
 (Development use only) Select this option to have ColdFusion display ActionScript errors in
 the browser when compiling Flash forms; this affects the display time of the page.
^ 4
The IP you attempted to add should not be blank.
` 
The IP you attempted to add (b FORMd IPTOBEADDEDf 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; �h
 i �) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format.
k ) is not valid.
IPs are four sets of numbers from 0 to 255 separated by periods (e.g., 127.0.0.1) in IPv4 addressing format
or eight sets of hexadecimal numbers from 0 to FFFF seperated by colon (e.g., 0:0:0:0:0:0:0:1) in IPv6 addressing format. <br />
m 	 <br />
o 
q _whitespace %(Ljava/io/Writer;Ljava/lang/String;)Vst
 u 6
An error occurred attempting to add the current IP (w REMOTE_ADDRy %)
to the Debugging Service. <br />
{ b
An error occurred attempting to remove the requested IP(s).
from the Debugging Service.<br />
} q
An error occurred attempting to retrieve a list of restricted IP addresses
from the Debugging Service.<br />
 2Port number must be numeric and greater than zero.� 7Maximum sessions must be numeric and greater than zero.� $Unable to update debugging settings.� false� set (Ljava/lang/Object;)V�� coldfusion/runtime/Variable�
�� coldfusion/runtime/SwitchTable�
� 	 ENABLE_CFSTAT_DESC� addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;��
�� DA_TIP� 
ENABLE_TIP� IP_ERROR_INVALID� TIMER� TRACE� DS_MSG_SELECTUNUSEDPORT� GENERAL_TIP� IP_ERROR_REMOVE� ENABLE� STATMESS� URLVAR� CUSTOMDEBUGOUTPUT� 
SESSIONVAR� OPTIONS_PAGENAME� 	TRACE_TIP� DS_MSG_RESTARTSERVER� TEMPLATE_TIP� AJAX_ENABLED� DEBUGGER_SERVER� IP_ERROR_ADD� !CFSTAT_CONNECTOR_PORT_CHANGE_DESC� CLICK_NORMAL� SELECTIP� PORT_IN_USE_WARNING� SUBMIT_CHANGES� PAGEHEADER_DEBUGGING� 	COOKIEVAR� ENABLE_METRICS� AJAX_ENABLED_TIP� ENABLE_METRICS_DESC� VARS_TIP� DEBUG_ERROR_UPDATE� 	SERVERVAR� PAGEHEADER_IPLIST� RESTART_DEBUGGER_SERVER� ENABLE_PERFMON_DESC� CGIVAR� ENABLE_CFSTAT� DEBUG_IP_ERROR_EMPTY� EXCEPTION_TIP� IP_DEBUGGER_PORT� 	CLIENTVAR� DEBUGGER_SERVER_DESC� CF_METRICS_FREQUENCY_DESC� PAGEHEADER_LINEDEBUGGER� VARS� STOP_DEBUGGER_SERVER� HF_APPLY� LINEDEBUG_ERROR_UPDATE� DS_ERROR_PORTNUM� LINEDEBUGGER_DEBUGPORT_WARNING� METRICS_FREQUENCY� 	TIMER_TIP  IP_PAGENAME 
ADD_BUTTON DS_ERROR_MAXSESSIONS DA IMPORTANT_NOTICE
 FLASHFORMCOMPILEERRORS $LINEDEBUGGER_DEBUGPORT_WARNING_PART2 ENABLE_ROBUST GENERAL FORMVAR DEBUG_APPLY DEFAULT_PAGENAME LINEDEBUGSETTINGS VIEWDELETEIP TEMPLATE_MODE_SUMMARY FLASHFORMCOMPILEERRORS_TIP  ALLOW_LINE_DEBUGGING" CLICK_RETURN$ IP_ERROR_GET& ADD_CURRENT_BUTTON( REMOVE_BUTTON* START_DEBUGGER_SERVER, 
IP_ADDRESS. DEBUGSLOWTEMPLATHIGHLIGHT0 ENABLE_PERFMON2 IP_ERROR_ADD_CURRENT4 MAX_DEBUGGING_SESSIONS6 ALERT8 DEBUG_TEMPLATE_OUTPUT: TEMPLATE< CFSTAT_CONNECTOR_PORT_CHANGE> OPTIONS_PAGENAME_LINEDEBUG@ 	PAGE_DESCB IP_WELCOMETEXTD TEMPLATE_MODE_TREEF 	EXCEPTIONH TEMPLATE_USINGJ DEBUG_TEMPLATE_TIPL APPLICATIONVARN DEBUG_ERROR_GETP 
REQUESTVARR ENABLE_ROBUST_DESCT 
V
 L x
 L { metaData Ljava/lang/Object;Z[	 \ &coldfusion/runtime/AttributeCollection^ java/lang/Object` ([Ljava/lang/Object;)V b
_c getMetadata ()Ljava/lang/Object; this Lcfdebugging_en2ecfm1776510547; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value processingdirective8 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode8 I silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t8 Ljava/lang/Throwable; t9 t10 t11 t12 t13 output1  Lcoldfusion/tagext/io/OutputTag; mode1 t16 t17 t18 t19 output2 mode2 t22 t23 t24 t25 output3 mode3 t28 t29 t30 t31 output4 mode4 t34 t35 t36 t37 output5 mode5 t40 t41 t42 t43 output6 mode6 t46 t47 t48 t49 output7 mode7 t52 t53 t54 t55 t56 t57 t58 t59 LineNumberTable java/lang/Throwable� <clinit> 1                      ; <    ^ <    } ~   8 <   Z[    ef j   "     �]�   i       gh      j   ]     +*+,� **+,� � **+,� � **+,� � !�   i        +gh     +kl    +mn  of j  �  <  �*� (� .L*� 2N*� (4� :*� F-� J� L:*� P� T� Y� ]Y6�x*� b� J� d:*� P� Y� eY6� /*+� iL� l���� � :� �:	*+� pL�	� u� :
� &�D
�� � #:� y� � :� �:� |�� �**� � �Y�S� �� ��     
�       _  �  �  �  �  �  �  �  �  �  �  �  �  �           )  2  ;  D  M  V  _  h  q  z  �  �  �  �  �  �  �  �  �  �  �  �  �  �    
      %  .  7  @  I  R  [  d  m  v    �  �  �  �  �  �  �  �  �  �  �  �          )  3  =  G  Q  [  e  o  y  �  �  �  k  ?  I  S  ]  �  �  �  	�  
�  
�  
�+�� ��	,+�� ��	#+�� ��	+�� ��	+�� ��	+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ���+�� ��x+�� ��o+�� ��f+�� ��]+ö ��T+Ŷ ��K+Ƕ ��B+ɶ ��9+˶ ��0+Ͷ ��'+϶ ��+Ѷ ��+Ӷ ��+ն ��+׶ ���+ٶ ���+۶ ���+ݶ ���+߶ ���+� ���+� ���+� ���+� ���+� ���+� ���+�� ���+� ���+� ���+� ��|+�� ��s+�� ��j+�� ��a+�� ��X+�� ��O+�� ��F+� ��<+� ��2+� ��(+� ��+	� ��+� ��
+� �� +� ���+� ���+� ���+� ���+� ���+� ���+� ���+� ���+� ���+!� ���+#� ���+%� ���+'� ��~+)� ��t++� ��j+-� ��`+/� ��V+1� ��L+3� ��B+5� ��8+7� ��.*�<� J�>:* �� P� Y�?Y6� r+A� �+* �� P**� � �YCSYES� ��K�O� �+Q� �+* �� P**� � �YCSYSS� ��K�O� �+Q� ��T����W� :� &���� � #:�X� � :� �:�Y��Z*�<� J�>:* �� P� Y�?Y6� r+[� �+*� P**� � �YCSYES� ��K�O� �+Q� �+*� P**� � �YCSYSS� ��K�O� �+Q� ��T����W� :� &���� � #:�X� � :� �:�Y���+]� ��|+_� ��r+a� ��h*�<� J�>:*� P� Y�?Y6� ;+c� �+*� P*e� �YgS�j�K�O� �+l� ��T����W� :� &�6�� � #:�X� � :� �:�Y���*�<� J�>: *� P � Y �?Y6!� �+c� �+*� P*e� �YgS�j�K�O� �+n� �+*� P**� � �YCSYES� ��K�O� �+p� �+*� P**� � �YCSYSS� ��K�O� �*+r�v �T��j �W� :"� &�8"�� � #:# #�X� � :$� $�:% �Y�%��*�<� J�>:&*� P&� Y&�?Y6'� �+x� �+*�� �YzS�j�K� �+|� �+*!� P**� � �YCSYES� ��K�O� �+p� �+*"� P**� � �YCSYSS� ��K�O� �*+r�v&�T��u&�W� :(� &�E(�� � #:)&)�X� � :*� *�:+&�Y�+��*�<� J�>:,*%� P,� Y,�?Y6-� s+~� �+*(� P**� � �YCSYES� ��K�O� �+p� �+*)� P**� � �YCSYSS� ��K�O� �*+r�v,�T���,�W� :.� &�o.�� � #:/,/�X� � :0� 0�:1,�Y�1�*�<� J�>:2*,� P2� Y2�?Y63� s+�� �+*/� P**� � �YCSYES� ��K�O� �+Q� �+*0� P**� � �YCSYSS� ��K�O� �*+r�v2�T���2�W� :4� &� �4�� � #:525�X� � :6� 6�:72�Y�7� .+�� �� $+�� �� +�� �� *� !���� *+W�v� l��� u� :8� #8�� � #:99�X� � ::� :�:;�Y�;� H f { ~� ~ � ~� [ � �� � � �� [ � �� � � �� � � �� � � ��� ,�&),�� ;�&);�,8;�;@;�k� ��� �k����� ��]�������]����������������������������������������	�	��	�	�	���	�	��	�	�	��	�	�	��	�	�	��	�
v
��
|

��	�
v
��
|

��
�
�
��
�
�
��
�LX�RUX�
�Lg�RUg�Xdg�glg� 6 ��� � ��&������������	���	�
v��
|L��R������� 6 ��� � ��&������������	���	�
v��
|L��R��������������� i  Z <  �gh    �pq   �r[   � / 0   �st   �uv   �wx   �yv   �z{   �|[ 	  �}[ 
  �~{   �{   ��[   ���   ��v   ��[   ��{   ��{   ��[   ���   ��v   ��[   ��{   ��{   ��[   ���   ��v   ��[   ��{   ��{   ��[   ���    ��v !  ��[ "  ��{ #  ��{ $  ��[ %  ��� &  ��v '  ��[ (  ��{ )  ��{ *  ��[ +  ��� ,  ��v -  ��[ .  ��{ /  ��{ 0  ��[ 1  ��� 2  ��v 3  ��[ 4  ��{ 5  ��{ 6  ��[ 7  ��[ 8  ��{ 9  ��{ :  ��[ ;�  � � A  �  �  �  � t } � � � �  � "� $� &� (� *� 6� 8� >� @� F H J O Q( S1 U: WC YL `U b^ gg ip my o� s� u� z� |� �� �� �� �� �� �� �� �� �� �  �	 � � �$ �- �6 �? �H �Q �Z �c �m �w �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �! �+ �5 �? �I �S �] �g �q �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �{ �{ ���������}���������O �O �#-7wwwwwwwwoAA========5mmmmmmmme��					
	0!	0!	0!	0!	0!	0!	0!	0!	(!	`"	`"	`"	`"	`"	`"	`"	`"	X"��
(
(
(
(
(
(
(
(	�(
6)
6)
6)
6)
6)
6)
6)
6)
.)	�%	�%
�/
�/
�/
�/
�/
�/
�/
�/
�/000000000
�,
�,{3�5�7�:�:�:�:�:�:�: �         j   #     *� 
�   i       gh   �  j  J    ,>� D� F`� D� b:� D�<��Y���4���������X��� ������C������[���������,������)���������B���������L���Y���6������<���R���������%���/������0���#���S���&���:���P���.���'���3���W������H���*���M���2���E���"���O���7���_���]���I���1��!��9��>��^��	����U��J��	����(��8����F��@����!V��#G��%��'\��)?��+A��-N��/=��1��3-��5Z��7K��9��;��=��?5��AD��CQ��E;��G��I��K��M��O$��QT��S+��U
��� ��_Y�a�d�]�   i      ,gh         "    #