����  - 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm 0cf_fileoptions2ecfm129444254$funcCFADMIN_GETFILE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   LOCATION  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  I ! PERMISSIONCLASS # VFILE % coldfusion/runtime/CfJspPage ' pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	 ( + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	 ( 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 _setCurrentLineNo (I)V = >
 ( ? ArrayNew (I)Ljava/util/List; A B coldfusion/runtime/CFPage D
 E C set (Ljava/lang/Object;)V G H coldfusion/runtime/Variable J
 K I 1 M 	StructNew !()Lcoldfusion/util/FastHashtable; O P
 E Q false S   U java W coldfusion.vfs.VFSFileFactory Y CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; [ \
 E ] checkIfVFile _ java/lang/Object a DAFILE c _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; e f
 ( g _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; i j
 ( k _boolean (Ljava/lang/Object;)Z m n coldfusion/runtime/Cast p
 q o coldfusion.vfs.VFilePermission s java.io.FilePermission u request.security.contexts w 	IsDefined (Ljava/lang/String;)Z y z
 E { REQUEST } java/lang/String  SECURITY � CONTEXTS � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 ( � IsStruct � n
 E � _resolve � �
 ( � WEBAPP � 	DIRECTORY � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 E � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 ( � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 q � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 ( � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 ( � TARGET � _double (Ljava/lang/Object;)D � �
 q � _Object (D)Ljava/lang/Object; � �
 q � ArrayLen (Ljava/lang/Object;)I � �
 E � (I)Ljava/lang/Object; � �
 q � cfadmin_getFile � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � \This will return the struct that describes the class,target, and actions for a file/dir path � version � 1,  January 08, 2002 � return � Returns the file struct. � 
Parameters � REQUIRED � NAME � daFile � ([Ljava/lang/Object;)V  �
 � � webapp � 	directory � getMetadata ()Ljava/lang/Object; this 2Lcf_fileoptions2ecfm129444254$funcCFADMIN_GETFILE; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �   2     � �YdSY�SY�S�    �        � �    � �  �   	   +� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :-� ,� 2:-� 6:� <:� <:� <:- ζ @-� F� LN� L
- ж @� R� LT� LV� L- Զ @-- Զ @-XZ� ^`� bY-d� hS� l� L-&� h� r� t� L� 
v� L- � @-x� |� a- � @-~� �Y�SY�S� �� �� @- � @--~� �Y�SY�S� �� bY-�� hSY-�� hS� �� �� LN� L� �-- -"� h� �� �� �Y�S� �-$� h� ��~�� B-- -"� h� �� �� �Y�S� �-d� h� ��~�� 
- -"� h� �� L-"� h� �c� �� L-"� h- � @- � h� �� �� ��t|���\-� h��    �   �    � �     � �    � �    � �    � �    � �    � �    3 4     �     � 	    � 
    �    ! �    # �    % �    c �    � �    � �    * �   � R � d � n � n � m � m � m � m � d � u � w � w � w � w � u � | � � � � � � � � � | � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �9 �9 �B �B � � � � � � � � � � � �T �T �T �T �R �` �` �\ �\ �x �x �\ �\ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �\ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �R � � � � � �     �   #     *� 
�    �        � �      �   �     ƻ �Y� bY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� bY� �Y� bY�SYTSY�SY�S� �SY� �Y� bY�SYTSY�SY�S� �SY� �Y� bY�SYTSY�SY�S� �SS� � ��    �       � � �        ����  - � 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm ;cf_fileoptions2ecfm129444254$funcCFADMIN_GETALLENABLEDFILES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   AFILES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  I ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 _setCurrentLineNo (I)V 9 :
 $ ; ArrayNew (I)Ljava/util/List; = > coldfusion/runtime/CFPage @
 A ? set (Ljava/lang/Object;)V C D coldfusion/runtime/Variable F
 G E 1 I request.security.contexts K 	IsDefined (Ljava/lang/String;)Z M N
 A O REQUEST Q java/lang/String S SECURITY U CONTEXTS W _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; Y Z
 $ [ IsStruct (Ljava/lang/Object;)Z ] ^
 A _ _resolve a Z
 $ b java/lang/Object d WEBAPP f _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; h i
 $ j 	DIRECTORY l _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; n o
 $ p 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; r s
 A t 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; n v
 $ w _Map #(Ljava/lang/Object;)Ljava/util/Map; y z coldfusion/runtime/Cast |
 } { CLASS  6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; Y �
 $ � java.io.FilePermission � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Object (Z)Ljava/lang/Object; � �
 } � _boolean � ^
 } � coldfusion.vfs.VFilePermission � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 } � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 A � _double (Ljava/lang/Object;)D � �
 } � (D)Ljava/lang/Object; � �
 } � ArrayLen (Ljava/lang/Object;)I � �
 A � (I)Ljava/lang/Object; � �
 } � '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 $ � cfadmin_getAllEnabledFiles � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � Freturn an array of all dsn's that are enabled by this security context � version � 1,  January 08, 2002 � return � Returns an array. � 
Parameters � REQUIRED � false � NAME � webapp � ([Ljava/lang/Object;)V  �
 � � 	directory � getMetadata ()Ljava/lang/Object; this =Lcf_fileoptions2ecfm129444254$funcCFADMIN_GETALLENABLEDFILES; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �   -     � TYgSYmS�    �        � �    � �  �      �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:� 8:� 8:-� <-� B� H
-� <-� B� HJ� H-� <-L� P� _-� <-R� TYVSYXS� \� `� ?-� <--R� TYVSYXS� c� eY-g� kSY-m� kS� q� u� HJ� H� �-- -"� k� x� ~� TY�S� ��� ��~�� �Y� �� .W-- -"� k� x� ~� TY�S� ��� ��~�� �� �� "-)� <-� k� �- -"� k� x� �W-"� k� �c� �� H-"� k-$� <- � k� �� �� ��t|���I-� k��    �   �   � � �    � � �   � � �   � � �   � � �   � � �   � � �   � / 0   �  �   �  � 	  �  � 
  �  �   � ! �   � f �   � l �  �  � o    B  L  U  U  T  T  T  T  L  \  e  e  d  d  d  d  \  l  n  n  n  n  l  z  z  y  y  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  y  � $ � $ � $ � $ � $ � ' � ' � ' � ' ' ' � ' � ' � ' � ' ' ' ' '6 '6 ' ' ' ' ' � ' � 'P )P )P )P )\ )\ )Y )Y )P )P )P ) � 'k $k $k $k $t $t $k $k $k $k $i $| $| $� $� $� $� $| $| $ � $� .� .� .� .� .     �   #     *� 
�    �        � �    �   �   �     �� �Y� eY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� eY� �Y� eY�SY�SY�SY�S� �SY� �Y� eY�SY�SY�SY�S� �SS� ֳ ��    �       � � �        ����  - � 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm Fcf_fileoptions2ecfm129444254$funcCFADMIN_REMOVEFILEFROMSECURITYCONTEXT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   LOCATION  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / getVariable  (I)Lcoldfusion/runtime/Variable; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 _setCurrentLineNo (I)V 7 8
 " 9 ArrayNew (I)Ljava/util/List; ; < coldfusion/runtime/CFPage >
 ? = set (Ljava/lang/Object;)V A B coldfusion/runtime/Variable D
 E C 0 G request.security.contexts I 	IsDefined (Ljava/lang/String;)Z K L
 ? M REQUEST O java/lang/String Q SECURITY S CONTEXTS U _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; W X
 " Y IsStruct (Ljava/lang/Object;)Z [ \
 ? ] _resolve _ X
 " ` java/lang/Object b WEBAPP d _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; f g
 " h 	DIRECTORY j _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; l m
 " n 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; p q
 ? r CFADMIN_GETFILEPOSITION t _get v g
 " w cfadmin_getFilePosition y DAFILE { 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; } ~
 "  _compare (Ljava/lang/Object;D)D � �
 " � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � _int (Ljava/lang/Object;)I � �
 � � ArrayDeleteAt (Ljava/util/List;I)Z � �
 ? � _LhsResolve � X
 " � _arraySetAt :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 " � %cfadmin_removeFileFromsecurityContext � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � Fthis will remove an individual file/dir path from the security context � version � 1,  January 08, 2002 � return � Returns the permissions array. � 
Parameters � REQUIRED � false � NAME � daFile � ([Ljava/lang/Object;)V  �
 � � webapp � 	directory � getMetadata ()Ljava/lang/Object; this HLcf_fileoptions2ecfm129444254$funcCFADMIN_REMOVEFILEFROMSECURITYCONTEXT; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �   2     � RY|SYeSYkS�    �        � �    � �  �  � 	   �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:� 6:� 6:� 6:- �� :-� @� F
H� F- �� :-J� N� a- �� :-P� RYTSYVS� Z� ^� @- �� :--P� RYTSYVS� a� cY-e� iSY-k� iS� o� s� F
- �� :-u� xz-� cY-|� iSY-e� iSY-k� iS� �� F-� i� ��� !- �� :-- � i� �-� i� �� �W- �� :-J� N� W- �� :-P� RYTSYVS� Z� ^� 6-P� RYTSYVS� �� cY-e� iSY-k� iS- � i� �- � i��    �   �   � � �    � � �   � � �   � � �   � � �   � � �   � � �   � - .   �  �   �  � 	  �  � 
  �  �   � { �   � d �   � j �  �  z ^   � : � L � V � V � U � U � U � U � L � ] � _ � _ � _ � _ � ] � l � l � k � k � { � { � { � { � � � � � � � � � � � � � � � � � � � � � � � � � � � { � k � � � � � � � � � � � � � � � � � � � � � � � � � � �	 �	 � � �  �  �  �  �) �) �) �) � � � �	 �> �> �= �= �M �M �M �M �g �g �� �� �� �� �� �� �� �� �g �M �= �� �� �� �� �� �     �   #     *� 
�    �        � �    �   �   �     ƻ �Y� cY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� cY� �Y� cY�SY�SY�SY�S� �SY� �Y� cY�SY�SY�SY�S� �SY� �Y� cY�SY�SY�SY�S� �SS� ĳ ��    �       � � �        ����  -� 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm cf_fileoptions2ecfm129444254  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   NEWFILEREAD Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   %CFADMIN_REMOVEFILEFROMSECURITYCONTEXT   	   DAFILE   	    CHECKCSRFTOKEN " " 	  $ CFADMIN_GETALLENABLEDFILES & & 	  ( URL * * 	  , AFILES . . 	  0 DELETE 2 2 	  4 	URLENCHAR 6 6 	  8 EXECUTE_VAR : : 	  < 
DELETE_VAR > > 	  @ NEWFILEDELETE B B 	  D READ_VAR F F 	  H DELETE_FILEPATH_CONFIRMATION J J 	  L CFADMIN_GETFILE N N 	  P GETCSRFTOKEN R R 	  T TOKEN V V 	  X  CFADMIN_ADDFILETOSECURITYCONTEXT Z Z 	  \ 	WRITE_VAR ^ ^ 	  ` ADDFILE b b 	  d FORM f f 	  h AERRORMESSAGES j j 	  l ERROR_INVALIDFILEPERMISSIONS n n 	  p EDIT r r 	  t WEBAPP v v 	  x NEWFILEWRITE z z 	  | EDITFILE ~ ~ 	  � 
TEMPACTION � � 	  � TEMP � � 	  � NEWFILE � � 	  � ACTION � � 	  � 	DIRECTORY � � 	  � BROWSE_BUTTON � � 	  � BERRORSEXIST � � 	  � NEWFILEEXECUTE � � 	  � SEP � � 	  � STFILE � � 	  � L10N_FINISH � � 	  � com.macromedia.SourceModTime  [�;�� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
 � � parent Ljavax/servlet/jsp/tagext/Tag; � �	  � Cp1252 � setPageEncoding (Ljava/lang/String;)V � � !coldfusion/runtime/NeoPageContext �
 � � _setCurrentLineNo (I)V � �
  � java � java.lang.System � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
  � getProperty � java/lang/Object � file.separator � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
  � checkSimpleParameter 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V � �
  � H
<script language="Javascript" src="../scripts/util.js"></script>


 � write � � java/io/Writer �
 � � $class$coldfusion$tagext$io$SilentTag Ljava/lang/Class; coldfusion.tagext.io.SilentTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � coldfusion/tagext/io/SilentTag � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I 
 � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;	
 
 _factor1	
  _factor2	
  doAfterBody
 � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
  doEndTag #javax/servlet/jsp/tagext/TagSupport
 doCatch (Ljava/lang/Throwable;)V
 �  	doFinally" 
 �# 
ADDNEWFILE% FORM.ADDNEWFILE'  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z)*
 + _Object (Z)Ljava/lang/Object;-. coldfusion/runtime/Cast0
1/ _boolean (Ljava/lang/Object;)Z34
15 
URL.ACTION7 java/lang/String9 _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;;<
 = delete? _compare '(Ljava/lang/Object;Ljava/lang/String;)DAB
 C editE  G set (Ljava/lang/Object;)VIJ coldfusion/runtime/VariableL
MK 	CSRFTOKENO FORM.CSRFTOKENQ URL.CSRFTOKENS _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;UV
 W checkCSRFTokenY _autoscalarize[V
 \ REQUEST^ SECTABKEYNAME` 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;bc
 d ORIGINALNAMEf FORM.ORIGINALNAMEh V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V �j
 k FORM.NEWFILEREADm falseo FORM.NEWFILEWRITEq FORM.NEWFILEEXECUTEs FORM.NEWFILEDELETEu (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagxw �	 z "coldfusion/tagext/lang/ImportedTag| l10n~ 
../cftags/� admin� setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V��
}� &coldfusion/runtime/AttributeCollection� id� error_InvalidFilePermissions� var� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
� �
		Invalid path or path without permisions error.<br />
		Please make sure the file or directory exists and some level of permision is enabled.
		This update could not be completed.
	�
�
� 
�# _String &(Ljava/lang/Object;)Ljava/lang/String;��
1� Trim &(Ljava/lang/String;)Ljava/lang/String;��
 � true� _List $(Ljava/lang/Object;)Ljava/util/List;��
1� ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z��
 � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V��
 �  cfadmin_addFileToSecurityContext� _factor3�	
 � %cfadmin_removeFileFromsecurityContext� TARGET� FORM.NEWFILE� cfadmin_getAllEnabledFiles� cfadmin_getFile� _Map #(Ljava/lang/Object;)Ljava/util/Map;��
1� StructIsEmpty (Ljava/util/Map;)Z��
 � D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object;;�
 � read� ListFind '(Ljava/lang/String;Ljava/lang/String;)I��
 � (J)Z3�
1� "true"� "false"� IIf 9(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/Object;��
 � � execute� $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag�� �	 � coldfusion/tagext/io/OutputTag�
� 
� _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V��
 � 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag�� �	 � !coldfusion/tagext/lang/IncludeTag� ../include/errors.cfm� setTemplate� �
�� _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z��
 � q
<table border="0" cellpadding="0" cellspacing="0">
<tr>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="# 	BLUELIGHT 5">&nbsp;&nbsp; <a href="javascript:changeTab('dsn')"> l10n_secdsource Data Sources	 M</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="# 8">&nbsp;&nbsp; <a href="javascript:changeTab('cftags')"> l10n_cftags CF Tags =">&nbsp;&nbsp; <a href="javascript:changeTab('cffunctions')"> l10n_cffunctions CF Functions L</a> &nbsp;&nbsp;</td>
	<td>&nbsp;</td>
	<td nowrap height="25" bgcolor="# 	GRAYLIGHT 7">&nbsp;&nbsp; <a href="javascript:changeTab('files')"> l10n_cfilesdir 
Files/Dirs! _factor7#	
 $ 8">&nbsp;&nbsp; <a href="javascript:changeTab('ipport')">& ipports( Server/Ports* T</a> &nbsp;&nbsp;</td>
        <td>&nbsp;</td>
	<td nowrap height="25"  bgcolor="#, 8">&nbsp;&nbsp; <a href="javascript:changeTab('Others')">. Others0 z</a> &nbsp;&nbsp;</td>
</tr>
</table>

<table border="0" cellpadding="0" cellspacing="1" width="100%">
<tr bgcolor="#2 i" class="cellBlueTopAndBottom">
	<td height="20"><font class="label">&nbsp;&nbsp; <b class="form-title">4 addEditSecuredFileDir6 )Add / Edit Secured Files and Directories:8 
		: 
			< /*> (@ rootsecuritycntxB Root Security ContextD )F 
ESAPIUTILSH _resolveJ<
 K encodeForHTMLFilePathM _factor8O	
 P �
	</b></font></td>
</tr>
<tr>
	<td align="center">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr><td height="5"></td></tr>
		<tr>
			<td nowrap>
				<font class="label">&nbsp; <label for="logic">R logical_filepathT 	File PathV b</label> &nbsp;</font>
			</td>
			<td><input type="text" maxlength="550" name="newfile" value="X encodeForHTMLAttributeFilePathZ b" size="25" style="width:30em;" class="label"  id="logic"></td>
			<td>&nbsp;</td>
			<td>
				\ button_browse^ browse_button` Browse Serverb "
				<input type="button" title="d " name="browsesubmit" value="f b" class="buttn" onclick='wopen("logic");'>
			</td>
		</tr>
		<tr><td height="5"></td></tr>
		h read_varj Readl 	write_varn Writep execute_varr Executet _factor9v	
 w 
delete_vary Delete{ H
		<tr>
			<td nowrap><font class="label">&nbsp; <label for="dirpath">} permissions Permissions� �</label> &nbsp; &nbsp;</font></td>
			<td nowrap>
				<table border="0" cellpadding="0" cellspacing="0"><tr>
				<td><font class="label"><label for="fr">� ]</label></font></td>
				<td><input type="checkbox" name="newfileread" value="true" id="fr" � checked� k ></td>
				<td><font class="label">&nbsp;&nbsp;</font></td>
				<td><font class="label"><label for="fw">� _</label></font></td>
				<td><input type="checkbox" name="newfilewrite" value="true" id="fw"  � j></td>
				<td><font class="label">&nbsp;&nbsp;</font></td>
				<td><font class="label"><label for="fe">� a</label></font></td>
				<td><input type="checkbox" name="newfileexecute" value="true" id="fe"  � j></td>
				<td><font class="label">&nbsp;&nbsp;</font></td>
				<td><font class="label"><label for="fd">� `</label></font></td>
				<td><input type="checkbox" name="newfiledelete" value="true" id="fd"  � �></td>
				</tr></table>
			</td>
			<td><font class="label">&nbsp;&nbsp;</font></td>
		</tr>
		<tr><td height="5"></td></tr>
		</table>	
	</td>
</tr>
<tr>
	<td height="30" class="cellBlueTopAndBottom" bgcolor="#� �">
		<table border="0" cellpadding="0" cellspacing="0"><tr>
		<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
			<td>
				� addFile� Add Files / Paths� 
				� editFile� Edit Files / Paths� 	_factor10�	
 � Len (Ljava/lang/Object;)I��
 � #
					<input type="submit" title="� " name="addNewFile" value="� " class="buttn">
				� " class="buttn">
					� 7
					<input type="Hidden" name="originalName" value="� EncodeForHTMLAttribute��
 � ">
				� Q
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

<br clear="left" />
� delete_filepath_confirmation� 8
	Are you sure that you want to delete the File Path?
� Q
<table border="0" cellpadding="2" cellspacing="1" width="100%">
<tr bgcolor="#� o" class="cellBlueTopAndBottom">
	<td height="20" colspan="3"><font class="label">&nbsp; <b class="form-title">� file_active� Secured Files and Directories� V</b></font></td>
</tr>
<tr class="color-header">
	<th nowrap height="20" bgcolor="#� &" class="cellBlueTopAndBottom">&nbsp; � actions� Actions� 	_factor11�	
 � 1 &nbsp; &nbsp;</td>
	<th width="100%" bgcolor="#� File� + &nbsp; &nbsp;</td>
	<th nowrap bgcolor="#�  &nbsp;</td>
</tr>

� isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z��
 � IsArray�4
 � ArrayLen��
 � (I)Ljava/lang/Object;-�
1� 
	� 1� _double (Ljava/lang/String;)D��
1� (D)Ljava/lang/Object;-�
1� P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; �
 � J
	<tr>
		<td nowrap height="20" class="cell3BlueSides">
			<table>
			� Edit� 
			<tr>
			<td>
				� _arrayGetAt C(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)Ljava/lang/Object;��
 � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object;;�
   <<ALL FILES>> ram:///- ram:/// 
					 /CFIDE
 
ExpandPath�
  '(Ljava/lang/Object;Ljava/lang/Object;)DA
  GetPageContext %()Lcoldfusion/runtime/NeoPageContext;
  getServletContext getRealPath /CFIDE/ endsWith CFIDE concat �
:! java/lang/StringBuffer#  �
$% append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;'(
$) toString ()Ljava/lang/String;+,
 �- 	/WEB-INF// WEB-INF1 
						<a href="3 CGI5 SCRIPT_NAME7 ?page=files&action=edit&target=9 URLEncodedFormat 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;;<
 = &webapp=? &directory=A &csrftoken=C getCSRFTokenE P">
						<img src="../images/iedit.gif" height="16" width="16" border="0" alt="G "></a>
					I "></a>
				K _factor4M	
 N 
			</td>
			<td>
				P 

						<a href="R !?page=files&action=delete&target=T "  onclick="return confirm('V J')";>
						<img src="../images/idelete.gif" height="16" width="16" alt="X " border="0"></a>
					Z " border="0"></a>
				\ _factor5^	
 _ ]
			</td>
			</tr></table>
		</td>
		<td nowrap class="cellRightAndBottomBlueSide">
				a "
					<font class="label">&nbsp; c <,>e 	&lt;,&gt;g ReplaceList J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;ij
 k  &nbsp; &nbsp;</font>
				m +
					<font class="label">&nbsp; <a href="o ">q </a> &nbsp; &nbsp;</font>
				s _factor6u	
 v S
		</td>
		<td nowrap class="cellRightAndBottomBlueSide"><font class="label">
		x 	VARIABLESz ListContains|�
 } , 
ListAppend�j
 � 
		&nbsp; � EncodeForHTML��
 �  &nbsp;</font></td>
	</tr>
	� CFLOOP� checkRequestTimeout� �
 � _checkCondition (DDD)Z��
 � N	
	<tr>
		<td colspan="3" height="50" align="center"><font class="sentance">� map_nomappings� No mappings are active.� </font></td>
	</tr>
� 	_factor12�	
 � finish� l10n_finish� Finish� -
<tr class="cellBlueTopAndBottom" bgcolor="#� �">
	<td height="30" colspan="3">
		<table border="0" cellpadding="0" cellspacing="0"><tr>
		<td nowrap><font class="label">&nbsp;&nbsp;</font></td>
		<td><input type="Submit" title="� " class="buttn-fix" value="� �" name="finish"></td>
		</tr></table></td>
</tr>
</table>

<br />
<table border="0" cellpadding="0" cellspacing="0" width="80%">
<tr><td>
<p class="sentance">
� 
step_files� m
	Enter files that you would like to <b>grant</b> access for 
	templates operations under this directory.
�  
</p>

<p class="sentance">
� step_files_tip��
	A file permission consists of a pathname and a set of actions valid 
	for that pathname. A pathname is the pathname of the file or 
	directory granted the specified actions. A pathname that ends in "/*" 
	indicates all the files and directories contained in that directory. 
	A pathname that ends with "/-" indicates (recursively) all files and 
	subdirectories contained in that directory. A pathname consisting of the 
	special token &quot;&lt;&lt;ALL FILES&gt;&gt;&quot; matches any file.
� 6
</p>

<br />
<br />
<br />
</td></tr></table>
� IsDebugMode ()Z��
 � dump� /WEB-INF/cftags� SECURITY� CONTEXTS� 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;��
 � cfdump� _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;��
 �
� coldfusion/tagext/QueryLoop�
�
� 
�# 	_factor13�	
 � cfadmin_getFilePosition Lcoldfusion/runtime/UDFMethod; 8cf_fileoptions2ecfm129444254$funcCFADMIN_GETFILEPOSITION�
� 	��	 � CFADMIN_GETFILEPOSITION� registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V��
 � ;cf_fileoptions2ecfm129444254$funcCFADMIN_GETALLENABLEDFILES�
� 	��	 � Acf_fileoptions2ecfm129444254$funcCFADMIN_ADDFILETOSECURITYCONTEXT�
� 	��	 � Fcf_fileoptions2ecfm129444254$funcCFADMIN_REMOVEFILEFROMSECURITYCONTEXT�
� 	��	 � 0cf_fileoptions2ecfm129444254$funcCFADMIN_GETFILE�
� 	��	 � metaData Ljava/lang/Object;��	 � 	Functions�	��	��	��	��	�� getMetadata ()Ljava/lang/Object; this Lcf_fileoptions2ecfm129444254; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs __factorParent out Ljavax/servlet/jsp/JspWriter; value module27 $Lcoldfusion/tagext/lang/ImportedTag; mode27 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module28 mode28 t14 t15 t16 t17 t18 t19 module29 mode29 t22 t23 t24 t25 t26 t27 module30 mode30 t30 t31 t32 t33 t34 t35 LineNumberTable java/lang/Throwable6 module32 mode32 module33 mode33 module34 mode34 module35 mode35 module36 mode36 t20 D module39 mode39 t29 silent1  Lcoldfusion/tagext/io/SilentTag; mode1 t12 output44  Lcoldfusion/tagext/io/OutputTag; mode44 module40 mode40 t28 module41 mode41 t36 module42 mode42 t39 t40 t41 t42 t43 t44 module43 t46 t47 t48 t49 t50 t51 module18 mode18 module19 mode19 module20 mode20 module21 mode21 module22 mode22 module23 mode23 module24 mode24 module25 mode25 module26 mode26 t38 	include13 #Lcoldfusion/tagext/lang/IncludeTag; module14 mode14 module15 mode15 module16 mode16 module17 mode17 runPage module37 mode37 module38 mode38 <clinit> module7 mode7 1     0                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     �     �     �     �     �     �     �     �     �     �     � �   w �   � �   � �   ��   ��   ��   ��   ��   ��        "     ���                      �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � �**�+,� � ��          �    �	
   �       M     /*߲ݶ�*'���*[����*���*O����          /         #     *� 
�             �	     $  *,;��*�{+� ��}:*ɶ �������Y� �Y�SY@SY�SYzS����� ���Y6� 6*,�M,|� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���,~� �*�{+� ��}:*˶ �������Y� �Y�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,�� �,**� I�]��� �,�� �**� �]�6� 
,�� �,�� �,**� a�]��� �,�� �**� }�]�6� 
,�� �,�� �,**� =�]��� �,�� �**� ��]�6� 
,�� �,�� �,**� A�]��� �,�� �**� E�]�6� 
,�� �,�� �,*_�:YS�>��� �,�� �*�{+� ��}:*� �������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���*,���*�{+� ��}:*� �������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� : � # �� � #:!!��� � :"� "�:#���#*�   f � �7 � � �7 [ � �7 � � �7 [ � �7 � � �7 � � �7 � � �7*FI7INI7iu7oru7i�7or�7u��7���7�� 7  7� ,7&),7� ;7&);7,8;7;@;7���7���7���7���7��7��7�	77   j $       �      �            �   �    	   
  �             �   !�   "   #   $�   %   &   '   (�   )�   *   +   ,�   -   .   /   0�   1�    2 !  3 "  4� #5   � 7 ?� ?� K� K� ��� �������������������������������������� ����3�3�3�3�2�H�H�H�e�e�e�e�d�������������������T� �	   �    �*,���**� igi�,��2Y�6� 'W*� �*g�:YgS�>�������2Y�6� :W**� -�8�,��2Y�6�  W*+�:Y�S�>F�D�~�2�6� 9,�� �,**� e�]��� �,�� �,**� e�]��� �,�� � {,�� �,**� ��]��� �,�� �,**� ��]��� �,�� �**� igi**� ��]�l,�� �,*�� �*g�:YgS�>����� �,�� �,�� �*�{ +� ��}:*�� �������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���,�� �,*_�:YS�>��� �,¶ �*�{!+� ��}:*�� �������Y� �Y�SY�S����� ���Y6� 6*,�M,ƶ ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,ȶ �,*_�:YS�>��� �,ʶ �*�{"+� ��}:*�� �������Y� �Y�SY�S����� ���Y6� 6*,�M,ζ ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���*� ���7���7���7���7���7���7���7���7���7���7u��7���7u��7���7���7���7c�7���7X��7���7X��7���7���7���7      �    � �   �   ��   �8   �9   �   ��   ��   � 	  � 
  ��   �:   �;   �   � �   �!�   �"   �#   �$�   �<   �=   �'   �(�   �)�   �*   �+   �,� 5  �  	� 	� 	� 	� � � � � � � � � � � � � *� *� *� *� *� *� *� *� *� *� � � � � O� O� O� O� S� S� U� U� N� N� N� N� N� N� N� N� h� h� w� w� h� h� h� h� N� N� N� N� � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ����������� �� �v�v�����?������e�e�.�����������H�H�� �	   
!  #  E,Ӷ �,*_�:YS�>��� �,ʶ �*�{#+� ��}:* � �������Y� �Y�SY�S����� ���Y6� 6*,�M,W� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���,׶ �,*_�:YS�>��� �,ʶ �*�{$+� ��}:*� �������Y� �Y�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,ٶ �**� 1�ݸ2Y�6� W*� �**� 1�]��2Y�6� W*� �**� 1�]���6�c*,��9*� �**� 1�]��9��9��N*��:-�N�*+,�O� �*+,�`� �*+,�w� �,y� �*{�:Y�SH��*:� �***� 1**� !�]�����:Y�S���и~��י -*� �*;� �**� ��]��**� I�]������N*<� �***� 1**� !�]�����:Y�S����~��י -*� �*=� �**� ��]��**� a�]������N*>� �***� 1**� !�]�����:Y�S����~��י -*� �*?� �**� ��]��**� =�]������N*@� �***� 1**� !�]�����:Y�S���@�~��י -*� �*A� �**� ��]��**� A�]������N,�� �,*C� �*{�:Y�S�>����� �,�� �c\9��N-�N��������*,�� �,�� �*�{'+� ��}:*H� �������Y� �Y�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:  ��� � :!� !�:"���",�� �*�  x � �7 � � �7 m � �7 � � �7 m � �7 � � �7 � � �7 � � �7[wz7zz7P��7���7P��7���7���7���7���7���7�77�+7+7(+7+0+7   B    E    E �   E   E�   E>   E?   E   E�   E�   E 	  E 
  E�   E@   EA   E   E �   E!�   E"   E#   E$�   EBC   E'C   E)C   E+    ED   EE   EF   E/�   E0�   E1    E2 !  E3� "5  � �           ]  ]  &  � � � � �@@	��������������������******88�9�9�9�9�9�:�:�:�:�:�:�:�:�:�:�;�;�;�;�;�;�;�;�;�;�;�;�;�;�;�:<<�<�<�<�<!<!<�<�<9=9=9=9=D=D=D=D=O=O=9=9=9=9=.=�<e>e>_>_>_>_>�>�>_>_>�?�?�?�?�?�?�?�?�?�?�?�?�?�?�?_>�@�@�@�@�@�@�@�@�@�@�A�A�A�AAAAAAA�A�A�A�A�A�@�8)C)C)C)C)C)C)C)C!Cj �H�HHxF� �	   �  4  	8**� �*� �**� �*�ζ ��� �Y�S� ܶ �,� �*� �+� �� �:*� �� ��Y6� F*,�M*,�� :� � W����� � :� �:*,�M��� :	� #	�� � #:

�!� � :� �:�$�**� i&(�,�2Y�6� `W**� -�8�,�2Y�6� HW*+�:Y�S�>@�D�~��2Y�6� "W*+�:Y�S�>F�D�~��2�6� �*� YH�N**� iPR�,�2Y�6� W**� -PT�,�2�6� >*� Y**� iPR�,� *+�:YPS�>� *g�:YPS�>�N*:� �**� %�XZ*� �Y**� Y�]SY*_�:YaS�>S�eW**� i&(�,� *+,��� �**� -�8�,�2Y�6� W**� ��]@�D�~��2�6� M*� �*q� �**� �X�*� �Y*+�:Y�S�>SY**� y�]SY**� ��]S�e�N**� i��H�l**� in��l**� i{r��l**� i�tp�l**� iCv��l*� 1*�� �**� )�X�*� �Y**� y�]SY**� ��]S�e�N**� -�8�,��*+�:Y�S�>F�D���*� �*�� �**� Q�X�*� �Y*+�:Y�S�>SY**� y�]SY**� ��]S�e�N*�� �***� ��]�Ƕ���8*g�:Y�S**� ��:Y�S�ζ�*g�:YS*�� �**�� �**� ��:Y�S�θ�иԅ���۶߶�*g�:Y{S*�� �**�� �**� ��:Y�S�θ��ԅ���۶߶�*g�:Y�S*�� �**�� �**� ��:Y�S�θ��ԅ���۶߶�*g�:YCS*�� �**�� �**� ��:Y�S�θ�@�ԅ���۶߶�*��,+� ���:*�� �� ���Y6��*,�%� :��*,�Q� :��*,�x� :���*,��� :���*,��� :���*,��� :���*,��*�{(� ��}:*K� �������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� &��� � #:��� � :� �:���,�� �,*_�:YS�>��� �,�� �,**� ��]��� �,�� �,**� ��]��� �,�� �*�{)� ��}:*Y� �������Y� �Y�SY�S����� ���Y6� 6*,�M,�� ������� � :� �: *,�M� �� :!� &��!�� � #:""��� � :#� #�:$���$,�� �*�{*� ��}:%*`� �%����%��Y� �Y�SY�S����%� �%��Y6&� 6*%&,�M,�� �%������ � :'� '�:(*&,�M�(%�� :)� &�*)�� � #:*%*��� � :+� +�:,%���,,�� �*o� �*��� �*,��*�{+� ��}:-*p� �-����**_�:Y�SY�S�L� �Y**� y�]SY**� ��]S��:.��.��W-��Y� �Y�SY.S����-� �-� � :/� M/�*,��*,���Κ���� :0� #0�� � #:11�Ҩ � :2� 2�:3�ө3*� = T o �7 u � �7 � � �7 I o �7 u � �7 � � �7 I o �7 u � �7 � � �7 � � �7 � � �7�7
7�(47.147�(C7.1C74@C7CHC7�77�;G7ADG7�;V7ADV7GSV7V[V7���7���7�7	7�7	77#7�	7)	7/=	7CQ	7We	7ky	7(	7.;	7A	7	�	7�	
	7			7�	%7)	%7/=	%7CQ	%7We	%7ky	%7(	%7.;	%7A	%7	�	%7�	
	%7			%7		"	%7	%	*	%7   
 4  	8    	8 �   	8   	8�   	8GH   	8I   	8�   	8   	8�   	8� 	  	8 
  	8   	8J�   	8KL   	8M   	8 �   	8!�   	8"�   	8#�   	8$�   	8B�   	8N   	8O   	8(   	8)�   	8*�   	8+   	8,   	8P�   	8Q   	8R   	80   	81�    	82� !  	83 "  	84 #  	8S� $  	8T %  	8U &  	8V '  	8W� (  	8X� )  	8Y *  	8Z +  	8[� ,  	8\ -  	8]� .  	8^� /  	8_� 0  	8` 1  	8a 2  	8b� 35  �f                   
  
  
  
  )  /  �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 �2 2 222 2 2 2 2&2&25252&2&2&2&2 2 2 2 2 �2 �2 �2 �2 �2 �2N5N5N5N5J5U6U6U6U6Y6Y6\6\6T6T6T6T6n6n6n6n6r6r6u6u6m6m6m6m6T6T6�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8�8T6�:�:�:�:�:�:�:�:�: �2 �1�A�A�A�A�A�AAA�A�A�Aoooooooooooo.o.o6o6o.o.o.o.oooVqVqhqhq{q{q�q�qVqVqVqVqKqKpo�{�{�|�|�}�}�~�~������������������������!�!�#�#���,�,�;�;�Q�Q�c�c�v�v�����Q�Q�Q�Q�F�����������������������������������������������������������������,�,�,�,�@�@�,�,�,�,�J�J�M�M�$�$�$�$��q�q�q�q�����q�q�q�q���������i�i�i�i�V�����������������������������������������,�����K�K�K�K�K\L\L\L\L[L{P{P{P{PzP�P�P�P�P�P�Y�Y�Y�`�`n`=o=oqpqp�p�p�p�pppppppppLp=o�� O	   3 	 $  �,� �,*_�:YS�>��� �,'� �*�{+� ��}:*�� �������Y� �Y�SY)S����� ���Y6� 6*,�M,+� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���,-� �,*_�:YS�>��� �,/� �*�{+� ��}:*�� �������Y� �Y�SY1S����� ���Y6� 6*,�M,1� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,3� �,*_�:YS�>��� �,5� �*�{+� ��}:*�� �������Y� �Y�SY7S����� ���Y6� 6*,�M,9� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���*,;��**� ��]H�D�� *,;��)*,=��**� ��]?�D�� �,A� �*�{+� ��}:*�� �������Y� �Y�SYCS����� ���Y6� 6*,�M,E� ������� � :� �:*,�M��� : � # �� � #:!!��� � :"� "�:#���#,G� � 8,*�� �**_�:YIS�LN� �Y**� ��]S� ܸ�� �*,;��*�   x � �7 � � �7 m � �7 � � �7 m � �7 � � �7 � � �7 � � �7[wz7zz7P��7���7P��7���7���7���7>Z]7]b]73}�7���73}�7���7���7���7C_b7bgb78��7���78��7���7���7���7   j $  �    � �   �   ��   �c   �d   �   ��   ��   � 	  � 
  ��   �e   �f   �   � �   �!�   �"   �#   �$�   �g   �h   �'   �(�   �)�   �*   �+   �,�   �i   �j   �/   �0�   �1�    �2 !  �3 "  �4� #5   � . � � � � � ]� ]� &� �� �� �� �� ��@�@�	�����������#�#�������������������(�(������������������������� v	   $ 	 ,  p,S� �*�{+� ��}:*�� �������Y� �Y�SYUS����� ���Y6� 6*,�M,W� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���,Y� �,*�� �**_�:YIS�L[� �Y**� ��]S� ܸ�� �,]� �*�{+� ��}:*�� �������Y� �Y�SY_SY�SYaS����� ���Y6� 6*,�M,c� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,e� �,**� ��]��� �,g� �,**� ��]��� �,i� �*�{+� ��}:*ƶ �������Y� �Y�SY�SY�SYkS����� ���Y6� 6*,�M,m� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���*,;��*�{+� ��}:*Ƕ �������Y� �Y�SY�SY�SYoS����� ���Y6� 6*,�M,q� ������� � :� �:*,�M��� : � # �� � #:!!��� � :"� "�:#���#*,;��*�{+� ��}:$*ȶ �$����$��Y� �Y�SY�SY�SYsS����$� �$��Y6%� 6*$%,�M,u� �$������ � :&� &�:'*%,�M�'$�� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u x7 x } x7 N � �7 � � �7 N � �7 � � �7 � � �7 � � �7e��7���7Z��7���7Z��7���7���7���7a}�7���7V��7���7V��7���7���7���72NQ7QVQ7'q}7wz}7'q�7wz�7}��7���7"7"'"7�BN7HKN7�B]7HK]7NZ]7]b]7   � ,  p    p �   p   p�   pk   pl   p   p�   p�   p 	  p 
  p�   pm   pn   p   p �   p!�   p"   p#   p$�   po   pp   p'   p(�   p)�   p*   p+   p,�   pq   pr   p/   p0�   p1�    p2 !  p3 "  p4� #  ps $  pt %  pu &  pV� '  pW� (  pX )  pY *  pZ� +5   � ( >� >� � �� �� �� �� �� �� ��>�>�J�J����������������������:�:�F�F������������������ u	   �    X,b� �***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2Y�6�!W**� ��]*-� �*���~��2Y�6� MW**� ��]*-� �**-� �**-� �*�� ֶ �� �YS� ܸ�~��2Y�6� 2W*.� �***� ��X� �Y**� ��]���"S� �Y�6� JW*.� �***� ��X� �Y�$Y**� ��]���&�***� ��]���*�.S� �Y�6� MW**� ��]*/� �**/� �**/� �*�� ֶ �� �YS� ܸ�~��2Y�6� MW**� ��]*0� �**0� �**0� �*�� ֶ �� �Y0S� ܸ�~��2Y�6� 2W*1� �***� ��X� �Y**� ��]��2�"S� �Y�6� JW*1� �***� ��X� �Y�$Y**� ��]���&2�***� ��]���*�.S� ܸ6� L,d� �,*2� �***� 1**� !�]�����:Y�S���fh�l� �,n� �>,p� �,*6�:Y8S�>��� �,:� �,*4� �***� 1**� !�]�����:Y�S���**� 9�]���>� �,@� �,*4� �**� y�]��**� 9�]���>� �,B� �,*4� �**� ��]��**� 9�]���>� �,D� �,*4� �**� U�XF*� �Y*_�:YaS�>S�e��� �,r� �,*4� �***� 1**� !�]�����:Y�S���fh�l� �,t� �*�      *   X    X �   X   X� 5  > , , , , (, (, , , , , E, E, ?, ?, `, `, ?, ?, ?, ?, , , , , }, }, w, w, �, �, w, w, w, w, , , , , �- �- �- �- �- �- �- �- �- �- �- �- �- �- �- �--- �- �- �- �- �- �- �- �- �- �-2.2.C.C.C.C.N.N.C.C.1.1.1.1. �. �. �. �.h.h.}.}.}.}.�.�.�.�.�.�.y.y.g.g.g.g. �. �. �. �.�/�/�/�/�/�/�/�/�/�/�/�/�/�/ �/ �/ �/ �/�0�00000505000�0�0�0�0 �0 �0 �0 �0X1X1i1i1i1i1t1t1i1i1W1W1W1W1 �1 �1 �1 �1�1�1�1�1�1�1�1�1�1�1�1�1�1�1�1�1�1�1 �1 �1 �1 �1 , ,�2�2�2�2�2�22222�2�2�2�2�2#4#4#4#4"4O4O4I4I4I4I4m4m4m4m4I4I4I4I4A4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4%4%44444C4C4F4F4444443 , #	   �  %  �*,��*��+� ���:*�� ����� �� � �,� �,*_�:YS�>��� �,� �*�{+� ��}:*�� �������Y� �Y�SYS����� ���Y6� 6*,�M,
� ������� � :� �:*,�M��� :	� #	�� � #:

��� � :� �:���,� �,*_�:YS�>��� �,� �*�{+� ��}:*�� �������Y� �Y�SYS����� ���Y6� 6*,�M,� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,� �,*_�:YS�>��� �,� �*�{+� ��}:*�� �������Y� �Y�SYS����� ���Y6� 6*,�M,� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,� �,*_�:YS�>��� �,� �*�{+� ��}:*�� �������Y� �Y�SY S����� ���Y6� 6*,�M,"� ������� � :� �: *,�M� �� :!� #!�� � #:""��� � :#� #�:$���$*�   � � �7 � � �7 � � �7 � � �7 � �7 � �7 �77���7���7���7���7���7���7���7���7t��7���7i��7���7i��7���7���7���7Wsv7v{v7L��7���7L��7���7���7���7   t %  �    � �   �   ��   �vw   �x   �y   �   ��   �� 	  � 
  �   �J�   �z   �{   �    �!�   �"�   �#   �$   �B�   �|   �}   �(   �)�   �*�   �+   �,   �P�   �~   �   �0   �1�    �2� !  �3 "  �4 #  �S� $5   � #  �  � � >� >� >� >� =� �� �� \�!�!�!�!� �v�v�?������Y�Y�"�����������<�<�� 	    >     *�      *          �        �  	    >     *�      *          �        �  �    l     $*� �� �L*� �N*� ��� �*-+��� ��      *    $     $    $�    $ � � 5       M	   B    �,�� �*�{%+� ��}:*	� �������Y� �Y�SYFSY�SYFS����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���*,=��*�{&+� ��}:*
� �������Y� �Y�SY@SY�SY@S����� ���Y6� 6*,�M,|� ������� � :� �:*,�M��� :� #�� � #:��� � :� �:���,�� �***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2�6�c*,	��**� ��]*� �*���~�2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �YS� ܸ�~�2Y�6� :W*� �***� ��X� �Y**� ��]���"S� ܸ6��2Y�6� RW*� �***� ��X� �Y�$Y**� ��]���&�***� ��]���*�.S� ܸ6��2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �YS� ܸ�~�2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �Y0S� ܸ�~�2Y�6� :W*� �***� ��X� �Y**� ��]��2�"S� ܸ6��2Y�6� RW*� �***� ��X� �Y�$Y**� ��]���&2�***� ��]���*�.S� ܸ6��2�6�,4� �,*6�:Y8S�>��� �,:� �,*� �***� 1**� !�]�����:Y�S���**� 9�]���>� �,@� �,*� �**� y�]��**� 9�]���>� �,B� �,*� �**� ��]��**� 9�]���>� �,D� �,*� �**� U�XF*� �Y*_�:YaS�>S�e��� �,H� �,**� u�]��� �,J� �*,���,4� �,*6�:Y8S�>��� �,:� �,*� �***� 1**� !�]�����:Y�S���**� 9�]���>� �,@� �,*� �**� y�]��**� 9�]���>� �,B� �,*� �**� ��]��**� 9�]���>� �,D� �,*� �**� U�XF*� �Y*_�:YaS�>S�e��� �,H� �,**� u�]��� �,L� �*�  e � �7 � � �7 Z � �7 � � �7 Z � �7 � � �7 � � �7 � � �76RU7UZU7+u�7{~�7+u�7{~�7���7���7    �   �    � �   �   ��   ��   ��   �   ��   ��   � 	  � 
  ��   ��   ��   �   � �   �!�   �"   �#   �$� 5  G >	 >	 J	 J	 	



 �
����������������������99��VVffeeVVVV~~��������~~~~VVVV������������������VVVV((((66<<<<$$VVVVaa��xx��ppaaaaVVVV��������������VVVV##VVVVEEZZZZhhnnnnVVDDDDDDDDVV���������������������....9999....&YYkkYYYYQ�����V�����������    �����    ++++    KKKKVVVVKKKKCvv��vvvvn������� ^	   
�    M,Q� �***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2Y�6� 4W***� 1**� !�]�����:Y�S��D�~��2�6�y*,	��**� ��]*� �*���~�2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �YS� ܸ�~�2Y�6� :W*� �***� ��X� �Y**� ��]���"S� ܸ6��2Y�6� RW*� �***� ��X� �Y�$Y**� ��]���&�***� ��]���*�.S� ܸ6��2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �YS� ܸ�~�2Y�6� KW**� ��]*� �**� �**� �*�� ֶ �� �Y0S� ܸ�~�2Y�6� :W*� �***� ��X� �Y**� ��]��2�"S� ܸ6��2Y�6� RW*� �***� ��X� �Y�$Y**� ��]���&2�***� ��]���*�.S� ܸ6��2�6�+,S� �,*6�:Y8S�>��� �,U� �,*!� �***� 1**� !�]�����:Y�S���**� 9�]���>� �,@� �,*!� �**� y�]��**� 9�]���>� �,B� �,*!� �**� ��]��**� 9�]���>� �,D� �,*!� �**� U�XF*� �Y*_�:YaS�>S�e��� �,W� �,**� M�]��� �,Y� �,**� 5�]��� �,[� �*,���+,4� �,*6�:Y8S�>��� �,U� �,*%� �***� 1**� !�]�����:Y�S���**� 9�]���>� �,@� �,*%� �**� y�]��**� 9�]���>� �,B� �,*%� �**� ��]��**� 9�]���>� �,D� �,*%� �**� U�XF*� �Y*_�:YaS�>S�e��� �,W� �,**� M�]��� �,Y� �,**� 5�]��� �,]� �*�      *   M    M �   M   M� 5  G     ( (     E E ? ? ` ` ? ? ? ?     } } w w � � w w w w   � � � � � � � � � � � � � � � � � � � � � � � � � �44EEEEPPEE33333333 � � � �rr������������qqqqqqqq � � � ��������������� � � � �..&&EE � � � �ffwwww��wweeeeeeee � � � ����������������������� � ��!�!�!�!�!$!$!!!!!B!B!B!B!!!!!!b!b!b!b!m!m!m!m!b!b!b!b!Z!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!�!""""" �+%+%+%+%*%W%W%Q%Q%Q%Q%u%u%u%u%Q%Q%Q%Q%I%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�% % % % %%6&6&6&6&5&#$  	    b     *+,�� �*+,�� �*�      *          �        � 5       	 �     � 	    �� � �y� �{� ��� ����Y�۳ݻ�Y����Y�����Y����Y������Y� �Y�SY� �Y��SY��SY� SY�SY�SS�����          �  5   * 
 k k q ? q ? w  w  } � } � � � � � �	       **� igiH�l**� inp�l**� i{rp�l**� i�tp�l**� iCvp�l*�{+� ��}:*J� �������Y� �Y�SY�SY�SY�S����� ���Y6� 6*,�M,�� ������� � :� �:*,�M��� :� #�� � #:		��� � :
� 
�:���*P� �*g�:Y�S�>����H�D�~��2Y�6� xW*g�:YS�>�6��2Y�6� W*g�:Y{S�>�6��2Y�6� W*g�:Y�S�>�6��2Y�6� W*g�:YCS�>�6��2�6� L*� ���N*T� �**� m�]��**� q�]��W*g�:Y�S*g�:Y�S�>���*� �*^� �**� ]�X�*� �Y*g�:YgS�>SY*g�:Y�S�>SY*g�:YS�>SY*g�:Y{S�>SY*g�:Y�S�>SY*g�:YCS�>SY**� y�]SY**� ��]S�e�N*g�:Y�SH��*g�:YS���*g�:Y{S���*g�:Y�Sp��*g�:YCS���*�  � � �7 � � �7 � � �7 � � �7 � �	7 � �	7 �	7		7    z        �      �   �   �      �   �    	   
  � 5   � A A A A A A A A C C  A  A  A A A A A A A A A D D A A A "A "A "A "A &A &A (A (A +E +E !A !A !A 2A 2A 2A 2A 6A 6A 8A 8A ;F ;F 1A 1A 1A BA BA BA BA FA FA HA HA KG KG AA AA AA �J �J �J �J QJ!P!P!P!P!P!P6P6P!P!P!P!PMPMPMPMPMPMPMPMPlPlPlPlPlPlPlPlPMPMPMPMP�P�P�P�P�P�P�P�PMPMPMPMP�P�P�P�P�P�P�P�PMPMPMPMP!P!P�S�S�S�S�S�T�T�T�T�T�T�T�T�T�W�W�W�W�W�Q^^.^.^A^A^S^S^e^e^w^w^�^�^�^�^�^�^^^^^^�a�a�a�a�a�b�b�b�b�b�c�c�c�c�c�d�d�d�d�deeee�e]Z!P       �    �����  -	 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm 8cf_fileoptions2ecfm129444254$funcCFADMIN_GETFILEPOSITION  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   LOCATION  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  I ! VFSFILEFACTORY # PERMISSIONCLASS % VFILE ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; _setCurrentLineNo (I)V ? @
 * A ArrayNew (I)Ljava/util/List; C D coldfusion/runtime/CFPage F
 G E set (Ljava/lang/Object;)V I J coldfusion/runtime/Variable L
 M K 1 O 0 Q false S   U java W coldfusion.vfs.VFSFileFactory Y CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; [ \
 G ] _get &(Ljava/lang/String;)Ljava/lang/Object; _ `
 * a checkIfVFile c java/lang/Object e DAFILE g _autoscalarize i `
 * j _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; l m
 * n _boolean (Ljava/lang/Object;)Z p q coldfusion/runtime/Cast s
 t r coldfusion.vfs.VFilePermission v getFileObject x getAbsolutePath z java.io.FilePermission | request.security.contexts ~ 	IsDefined (Ljava/lang/String;)Z � �
 G � REQUEST � java/lang/String � SECURITY � CONTEXTS � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � IsStruct � q
 G � _resolve � �
 * � WEBAPP � 	DIRECTORY � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 G � 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 t � CLASS � 6(Ljava/util/Map;[Ljava/lang/String;)Ljava/lang/Object; � �
 * � _compare '(Ljava/lang/Object;Ljava/lang/Object;)D � �
 * � TARGET � _double (Ljava/lang/Object;)D � �
 t � _Object (D)Ljava/lang/Object; � �
 t � ArrayLen (Ljava/lang/Object;)I � �
 G � (I)Ljava/lang/Object; � �
 t � cfadmin_getFilePosition � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � This will return the permissions array position for the struct that describes the class,target, and actions for a file/dir path � version � 1,  January 08, 2002 � return � Returns a array index (int). � 
Parameters � REQUIRED � NAME � daFile � ([Ljava/lang/Object;)V  �
 � � webapp � 	directory � getMetadata ()Ljava/lang/Object; this :Lcf_fileoptions2ecfm129444254$funcCFADMIN_GETFILEPOSITION; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �     � �  �   "     � Ȱ    �        � �    � �  �   !     İ    �        � �    � �  �   2     � �YhSY�SY�S�    �        � �    � �  �  � 
   G+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:� >:� >:� >:-� B-� H� NP� N
R� NT� NV� N-	� B-XZ� ^� N-
� B--$� bd� fY-h� kS� o� N-(� k� u� Cw� N-� B--� B--$� by� fY-h� kS� o{� f� o� N� 
}� N-� B-� �� a-� B-�� �Y�SY�S� �� �� @-� B--�� �Y�SY�S� �� fY-�� kSY-�� kS� �� �� NP� N� }-- -"� k� �� �� �Y�S� �-&� k� ��~�� <-- -"� k� �� �� �Y�S� �-h� k� ��~�� 
-"� k� N-"� k� �c� �� N-"� k- � B- � k� �� ¸ ��t|���b-� k��    �   �   G � �    G � �   G � �   G �    G   G   G �   G 5 6   G    G  	  G  
  G    G !   G #   G %   G '   G g   G �   G �   f �   Z l v v u u u u l }     } � � � � � � � � � � � � � � � � � � �	 �	 �	 �	 �	 �	 �	 �	 �	 �	 �
 �
 �
 �
 �
 �
 �
 �
 �
 � � � � � � � � � � � � � � � �     �--,,<<<<``zz��______V<,� � � � � �"�"�"�"�"�"�"�"�$�$�$�$�$�$�$�$�&�&�&�&�&�$�"             $ $ $ $   � >+>+>+>+>+     �   #     *� 
�    �        � �      �   �     ƻ �Y� fY�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY�SY�SY� fY� �Y� fY�SYTSY�SY�S� �SY� �Y� fY�SYTSY�SY�S� �SY� �Y� fY�SYTSY�SY�S� �SS� � ȱ    �       � � �        ����  -: 
SourceFile ./CFIDE/administrator/security/_fileoptions.cfm Acf_fileoptions2ecfm129444254$funcCFADMIN_ADDFILETOSECURITYCONTEXT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ST  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PERMISSIONS  ACT ! VFSFILEFACTORY # FILEPOS % VFILE ' coldfusion/runtime/CfJspPage ) pageContext #Lcoldfusion/runtime/NeoPageContext; + ,	 * - getOut ()Ljavax/servlet/jsp/JspWriter; / 0 javax/servlet/jsp/JspContext 2
 3 1 parent Ljavax/servlet/jsp/tagext/Tag; 5 6	 * 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; _setCurrentLineNo (I)V ? @
 * A ArrayNew (I)Ljava/util/List; C D coldfusion/runtime/CFPage F
 G E set (Ljava/lang/Object;)V I J coldfusion/runtime/Variable L
 M K 	StructNew !()Lcoldfusion/util/FastHashtable; O P
 G Q 0 S   U false W java Y coldfusion.vfs.VFSFileFactory [ CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; ] ^
 G _ request.security.contexts a 	IsDefined (Ljava/lang/String;)Z c d
 G e REQUEST g java/lang/String i SECURITY k CONTEXTS m _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; o p
 * q IsStruct (Ljava/lang/Object;)Z s t
 G u _resolve w p
 * x java/lang/Object z WEBAPP | _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; ~ 
 * � 	DIRECTORY � _arrayGetAt 9(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � 	Duplicate &(Ljava/lang/Object;)Ljava/lang/Object; � �
 G � ORIGINALFILE � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 * � _get � 
 * � checkIfVFile � _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � _boolean � t coldfusion/runtime/Cast �
 � � getFileObject � getAbsolutePath � DAFILE � CFADMIN_GETFILEPOSITION � cfadmin_getFilePosition � 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 * � FILEREAD � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � read � , � 
ListAppend J(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 G � 	FILEWRITE � write � FILEEXECUTE � execute � 
FILEDELETE � delete � CLASS � coldfusion.vfs.VFilePermission � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 * � java.io.FilePermission � TARGET � ACTION � (Ljava/lang/Object;D)D � �
 * � _arraySetAt � �
 * � _List $(Ljava/lang/Object;)Ljava/util/List; � �
 � � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z � �
 G � _LhsResolve � p
 * � :(Ljava/lang/Object;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 * �  cfadmin_addFileToSecurityContext � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � author � "Mike Nimer (mnimer@macromedia.com) � param � /directory - working security context/directory. � hint � =this function adds a new file or dir. to the security context � version  1,  January 08, 2002 return Returns the permissions array. 
Parameters REQUIRED
 NAME originalfile ([Ljava/lang/Object;)V 
 � daFile fileRead 	fileWrite fileExecute 
fileDelete webapp 	directory getMetadata ()Ljava/lang/Object; this CLcf_fileoptions2ecfm129444254$funcCFADMIN_ADDFILETOSECURITYCONTEXT; LocalVariableTable Code getName ()Ljava/lang/String; getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; LineNumberTable <clinit> 1       � �    !" &   "     � �   %       #$   '( &   !     �   %       #$   )* &   N     0� jY�SY�SY�SY�SY�SY�SY}SY�S�   %       0#$   +, &  	� 
   k+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :-� .� 4:-� 8:� >:� >:� >:� >:� >:� >:� >:� >:-A� B-� H� N
-B� B� R� NT� NV� NX� N-F� B-Z\� `� N-I� B-b� f� _-K� B-h� jYlSYnS� r� v� ?-M� B--h� jYlSYnS� y� {Y-}� �SY-�� �S� �� �� N-�� �V� ��� �-U� B--$� ��� {Y-�� �S� �� N-(� �� �� k-X� B--X� B--$� ��� {Y-�� �S� ��� {� �� N-Y� B--Y� B--$� ��� {Y-�� �S� ��� {� �� N-[� B-�� ��-� {Y-�� �SY-}� �SY-�� �S� �� N� �-_� B--$� ��� {Y-�� �S� �� N-(� �� �� 7-b� B--b� B--$� ��� {Y-�� �S� ��� {� �� N-e� B-�� ��-� {Y-�� �SY-}� �SY-�� �S� �� N-�� �� �� -j� B-"� �� ���� �� N-�� �� �� -l� B-"� �� ���� �� N-�� �� �� -n� B-"� �� ���� �� N-Ŷ �� �� -p� B-"� �� ���� �� N-(� �� �� -� jY�S˶ ϧ -� jY�SѶ �-� jY�S-�� �� �-� jY�S-"� �� �-&� �� ��� &- � {Y-&� �S-� �� ۧ - �� B- � �� �-� �� �W- �� B-b� f� W- �� B-h� jYlSYnS� r� v� 6-h� jYlSYnS� �� {Y-}� �SY-�� �S- � �� �- � ���   %   �   k#$    k-.   k/ �   k01   k23   k45   k6 �   k 5 6   k 7   k 7 	  k 7 
  k 7   k !7   k #7   k %7   k '7   k �7   k �7   k �7   k �7   k �7   k �7   k |7   k �7 8  �!   ? Z ? � A � A � A � A � A � A � A � A � B � B � B � B � B � B � C � C � C � C � C � C � D � D � D � D � D � D � E � E � E � E � E � E � F � F � F � F � F � F � F � F � F � F � I � I � I � I � K � K � K � K M M. M. M7 M7 M M M M M M M M � K � IG RG RM RM R` U` Un Un U_ U_ U_ U_ UW U{ V{ V� X� X� X� X� X� X� X� X� X� X� X� Y� Y� Y� Y� Y� Y� Y� Y� Y� Y� Y{ V� [� [ [ [ [ [ [ [� [� [� [� [� [1 _1 _? _? _0 _0 _0 _0 _( _L `L `h bh bv bv bg bg b` b` b` b` bX bL `� e� e� e� e� e� e� e� e� e� e� e� e� eG R� i� i� j� j� j� j� j� j� j� j� j� j� j� j� j� i� k� k� l� l� l� l l l l l� l� l� l� l� l� k m m$ n$ n$ n$ n- n- n/ n/ n$ n$ n$ n$ n n m7 o7 oK pK pK pK pT pT pV pV pK pK pK pK pC p7 o^ s^ sv uv uv uv uj u� y� y� y� y~ y^ s� {� {� {� {� {� |� |� |� |� |� � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��  � � � � � � � �/ �/ �I �I �R �R �Y �Y �Y �Y �/ � � �b �b �b �b �b �    &   #     *� 
�   %       #$   9  &  �    �� �Y� {Y�SY�SY�SY�SY�SY�SY�SY�SYSY	SY
SYSY	SY� {Y� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSYS�SY� �Y� {YSYXSYSY S�SS�� �   %      �#$        