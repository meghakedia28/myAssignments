����  -8 
SourceFile )/CFIDE/administrator/settings/license.cfm cflicense2ecfm924121982  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   NOT_VALID_LICENSE Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   ADMINSUBMIT   	   ENTER_LICENSE   	    REQUEST " " 	  $ FORM & & 	  ( AERRORMESSAGES * * 	  , CHECKCSRFTOKEN . . 	  0 BERRORSEXIST 2 2 	  4 GETCSRFTOKEN 6 6 	  8 TOKEN : : 	  < EDITION > > 	  @ com.macromedia.SourceModTime  [�;�+ pageContext #Lcoldfusion/runtime/NeoPageContext; E F	  G getOut ()Ljavax/servlet/jsp/JspWriter; I J javax/servlet/jsp/JspContext L
 M K parent Ljavax/servlet/jsp/tagext/Tag; O P	  Q Cp1252 S setPageEncoding (Ljava/lang/String;)V U V !coldfusion/runtime/NeoPageContext X
 Y W LOCALE [ REQUEST.LOCALE ] en _ checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V a b
  c java/lang/String e 
LOCALEFILE g java/lang/StringBuffer i resources/settings_ k  V
 j m _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; o p
  q _String &(Ljava/lang/Object;)Ljava/lang/String; s t coldfusion/runtime/Cast v
 w u append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; y z
 j { .cfm } toString ()Ljava/lang/String;  � java/lang/Object �
 � � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � false � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � _setCurrentLineNo (I)V � �
  � ArrayNew (I)Ljava/util/List; � �
  � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray; � �
 w � setArray !(Lcoldfusion/runtime/FastArray;)V � �
 � � (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � "coldfusion/tagext/lang/ImportedTag � l10n � 
../cftags/ � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � id � not_valid_license � var � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � "The license entered was not valid. � write � V java/io/Writer �
 � � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � isDefinedCanonicalVariable  (Lcoldfusion/runtime/Variable;)Z � �
  �   � 	CSRFTOKEN � FORM.CSRFTOKEN �  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z 
  _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object;
  checkCSRFToken _autoscalarize

  SETTINGSTABKEYNAME 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;
  FORM.ADMINSUBMIT NEW_LICENSE Trim &(Ljava/lang/String;)Ljava/lang/String;
  LICENSE _resolve p
  
isValidKey  _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;"#
 $ _boolean (Ljava/lang/Object;)Z&'
 w( 1* ArrayLen (Ljava/lang/Object;)I,-
 . _Object (D)Ljava/lang/Object;01
 w2 _arraySetAt E(Lcoldfusion/runtime/Variable;[Ljava/lang/Object;Ljava/lang/Object;)V45
 6 setLicenseKey8 license_pagename: pagename< Licensing Settings> enter_license@ jscriptB trueD Enter a license number.F 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTagIH �	 K !coldfusion/tagext/lang/IncludeTagM ../header.cfmO setTemplateQ V
NR _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)ZTU
 V $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTagYX �	 [ coldfusion/tagext/io/OutputTag]
^ � 
` _whitespace %(Ljava/io/Writer;Ljava/lang/String;)Vbc
 d )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTaggf �	 i #coldfusion/tagext/html/form/FormTagk cfformm actiono CGIq SCRIPT_NAMEs _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;uv
 w 	setActiony V
lz post| 	setMethod~ V
l
l � 2
	
<input type="hidden" name="csrftoken" value="� getCSRFToken� ">

� ../include/buttonbar.cfm� ../include/margintop.cfm� ../include/errors.cfm� "


<p>
<span class="sentance">� license_intro� �
		Use the form below to enter a new serial number. Depending on the serial
		number you enter, various features will be turned on or turned off.
		Your current edition is:
� 
<b>� EncodeForHTML�
 � 5</b>
</span>
</p>

<p>
<span class="sentance">
� new_license� New License�  � *class$coldfusion$tagext$html$form$InputTag $coldfusion.tagext.html.form.InputTag�� �	 � $coldfusion/tagext/html/form/InputTag� text� setType� V
�� setMaxLength� �
�� � V
�� setValue� V
�� cfinput� message� 
setMessage� V
�� size� 35� class� label�
� � 
</span>
</p>		


� ../include/marginbottom.cfm�
l �
l �
l �
l �
^ � coldfusion/tagext/QueryLoop�
� �
� �
^ � 

� ../footer.cfm� metaData Ljava/lang/Object;��	 � getMetadata ()Ljava/lang/Object; this Lcflicense2ecfm924121982; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; runPage out Ljavax/servlet/jsp/JspWriter; value module1 $Lcoldfusion/tagext/lang/ImportedTag; mode1 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 module2 mode2 t14 t15 t16 t17 t18 t19 module3 mode3 t22 t23 t24 t25 t26 t27 include4 #Lcoldfusion/tagext/lang/IncludeTag; output14  Lcoldfusion/tagext/io/OutputTag; mode14 form13 %Lcoldfusion/tagext/html/form/FormTag; mode13 include5 t34 include6 t36 include7 t38 module8 mode8 t41 t42 t43 t44 t45 t46 module9 mode9 t49 t50 t51 t52 t53 t54 input10 &Lcoldfusion/tagext/html/form/InputTag; t56 	include11 t58 	include12 t60 t61 t62 t63 t64 t65 t66 t67 t68 t69 t70 	include15 LineNumberTable java/lang/Throwable5 <clinit> 1                      "     &     *     .     2     6     :     >     � �   H �   X �   f �   � �   ��    �� �   "     �ڰ   �       ��      �   �     �*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A�   �        ���     ���    ���  �� �    H  	�*� H� NL*� RN*� HT� Z**� %\^`� d*#� fYhS� jYl� n*#� fY\S� r� x� |~� |� �� �*� 5�� �*� -*� �*� �� �� �*� �-� �� �:*� ����� �� �Y� �Y�SY�SY�SY�S� Ƕ �� �� �Y6� 5*+� �L+ݶ �� ���� � :� �:*+� �L�� �� :� #�� � #:		� � � :
� 
�:� ��**� � �� i*� =�� �**� )���� *� =*'� fY�S� r� �*� �**� 1�	*� �Y**� =�SY*#� fYS� rS�W**� )�� �*'� fYS*#� �*'� fYS� r� x�� �*$� �**#� fYS�!� �Y*'� fYS� rS�%�)�� >*� 5+� �**� -� �Y*&� �**� -��/�c�3S**� ��7� 8*(� �**#� fYS�9� �Y*'� fYS� rS�%W*� A*#� fYSY?S� r� �*� �-� �� �:*3� ����� �� �Y� �Y�SY;SY�SY=S� Ƕ �� �� �Y6� 6*+� �L+?� �� ���� � :� �:*+� �L�� �� :� #�� � #:� � � :� �:� ��*� �-� �� �:*4� ����� �� �Y� �Y�SYASY�SYASYCSYES� Ƕ �� �� �Y6� 6*+� �L+G� �� ���� � :� �:*+� �L�� �� :� #�� � #:� � � :� �:� ��*�L-� ��N:*5� �P�S� ��W� �*�\-� ��^:*7� �� ��_Y6��*+a�e*�j� ��l:*8� �np*r� fYtS� r� x�x�{}��� ���Y6 �
* +� �L+�� �+*:� �**� 9��*� �Y*#� fYS� rS�� x� �+�� �*�L� ��N:!*<� �!��S!� �!�W� :"�����"�*+a�e*�L� ��N:#*=� �#��S#� �#�W� :$�?�z��$�*+a�e*�L� ��N:%*>� �%��S%� �%�W� :&���7�|&�+�� �*� �� �� �:'*B� �'���� �'� �Y� �Y�SY�S� Ƕ �'� �'� �Y6(� 6*'(+� �L+�� �'� ���� � :)� )�:**(+� �L�*'� �� :+� ,�Y����+�� � #:,',� � � :-� -�:.'� ��.+�� �+*G� �**� A�� x��� �+�� �*� �	� �� �:/*M� �/���� �/� �Y� �Y�SY�S� Ƕ �/� �/� �Y60� 6*/0+� �L+�� �/� ���� � :1� 1�:2*0+� �L�2/� �� :3� ,�q����3�� � #:4/4� � � :5� 5�:6/� ��6*+��e*��
� ���:7*M� �7���7&��7���7���7��**� !�� x�x��7� �Y� �Y�SY�SY�SY�S� Ƕ�7� �7�W� :8� �� �/8�+ƶ �*�L� ��N:9*R� �9ȶS9� �9�W� ::� m� �� �:�*+a�e*�L� ��N:;*S� �;��S;� �;�W� :<� *� e� �<�*+a�e�ɚ� � � :=� =�:>* +� �L�>��� :?� &� k?�� � #:@@�˨ � :A� A�:B�̩B*+a�e�͚�W��� :C� #C�� � #:DD�Ѩ � :E� E�:F�ҩF*+Զe*�L-� ��N:G*W� �GֶSG� �G�W� �� ` � � �6 � � �6 �
66 �
%6%6"%6%*%6!6!&!6�AM6GJM6�A\6GJ\6MY\6\a\6���6���6�66�+6+6(+6+0+6Hdg6glg6=��6���6=��6���6���6���60LO6OTO6%x�6~��6%x�6~��6���6���6�g�6m��6���6���6�x�6~:�6@|�6���6���6���6�g	
6m�	
6��	
6��	
6�x	
6~:	
6@|	
6��	
6��	
6			
6�g	6m�	6��	6��	6�x	6~:	6@|	6��	6��	6			6	
		6			6�g	R6m�	R6��	R6��	R6�x	R6~:	R6@|	R6��	R6��	R6		F	R6	L	O	R6�g	a6m�	a6��	a6��	a6�x	a6~:	a6@|	a6��	a6��	a6		F	a6	L	O	a6	R	^	a6	a	f	a6 �  � H  	���    	���   	���   	� O P   	���   	���   	���   	���   	���   	��� 	  	��� 
  	���   	���   	���   	���   	���   	���   	���   	���   	���   	���   	���   	���   	���   	� �   	��   	��   	��   	�   	�   	��   	�	
   	��    	� !  	�� "  	� #  	�� $  	� %  	�� &  	�� '  	�� (  	�� )  	�� *  	�� +  	�� ,  	�� -  	�� .  	�� /  	�� 0  	�� 1  	�� 2  	�� 3  	�� 4  	� � 5  	�!� 6  	�"# 7  	�$� 8  	�% 9  	�&� :  	�' ;  	�(� <  	�)� =  	�*� >  	�+� ?  	�,� @  	�-� A  	�.� B  	�/� C  	�0� D  	�1� E  	�2� F  	�3 G4  n �       4  4  9  9  9  9  N  N  0  0  0  0  $  $  ]  ]  ]  ]  Y  m  m  l  l  l  l  b  Y  �  �  �  �  w 7 7 7 7 6 6 E E E E A K K K K O O Q Q J J ] ] ] ] Y J u u � � � � u u u 6 6 � "� "� "� "� "� "� "� "� "� "� #� #� #� #� #� #� #� #� #� # $ $� $� $� $� $� $� $# %# %# %# % % %: &: &: &: &: &: &F &F &: &: &L &L &L &L &) &) &z (z (` (` (` (` (Z '� $� "� /� /� /� /� /� /� 3� 3� 3� 3� 3� 4� 4� 4� 4� 4� 4m 4R 5R 5< 5� 8� 8� 8� 8� 8� 8  :  : : :  :  :  :  :� :J <J <3 <� =� =u =� >� >� >- B- B� B� G� G� G� G� G� G� G� G� G M M� M� M� M� M� M� M� M� M� M� M� M M M M M� M_ R_ RG R� S� S� S� 8h 7	� W	� W	z W      �   #     *� 
�   �       ��   7  �   Y     ;�� �� �J� ��LZ� ��\h� ��j�� ���� �Y� �� ǳڱ   �       ;��         B    C