����  -� 
SourceFile 1/CFIDE/administrator/cftags/resources/solr_en.cfm cfsolr_en2ecfm697038311  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   
ATTRIBUTES Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   INDEXRESULT   	   CALLER   	    BSUCCESS " " 	  $ com.macromedia.SourceModTime  [�;�� pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	  + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	  5 	ISO8859_1 7 setPageEncoding (Ljava/lang/String;)V 9 : !coldfusion/runtime/NeoPageContext <
 = ; 3class$coldfusion$tagext$lang$ProcessingDirectiveTag Ljava/lang/Class; -coldfusion.tagext.lang.ProcessingDirectiveTag A forName %(Ljava/lang/String;)Ljava/lang/Class; C D java/lang/Class F
 G E ? @	  I _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; K L
  M -coldfusion/tagext/lang/ProcessingDirectiveTag O _setCurrentLineNo (I)V Q R
  S setSuppresswhitespace (Z)V U V
 P W 	hasEndTag Y V coldfusion/tagext/GenericTag [
 \ Z 
doStartTag ()I ^ _
 P ` $class$coldfusion$tagext$io$SilentTag coldfusion.tagext.io.SilentTag c b @	  e coldfusion/tagext/io/SilentTag g
 h ` 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; j k
  l doAfterBody n _
 \ o _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; q r
  s doEndTag u _ #javax/servlet/jsp/tagext/TagSupport w
 x v doCatch (Ljava/lang/Throwable;)V z {
 \ | 	doFinally ~ 
 \  	__HTSWT_0 Lcoldfusion/util/FastHashtable; � �	  � java/lang/String � ID � _resolveAndAutoscalarize D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; � �
  � __caseValue 4(Lcoldfusion/util/FastHashtable;Ljava/lang/Object;)I � �
  � ColdFusion Administrator � write � : java/io/Writer �
 � � $Server has been updated successfully � 'Click the button on the right to update � ALERT! � &Important notice about last submission � 8Click arrow on left to return without submitting changes � Submit Changes � $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag � � @	  � coldfusion/tagext/io/OutputTag �
 � ` URL � COLLECTIONNAME � 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
  � _String &(Ljava/lang/Object;)Ljava/lang/String; � � coldfusion/runtime/Cast �
 � � EncodeForHTML &(Ljava/lang/String;)Ljava/lang/String; � �
  � 
 Optimized �
 � o coldfusion/tagext/QueryLoop �
 � v
 � |
 �  	 Reloaded �  Purged � 	 removed. � ColdFusion Collections � /Data &amp; Services &gt; ColdFusion Collections �
The Solr indexing engines allows you to easily develop search capabilities for your ColdFusion applications. A Solr collection is a group of information that can be indexed and searched as a set. Use this form to create and manage your Solr collections.
 � Add New Solr Collections � Name � 'A name for your collection is required. � Create Collection � 2Optimizing a collection can take several minutes.  � NL � 	 Proceed? � 'Purging a collection cannot be undone.  � ' Remove all indices in this collection? � (Deleting a collection cannot be undone.  �  Destroy this collection? � Optimize Collection � Purge Collection � Delete Collection � Index Collection � Reload Collection � Solr Collections � Actions � 	Documents � 	Size (Kb) � Last Modified � Path � �
Unable to retrieve collections from the Search Services.<br />
Ensure that you have installed ColdFusion Search Service and it is running.
 � .Please enter a valid name for this collection. � 8Please enter a valid Directory Path for this collection. Collection  
 Indexed:  INSERTED  files inserted, 	 UPDATED  files updated. _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;
  An alias name is required. 
                  Alias  FORM SOLRALIASNAME  created for  . 
                _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V!"
 # _factor1%
 & "A new collection name is required.( 
                  *  renamed to , SOLRNEWNAME. _factor20
 1 �Could not determine collection path locally. See the section Term Highlighting in the <i>Developing Coldfusion 9 Applications</i> to enable term highlighting for the entire document.3 Term highlighting enabled for 5 6. Reindex collection for these changes to take effect 7 _factor39
 : $Full term highlighting disabled for < _factor4>
 ? Index Solr CollectionsA FData &amp; Services &gt; ColdFusion Collections &gt; Manage CollectionC EData &amp; Services &gt; ColdFusion Collections &gt; Index CollectionE�
NOTE: Because you have a remote Solr server configured, you must ensure that the documents
to be indexed are accessible from the ColdFusion server machine as well as the computer
on which the Solr search services run. Also, if the local and remote file paths do not match exactly,
you can use the Remote Directory Path field to define a prefix that maps the local path to the path
on the remote Solr host.
G Index Collection:I File ExtensionsK Directory PathM Local Directory PathO Browse ServerQ Remote Directory PathS !Recursively Index Sub DirectoriesU 
Return URLW LanguageY Cancel[ Submit] Enable Term Highlighting:_ �
<p> By default, Solr highlights searched terms available in the summary content. Click Enable to highlight contents in the entire document. After you enable/disable, and reindex the collection.</p>
a Enablec Disablee S
Note: Enabling term highlighting for the entire document increases index size. 
g �
<p>By default, Solr highlights searched terms only in the summary content. See the section Term Highlighting in the <i>Developing Coldfusion 9 Applications</i> to enable term highlighting for the entire document.</p>
i Rename Collection:k New name for Collectionm 2
Solr Server Configuration information updated.
o 5
Solr Collections have been migrated successfully.
q REMOVELANGUAGEs  Removedu Solr Serverw $Data &amp; Services &gt; Solr Serveryn
You can install and configure Solr search service on a host other than the one
on which ColdFusion runs. That is the host that Coldfusion will use while performing search operations.
Click the Show Advanced Settings to configure these values.
You should not need to change the advanced values if you are running with the ColdFusion installed
version of Solr.
{ Configure Solr Server} Solr Host Name 	Solr Home� Solr Admin Port� Solr Webapp�  Context root of the solr server.� Solr Buffer Limit� �Size in MB after which, the docs are committed to the Solr Server while indexing. More the buffer limit, better the performance.
� 	User name� Password� KIf basic authentication is enabled on Solr Server, specify the credentials.� Solr Connection� Use HTTPS connection� Solr Admin HTTPS Port� Show Advanced Settings� Configure Indexing languages� I
After adding a stemmer, specify the language and the suffix.
         � New language� New language suffix� Add� Current Languages� Language Name� Language Suffix� 8Are you sure you want to delete this ColdFusion Mapping?� Edit� Delete� Migrate Collections� !
Migrate old Solr collections.
� Old Solr Home� Migrate Solr Collections� ;Restart the Solr server before creating any new collection.� English�  
  Unable to create collection � NEWCOLLECTIONNAME� .<br />
  � CFCATCH� MESSAGE� 
<br />
  � DETAIL� _factor5�
 �  
Unable to optimize collection � 	.<br />
� <br />
� _factor6�
 � 
Unable to reload collection � _factor7�
 � 
Unable to purge collection � _factor8�
 � 
Unable to delete collection � _factor9�
 � ?
Unable to retrieve the default collections directory.<br />
� 7
There was an error indexing this collection. <br />
� REQUEST� 
ESAPIUTILS� _resolve� �
 � encodeForHTMLFilePath� java/lang/Object� _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;��
 � 
� 	_factor10�
 � 7
There was an error aliasing this collection. <br />
� <br />
     7
There was an error renaming this collection. <br />
 H
There was an error enabling highlighting for this collection. <br />
 I
There was an error disabling highlighting for this collection. <br />
 7If specifying a language, both the fields are mandatory C
An error occurred while attempting to save your changes. <br />

 <br />
       #Old Solr Home path can not be empty 
Unable to remove language  	_factor11
  APlease enter a valid host name or IP address ( xxx.xxx.xxx.xxx ). EPlease enter a valid Solr Admin port. The default Admin port is 8989. 9Please enter a webapp. The default Solr webapp is 'solr'. 8Enter the buffer limit in MB. The default value is 40 MB +Enter the username for basic authentication +Enter the password for basic authentication QPlease enter a valid Solr Admin HTTPS port. The default Admin HTTPS port is 8443.! Enter the name of new language#  Enter the suffix of the language% false' set (Ljava/lang/Object;)V)* coldfusion/runtime/Variable,
-+ coldfusion/runtime/SwitchTable/
0 	 BUTTON_BROWSE2 addStringCase 5(Ljava/lang/String;I)Lcoldfusion/runtime/SwitchTable;45
06 SOLR_OLDPATH8 ERROR_SOLRPASSWORD: COLLECTION_INDEXED< PATH> SOLR_PAGENAME@ TERMHIGHLIGHT_NOTEB MIGRATE_COLLECTIONSD ERROR_OPTIMIZEF SOLR_SOLRLANGUAGEH ENABLEJ SOLR_LANG_SUFFIXL STATMESSN 	ERROR_MSGP SOLRMIGRATION_WELCOMER DELETE_MAPPING_CONFIRMATIONT NAMEV SOLR_BUFFERSIZEX CLICK_NORMALZ COL_DELETED\ ERROR_SOLRADMINHTTPSPORT^ VERITY_OPTIMIZE_WARN` SOLRMIGRATIONUPDATEDb MIGRATE_SOLR_BUTTONd SUBMIT_CHANGESf SOLRCONFIG_WELCOME_SHORTh COLLECTION_ALIASEDj  INDEXCOLLECTION_PAGEHEADER_INDEXl SOLRINDEX_WELCOMEn VERITY_DELETE_WARNp L10N_INDEXEXTENSIONSr ERROR_SOLRWEBAPPt TERMHIGHLIGHT_DESCv 	NO_SERVERx L10N_ADDSOLR_INDEXLANGz SOLRCONFIG_WELCOME| MAP_LOGICAL_PATH~ SOLR_NEWNAME_REQUIRED� SOLR_WEBAPP� L10N_LOCALINDEXDIRPATH� ERROR_SOLRUPDATE� COLLECTION_RENAMED� ERROR_CREATE� HIDEADVANCEDSETTINGS� L10N_INDEXRETURNURL� ERROR_SOLRHTTPSENABLE� EDIT� VALID_COLLECTION_PATH� ACTIONS� LANG_ERROR_MSG� SOLRUPDATED� 
ERROR_HOST� PAGEHEADER_VERITY� ERROR_SOLRADMINPORT� L10N_RENAMECOLLECTION� L10N_ADDSOLR_CONFIG� SOLR_USERNAME� L10N_CORERENAME� SOLR_ADMINHTTPSPORT� SOLR_HIGHLIGHTING_REMOTE� BUTTON_ADD_LANGUAGE� VALID_COLLECTION_NAME� L10N_IRELOAD3� SOLR_ALIAS_REQUIRED� DELETE� SOLR_PWD� L10N_INDEXDIRPATH� DISABLE� 	ALIASNAME� SOLR_HTTPSENABLE� LASTMOD� %FULLTERM_COLLECTION_HIGHTLIGHTENABLED� MAP_DIR_PATH� 	WS_ENABLE� ERRORDELETECOLLECTION� VERITY_WELCOME� L10N_IINDEX3� ERROR_REMOVE� L10N_GRAPHCACHE_TEXT� L10N_ADD� CANCEL� ERROR_RENAMING_COLLECTION� 	SOLR_HOST� TERMHIGHLIGHT_REMOTE_NOTE� L10N_TERMHIGHLIGHT_TITLE� IMPORTANT_NOTICE� COL_OPTIMIZED� COL_REMOVED� 
MAP_ACTIVE� ERROR_USERNAME� DEFAULT_PAGENAME� L10N_GRAPHCACHE_CONDITION� 	SOLR_HOME� $ERROR_DISABLE_HIGLIGHTING_COLLECTION� L10N_GRAPHCACHE_ROOT� L10N_IOPTIMIZE3� CLICK_RETURN� CONN1Z2_SOLR� VERITY_NAME_REQUIRED� VERITY_PURGE_WARN� L10N_ADDCOL� ERROR_SOLRPREFIX  #ERROR_ENABLE_HIGLIGHTING_COLLECTION ERROR_PURGE L10N_IPURGE3 SOLR_ADMINPORT SOLRENGLISH
 BROWSER_SERVER 
COL_PURGED !INDEXCOLLECTION_PAGEHEADER_MANAGE 10N_INDEXLANGUAGE ALERT RECURSE_INDEX_SUB_DIRS COL_RELOADED 	DOCUMENTS ERROR_SOLRLANGUAGE ERROR_SOLRBUFFERSIZE PAGEHEADER_SOLR  L10N_INDEXDIRPREFIX" SOLR_MIGRATE_RESTART$ 
PAGENAMEQ8& SIZE_KB( PAGENAME_INDEXVERITYCOLLECTION* SUBMIT, 
ERRORS_GET. ERROR_INDEXING_COLLECTION0 L10N_INDEXCOLLECTION2 COLLECTION_HIGHTLIGHTENABLED4 ERROR_RELOAD6 L10N_IDELETE38 ERROR_ALIASING_COLLECTION: 
< 	_factor12>
 ?
 P |
 P  	_factor13C
 D metaData Ljava/lang/Object;FG	 H &coldfusion/runtime/AttributeCollectionJ ([Ljava/lang/Object;)V L
KM getMetadata ()Ljava/lang/Object; this Lcfsolr_en2ecfm697038311; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; value output25  Lcoldfusion/tagext/io/OutputTag; mode25 I t6 t7 Ljava/lang/Throwable; t8 t9 LineNumberTable java/lang/Throwableg output31 mode31 silent0  Lcoldfusion/tagext/io/SilentTag; mode0 t10 t11 output1 mode1 t14 t15 t16 t17 output2 mode2 t20 t21 t22 t23 output3 mode3 t26 t27 t28 t29 output4 mode4 t32 t33 t34 t35 output5 mode5 t38 t39 t40 t41 output6 mode6 t44 t45 t46 t47 output7 mode7 t50 t51 t52 t53 output18 mode18 t56 t57 t58 t59 output24 mode24 t62 t63 t64 t65 output26 mode26 t68 t69 t70 t71 output27 mode27 t74 t75 t76 t77 output28 mode28 t80 t81 t82 t83 output29 mode29 t86 t87 t88 t89 output30 mode30 t92 t93 t94 t95 processingdirective32 /Lcoldfusion/tagext/lang/ProcessingDirectiveTag; mode32 output22 mode22 output23 mode23 output20 mode20 output21 mode21 output9 mode9 output8 mode8 t12 t13 output11 mode11 output10 mode10 runPage output17 mode17 output16 mode16 output19 mode19 output13 mode13 output12 mode12 <clinit> output15 mode15 output14 mode14 1     	                 "     ? @    b @    � �    � @   FG    OP T   "     �I�   S       QR      T   i     7*+,� **+,� � **+,� � **+,� � !**#+,� � %�   S        7QR     7UV    7WX     T   #     *� 
�   S       QR   � T  �  
  	*� �+� N� �:*6� T� ]� �Y6� �,� �,*8� T**�� �Y�S�����Y**� !� �Y�SY�S� �S��� �� �,Ӷ �,*9� T**�� �Y�S�����Y**� !� �Y�SY�S� �S��� �� �*,��$� ���[� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
  	QR    	Y 4   	Z[   	\G   	]^   	_`   	aG   	bc   	dc   	eG 	f   >  Q8 Q8 68 68 68 68 .8 �9 �9 �9 �9 �9 �9 z9  6  T    
   �*� �+� N� �:*Z� T� ]� �Y6� �,� �,*[� T*�� �YtS� �� �� �� �,Ѷ �,*\� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*]� T**� !� �Y�SY�S� �� �� �� �,Ӷ �� ���l� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    �i^    �j`    �aG    �bc    �dc    �eG 	f   r  6[ 6[ 6[ 6[ 6[ 6[ 6[ 6[ .[ ^\ ^\ ^\ ^\ ^\ ^\ ^\ ^\ V\ �] �] �] �] �] �] �] �] �]  Z > T  X  `  *� f+� N� h:*� T� ]� iY6� /*,� mM� p���� � :� �:*,� tM�� y� :� #�� � #:		� }� � :
� 
�:� ��� �**� � �Y�S� �� ��  ^       �    "  +  4  =  F  O  X  �  r  �  �  �  �  �  �  �  �  �  W  �  q  z  �  �  �  �  �  �  �  �  �  �  �  �  �  �  	    "  ,  ;  E  T  c  m  w  �  �  �  �  �  �  �  �  �  �  �  �  �        !  +  5  ?  I  S  ]  �  �  	  	  	  	!  	+  	5  	?  	I  	S  	]  	g  	q  	{  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  	�  
  
  
  
%  
/  
9  
C  
M  
W  
f  
u  
�  
�  
�  s  �  #  �  e      �  �  �        "  ,  6  @  J  T,�� ��L,�� ��C,�� ��:,�� ��1,�� ��(,�� ��,�� ��*� �+� N� �:*$� T� ]� �Y6� 0,*$� T*�� �Y�S� �� �� �� �,�� �� ����� �� :� #�� � #:� è � :� �:� ĩ��*� �+� N� �:*&� T� ]� �Y6� 0,*&� T*�� �Y�S� �� �� �� �,ƶ �� ����� �� :� #�� � #:� è � :� �:� ĩ��*� �+� N� �:*(� T� ]� �Y6� 0,*(� T*�� �Y�S� �� �� �� �,ȶ �� ����� �� :� #�� � #:� è � :� �:� ĩ�o*� �+� N� �:**� T� ]� �Y6� 0,**� T*�� �Y�S� �� �� �� �,ʶ �� ����� �� : � # �� � #:!!� è � :"� "�:#� ĩ#�
�,̶ ��
�,ζ ��
�,ж ��
�,Ҷ ��
�,Զ ��
�,ֶ ��
�,ض ��
�*� �+� N� �:$*<� T$� ]$� �Y6%� /,ڶ �,**� !� �Y�S� �� �� �,޶ �$� ����$� �� :&� #&�� � #:'$'� è � :(� (�:)$� ĩ)�
*� �+� N� �:**>� T*� ]*� �Y6+� /,� �,**� !� �Y�S� �� �� �,� �*� ����*� �� :,� #,�� � #:-*-� è � :.� .�:/*� ĩ/�	�*� �+� N� �:0*@� T0� ]0� �Y61� /,� �,**� !� �Y�S� �� �� �,� �0� ����0� �� :2� #2�� � #:303� è � :4� 4�:50� ĩ5��,� ���,� ���,� ���,� ���,� ���,� ���,�� ���,Զ ���,�� ���,�� ���,�� ���,�� ���,�� ���, � ��~,� ��t*+,�� ��e,� ��[*+,�'� ��L,)� ��B*+,�2� ��3,4� ��)*+,�;� ��*+,�@� ��,B� ��,D� ���,F� ���,H� ���,J� ���,L� ���,N� ���,P� ���,R� ���,T� ���,V� ���,X� ���,Z� ���,\� ��,^� ��u,`� ��k,b� ��a,d� ��W,f� ��M,h� ��C,j� ��9,l� ��/,n� ��%,p� ��,r� ��*� �+� N� �:6* �� T6� ]6� �Y67� 3,* �� T*�� �YtS� �� �� �� �,v� �6� ����6� �� :8� #8�� � #:969� è � ::� :�:;6� ĩ;�,x� ��u,z� ��k,|� ��a,~� ��W,�� ��M,�� ��C,R� ��9,�� ��/,�� ��%,�� ��,�� ��,�� ��,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ���,�� ��{,�� ��q,�� ��g,�� ��],�� ��S,�� ��I,�� ��?,�� ��5,�� ��+,�� ��!,�� ��*+,��� ��*+,��� ���*+,��� ���*+,��� ���*+,��� ���*� �+� N� �:<*0� T<� ]<� �Y6=� r,� �,*2� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*3� T**� !� �Y�SY�S� �� �� �� �,Ӷ �<� ����<� �� :>� #>�� � #:?<?� è � :@� @�:A<� ĩA��*+,��� ���*� �+� N� �:B*<� TB� ]B� �Y6C� B,�� �,*>� T**� !� �Y�SY�S� �� �� �� �,� �B� ����B� �� :D� #D�� � #:EBE� è � :F� F�:GB� ĩG�K*� �+� N� �:H*A� TH� ]H� �Y6I� B,� �,*C� T**� !� �Y�SY�S� �� �� �� �,� �H� ����H� �� :J� #J�� � #:KHK� è � :L� L�:MH� ĩM��*� �+� N� �:N*F� TN� ]N� �Y6O� B,� �,*H� T**� !� �Y�SY�S� �� �� �� �,� �N� ����N� �� :P� #P�� � #:QNQ� è � :R� R�:SN� ĩS�	*� �+� N� �:T*K� TT� ]T� �Y6U� B,� �,*M� T**� !� �Y�SY�S� �� �� �� �,� �T� ����T� �� :V� #V�� � #:WTW� è � :X� X�:YT� ĩY�h,	� ��^*� �+� N� �:Z*R� TZ� ]Z� �Y6[� r,� �,*T� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*U� T**� !� �Y�SY�S� �� �� �� �,� �Z� ����Z� �� :\� #\�� � #:]Z]� è � :^� ^�:_Z� ĩ_� �,� �� �*+,�� �� t,� �� j,� �� `,� �� V,� �� L,� �� B, � �� 8, � �� .,"� �� $,$� �� ,&� �� *� %(�.� *,=�$*� \ $ 9 <h < A <h  \ hh b e hh  \ wh b e wh h t wh w | whUah[^ahUph[^phamphpuph���h���h���h���h���h��h+o{hux{h+o�hux�h{��h���h��hh��hhhh���h���h���h���h���h���hT`hZ]`hTohZ]oh`lohotoh���h���h���h���h���h��h		_	kh	e	h	kh		_	zh	e	h	zh	k	w	zh	z		zh]��h���h]��h���h���h��h=��h���h=��h���h���h���h�4@h:=@h�4Oh:=Oh@LOhOTOh��h���h��h���h���h���h v�h|�h v�h|�h���h���h�Q]hWZ]h�QlhWZlh]ilhlqlh S  � `  QR    Y 4   Z[   \G   kl   m`   ac   bG   dG   ec 	  nc 
  oG   p^   q`   rG   sc   tc   uG   v^   w`   xG   yc   zc   {G   |^   }`   ~G   c   �c   �G   �^   �`   �G    �c !  �c "  �G #  �^ $  �` %  �G &  �c '  �c (  �G )  �^ *  �` +  �G ,  �c -  �c .  �G /  �^ 0  �` 1  �G 2  �c 3  �c 4  �G 5  �^ 6  �` 7  �G 8  �c 9  �c :  �G ;  �^ <  �` =  �G >  �c ?  �c @  �G A  �^ B  �` C  �G D  �c E  �c F  �G G  �^ H  �` I  �G J  �c K  �c L  �G M  �^ N  �` O  �G P  �c Q  �c R  �G S  �^ T  �` U  �G V  �c W  �c X  �G Y  �^ Z  �` [  �G \  �c ]  �c ^  �G _f  �"    �  �  �  � � � � � � �  � "# $# $# $# $# $# $# $# $ $� $� $� &� &� &� &� &� &� &� &� &� &� &= (= (= (= (= (= (= (= (6 ( ( (� *� *� *� *� *� *� *� *� *� *� *+ ,4 .= 0F 4O 6X 8a :� <� <� <� <� <j <j <# ># ># ># >" >� >� >� @� @� @� @� @� @� @ B D" F+ H4 J= LF NO PX Ra Tj Vs X| Z� _� a� c� e� g� k� m� q� s� w { }   �* �4 �> �H �R �\ �f �p �z �� �� �� �� �� �� �� �� �� �� �� �� �	+ �	+ �	+ �	+ �	+ �	+ �	+ �	+ �	# �� �� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �	� �
 �
 �
 �
$ �
. �
8 �
B �
L �
V �
` �
j �
t �
~ �
� �
� �
� �
� 
�
�
�
�

�
�
�
�#$2*w2w2w2w2w2w2w2w2o2�3�3�3�3�3�3�3�3�3A0A06W>W>W>W>W>W>W>W>O>!<!<�C�C�C�C�C�C�C�C�C�A�A�H�H�H�H�H�H�H�H�HcFcF:M:M:M:M:M:M:M:M2MKK�P�T�T�T�T�T�T�T�T�TUUUUUUUUU�R�R�X�Z�`�b�d�f�h�j�l�n�p�ruuuu�u�u�u �  C T  O     �*� J +� N� P:*� T� X� ]� aY6� *,�@� :� =�� p���� y� :� #�� � #:�A� � :	� 	�:
�B�
*�    9 _h ? S _h Y \ _h   9 nh ? S nh Y \ nh _ k nh n s nh S   p    �QR     �Y 4    �Z[    �\G    ���    ��`    �aG    �bG    �dc    �ec 	   �nG 
f        � T    
   �*� �+� N� �:*$� T� ]� �Y6� �,ݶ �,*%� T*�� �Y�S� �� �� �� �,Ѷ �,*&� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*'� T**� !� �Y�SY�S� �� �� �� �,Ӷ �� ���m� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    ��^    ��`    �aG    �bc    �dc    �eG 	f   r  6% 6% 6% 6% 6% 6% 6% 6% .% ]& ]& ]& ]& ]& ]& ]& ]& U& �' �' �' �' �' �' �' �' �'  $ � T    
   �*� �+� N� �:**� T� ]� �Y6� �,� �,*+� T*�� �Y�S� �� �� �� �,Ѷ �,*,� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*-� T**� !� �Y�SY�S� �� �� �� �,Ӷ �� ���m� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    ��^    ��`    �aG    �bc    �dc    �eG 	f   r  6+ 6+ 6+ 6+ 6+ 6+ 6+ 6+ .+ ], ], ], ], ], ], ], ], U, �- �- �- �- �- �- �- �- �-  * � T    
   �*� �+� N� �:*� T� ]� �Y6� �,϶ �,*� T*�� �Y�S� �� �� �� �,Ѷ �,*� T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*� T**� !� �Y�SY�S� �� �� �� �,Ӷ �� ���m� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    ��^    ��`    �aG    �bc    �dc    �eG 	f   r  6 6 6 6 6 6 6 6 . ] ] ] ] ] ] ] ] U � � � � � � � � �   � T    
   �*� �+� N� �:*� T� ]� �Y6� �,ض �,*� T*�� �Y�S� �� �� �� �,Ѷ �,* � T**� !� �Y�SY�S� �� �� �� �,Ӷ �,*!� T**� !� �Y�SY�S� �� �� �� �,Ӷ �� ���m� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    ��^    ��`    �aG    �bc    �dc    �eG 	f   r  6 6 6 6 6 6 6 6 . ]  ]  ]  ]  ]  ]  ]  ]  U  �! �! �! �! �! �! �! �! �!    T  �    A*� �	+� N� �:*c� T� ]� �Y6� �,� �*� �� N� �:*c� T� ]� �Y6� s,*c� T**� !� �Y�S� �� �� �� �,� �,**� � �YS� �� �� �,
� �,**� � �YS� �� �� �,� �� ����� �� :� &� c�� � #:		� è � :
� 
�:� ĩ� ���"� �� :� #�� � #:� è � :� �:� ĩ*�  I � �h � � �h I � �h � � �h � � �h � � �h  �h �hh  �.h �.h.h+.h.3.h S   �   AQR    AY 4   AZ[   A\G   A�^   A�`   A�^   A�`   AdG   Aec 	  Anc 
  AoG   A�G   A�c   Arc   AsG f   V  [ c [ c [ c [ c [ c [ c [ c [ c T c } c } c } c } c | c � c � c � c � c � c - c   c % T  �    1*� �+� N� �:*g� T� ]� �Y6� �,� �*� �
� N� �:*h� T� ]� �Y6� [,*h� T*� �YS� �� �� �� �,� �,*h� T**� !� �Y�S� �� �� �� �,� �� ����� �� :� &� k�� � #:		� è � :
� 
�:� ĩ*, �$� ���2� �� :� #�� � #:� è � :� �:� ĩ*�  I � �h � � �h I � �h � � �h � � �h � � �h  �h �h	h  �h �h	hh#h S   �   1QR    1Y 4   1Z[   1\G   1�^   1�`   1�^   1�`   1dG   1ec 	  1nc 
  1oG   1�G   1�c   1rc   1sG f   R  [ h [ h [ h [ h [ h [ h [ h [ h T h � h � h � h � h � h � h � h � h | h - h   g �P T   l     $*� ,� 2L*� 6N*� ,8� >*-+�E� ��   S   *    $QR     $Z[    $\G    $ 3 4 f       > T  i    *� �+� N� �:*w� T� ]� �Y6� �*,+�$*� �� N� �:*x� T� ]� �Y6� :,=� �,*x� T**� !� �Y�S� �� �� �� �,8� �� ����� �� :� &� k�� � #:		� è � :
� 
�:� ĩ*, �$� ���R� �� :� #�� � #:� è � :� �:� ĩ*�  J � �h � � �h J � �h � � �h � � �h � � �h  � �h � � �h � � �h  � �h � � �h � � �h � � �h � �h S   �   QR    Y 4   Z[   \G   �^   �`   �^   �`   dG   ec 	  nc 
  oG   �G   �c   rc   sG f   .  c x c x c x c x c x c x c x c x \ x . x   w � T    
   �*� �+� N� �:*� T� ]� �Y6� �,�� �,*� T*� �Y�S� �� �� �� �,¶ �,*� T**� !� �Y�SY�S� �� �� �� �,ȶ �,*� T**� !� �Y�SY�S� �� �� �� �,ȶ �� ���k� �� :� #�� � #:� è � :� �:	� ĩ	*�   � �h � � �h  � �h � � �h � � �h � � �h S   f 
   �QR     �Y 4    �Z[    �\G    ��^    ��`    �aG    �bc    �dc    �eG 	f   r  6 6 6 6 6 6 6 6 . _ _ _ _ _ _ _ _ W � � � � � � � � �   0 T  �    2*� �+� N� �:*m� T� ]� �Y6� �*,+�$*� �� N� �:*n� T� ]� �Y6� [,*n� T**� !� �Y�S� �� �� �� �,-� �,*n� T*� �Y/S� �� �� �� �,� �� ����� �� :� &� k�� � #:		� è � :
� 
�:� ĩ*, �$� ���1� �� :� #�� � #:� è � :� �:� ĩ*�  J � �h � � �h J � �h � � �h � � �h � � �h  �h �h
h  �h �h
hh$h S   �   2QR    2Y 4   2Z[   2\G   2�^   2�`   2�^   2�`   2dG   2ec 	  2nc 
  2oG   2�G   2�c   2rc   2sG f   R  \ n \ n \ n \ n \ n \ n \ n \ n U n � n � n � n � n � n � n � n � n } n . n   m �  T  d    FB� H� Jd� H� f�� H� ��0Y�13L�79f�7;~�7=$�7? �7AF�7C?�7Ed�7Gk�7I[�7K=�7M\�7O�7Qw�7Se�7Ua�7W�7YP�7[�7]
�7_ ��7a�7cD�7eg�7g�7iZ�7k&�7m.�7o/�7q�7s1�7u{�7w<�7y!�7{Y�7}H�7_�7�'�7�N�7�3�7�v�7�(�7�j�7�X�7�7�7��7�b�7�#�7��7�u�7�C�7�y�7��7�z�7�A�7�I�7�R�7�B�7�W�7�)�7�]�7�"�7��7�%�7�c�7�S�7�2�7�>�7��7�U�7��7�+�7�`�7�V�7�n�7��7��7�x�7�Q�7��7�9�7�r�7�J�7�@�7�;�7��7��7�E�7�^�7�}�7��7�T�7�K�7�t�7�O�7��7��7��7��7��7��7 ��7s�7m�7�7	M�7i�74�7	�7-�78�7�76�7�7�7 ��7|�7!G�7#5�7%h�7'�7)�7+,�7-:�7/o�71p�730�75*�77l�79�7;q�7� ��KY���N�I�   S      FQR   9 T  i    *� �+� N� �:*s� T� ]� �Y6� �*,+�$*� �� N� �:*t� T� ]� �Y6� :,6� �,*t� T**� !� �Y�S� �� �� �� �,8� �� ����� �� :� &� k�� � #:		� è � :
� 
�:� ĩ*, �$� ���R� �� :� #�� � #:� è � :� �:� ĩ*�  J � �h � � �h J � �h � � �h � � �h � � �h  � �h � � �h � � �h  � �h � � �h � � �h � � �h � �h S   �   QR    Y 4   Z[   \G   �^   �`   �^   �`   dG   ec 	  nc 
  oG   �G   �c   rc   sG f   .  c t c t c t c t c t c t c t c t \ t . t   s       &    '