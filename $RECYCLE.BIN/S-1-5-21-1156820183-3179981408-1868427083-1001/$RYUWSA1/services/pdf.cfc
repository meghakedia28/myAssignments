����  -  
SourceFile /CFIDE/services/pdf.cfc #cfpdf2ecfc472483660$funcEXTRACTTEXT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  INFO ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PASSWORD K PAGES M ADDQUADS O HONOURSPACES Q USESTRUCTURE S TYPE U         

		 W _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V Y Z
 $ [   ] set (Ljava/lang/Object;)V _ ` coldfusion/runtime/Variable b
 c a _setCurrentLineNo (I)V e f
 $ g 	ISALLOWED i _get &(Ljava/lang/String;)Ljava/lang/Object; k l
 $ m 	isAllowed o java/lang/Object q _autoscalarize s l
 $ t pdf v 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; x y
 $ z ISALLOWEDIP | isAllowedIP ~ READFILEFROMURL � readFileFromURL �  java/lang/String � ACTION � extracttext � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � NAME � info � ALLOWEXTRAATTRIBUTES � true � addquads � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � password � honourspaces � usestructure � type � pages � 				

		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ � 
		 � 			
	 � extractText � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source  getMetadata ()Ljava/lang/Object; this %Lcfpdf2ecfc472483660$funcEXTRACTTEXT; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf5 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �        "     � �             	    !     �             
          �             	    !     6�                 T     6	� �Y4SYHSYJSYLSYNSYPSYRSYTSYVS�          6      � 	   �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:*N6� <� B� F:*P6� <� B� F:*R6� <� B� F:*T6� <� B� F:*V6� <� B� F:-X� \^� d- � h-j� np-� rY-4� uSY-H� uSYwS� {W- � h-}� n-� rY-4� uSYwS� {W- �� h-�� n�-� rY-J� uS� {� d
-�� u� d-� �Y�S�� �-� �Y�S�� �-� �YJS- � u� �-� �Y�S�� �- �� h-�� ��� �Y� �� W-P� u^� ��~�� �� �� - �� h--� u� ��� �W- �� h-�� ��� �Y� �� W-L� u^� ��~�� �� �� - �� h--� u� ��� �W- �� h-�� ��� �Y� �� W-R� u^� ��~�� �� �� - �� h--� u� ��� �W- �� h-�� ��� �Y� �� W-T� u^� ��~�� �� �� - �� h--� u� ��� �W- �� h-�� ��� �Y� �� W-V� u^� ��~�� �� �� - �� h--� u� ��� �W- �� h-�� ��� �Y� �� W-N� u^� ��~�� �� �� - � h--� u� ��� �W-�� \-� �� �� �:-� h�-� u� �� �� � �-� \-"� u�-� \�      �   �    �   � �   �   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   � G   � I   � K   � M   � O   � Q   � S   � U   �   � �   � � � � � � � � � � � � �  �  � � � � �! �! �  �  �  �/ �/ �> �> �G �G �/ �/ �/ �N �W �W �f �f �W �W �W �W �N �s �u �u �u �u �s �� �� �� �� �~ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � �� � � � � � � � � � � �+ �+ �1 �1 �+ �+ �+ �+ � � �M �M �M �M �V �V �L �L �L � �d �d �c �c �c �c �c �c �c �c �v �v �| �| �v �v �v �v �c �c �� �� �� �� �� �� �� �� �� �c �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � �� �� �. �. �. �. �7 �7 �- �- �- �� �E �E �D �D �D �D �D �D �D �D �W �W �] �] �W �W �W �W �D �D �y y y y � � x x x D � � �����������       #     *� 
�                 �    {ĸ ʳ ̻ �Y� rY�SY�SY�SY�SY�SY6SY�SY	� rY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SYS� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SY� �Y� rYVSY6SY�SY�S� �SS� �� �         {        ����  -� 
SourceFile /CFIDE/services/pdf.cfc $cfpdf2ecfc472483660$funcEXTRACTIMAGE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   HTTPURLFORDIRECTORY  ARRAY ! 
SOURCEPATH # DESTINATION % I ' 	FILESLIST ) FILENAME + MAP - coldfusion/runtime/CfJspPage / pageContext #Lcoldfusion/runtime/NeoPageContext; 1 2	 0 3 getOut ()Ljavax/servlet/jsp/JspWriter; 5 6 javax/servlet/jsp/JspContext 8
 9 7 parent Ljavax/servlet/jsp/tagext/Tag; ; <	 0 = SERVICEUSERNAME ? string A getVariable  (I)Lcoldfusion/runtime/Variable; C D %coldfusion/runtime/ArgumentCollection F
 G E 3coldfusion/tagext/validation/CFTypeValidatorFactory I STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; K L	 J M _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; O P
  Q SERVICEPASSWORD S SOURCE U FORMAT W IMAGEPREFIX Y PASSWORD [ PAGES ]         
	
		 _ _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V a b
 0 c   e set (Ljava/lang/Object;)V g h coldfusion/runtime/Variable j
 k i _setCurrentLineNo (I)V m n
 0 o 	ISALLOWED q _get &(Ljava/lang/String;)Ljava/lang/Object; s t
 0 u 	isAllowed w java/lang/Object y _autoscalarize { t
 0 | pdf ~ 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 0 � ISALLOWEDIP � isAllowedIP � READFILEFROMURL � readFileFromURL � GETTEMPFILEPATH � getTempFilePath � imageextract �  java/lang/String � ACTION � extractimage � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 0 � ALLOWEXTRAATTRIBUTES � true � format � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 0 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � imageprefix � pages � password �          

		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 0 � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � 
doStartTag ()I � �
 � � doAfterBody � �
 � � doEndTag � �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � �  
		 � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � name � DirectoryList 9(Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/Object; � �
 �  

		 ArrayNew (I)Ljava/util/List;
 � 
		 1
 
GETHTTPURL 
getHttpUrl _List $(Ljava/lang/Object;)Ljava/util/List;
 � java/util/List size � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;
 0 get (I)Ljava/lang/Object; 
			! 	component# CFIDE.services.element% CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;'(
 �) KEY+ VALUE- // concat &(Ljava/lang/String;)Ljava/lang/String;12
 �3 '(Ljava/lang/String;I)Ljava/lang/Object; {5
 06 _double (Ljava/lang/Object;)D89
 �: (D)Ljava/lang/Object; �<
 �= _arraySetAt? �
 0@ 
	
		B           
	D extractImageF metaData Ljava/lang/Object;HI	 J CFIDE.services.element[]L &coldfusion/runtime/AttributeCollectionN accessP remoteR 
returntypeT 
ParametersV TYPEX NAMEZ serviceusername\ ([Ljava/lang/Object;)V ^
O_ servicepassworda sourcec getMetadata ()Ljava/lang/Object; this &Lcfpdf2ecfc472483660$funcEXTRACTIMAGE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf6 Lcoldfusion/tagext/lang/PDFTag; mode6 t28 t29 Ljava/lang/Throwable; t30 t31 t32 Ljava/util/List; t33 t34 t35 t36 LineNumberTable java/lang/Throwable� <clinit> 1       � �   HI    ef j   "     �K�   i       gh   kl j   "     G�   i       gh   m � j         �   i       gh   nl j   "     M�   i       gh   op j   H     *� �Y@SYTSYVSYXSYZSY\SY^S�   i       *gh   qr j  � 	 %  A+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :-� 4� ::-� >:*@B� H� N� R:*TB� H� N� R:*VB� H� N� R:*XB� H� N� R:*ZB� H� N� R:*\B� H� N� R:*^B� H� N� R:-`� df� l-� p-r� vx-� zY-@� }SY-T� }SYS� �W-� p-�� v�-� zY-@� }SYS� �W-� p-�� v�-� zY-V� }S� �� l-� p-�� v�-� zY�S� �� l
-�� }� l-� �Y�S�� �-� �YVS-$� }� �-� �Y&S-&� }� �-� �Y�S�� �-� p-�� ��� �Y� �� W-X� }f� ��~�� �� �� - � p--� }� ��� �W-!� p-�� ��� �Y� �� W-Z� }f� ��~�� �� �� -"� p--� }� ��� �W-#� p-¶ ��� �Y� �� W-^� }f� ��~�� �� �� -$� p--� }� �¶ �W-%� p-Ķ ��� �Y� �� W-\� }f� ��~�� �� �� -&� p--� }� �Ķ �W-ƶ d-� �� �� �:-*� p�-� }� �� �� �Y6� � ���� �� :� #�� � #:� � � :� �:� ��-�� d-+� p--&� }� ���� l-� d--� p-�� l-	� d� l-	� df� l-	� d-0� p-� v-� zY-&� }S� �� l-	� d-*� }�: 6!6" � 6#-,+�:$� � "�  :$� l� �-"� d-2� p-$&�*� l-"� d-.� �Y,S-(� }� �-"� d-.� �Y.S- � }� �0�4-,� }� ��4� �-"� d-"� zY-( �7�;�>S-.� }�A-	� d"!`6""#��7-C� d-"� }�-E� d� Qp|�vy|�Qp��vy��|������� i  t %  Agh    Ast   AuI   Avw   Axy   Az{   A|I   A ; <   A }   A } 	  A } 
  A }   A !}   A #}   A %}   A '}   A )}   A +}   A -}   A ?}   A S}   A U}   A W}   A Y}   A [}   A ]}   A~   A� '   A�I   A��   A��   A�I   A��    A� ' !  A� ' "  A� ' #  A�} $�  �4   � � � � � �  ))77FFOO777V__nn____V{��������{��������������������������������������/ / / / 8 8 . . . �F!F!E!E!E!E!E!E!E!E!X!X!^!^!X!X!X!X!E!E!z"z"z"z"�"�"y"y"y"E!�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�#�$�$�$�$�$�$�$�$�$�#�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%�%&&&&&&&&&�% �A*A*A*A*'*�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�-�-�-�-�-�-�-�-�-�.�.�.�.�.�.�.�/�/�/�/�/�/�/0000000000041414141{2�2�2�2�2�2�2�2�2{2{2�3�3�3�3�3�3�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�4�5�5�5�5�5�55555�5�5#141/8/8/8/8/8    j   #     *� 
�   i       gh   �  j  i    Kʸ г һOY� zY�SYGSYQSYSSYUSYMSYWSY� zY�OY� zYYSYBSY[SY]S�`SY�OY� zYYSYBSY[SYbS�`SY�OY� zYYSYBSY[SYdS�`SY�OY� zYYSYBSY[SY�S�`SY�OY� zYYSYBSY[SY�S�`SY�OY� zYYSYBSY[SY�S�`SY�OY� zYYSYBSY[SY�S�`SS�`�K�   i      Kgh        ����  -d 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcGETINFO  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  PDFINFO ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PASSWORD K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 $ Q _setCurrentLineNo (I)V S T
 $ U 	ISALLOWED W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 $ [ 	isAllowed ] java/lang/Object _ _autoscalarize a Z
 $ b pdf d 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; f g
 $ h ISALLOWEDIP j isAllowedIP l READFILEFROMURL n readFileFromURL p set (Ljava/lang/Object;)V r s coldfusion/runtime/Variable u
 v t  java/lang/String y ACTION { getinfo } _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V  �
 $ � NAME � info � ALLOWEXTRAATTRIBUTES � true � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
        	 � 	component � CFIDE.services.pdfinfo � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 � � APPLICATION � INFO � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 $ � AUTHOR � CENTERWINDOWONSCREEN � CHANGINGDOCUMENT � 
COMMENTING � CONTENTEXTRACTION � COPYCONTENT � CREATED � DOCUMENTASSEMBLY � 
ENCRYPTION � FILEPATH � FILLINGFORM � FITTOWINDOW � HIDEMENUBAR � HIDETOOLBAR � HIDEWINDOWUI � KEYWORDS � LANGUAGE MODIFIED 
PAGELAYOUT PRINTING PRODUCER	 
PROPERTIES SECURE SHOWDOCUMENTSOPTION SHOWWINDOWSOPTION SIGNING SUBJECT TITLE 
TOTALPAGES TRAPPED VERSION 	PAGESIZES (CONVERTARRAYOFSTRUCTTOPDFPAGEDETAILARRAY! (convertArrayOfStructToPDFPageDetailArray# PAGEROTATIONS% 
        
               	' 			
	) metaData Ljava/lang/Object;+,	 - &coldfusion/runtime/AttributeCollection/ name1 access3 remote5 
returntype7 
Parameters9 TYPE; serviceusername= ([Ljava/lang/Object;)V ?
0@ servicepasswordB sourceD getMetadata ()Ljava/lang/Object; this !Lcfpdf2ecfc472483660$funcGETINFO; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf2 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �   +,    FG K   "     �.�   J       HI   LM K   !     ~�   J       HI   NO K         �   J       HI   PM K   !     ԰   J       HI   QR K   7     � zY4SYHSYJSYLS�   J       HI   ST K  s    C+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:-N� R-X� V-X� \^-� `Y-4� cSY-H� cSYeS� iW-Y� V-k� \m-� `Y-4� cSYeS� iW-Z� V-o� \q-� `Y-J� cS� i� w
-x� c� w-� zY|S~� �-� zYJS- � c� �-� zY�S�� �-� zY�S�� �-b� V-�� ��� �Y� �� W-L� c�� ��~�� �� �� -c� V--� c� ��� �W-�� R-� �� �� �:-e� V�-� c� �� �� Ι �-ж R-g� V-�Զ ض w-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY�S-�� zY�S� � �-"� zY S-�� zY S� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zY
S-�� zY
S� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zYS-�� zYS� � �-"� zY S- �� V-"� \$-� `Y-�� zY S� �SY-�� zY&S� �S� i� �-(� R-"� c�-*� R�   J   �   CHI    CUV   CW,   CXY   CZ[   C\]   C^,   C / 0   C _   C _ 	  C _ 
  C _   C !_   C 3_   C G_   C I_   C K_   C`a b  b   R � X � X � X � X � X � X � X � X � X � X � X � Y � Y � Y � Y � Y � Y � Y � Y � Y � Z � Z � Z � Z � Z � Z � Z � Z � Z � Z \	 \	 \	 \	 \ \ ] ] ] ] ]/ ^/ ^/ ^/ ^# ^D _D _D _D _8 _U `U `U `U `I `a ba b` b` b` b` b` b` b` b` bs bs by by bs bs bs bs b` b` b� c� c� c� c� c� c� c� c� c` b � W� e� e� e� e� e� g� g� g� g� g� g� g� g� g� g h h h h� h# i# i# i# i iA jA jA jA j5 j_ k_ k_ k_ kS k} l} l} l} lq l� m� m� m� m� m� n� n� n� n� n� o� o� o� o� o� p� p� p� p� p q q q q q1 r1 r1 r1 r% rO sO sO sO sC sm tm tm tm ta t� u� u� u� u u� v� v� v� v� v� w� w� w� w� w� x� x� x� x� x y y y y� y& z& z& z& z zF {F {F {F {9 {f |f |f |f |Y |� }� }� }� }y }� ~� ~� ~� ~� ~� � � � � � �� �� �� �� � � � � �� �& �& �& �& � �F �F �F �F �9 �f �f �f �f �Y �� �� �� �� �y �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � �� �� �� �� �� �� f1 �1 �1 �1 �1 �    K   #     *� 
�   J       HI   c  K   �     ��� �� ��0Y� `Y2SY~SY4SY6SY8SY�SY:SY� `Y�0Y� `Y<SY6SY�SY>S�ASY�0Y� `Y<SY6SY�SYCS�ASY�0Y� `Y<SY6SY�SYES�ASY�0Y� `Y<SY6SY�SY�S�ASS�A�.�   J       �HI        ����  - 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcUNSIGN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  DESTINATION ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PASSWORD K SIGNATUREFIELDNAME M 	UNSIGNALL O    
		 Q _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V S T
 $ U _setCurrentLineNo (I)V W X
 $ Y 	ISALLOWED [ _get &(Ljava/lang/String;)Ljava/lang/Object; ] ^
 $ _ 	isAllowed a java/lang/Object c _autoscalarize e ^
 $ f pdf h 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; j k
 $ l ISALLOWEDIP n isAllowedIP p READFILEFROMURL r readFileFromURL t set (Ljava/lang/Object;)V v w coldfusion/runtime/Variable y
 z x GETTEMPFILEPATH | getTempFilePath ~  java/lang/String � ACTION � unsign � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � signaturefieldname � 	unsignall � 		
		
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � getMetadata ()Ljava/lang/Object; this  Lcfpdf2ecfc472483660$funcUNSIGN; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf14 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � ް    �        � �    � �  �   !     ��    �        � �      �         �    �        � �    �  �   !     6�    �        � �     �   B     $� �Y4SYHSYJSYLSYNSYPS�    �       $ � �     �  k 	   �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:*N6� <� B� F:*P6� <� B� F:-R� V-� Z-\� `b-� dY-4� gSY-H� gSYiS� mW-�� Z-o� `q-� dY-4� gSYiS� mW-�� Z-s� `u-� dY-J� gS� m� {-�� Z-}� `-� dY- � gS� m� {
-�� g� {-� �Y�S�� �-� �YJS- � g� �-� �Y"S-"� g� �-�� Z-�� ��� �Y� �� W-L� g�� ��~�� �� �� -�� Z--� g� ��� �W-�� Z-�� ��� �Y� �� W-N� g�� ��~�� �� �� - � Z--� g� ��� �W-� Z-�� ��� �Y� �� W-P� g�� ��~�� �� �� -� Z--� g� ��� �W-�� V-� �� �� �:-� Z�-� g� �� �� ҙ �-Զ V-� Z-ֶ `�-� dY-"� gS� m�-ڶ V�    �   �   � � �    �   �	 �   �
   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   � G   � I   � K   � M   � O   �   � �  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���� �� �� �����#�#������0�9�9�H�H�9�9�9�9�0�U�W�W�W�W�U�l�l�l�l�`�}�}�}�}�q������������������������������������������������������������������������������������������� � ��� � � � �����" " " " + + ! ! ! ��9988888888KKQQKKKK88mmmmvvlll8 ����������������     �   #     *� 
�    �        � �      �  /    �� �� �� �Y� dY�SY�SY�SY�SY�SY6SY�SY� dY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SS� � ޱ    �       � �        ����  -
 
SourceFile /CFIDE/services/pdf.cfc +cfpdf2ecfc472483660$funcREADSIGNATUREFIELDS  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / SERVICEUSERNAME 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C SERVICEPASSWORD E SOURCE G PASSWORD I         
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 " O _setCurrentLineNo (I)V Q R
 " S 	ISALLOWED U _get &(Ljava/lang/String;)Ljava/lang/Object; W X
 " Y 	isAllowed [ java/lang/Object ] _autoscalarize _ X
 " ` pdf b 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; d e
 " f ISALLOWEDIP h isAllowedIP j READFILEFROMURL l readFileFromURL n set (Ljava/lang/Object;)V p q coldfusion/runtime/Variable s
 t r  java/lang/String w ACTION y readsignaturefields { _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V } ~
 "  NAME � res � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 " � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 	
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " �  
		 � RES � 			
	 � metaData Ljava/lang/Object; � �	  � query � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � getMetadata ()Ljava/lang/Object; this -Lcfpdf2ecfc472483660$funcREADSIGNATUREFIELDS; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf13 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � Ұ    �        � �    � �  �   !     |�    �        � �    � �  �         �    �        � �    � �  �   !     ԰    �        � �    � �  �   7     � xY2SYFSYHSYJS�    �        � �    � �  �  & 	   �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:*F4� :� @� D:*H4� :� @� D:*J4� :� @� D:-L� P-ܶ T-V� Z\-� ^Y-2� aSY-F� aSYcS� gW-ݶ T-i� Zk-� ^Y-2� aSYcS� gW-޶ T-m� Zo-� ^Y-H� aS� g� u
-v� a� u-� xYzS|� �-� xYHS- � a� �-� xY�S�� �-� T-�� ��� �Y� �� W-J� a�� ��~�� �� �� -� T--� a� ��� �W-�� P-� �� �� �:-� T�-� a� �� �� ș �-ʶ P-̶ a�-ζ P�    �   �   � � �    � � �   � � �   � � �   �    �   � �   � - .   �    �  	  �  
  �    � 1   � E   � G   � I   �   ~ _  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������������*�*�*�*��?�?�?�?�3�L�L�K�K�K�K�K�K�K�K�^�^�d�d�^�^�^�^�K�K����������������K� ��������������������������     �   #     *� 
�    �        � �   	   �   �     ��� �� �� �Y� ^Y�SY|SY�SY�SY�SY�SY�SY� ^Y� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SS� � ұ    �       � � �        ����  -> 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcSIGN  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   KEYSTOREPATH  
SOURCEPATH ! DESTINATION # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 SERVICEUSERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SERVICEPASSWORD I SOURCE K PASSWORD M SIGNATUREFIELDNAME O KEYSTORE Q KEYSTOREPASSWORD S KEYALIAS U KEYPASSWORD W PAGES Y POSITION [ HEIGHT ] WIDTH _ AUTHOR a 
		
		 c _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V e f
 & g _setCurrentLineNo (I)V i j
 & k 	ISALLOWED m _get &(Ljava/lang/String;)Ljava/lang/Object; o p
 & q 	isAllowed s java/lang/Object u _autoscalarize w p
 & x pdf z 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; | }
 & ~ ISALLOWEDIP � isAllowedIP � READFILEFROMURL � readFileFromURL � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � GETTEMPFILEPATH � getTempFilePath �  java/lang/String � ACTION � sign � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � signaturefieldname � coordinates � COORDINATES � 	unsignall � pages � author � keyalias � keypassword � 		
		
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 & �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access remote 
returntype 
Parameters TYPE	 NAME serviceusername ([Ljava/lang/Object;)V 
 � servicepassword source keystore keystorepassword position height width getMetadata ()Ljava/lang/Object; this Lcfpdf2ecfc472483660$funcSIGN; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf15 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     ! %   "     � ��   $       "#   &' %   !     ��   $       "#   () %         �   $       "#   *' %   !     8�   $       "#   +, %   r     T� �Y6SYJSYLSYNSYPSYRSYTSYVSYXSY	ZSY
\SY^SY`SYbS�   $       T"#   -. %  
� 	   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*J8� >� D� H:*L8� >� D� H:*N8� >� D� H:*P8� >� D� H:*R8� >� D� H:*T8� >� D� H:*V8� >� D� H:*X8� >� D� H:*Z8	� >� D� H:*\8
� >� D� H:*^8� >� D� H:*`8� >� D� H:*b8� >� D� H:-d� h-� l-n� rt-� vY-6� ySY-J� ySY{S� W-� l-�� r�-� vY-6� ySY{S� W-� l-�� r�-� vY-L� yS� � �-� l-�� r�-� vY-R� yS� � �-� l-�� r�-� vY-"� yS� � �
-�� y� �-� �Y�S�� �-� �YLS-"� y� �-� �YRS- � y� �-� �Y$S-$� y� �-&� l-�� ��� �Y� �� W-N� y�� ��~�� �� �� -'� l--� y� ��� �W-(� l-�� ��� �Y� �� W-P� y�� ��~�� �� �� -)� l--� y� ��� �W-*� l-�� ��� �Y� �� W-¶ y�� ��~�� �� �� -+� l--� y� �Ķ �W-,� l-ƶ ��� �Y� �� W-Z� y�� ��~�� �� �� --� l--� y� �ƶ �W-.� l-ȶ ��� �Y� �� W-b� y�� ��~�� �� �� -/� l--� y� �ȶ �W-1� l-ʶ ��� �Y� �� W-V� y�� ��~�� �� �� -2� l--� y� �ʶ �W-3� l-̶ ��� �Y� �� W-X� y�� ��~�� �� �� -4� l--� y� �̶ �W-ζ h-� �� �� �:-7� l�-� y� �� �� � �-� h-8� l-�� r�-� vY-$� yS� �-�� h�   $  $   �"#    �/0   �1 �   �23   �45   �67   �8 �   � 1 2   � 9   � 9 	  � 9 
  � 9   � !9   � #9   � 59   � I9   � K9   � M9   � O9   � Q9   � S9   � U9   � W9   � Y9   � [9   � ]9   � _9   � a9   �:; <  �.  eett}}��eee�������������������������������" $ $ $ $ " 9!9!9!9!-!J"J"J"J">"_#_#_#_#S#t$t$t$t$h$�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�&�'�'�'�'�'�'�'�'�'�&�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�(�()))))))))�(**********-*-*3*3*-*-*-*-***O+O+O+O+X+X+N+N+N+*f,f,e,e,e,e,e,e,e,e,x,x,~,~,x,x,x,x,e,e,�-�-�-�-�-�-�-�-�-e,�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�.�/�/�/�/�/�/�/�/�/�.�1�1�1�1�1�1�1�1�1�111111111�1�1020202029292/2/2/2�1G3G3F3F3F3F3F3F3F3F3Y3Y3_3_3Y3Y3Y3Y3F3F3{4{4{4{4�4�4z4z4z4F3e�7�7�7�7�7�8�8�8�8�8�8�8�8�8    %   #     *� 
�   $       "#   =  %  p    RҸ س ڻ �Y� vY SY�SYSYSYSY8SYSY� vY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSY�S�SY� �Y� vY
SY8SYSY�S�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSY�S�SY� �Y� vY
SY8SYSY�S�SY	� �Y� vY
SY8SYSY�S�SY
� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSYS�SY� �Y� vY
SY8SYSY�S�SS�� ��   $      R"#        ����  -> 
SourceFile /CFIDE/services/pdf.cfc $cfpdf2ecfc472483660$funcADDWATERMARK  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   COPYFROMPATH  
SOURCEPATH ! 	IMAGEPATH # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 SERVICEUSERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SERVICEPASSWORD I SOURCE K COPYFROMURL M IMAGEURL O 
FOREGROUND Q ISBASE64 S OPACITY U PAGES W PASSWORD Y POSITION [ ROTATION ] SHOWONPRINT _ 
		 a _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V c d
 & e _setCurrentLineNo (I)V g h
 & i 	ISALLOWED k _get &(Ljava/lang/String;)Ljava/lang/Object; m n
 & o 	isAllowed q java/lang/Object s _autoscalarize u n
 & v pdf x 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; z {
 & | ISALLOWEDIP ~ isAllowedIP � READFILEFROMURL � readFileFromURL � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � �  java/lang/String � ACTION � addwatermark � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � ALLOWEXTRAATTRIBUTES � true � copyfromurl � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � copyfrom � StructInsert 6(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)Z � �
 � � imageurl � image � 
foreground � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � isbase64 � opacity � pages � password � position � rotation � showonprint � destination � DESTINATION � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 & �  
		 � 
GETHTTPURL � 
getHttpUrl � 
	 metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name	 access remote 
returntype 
Parameters TYPE NAME serviceusername ([Ljava/lang/Object;)V 
 servicepassword source getMetadata ()Ljava/lang/Object; this &Lcfpdf2ecfc472483660$funcADDWATERMARK; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf0 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �        ! %   "     ��   $       "#   &' %   !     ��   $       "#   () %         �   $       "#   *' %   !     8�   $       "#   +, %   l     N� �Y6SYJSYLSYNSYPSYRSYTSYVSYXSY	ZSY
\SY^SY`S�   $       N"#   -. %  � 	   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*J8� >� D� H:*L8� >� D� H:*N8� >� D� H:*P8� >� D� H:*R8� >� D� H:*T8� >� D� H:*V8� >� D� H:*X8� >� D� H:*Z8	� >� D� H:*\8
� >� D� H:*^8� >� D� H:*`8� >� D� H:-b� f-� j-l� pr-� tY-6� wSY-J� wSYyS� }W-� j-� p�-� tY-6� wSYyS� }W-� j-�� p�-� tY-L� wS� }� �
-�� w� �-� �Y�S�� �-� �YLS-"� w� �-� �Y�S�� �-� j-�� �� �Y� �� W-N� w�� ��~� �� �� C-� j-�� p�-� tY-N� wS� }� �-� j--� w� ��- � w� �W- � j-�� �� �Y� �� W-P� w�� ��~� �� �� C-"� j-�� p�-� tY-P� wS� }� �-#� j--� w� ��-$� w� �W-%� j-¶ ��� �Y� �� W-R� w�� ��~�� �� �� -&� j--� w� �¶ �W-'� j-ȶ ��� �Y� �� W-T� w�� ��~�� �� �� -(� j--� w� �ȶ �W-)� j-ʶ ��� �Y� �� W-V� w�� ��~�� �� �� -*� j--� w� �ʶ �W-+� j-̶ ��� �Y� �� W-X� w�� ��~�� �� �� -,� j--� w� �̶ �W--� j-ζ ��� �Y� �� W-Z� w�� ��~�� �� �� -.� j--� w� �ζ �W-/� j-ж ��� �Y� �� W-\� w�� ��~�� �� �� -0� j--� w� �ж �W-1� j-Ҷ ��� �Y� �� W-^� w�� ��~�� �� �� -2� j--� w� �Ҷ �W-3� j-Զ ��� �Y� �� W-`� w�� ��~�� �� �� -4� j--� w� �Զ �W-5� j-ֶ ��� �Y� �� W-ض w�� ��~�� �� �� -6� j--� w� �ֶ �W-b� f-� �� �� �:-8� j�-� w� �� �� �� �-�� f-9� j-�� p -� tY-"� wS� }�-� f�   $     �"#    �/0   �1   �23   �45   �67   �8   � 1 2   � 9   � 9 	  � 9 
  � 9   � !9   � #9   � 59   � I9   � K9   � M9   � O9   � Q9   � S9   � U9   � W9   � Y9   � [9   � ]9   � _9   �:; <  v�   P P _ _ h h q q P P P ~ ~ � � � � ~ ~ ~ � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � 
 
 	 	 	 	           	 	 2 : : I I : : : : 2 ] ] ] ] f f h h \ \ \ 	 y  y  x  x  x  x  �  �  �  �  �  �  �  �  x  x  � "� "� "� "� "� "� "� "� "� "� #� #� #� #� #� #� #� #� #� #� #x  � %� %� %� %� %� %� %� %� %� %� %� %  %  %� %� %� %� %� %� % & & & &$ &$ & & & &� %1 '1 '0 '0 '0 '0 '0 '0 '0 '0 'C 'C 'I 'I 'C 'C 'C 'C '0 '0 'd (d (d (d (m (m (c (c (c (0 'z )z )y )y )y )y )y )y )y )y )� )� )� )� )� )� )� )� )y )y )� *� *� *� *� *� *� *� *� *y )� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� +� ,� ,� ,� ,� ,� ,� ,� ,� ,� + - - - - - - - - - - - -$ -$ - - - - - - -? .? .? .? .H .H .> .> .> . -U /U /T /T /T /T /T /T /T /T /g /g /m /m /g /g /g /g /T /T /� 0� 0� 0� 0� 0� 0� 0� 0� 0T /� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 2� 2� 2� 2� 2� 2� 2� 2� 2� 1� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3� 3 4 4 4 4# 4# 4 4 4 4� 30 50 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5B 5B 5H 5H 5B 5B 5B 5B 5/ 5/ 5c 6c 6c 6c 6l 6l 6b 6b 6b 6/ 5P � 8� 8� 8� 8z 8� 9� 9� 9� 9� 9� 9� 9� 9� 9    %   #     *� 
�   $       "#   =  %  F    (ܸ � �Y� tY
SY�SYSYSYSY8SYSY� tY�Y� tYSY8SYSYS�SY�Y� tYSY8SYSYS�SY�Y� tYSY8SYSYS�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY	�Y� tYSY8SYSY�S�SY
�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SY�Y� tYSY8SYSY�S�SS���   $      ("#        ����  - 
SourceFile /CFIDE/services/pdf.cfc $cfpdf2ecfc472483660$funcEXTRACTPAGES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  DESTINATION ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PASSWORD K PAGES M KEEPBOOKMARK O         
		 Q _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V S T
 $ U _setCurrentLineNo (I)V W X
 $ Y 	ISALLOWED [ _get &(Ljava/lang/String;)Ljava/lang/Object; ] ^
 $ _ 	isAllowed a java/lang/Object c _autoscalarize e ^
 $ f pdf h 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; j k
 $ l ISALLOWEDIP n isAllowedIP p READFILEFROMURL r readFileFromURL t set (Ljava/lang/Object;)V v w coldfusion/runtime/Variable y
 z x GETTEMPFILEPATH | getTempFilePath ~  java/lang/String � ACTION � merge � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � ALLOWEXTRAATTRIBUTES � true � keepbookmark � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � password � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � extractPages � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � pages � getMetadata ()Ljava/lang/Object; this &Lcfpdf2ecfc472483660$funcEXTRACTPAGES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf4 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �    "     � �                  !     ް                        �                  !     6�              	
    B     $� �Y4SYHSYJSYLSYNSYPS�          $       � 	   �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:*N6� <� B� F:*P6� <� B� F:-R� V- ɶ Z-\� `b-� dY-4� gSY-H� gSYiS� mW- ʶ Z-o� `q-� dY-4� gSYiS� mW- ˶ Z-s� `u-� dY-J� gS� m� {- ̶ Z-}� `-� dY- � gS� m� {
-�� g� {-� �Y�S�� �-� �YJS- � g� �-� �Y"S-"� g� �-� �Y�S�� �- Զ Z-�� ��� �Y� �� W-P� g�� ��~�� �� �� - ն Z--� g� ��� �W- ֶ Z-�� ��� �Y� �� W-L� g�� ��~�� �� �� - ׶ Z--� g� ��� �W-�� V-� �� �� �:- ٶ Z�-� g� �� �� ԙ �-ֶ V- ڶ Z-ض `�-� dY-"� gS� m�-ܶ V�      �   �     �   � �   �   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   � G   � I   � K   � M   � O   �   : �   � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �# �# � � � � � �0 �9 �9 �H �H �9 �9 �9 �9 �0 �U �W �W �W �W �U �l �l �l �l �` �} �} �} �} �q �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � �� �� �3 �3 �3 �3 �< �< �2 �2 �2 �� � � �d �d �d �d �J �� �� �� �� �� �� �� �� �� �       #     *� 
�                  /    �� �� �� �Y� dY�SY�SY�SY�SY�SY6SY�SY� dY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SY� �Y� dY�SY6SY�SY�S� �SS� �� �                  ����  - 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660  coldfusion/runtime/CFComponent  <init> ()V  
  	 com.macromedia.SourceModTime  [�;� coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext;  	   getOut ()Ljavax/servlet/jsp/JspWriter;   javax/servlet/jsp/JspContext 
   parent Ljavax/servlet/jsp/tagext/Tag;  	   Cp1252  setPageEncoding (Ljava/lang/String;)V   ! !coldfusion/runtime/NeoPageContext #
 $ " _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object; & '
  ( _factor1 * '
  + archive Lcoldfusion/runtime/UDFMethod; cfpdf2ecfc472483660$funcARCHIVE /
 0 	 - .	  2 ARCHIVE 4 registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V 6 7
  8 
processDDX "cfpdf2ecfc472483660$funcPROCESSDDX ;
 < 	 : .	  > 
PROCESSDDX @ readsignaturefields +cfpdf2ecfc472483660$funcREADSIGNATUREFIELDS C
 D 	 B .	  F READSIGNATUREFIELDS H getinfo cfpdf2ecfc472483660$funcGETINFO K
 L 	 J .	  N GETINFO P removewatermark 'cfpdf2ecfc472483660$funcREMOVEWATERMARK S
 T 	 R .	  V REMOVEWATERMARK X sign cfpdf2ecfc472483660$funcSIGN [
 \ 	 Z .	  ^ SIGN ` extractPages $cfpdf2ecfc472483660$funcEXTRACTPAGES c
 d 	 b .	  f EXTRACTPAGES h extractImage $cfpdf2ecfc472483660$funcEXTRACTIMAGE k
 l 	 j .	  n EXTRACTIMAGE p validatesignature )cfpdf2ecfc472483660$funcVALIDATESIGNATURE s
 t 	 r .	  v VALIDATESIGNATURE x deletepages #cfpdf2ecfc472483660$funcDELETEPAGES {
 | 	 z .	  ~ DELETEPAGES � (convertArrayOfStructToPDFPageDetailArray @cfpdf2ecfc472483660$funcCONVERTARRAYOFSTRUCTTOPDFPAGEDETAILARRAY �
 � 	 � .	  � (CONVERTARRAYOFSTRUCTTOPDFPAGEDETAILARRAY � addwatermark $cfpdf2ecfc472483660$funcADDWATERMARK �
 � 	 � .	  � ADDWATERMARK � unsign cfpdf2ecfc472483660$funcUNSIGN �
 � 	 � .	  � UNSIGN � 
mergeFiles "cfpdf2ecfc472483660$funcMERGEFILES �
 � 	 � .	  � 
MERGEFILES � protect cfpdf2ecfc472483660$funcPROTECT �
 � 	 � .	  � PROTECT � 	thumbnail !cfpdf2ecfc472483660$funcTHUMBNAIL �
 � 	 � .	  � 	THUMBNAIL � mergespecificpages *cfpdf2ecfc472483660$funcMERGESPECIFICPAGES �
 � 	 � .	  � MERGESPECIFICPAGES � setinfo cfpdf2ecfc472483660$funcSETINFO �
 � 	 � .	  � SETINFO � extractText #cfpdf2ecfc472483660$funcEXTRACTTEXT �
 � 	 � .	  � EXTRACTTEXT � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � _implicitMethods Ljava/util/Map; � �	  � java/lang/Object � style � document � extends � base � 	wsversion � 1 � Name � pdf � 	Functions �	 0 �	 < �	 D �	 L �	 T �	 \ �	 d �	 l �	 t �	 | �	 � �	 � �	 � �	 � �	 � �	 � �	 � �	 � �	 � � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this Lcfpdf2ecfc472483660; LocalVariableTable Code _setImplicitMethods (Ljava/util/Map;)V implicitMethods __factorParent out Ljavax/servlet/jsp/JspWriter; value 
getExtends ()Ljava/lang/String; registerUDFs runPage LineNumberTable _getImplicitMethods ()Ljava/util/Map; <clinit> 1       - .    : .    B .    J .    R .    Z .    b .    j .    r .    z .    � .    � .    � .    � .    � .    � .    � .    � .    � .    � �   
 � �   
  � �    "     � Ͱ                  -     +� ӱ                 �   & '    >     *�      *               	    
 �   * '    >     *�      *               	    
 �      !     ݰ                   �     �*5� 3� 9*A� ?� 9*I� G� 9*Q� O� 9*Y� W� 9*a� _� 9*i� g� 9*q� o� 9*y� w� 9*�� � 9*�� �� 9*�� �� 9*�� �� 9*�� �� 9*�� �� 9*�� �� 9*�� �� 9*�� �� 9*ɲ Ƕ 9�          �     �    x     0*� � L*� N*� � %*-+� )� �*-+� ,� ��      *    0      0	    0
 �    0                #     *� 
�                  "     � Ӱ                  D 	   �� 0Y� 1� 3� <Y� =� ?� DY� E� G� LY� M� O� TY� U� W� \Y� ]� _� dY� e� g� lY� m� o� tY� u� w� |Y� }� � �Y� �� �� �Y� �� �� �Y� �� �� �Y� �� �� �Y� �� �� �Y� �� �� �Y� �� �� �Y� �� �� �Y� ų ǻ �Y
� �Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	� �Y� �SY� �SY� �SY� �SY� �SY� �SY� �SY� �SY� �SY	� �SY
� �SY� �SY� �SY� �SY� �SY� �SY� �SY� �SY� �SS� �� ͱ         �      � &��bb�� R R;;& �& �--4�4�; <; <B �B �I I P�P�W �W �^�^�evevl;l;sVsVz �z �           ����  - 
SourceFile /CFIDE/services/pdf.cfc #cfpdf2ecfc472483660$funcDELETEPAGES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / SERVICEUSERNAME 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C SERVICEPASSWORD E SOURCE G PAGES I PASSWORD K 
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 " Q _setCurrentLineNo (I)V S T
 " U 	ISALLOWED W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 " [ 	isAllowed ] java/lang/Object _ _autoscalarize a Z
 " b pdf d 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; f g
 " h ISALLOWEDIP j isAllowedIP l READFILEFROMURL n readFileFromURL p set (Ljava/lang/Object;)V r s coldfusion/runtime/Variable u
 v t  java/lang/String y ACTION { deletepages } _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V  �
 " � ALLOWEXTRAATTRIBUTES � true � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 " � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � pages � getMetadata ()Ljava/lang/Object; this %Lcfpdf2ecfc472483660$funcDELETEPAGES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf1 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � ְ    �        � �    � �  �   !     ~�    �        � �    � �  �         �    �        � �    � �  �   !     4�    �        � �    � �  �   <     � zY2SYFSYHSYJSYLS�    �        � �    �   �  ^ 	   
+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:*F4� :� @� D:*H4� :� @� D:*J4� :� @� D:*L4� :� @� D:-N� R-C� V-X� \^-� `Y-2� cSY-F� cSYeS� iW-D� V-k� \m-� `Y-2� cSYeS� iW-E� V-o� \q-� `Y-H� cS� i� w
-x� c� w-� zY|S~� �-� zYHS- � c� �-� zY�S�� �-L� V-�� ��� �Y� �� W-L� c�� ��~�� �� �� -M� V--� c� ��� �W-�� R-� �� �� �:-O� V�-� c� �� �� ʙ �-̶ R-P� V-ζ \�-� `Y- � cS� i�-Ҷ R�    �   �   
 � �    
   
 �   
   
   
	   

 �   
 - .   
    
  	  
  
  
    
 1   
 E   
 G   
 I   
 K   
   � a   < � C � C � C � C � C � C � C � C � C � C � C � D � D � D � D � D � D � D � D � D � E � E � E E E � E � E � E � E � E G G G G G G) H) H) H) H H: I: I: I: I. IO JO JO JO JC J[ L[ LZ LZ LZ LZ LZ LZ LZ LZ Lm Lm Ls Ls Lm Lm Lm Lm LZ LZ L� M� M� M� M� M� M� M� M� MZ L � B� O� O� O� O� O� P� P� P� P� P� P� P� P� P     �   #     *� 
�    �        � �      �       ��� �� �� �Y� `Y�SY~SY�SY�SY�SY4SY�SY� `Y� �Y� `Y�SY4SY�SY�S� �SY� �Y� `Y�SY4SY�SY�S� �SY� �Y� `Y�SY4SY�SY�S� �SY� �Y� `Y�SY4SY�SY�S� �SY� �Y� `Y�SY4SY�SY�S� �SS� � ֱ    �       � � �        ����  -H 
SourceFile /CFIDE/services/pdf.cfc "cfpdf2ecfc472483660$funcMERGEFILES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   SOURCEINDEX  DESTINATION ! SOURCEPATHS # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 SERVICEUSERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SERVICEPASSWORD I SOURCE K KEEPBOOKMARK M #        
                     
		 O _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V Q R
 & S _setCurrentLineNo (I)V U V
 & W 	ISALLOWED Y _get &(Ljava/lang/String;)Ljava/lang/Object; [ \
 & ] 	isAllowed _ java/lang/Object a _autoscalarize c \
 & d pdf f 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; h i
 & j ISALLOWEDIP l isAllowedIP n 
       		  p   r set (Ljava/lang/Object;)V t u coldfusion/runtime/Variable w
 x v 
		 z _String &(Ljava/lang/Object;)Ljava/lang/String; | } coldfusion/runtime/Cast 
 � ~ , � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 & � java/util/StringTokenizer � '(Ljava/lang/String;Ljava/lang/String;)V  �
 � � 	nextToken ()Ljava/lang/String; � �
 � � 
        		 � READFILEFROMURL � readFileFromURL � concat &(Ljava/lang/String;)Ljava/lang/String; � � java/lang/String �
 � � 
        	 � CFLOOP � checkRequestTimeout (Ljava/lang/String;)V � �
 & � hasMoreTokens ()Z � �
 � � GETTEMPFILEPATH � getTempFilePath � .pdf �  ACTION � merge � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � ALLOWEXTRAATTRIBUTES � true � keepbookmark � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 & �  
		 � 
GETHTTPURL � 
getHttpUrl  			
	 
mergeFiles metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection
 name access remote 
returntype 
Parameters TYPE NAME serviceusername ([Ljava/lang/Object;)V 
 servicepassword source! getMetadata ()Ljava/lang/Object; this $Lcfpdf2ecfc472483660$funcMERGEFILES; LocalVariableTable Code getName 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t18 Ljava/lang/String; t19 t20 I t21 t22 Ljava/util/StringTokenizer; pdf3 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �       #$ (   "     �	�   '       %&   ) � (   "     �   '       %&   *+ (         �   '       %&   , � (   !     8�   '       %&   -. (   7     � �Y6SYJSYLSYNS�   '       %&   /0 (  < 
   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*J8� >� D� H:*L8� >� D� H:*N8� >� D� H:-P� T- �� X-Z� ^`-� bY-6� eSY-J� eSYgS� kW- �� X-m� ^o-� bY-6� eSYgS� kW-q� Ts� y-q� Ts� y-{� T-L� e� �:�:6- +� �:� �Y� �:� e� �:� y-�� T-$� e� �- �� X-�� ^�-� bY- � eS� k� �� ��� �� y-�� T�� �`6� ����-{� T- �� X-�� ^�-� bY�S� k� y
-�� e� y-� �Y�S�� �-� �YLS-$� e� �-� �Y"S-"� e� �-� �Y�S�� �- �� X-�� ��� �Y� ˚ W-N� es� ��~�� Ǹ ˙ - �� X--� e� ��� �W-ٶ T-� �� �� �:- �� X�-� e� �� �� �� �-�� T- �� X-�� ^-� bY-"� eS� k�-� T�   '   �   �%&    �12   �3   �45   �67   �89   �:   � 1 2   � ;   � ; 	  � ; 
  � ;   � !;   � #;   � 5;   � I;   � K;   � M;   �<=   �>=   �?@   �A;   �BC   �DE F  N �   � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �V �V �V �V �f �f �u �u �f �f �f �f �V �V �V �V �� �� �V �V �V �V �T �T �� � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � �# �# �# �# � �0 �0 �/ �/ �/ �/ �/ �/ �/ �/ �B �B �H �H �B �B �B �B �/ �/ �d �d �d �d �m �m �c �c �c �/ �� �� �� �� �� �{ �� �� �� �� �� �� �� �� �� �    (   #     *� 
�   '       %&   G  (   �     �ݸ � �Y� bYSYSYSYSYSY8SYSY� bY�Y� bYSY8SYSYS�SY�Y� bYSY8SYSY S�SY�Y� bYSY8SYSY"S�SY�Y� bYSY8SYSY�S�SS��	�   '       �%&        ����  - 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcARCHIVE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  DESTINATION ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PASSWORD K         
		 M _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V O P
 $ Q _setCurrentLineNo (I)V S T
 $ U 	ISALLOWED W _get &(Ljava/lang/String;)Ljava/lang/Object; Y Z
 $ [ 	isAllowed ] java/lang/Object _ _autoscalarize a Z
 $ b pdf d 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; f g
 $ h ISALLOWEDIP j isAllowedIP l READFILEFROMURL n readFileFromURL p set (Ljava/lang/Object;)V r s coldfusion/runtime/Variable u
 v t GETTEMPFILEPATH x getTempFilePath z  java/lang/String } ACTION  archive � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 	
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � getMetadata ()Ljava/lang/Object; this !Lcfpdf2ecfc472483660$funcARCHIVE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf11 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � ְ    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     6�    �        � �    � �  �   7     � ~Y4SYHSYJSYLS�    �        � �    � �  �  � 	   /+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:-N� R-�� V-X� \^-� `Y-4� cSY-H� cSYeS� iW-�� V-k� \m-� `Y-4� cSYeS� iW-�� V-o� \q-� `Y-J� cS� i� w-�� V-y� \{-� `Y- � cS� i� w
-|� c� w-� ~Y�S�� �-� ~YJS- � c� �-� ~Y"S-"� c� �-�� V-�� ��� �Y� �� W-L� c�� ��~�� �� �� -�� V--� c� ��� �W-�� R-� �� �� �:-�� V�-� c� �� �� ʙ �-̶ R-�� V-ζ \�-� `Y-"� cS� i�-Ҷ R�    �   �   / � �    / �    / �   /   /   /   / �   / / 0   / 	   / 	 	  / 	 
  / 	   / !	   / 3	   / G	   / I	   / K	   /
   � k  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ��
���"�"�����
�/�1�1�1�1�/�F�F�F�F�:�W�W�W�W�K�l�l�l�l�`�}�}�|�|�|�|�|�|�|�|�����������������|�|�������������������|� ���������������������     �   #     *� 
�    �        � �      �   �     ��� �� �� �Y� `Y�SY�SY�SY�SY�SY6SY�SY� `Y� �Y� `Y�SY6SY�SY�S� �SY� �Y� `Y�SY6SY�SY�S� �SY� �Y� `Y�SY6SY�SY�S� �SY� �Y� `Y�SY6SY�SY�S� �SS� � ֱ    �       � � �        ����  -� 
SourceFile /CFIDE/services/pdf.cfc "cfpdf2ecfc472483660$funcPROCESSDDX  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   INPUTFILESSTRUCT  OUTPUTFILESSTRUCT ! KVPAIR # MODIFIEDRESULT % VALUE ' KEY ) coldfusion/runtime/CfJspPage + pageContext #Lcoldfusion/runtime/NeoPageContext; - .	 , / getOut ()Ljavax/servlet/jsp/JspWriter; 1 2 javax/servlet/jsp/JspContext 4
 5 3 parent Ljavax/servlet/jsp/tagext/Tag; 7 8	 , 9 SERVICEUSERNAME ; string = getVariable  (I)Lcoldfusion/runtime/Variable; ? @ %coldfusion/runtime/ArgumentCollection B
 C A 3coldfusion/tagext/validation/CFTypeValidatorFactory E STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; G H	 F I _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; K L
  M SERVICEPASSWORD O 	DDXSTRING Q 
INPUTFILES S CFIDE.services.element[] U OUTPUTFILES W         
		 Y _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V [ \
 , ] _setCurrentLineNo (I)V _ `
 , a 	ISALLOWED c _get &(Ljava/lang/String;)Ljava/lang/Object; e f
 , g 	isAllowed i java/lang/Object k _autoscalarize m f
 , n pdf p 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; r s
 , t ISALLOWEDIP v isAllowedIP x 	StructNew !()Lcoldfusion/util/FastHashtable; z { coldfusion/runtime/CFPage }
 ~ | set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � 
		 �   � 

         � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � java/util/List � size ()I � � � � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 , � get (I)Ljava/lang/Object; � � � � 
            � java/lang/String � READFILEFROMURL � readFileFromURL � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 , � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 , � 
             � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � StructInsert 6(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)Z � �
 ~ � GETTEMPFILEPATH � getTempFilePath � .pdf �         
         � ___IMPLICITARRYSTRUCTVAR0 � ACTION � 
processddx � DDXFILE � NAME � result � 	
         � 		
	 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 , � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 , � 
	 � 
     	 � RESULT � _validatingMap � �
 , � java/util/Map entrySet ()Ljava/util/Set; java/util/Set iterator ()Ljava/util/Iterator;	
 java/util/Iterator next ()Ljava/lang/Object; class$java$util$Map$Entry java.util.Map$Entry �	  _cast 7(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
 � java/util/Map$Entry getKey key! SetVariable 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;#$
 ~% 
StructFind 5(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;'(
 ~) 
successful+ _compare '(Ljava/lang/Object;Ljava/lang/String;)D-.
 ,/ 
            	1 
GETHTTPURL3 
getHttpUrl5 
             7 
             	9 CFLOOP; checkRequestTimeout (Ljava/lang/String;)V=>
 ,? hasNext ()ZABC          
		E CONVERTSTRUCTTOMAPG convertStructToMapI 			
	K 
processDDXM metaData Ljava/lang/Object;OP	 Q &coldfusion/runtime/AttributeCollectionS nameU accessW remoteY 
returntype[ 
Parameters] TYPE_ serviceusernamea ([Ljava/lang/Object;)V c
Td servicepasswordf 	ddxStringh 
inputfilesj outputfilesl getMetadata this $Lcfpdf2ecfc472483660$funcPROCESSDDX; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t22 Ljava/util/List; t23 I t24 t25 t26 t27 t28 t29 t30 t31 pdf9 Lcoldfusion/tagext/lang/PDFTag; t34 Ljava/util/Iterator; LineNumberTable <clinit> 1       � �    �   OP    n r   "     �R�   q       op   st r   "     N�   q       op   u � r         �   q       op   vt r   !     V�   q       op   wx r   <     � �Y<SYPSYRSYTSYXS�   q       op   yz r  
�  #  Y+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :-� 0� 6:-� ::*<>� D� J� N:*P>� D� J� N:*R>� D� J� N:*TV� D� N:*XV� D� N:-Z� ^-i� b-d� hj-� lY-<� oSY-P� oSYqS� uW-j� b-w� hy-� lY-<� oSYqS� uW-k� b� � �-l� b� � �-�� ^�� �-�� ^-T� o� �:66� � 6-$+� �:� �� � :� �� �-�� ^-$� �Y(S-p� b-�� h�-� lY-$� �Y(S� �S� u� �-�� ^-q� b-- � o� �-$� �Y*S� �� �-$� �Y(S� �� �W-�� ^`6��W-�� ^-X� o� �:66� � 6-$+� �:� �� � :� �� |-�� ^-$� �Y(S-t� b-�� h�-� lY�S� u� �-�� ^-u� b--"� o� �-$� �Y*S� �� �-$� �Y(S� �� �W-�� ^`6��d-Ŷ ^+Ƕ :  � � �-�� �Y�S˶ �-�� �Y�S-R� o� �-�� �YTS- � o� �-�� �YXS-"� o� �-�� �Y�SѶ �
-Ƕ h� �-Ӷ ^-z� b� � �-ն ^-� �� �� �:!-{� b!�-� o� �!� �!� �� �-�� ^�� �-�� ^-�� o� � � :"�-"� ����  :-"�&W-�� ^-~� b--�� o� �-*� o� ��*� �-�� ^-(� o,�0�� o-2� ^-�� b--&� o� �-*� o� �-�� b-4� h6-� lY-�� b--"� o� �-*� o� ��*S� u� �W-8� ^� O-:� ^-�� b--&� o� �-*� o� �-�� b--�� o� �-*� o� ��*� �W-�� ^-�� ^<�@"�D ���-F� ^-�� b-H� hJ-� lY-&� oS� u�-L� ^�   q  ` #  Yop    Y{|   Y}P   Y~   Y��   Y��   Y�P   Y 7 8   Y �   Y � 	  Y � 
  Y �   Y !�   Y #�   Y %�   Y '�   Y )�   Y ;�   Y O�   Y Q�   Y S�   Y W�   Y��   Y��   Y��   Y��   Y��   Y��   Y��   Y��   Y��   Y��   Y ��    Y�� !  Y�� "�  � �  b �i �i �i �i �i �i �i �i �i �i �i �j �jjjjj �j �j �jkkkkkk#l,l,l,l,l#l �h:n<n<n<n<n:n:nIoIoIoIo�p�p�p�p�p�p�p�p�p�p�q�q�q�q�q�q�q�q�q�q�q�q�q�qoIo#s#s#s#s|t|t�t�t|t|t|t|titit�u�u�u�u�u�u�u�u�u�u�u�u�u�u�s#s�x�x�x�x�x�xxxxx xxxxxxxx2x2x2x2x2x2x&xGxGxGxGxGxGx;x\x\x\x\xPx�xax�wtz}z}z}z}ztztz�{�{�{�{�{�|�|�|�|�|�|�|�}�}�}�}}}~!~!~!~!~*~*~*~*~ ~ ~ ~ ~~~AAGGc�c�c�c�l�l�l�l�|�|���������������������|�|�b�b�b�b�����������������������������������������������A}�}2�2�C�C�2�2�2�2�2�    r   #     *� 
�   q       op   �  r  %    ٸ ߳ �� ߳�TY� lYVSYNSYXSYZSY\SYVSY^SY� lY�TY� lY`SY>SY�SYbS�eSY�TY� lY`SY>SY�SYgS�eSY�TY� lY`SY>SY�SYiS�eSY�TY� lY`SYVSY�SYkS�eSY�TY� lY`SYVSY�SYmS�eSS�e�R�   q      op        ����  -
 
SourceFile /CFIDE/services/pdf.cfc )cfpdf2ecfc472483660$funcVALIDATESIGNATURE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / SERVICEUSERNAME 1 string 3 getVariable  (I)Lcoldfusion/runtime/Variable; 5 6 %coldfusion/runtime/ArgumentCollection 8
 9 7 3coldfusion/tagext/validation/CFTypeValidatorFactory ; STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; = >	 < ? _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; A B
  C SERVICEPASSWORD E SOURCE G PASSWORD I         
		 K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 " O _setCurrentLineNo (I)V Q R
 " S 	ISALLOWED U _get &(Ljava/lang/String;)Ljava/lang/Object; W X
 " Y 	isAllowed [ java/lang/Object ] _autoscalarize _ X
 " ` pdf b 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; d e
 " f ISALLOWEDIP h isAllowedIP j READFILEFROMURL l readFileFromURL n set (Ljava/lang/Object;)V p q coldfusion/runtime/Variable s
 t r  java/lang/String w ACTION y validatesignature { _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V } ~
 "  NAME � res � password � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 " � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 	
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 " �  
		 � RES � 			
	 � metaData Ljava/lang/Object; � �	  � struct � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � getMetadata ()Ljava/lang/Object; this +Lcfpdf2ecfc472483660$funcVALIDATESIGNATURE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf12 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � Ұ    �        � �    � �  �   !     |�    �        � �    � �  �         �    �        � �    � �  �   !     ԰    �        � �    � �  �   7     � xY2SYFSYHSYJS�    �        � �    � �  �  & 	   �+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:*24� :� @� D:*F4� :� @� D:*H4� :� @� D:*J4� :� @� D:-L� P-Ƕ T-V� Z\-� ^Y-2� aSY-F� aSYcS� gW-ȶ T-i� Zk-� ^Y-2� aSYcS� gW-ɶ T-m� Zo-� ^Y-H� aS� g� u
-v� a� u-� xYzS|� �-� xYHS- � a� �-� xY�S�� �-ж T-�� ��� �Y� �� W-J� a�� ��~�� �� �� -Ѷ T--� a� ��� �W-�� P-� �� �� �:-Ӷ T�-� a� �� �� ș �-ʶ P-̶ a�-ζ P�    �   �   � � �    � � �   � � �   � � �   �    �   � �   � - .   �    �  	  �  
  �    � 1   � E   � G   � I   �   ~ _  � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �������������*�*�*�*��?�?�?�?�3�L�L�K�K�K�K�K�K�K�K�^�^�d�d�^�^�^�^�K�K����������������K� ��������������������������     �   #     *� 
�    �        � �   	   �   �     ��� �� �� �Y� ^Y�SY|SY�SY�SY�SY�SY�SY� ^Y� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SY� �Y� ^Y�SY4SY�SY�S� �SS� � ұ    �       � � �        ����  -� 
SourceFile /CFIDE/services/pdf.cfc *cfpdf2ecfc472483660$funcMERGESPECIFICPAGES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ITEM  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   PDFPARAMATTRCOLL  DESTINATION ! I # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 SERVICEUSERNAME 5 string 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G SERVICEPASSWORD I PDFPARAM K CFIDE.services.pdfparam[] M KEEPBOOKMARK O   
         Q _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V S T
 & U _setCurrentLineNo (I)V W X
 & Y 	ISALLOWED [ _get &(Ljava/lang/String;)Ljava/lang/Object; ] ^
 & _ 	isAllowed a java/lang/Object c _autoscalarize e ^
 & f pdf h 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; j k
 & l ISALLOWEDIP n isAllowedIP p 

         r ArrayNew (I)Ljava/util/List; t u coldfusion/runtime/CFPage w
 x v set (Ljava/lang/Object;)V z { coldfusion/runtime/Variable }
 ~ | 1 �   � 	
        � pdfparam � 	IsDefined (Ljava/lang/String;)Z � �
 x �         
             � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � java/util/List � size ()I � � � � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 & � get (I)Ljava/lang/Object; � � � � 
                 � 	StructNew !()Lcoldfusion/util/FastHashtable; � �
 x � _arraySetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � 
item.pages � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � java/lang/String � PAGES � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 & � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � pages � StructInsert 6(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)Z � �
 x � item.password � PASSWORD � password � item.source � SOURCE � source � READFILEFROMURL � readFileFromURL � '(Ljava/lang/String;I)Ljava/lang/Object; e �
 & � _double (Ljava/lang/Object;)D � �
 � �             
             � 
		 � GETTEMPFILEPATH � getTempFilePath � .pdf � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 & � coldfusion/tagext/lang/PDFTag merge 	setAction (Ljava/lang/String;)V
 cfpdf	 destination _String &(Ljava/lang/Object;)Ljava/lang/String;
 � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 & setDestination
 	hasEndTag (Z)V coldfusion/tagext/GenericTag
 
doStartTag �
 
            ! 
               	# StructIsEmpty (Ljava/util/Map;)Z%&
 x' 
	                ) (class$coldfusion$tagext$lang$PDFParamTag "coldfusion.tagext.lang.PDFParamTag,+ �	 . "coldfusion/tagext/lang/PDFParamTag0 attributecollection2 _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V45
6 _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z89
 &: doAfterBody< �
= doEndTag? �
@ doCatch (Ljava/lang/Throwable;)VBC
D 	doFinallyF 
G 
GETHTTPURLI 
getHttpUrlK 
	M mergespecificpagesO metaData Ljava/lang/Object;QR	 S &coldfusion/runtime/AttributeCollectionU nameW accessY remote[ 
returntype] 
Parameters_ TYPEa NAMEc serviceusernamee ([Ljava/lang/Object;)V g
Vh servicepasswordj keepbookmarkl getMetadata ()Ljava/lang/Object; this ,Lcfpdf2ecfc472483660$funcMERGESPECIFICPAGES; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t18 Ljava/util/List; t19 t20 t21 t22 pdf8 Lcoldfusion/tagext/lang/PDFTag; mode8 t25 t26 t27 t28 t29 	pdfparam7 $Lcoldfusion/tagext/lang/PDFParamTag; t31 t32 t33 Ljava/lang/Throwable; t34 t35 LineNumberTable java/lang/Throwable� <clinit> 1       � �   + �   QR    no s   "     �T�   r       pq   tu s   "     P�   r       pq   v � s         �   r       pq   wu s   !     8�   r       pq   xy s   7     � �Y6SYJSYLSYPS�   r       pq   z{ s  
  $  �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*J8� >� D� H:*LN� >� H:*P8� >� D� H:-R� V-A� Z-\� `b-� dY-6� gSY-J� gSYiS� mW-B� Z-o� `q-� dY-6� gSYiS� mW-s� V-D� Z-� y� -R� V�� -s� V
�� -�� V-G� Z-�� ���-�� V-L� g� �:66� � 6-+� �:��� � :� ��-�� V- � dY-$� gS-I� Z� �� �-�� V-K� Z-�� �� �Y� �� W-� �Y�S� ��� ��~� �� �� /-L� Z-- -$� g� Ÿ ��-� �Y�S� �� �W-M� Z-Ѷ �� �Y� �� W-� �Y�S� ��� ��~� �� �� /-N� Z-- -$� g� Ÿ ��-� �Y�S� �� �W-O� Z-׶ �� �Y� �� W-� �Y�S� ��� ��~� �� �� I-Q� Z-- -$� g� Ÿ ��-Q� Z-ݶ `�-� dY-� �Y�S� �S� m� �W-$ � � �X-� V`6��R-s� V-� V-W� Z-� `�-� dY�S� m� -s� V-� �� �:-X� Z�
-"� g����� Y6� �-"� V- � g� �:66� � 6-+� �:� �� � :� � {-$� V-Z� Z--� g� ɶ(�� P-*� V-�/� �1:-[� Z3-� g�7��;� :� d�-�� V-"� V`6��e-s� V�>��&�A� : � # �� � #:!!�E� � :"� "�:#�H�#-�� V-_� Z-J� `L-� dY-"� gS� m�-N� V� �A��G��������A��G��������������� r  j $  �pq    �|}   �~R   ��   ���   ���   ��R   � 1 2   � �   � � 	  � � 
  � �   � !�   � #�   � 5�   � I�   � K�   � O�   ���   �� #   �� #   �� #   ���   ���   �� #   ���   �� #   �� #   �� #   ���   ���   ��R   ��R    ��� !  ��� "  ��R #�  ^ �  ; �A �A �A �A �A �A �A �A �A �A �A �B �B �B �B �B �B �B �B �B �@ �D �D �D �D �D �D �D �D �DEEEEEEEFFFFFFF2G2G1G1GBHBHBHBH�I�I�I�I�I�I�I�I�K�K�K�K�K�K�K�K�K�K�K�K�K�K�K�K�L�L�L�L�L�L�L�L�L�L�L�L�L�KMMMMMM*M*M9M9M*M*M*M*MMMVNVNSNSNSNSNbNbNdNdNRNRNRNMOO~O~O~O~O�O�O�O�O�O�O�O�O~O~O�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q~O�S�S�S�S�S�S�S�JHBH1G)W2W2WAWAW2W2W2W2W)W)WjXjXxXxXxXxX�Y�Y�Y�Y�Z�Z�Z�Z�Z�Z�Z�Z�Z�Z&[&[&[&[[�ZcY�YRX�_�_�_�_�_�_�_�_�_    s   #     *� 
�   r       pq   �  s       ��� �� �-� ��/�VY� dYXSYPSYZSY\SY^SY8SY`SY� dY�VY� dYbSY8SYdSYfS�iSY�VY� dYbSY8SYdSYkS�iSY�VY� dYbSYNSYdSY�S�iSY�VY� dYbSY8SYdSYmS�iSS�i�T�   r       �pq        ����  -R 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcSETINFO  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
INFOSTRUCT  
SOURCEPATH ! DESTINATION # KVPAIR % coldfusion/runtime/CfJspPage ' pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	 ( + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	 ( 5 SERVICEUSERNAME 7 string 9 getVariable  (I)Lcoldfusion/runtime/Variable; ; < %coldfusion/runtime/ArgumentCollection >
 ? = 3coldfusion/tagext/validation/CFTypeValidatorFactory A STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; C D	 B E _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; G H
  I SERVICEPASSWORD K SOURCE M INFO O CFIDE.services.element[] Q PASSWORD S         
		 U _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V W X
 ( Y _setCurrentLineNo (I)V [ \
 ( ] 	ISALLOWED _ _get &(Ljava/lang/String;)Ljava/lang/Object; a b
 ( c 	isAllowed e java/lang/Object g _autoscalarize i b
 ( j pdf l 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; n o
 ( p ISALLOWEDIP r isAllowedIP t READFILEFROMURL v readFileFromURL x set (Ljava/lang/Object;)V z { coldfusion/runtime/Variable }
 ~ | GETTEMPFILEPATH � getTempFilePath � 	StructNew !()Lcoldfusion/util/FastHashtable; � � coldfusion/runtime/CFPage �
 � � 
	 �   � 

         � _List $(Ljava/lang/Object;)Ljava/util/List; � � coldfusion/runtime/Cast �
 � � java/util/List � size ()I � � � � bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; � �
 ( � get (I)Ljava/lang/Object; � � � � 
            � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � java/lang/String � KEY � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 ( � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � VALUE � StructInsert 6(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)Z � �
 � � 
		 � 			
         �  ACTION � setinfo � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 ( � ALLOWEXTRAATTRIBUTES � true � password � 	IsDefined (Ljava/lang/String;)Z � �
 � � _Object (Z)Ljava/lang/Object; � �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 ( � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 ( � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � 
 � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
 (  
		 
GETHTTPURL	 
getHttpUrl 			
	 metaData Ljava/lang/Object;	  &coldfusion/runtime/AttributeCollection name access remote 
returntype 
Parameters TYPE NAME! serviceusername# ([Ljava/lang/Object;)V %
& servicepassword( source* info, getMetadata ()Ljava/lang/Object; this !Lcfpdf2ecfc472483660$funcSETINFO; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t20 Ljava/util/List; t21 I t22 t23 t24 pdf17 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �       ./ 3   "     ��   2       01   45 3   !     İ   2       01   6 � 3         �   2       01   75 3   !     :�   2       01   89 3   <     � �Y8SYLSYNSYPSYTS�   2       01   :; 3  � 	   :+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :-� ,� 2:-� 6:*8:� @� F� J:*L:� @� F� J:*N:� @� F� J:*PR� @� J:*T:� @� F� J:-V� Z-]� ^-`� df-� hY-8� kSY-L� kSYmS� qW-^� ^-s� du-� hY-8� kSYmS� qW-_� ^-w� dy-� hY-N� kS� q� -`� ^-�� d�-� hY-"� kS� q� -a� ^� �� -�� Z�� -�� Z-P� k� �:66� � 6-&+� �:� h� � :� � I-�� Z-e� ^-- � k� �-&� �Y�S� �� �-&� �Y�S� �� �W-�� Z`6���-�� Z
-�� k� -� �Y�SĶ �-� �YNS-"� k� �-� �Y$S-$� k� �-� �YPS- � k� �-� �Y�S̶ �-o� ^-ζ ��� �Y� ښ W-T� k�� ��~�� ָ ڙ -p� ^--� k� �ζ �W-� Z-� �� �� �:-r� ^�-� k� ���� �-� Z-s� ^-
� d-� hY-$� kS� q�-� Z�   2     :01    :<=   :>   :?@   :AB   :CD   :E   : 3 4   : F   : F 	  : F 
  : F   : !F   : #F   : %F   : 7F   : KF   : MF   : OF   : SF   :GH   :IJ   :KJ   :LJ   :MF   :NO P  ^ �  V �] �] �] �] �] �] �] �] �] �] �] �^ �^ �^ �^ �^ �^ �^ �^ �^__________+`4`4`C`C`4`4`4`4`+`PaYaYaYaYaPa �\gcicicicicgcgcvdvdvdvd�e�e�e�e�e�e�e�e�e�e�e�e�e�edvdhhhhhh'i'i'i'ii8j8j8j8j,jMkMkMkMkAkblblblblVlwmwmwmwmkm�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�o�p�p�p�p�p�p�p�p�p�og�r�r�r�r�rss$s$ssssss    3   #     *� 
�   2       01   Q  3      � � �Y� hYSY�SYSYSYSY:SYSY� hY�Y� hY SY:SY"SY$S�'SY�Y� hY SY:SY"SY)S�'SY�Y� hY SY:SY"SY+S�'SY�Y� hY SYRSY"SY-S�'SY�Y� hY SY:SY"SY�S�'SS�'��   2      01        ����  -� 
SourceFile /CFIDE/services/pdf.cfc !cfpdf2ecfc472483660$funcTHUMBNAIL  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   HTTPURLFORDIRECTORY  ARRAY ! UTIL # 
SOURCEPATH % DESTINATION ' I ) 	FILESLIST + FILENAME - MAP / coldfusion/runtime/CfJspPage 1 pageContext #Lcoldfusion/runtime/NeoPageContext; 3 4	 2 5 getOut ()Ljavax/servlet/jsp/JspWriter; 7 8 javax/servlet/jsp/JspContext :
 ; 9 parent Ljavax/servlet/jsp/tagext/Tag; = >	 2 ? SERVICEUSERNAME A string C getVariable  (I)Lcoldfusion/runtime/Variable; E F %coldfusion/runtime/ArgumentCollection H
 I G 3coldfusion/tagext/validation/CFTypeValidatorFactory K STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; M N	 L O _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; Q R
  S SERVICEPASSWORD U SOURCE W FORMAT Y IMAGEPREFIX [ PASSWORD ] PAGES _ 
RESOLUTION a SCALE c TRANSPARENT e ,                                        
		 g _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V i j
 2 k _setCurrentLineNo (I)V m n
 2 o 	ISALLOWED q _get &(Ljava/lang/String;)Ljava/lang/Object; s t
 2 u 	isAllowed w java/lang/Object y _autoscalarize { t
 2 | pdf ~ 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; � �
 2 � ISALLOWEDIP � isAllowedIP � READFILEFROMURL � readFileFromURL � set (Ljava/lang/Object;)V � � coldfusion/runtime/Variable �
 � � GETTEMPFILEPATH � getTempFilePath � 	thumbnail �  java/lang/String � ACTION � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 2 � ALLOWEXTRAATTRIBUTES � true � format � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 2 � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � imageprefix � pages � password � 
resolution � scale � transparent � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 2 � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � 
doStartTag ()I � �
 � � doAfterBody � �
 � � doEndTag � �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 �  
 
	       java coldfusion.servicelayer.Utils CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;	
 �
 sortThumnailFiles _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
 2 

	       ArrayNew (I)Ljava/util/List;
 � 	
	       1 
GETHTTPURL 
getHttpUrl _List $(Ljava/lang/Object;)Ljava/util/List; !
 �" java/util/List$ size& �%' bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;)*
 2+ get (I)Ljava/lang/Object;-.%/ 
		1 	component3 CFIDE.services.element5 KEY7 VALUE9 _String &(Ljava/lang/Object;)Ljava/lang/String;;<
 �= /? concat &(Ljava/lang/String;)Ljava/lang/String;AB
 �C '(Ljava/lang/String;I)Ljava/lang/Object; {E
 2F _double (Ljava/lang/Object;)DHI
 �J (D)Ljava/lang/Object; �L
 �M _arraySetAtO �
 2P 			
	R metaData Ljava/lang/Object;TU	 V CFIDE.services.element[]X &coldfusion/runtime/AttributeCollectionZ name\ access^ remote` 
returntypeb 
Parametersd TYPEf NAMEh serviceusernamej ([Ljava/lang/Object;)V l
[m servicepasswordo sourceq getMetadata ()Ljava/lang/Object; this #Lcfpdf2ecfc472483660$funcTHUMBNAIL; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf18 Lcoldfusion/tagext/lang/PDFTag; mode18 t32 t33 Ljava/lang/Throwable; t34 t35 t36 Ljava/util/List; t37 t38 t39 t40 LineNumberTable java/lang/Throwable� <clinit> 1       � �   TU    st x   "     �W�   w       uv   yz x   !     ��   w       uv   { � x         �   w       uv   |z x   "     Y�   w       uv   }~ x   Z     <
� �YBSYVSYXSYZSY\SY^SY`SYbSYdSY	fS�   w       <uv   � x  � 	 )  �+� � :+� ,� :	+� :
+ � :+"� :+$� :+&� :+(� :+*� :+,� :+.� :+0� :-� 6� <:-� @:*BD� J� P� T:*VD� J� P� T:*XD� J� P� T:*ZD� J� P� T:*\D� J� P� T:*^D� J� P� T:*`D� J� P� T:*bD� J� P� T:*dD� J� P� T:*fD	� J� P� T:-h� l-�� p-r� vx-� zY-B� }SY-V� }SYS� �W-�� p-�� v�-� zY-B� }SYS� �W-�� p-�� v�-� zY-X� }S� �� �-�� p-�� v�-� zY�S� �� �
-�� }� �-� �Y�S�� �-� �YXS-&� }� �-� �Y(S-(� }� �-� �Y�S�� �-�� p-�� ��� �Y� �� W-Z� }�� ��~�� �� �� -�� p--� }� ��� �W-�� p-ƶ ��� �Y� �� W-\� }�� ��~�� �� �� -�� p--� }� �ƶ �W-�� p-ȶ ��� �Y� �� W-`� }�� ��~�� �� �� -�� p--� }� �ȶ �W-�� p-ʶ ��� �Y� �� W-^� }�� ��~�� �� �� -�� p--� }� �ʶ �W-�� p-̶ ��� �Y� �� W-b� }�� ��~�� �� �� -�� p--� }� �̶ �W-�� p-ζ ��� �Y� �� W-d� }�� ��~�� �� �� -�� p--� }� �ζ �W-�� p-ж ��� �Y� �� W-f� }�� ��~�� �� �� -�� p--� }� �ж �W-Ҷ l-� �� �� �:-�� p�-� }� �� �� �Y6� � ����� �� : � # �� � #:!!� �� � :"� "�:#��#-� l-�� p-�� �-�� p--$� v� zY-(� }S�� �-� l-�� p-�� �-� l� �-� l�� �-� l-�� p-� v-� zY-(� }S� �� �-� l-,� }�#:$6%6&$�( 6'-.+�,:(� �$&�0 :(� �� �-2� l-�� p-46�� �-2� l-0� �Y8S-*� }� �-2� l-0� �Y:S- � }�>@�D-.� }�>�D� �-2� l-"� zY-* �G�K�NS-0� }�Q-� l&%`6&&'��7-� l-"� }�-S� l� o�������o��������������� w  � )  �uv    ���   ��U   ���   ���   ���   ��U   � = >   � �   � � 	  � � 
  � �   � !�   � #�   � %�   � '�   � )�   � +�   � -�   � /�   � A�   � U�   � W�   � Y�   � [�   � ]�   � _�   � a�   � c�   � e�   ���   �� )   ��U    ��� !  ��� "  ��U #  ��� $  �� ) %  �� ) &  �� ) '  ��� (�  :�  vE�E�T�T�]�]�f�f�E�E�E�t�t���������t�t�t�������������������������������������������������������������������������
�+�+�+�+��8�8�7�7�7�7�7�7�7�7�J�J�P�P�J�J�J�J�7�7�l�l�l�l�u�u�k�k�k�7��������������������������������������������������������������������������������������������������������������������������+�+�1�1�+�+�+�+���M�M�M�M�V�V�L�L�L��d�d�c�c�c�c�c�c�c�c�v�v�|�|�v�v�v�v�c�c�������������������c���������������������������������������������������������������������������������������������.�.�.�.�7�7�-�-�-���E�_�_�_�_�E����������������������������������������������������"�$�$�$�$�"�"�3�5�5�5�5�3�3�C�L�L�]�]�L�L�L�L�C�C�s�s�s�s���������������������������������������������������������5�5�5�5�5�5�E�E�E�E�,�,�b�s�n�n�n�n�n�    x   #     *� 
�   w       uv   �  x  �    �ָ ܳ ޻[Y� zY]SY�SY_SYaSYcSYYSYeSY
� zY�[Y� zYgSYDSYiSYkS�nSY�[Y� zYgSYDSYiSYpS�nSY�[Y� zYgSYDSYiSYrS�nSY�[Y� zYgSYDSYiSY�S�nSY�[Y� zYgSYDSYiSY�S�nSY�[Y� zYgSYDSYiSY�S�nSY�[Y� zYgSYDSYiSY�S�nSY�[Y� zYgSYDSYiSY�S�nSY�[Y� zYgSYDSYiSY�S�nSY	�[Y� zYgSYDSYiSY�S�nSS�n�W�   w      �uv        ����  - � 
SourceFile /CFIDE/services/pdf.cfc @cfpdf2ecfc472483660$funcCONVERTARRAYOFSTRUCTTOPDFPAGEDETAILARRAY  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ARRAY  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   I  MAP ! KEY # coldfusion/runtime/CfJspPage % pageContext #Lcoldfusion/runtime/NeoPageContext; ' (	 & ) getOut ()Ljavax/servlet/jsp/JspWriter; + , javax/servlet/jsp/JspContext .
 / - parent Ljavax/servlet/jsp/tagext/Tag; 1 2	 & 3 VALUE 5 array 7 getVariable  (I)Lcoldfusion/runtime/Variable; 9 : %coldfusion/runtime/ArgumentCollection <
 = ; 3coldfusion/tagext/validation/CFTypeValidatorFactory ? ARRAY_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; A B	 @ C _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; E F
  G ROTATION I 
   			
       K _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V M N
 & O _setCurrentLineNo (I)V Q R
 & S ArrayNew (I)Ljava/util/List; U V coldfusion/runtime/CFPage X
 Y W set (Ljava/lang/Object;)V [ \ coldfusion/runtime/Variable ^
 _ ] 
       a 1 c   e _autoscalarize &(Ljava/lang/String;)Ljava/lang/Object; g h
 & i _List $(Ljava/lang/Object;)Ljava/util/List; k l coldfusion/runtime/Cast n
 o m java/util/List q size ()I s t r u bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable; w x
 & y get (I)Ljava/lang/Object; { | r } 

          	component � CFIDE.services.pdfpagedetail � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
 Y � java/lang/String � HEIGHT � _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; � �
 & � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 & � WIDTH � _arrayGetAt 8(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; � �
 & � java/lang/Object � '(Ljava/lang/String;I)Ljava/lang/Object; g �
 & � _double (Ljava/lang/Object;)D � �
 o � _Object (D)Ljava/lang/Object; � �
 o � _arraySetAt � �
 & � 
    � (convertArrayOfStructToPDFPageDetailArray � metaData Ljava/lang/Object; � �	  � CFIDE.services.pdfpagedetail[] � &coldfusion/runtime/AttributeCollection � name � access � private � 
returntype � 
Parameters � TYPE � NAME � value � ([Ljava/lang/Object;)V  �
 � � rotation � getMetadata ()Ljava/lang/Object; this BLcfpdf2ecfc472483660$funcCONVERTARRAYOFSTRUCTTOPDFPAGEDETAILARRAY; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; Lcoldfusion/runtime/Variable; t16 Ljava/util/List; t17 t18 t19 t20 LineNumberTable <clinit> 1       � �     � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � t  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   -     � �Y6SYJS�    �        � �    � �  �  � 	   �+� � :+� ,� :	+� :
+ � :+"� :+$� :-� *� 0:-� 4:*68� >� D� H:*J8� >� D� H:-L� P
- �� T-� Z� `-b� Pd� `-b� Pf� `-b� P-6� j� p:66� v 6-$+� z:� �� ~ :� `� �-�� P- �� T-��� �� `-�� P-"� �Y�S-$� �Y�S� �� �-�� P-"� �Y�S-$� �Y�S� �� �-�� P-"� �YJS-J- � j� �� �-�� P-� �Y-  � �� �� �S-"� j� �-b� P`6�� -b� P-� j�-�� P�    �   �   � � �    � � �   � � �   � � �   � � �   � � �   � � �   � 1 2   �  �   �  � 	  �  � 
  �  �   � ! �   � # �   � 5 �   � I �   � � �   � �    � �    � �    � � �  �  : N   � r � | � | � { � { � { � { � r � r � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �= �= �= �= �1 �1 �f �f �c �c �c �c �W �W �� �� �� �� �� �� �� �� �� �� �z �z �� � � �� �� �� �� �� �     �   #     *� 
�    �        � �    �   �   �     �� �Y� �Y�SY�SY�SY�SY�SY�SY�SY� �Y� �Y� �Y�SY8SY�SY�S� �SY� �Y� �Y�SY8SY�SY�S� �SS� ɳ ��    �       � � �        ����  -" 
SourceFile /CFIDE/services/pdf.cfc cfpdf2ecfc472483660$funcPROTECT  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  DESTINATION ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I NEWUSERPASSWORD K NEWOWNERPASSWORD M PERMISSIONS O ENCRYPT Q PASSWORD S         
		 U _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V W X
 $ Y _setCurrentLineNo (I)V [ \
 $ ] 	ISALLOWED _ _get &(Ljava/lang/String;)Ljava/lang/Object; a b
 $ c 	isAllowed e java/lang/Object g _autoscalarize i b
 $ j pdf l 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; n o
 $ p ISALLOWEDIP r isAllowedIP t READFILEFROMURL v readFileFromURL x set (Ljava/lang/Object;)V z { coldfusion/runtime/Variable }
 ~ | GETTEMPFILEPATH � getTempFilePath �  java/lang/String � ACTION � protect � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � ALLOWEXTRAATTRIBUTES � true � newUserPassword � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � newOwnerPassword � encrypt � password � 	
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source  permissions getMetadata ()Ljava/lang/Object; this !Lcfpdf2ecfc472483660$funcPROTECT; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf10 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     	   "     � �             
 	   !     ��              	         �              	   !     6�              	   N     0� �Y4SYHSYJSYLSYNSYPSYRSYTS�          0    	  � 	   o+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:*N6� <� B� F:*P6� <� B� F:*R6� <� B� F:*T6� <� B� F:-V� Z-�� ^-`� df-� hY-4� kSY-H� kSYmS� qW-�� ^-s� du-� hY-4� kSYmS� qW-�� ^-w� dy-� hY-J� kS� q� -�� ^-�� d�-� hY- � kS� q� 
-�� k� -� �Y�S�� �-� �YJS- � k� �-� �Y"S-"� k� �-� �Y�S�� �-�� ^-�� ��� �Y� �� W-L� k�� ��~�� �� �� -�� ^--� k� ��� �W-�� ^-�� ��� �Y� �� W-N� k�� ��~�� �� �� -�� ^--� k� ��� �W-�� ^-�� ��� �Y� �� W-R� k�� ��~�� �� �� -�� ^--� k� ��� �W-�� ^-�� ��� �Y� �� W-T� k�� ��~�� �� �� -�� ^--� k� ��� �W-�� Z-� �� �� �:-�� ^�-� k� �� �� ܙ �-޶ Z-�� ^-� d�-� hY-"� kS� q�-� Z�      �   o    o   o �   o   o   o   o �   o / 0   o    o  	  o  
  o    o !   o 3   o G   o I   o K   o M   o O   o Q   o S   o    * �  � �� �� �� �� �� ���� �� �� ����#�#�,�,����3�<�<�K�K�<�<�<�<�3�X�a�a�p�p�a�a�a�a�X�}�����}��������������������������������������������������������������������������������������������'�'�&�&�&�&�&�&�&�&�9�9�?�?�9�9�9�9�&�&�[�[�[�[�d�d�Z�Z�Z�&�r�r�q�q�q�q�q�q�q�q�����������������q�q�������������������q������������������������������������������������������������� ��"�"�"�"��K�K�Z�Z�K�K�K�K�K�    	   #     *� 
�             !  	  w    Y�� ĳ ƻ �Y� hY�SY�SY�SY�SY�SY6SY�SY� hY� �Y� hY�SY6SY�SY�S� �SY� �Y� hY�SY6SY�SY�S� �SY� �Y� hY�SY6SY�SYS� �SY� �Y� hY�SY6SY�SY�S� �SY� �Y� hY�SY6SY�SY�S� �SY� �Y� hY�SY6SY�SYS� �SY� �Y� hY�SY6SY�SY�S� �SY� �Y� hY�SY6SY�SY�S� �SS� �� �         Y        ����  - 
SourceFile /CFIDE/services/pdf.cfc 'cfpdf2ecfc472483660$funcREMOVEWATERMARK  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ATTRIBUTES  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
SOURCEPATH  DESTINATION ! coldfusion/runtime/CfJspPage # pageContext #Lcoldfusion/runtime/NeoPageContext; % &	 $ ' getOut ()Ljavax/servlet/jsp/JspWriter; ) * javax/servlet/jsp/JspContext ,
 - + parent Ljavax/servlet/jsp/tagext/Tag; / 0	 $ 1 SERVICEUSERNAME 3 string 5 getVariable  (I)Lcoldfusion/runtime/Variable; 7 8 %coldfusion/runtime/ArgumentCollection :
 ; 9 3coldfusion/tagext/validation/CFTypeValidatorFactory = STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ? @	 > A _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; C D
  E SERVICEPASSWORD G SOURCE I PAGES K PASSWORD M         
		 O _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V Q R
 $ S _setCurrentLineNo (I)V U V
 $ W 	ISALLOWED Y _get &(Ljava/lang/String;)Ljava/lang/Object; [ \
 $ ] 	isAllowed _ java/lang/Object a _autoscalarize c \
 $ d pdf f 
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object; h i
 $ j ISALLOWEDIP l isAllowedIP n READFILEFROMURL p readFileFromURL r set (Ljava/lang/Object;)V t u coldfusion/runtime/Variable w
 x v GETTEMPFILEPATH z getTempFilePath |  java/lang/String  ACTION � removewatermark � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
 $ � ALLOWEXTRAATTRIBUTES � true � pages � 	IsDefined (Ljava/lang/String;)Z � � coldfusion/runtime/CFPage �
 � � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � �   � _compare '(Ljava/lang/Object;Ljava/lang/String;)D � �
 $ � _Map #(Ljava/lang/Object;)Ljava/util/Map; � �
 � � StructDelete $(Ljava/util/Map;Ljava/lang/String;)Z � �
 � � password � 			
		 � #class$coldfusion$tagext$lang$PDFTag Ljava/lang/Class; coldfusion.tagext.lang.PDFTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 $ � coldfusion/tagext/lang/PDFTag � attributecollection � _setArguments ((Ljava/lang/String;Ljava/lang/Object;Z)V � � coldfusion/tagext/GenericTag �
 � � 	hasEndTag (Z)V � �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
 $ �  
		 � 
GETHTTPURL � 
getHttpUrl � 			
	 � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � remote � 
returntype � 
Parameters � TYPE � NAME � serviceusername � ([Ljava/lang/Object;)V  �
 � � servicepassword � source � getMetadata ()Ljava/lang/Object; this )Lcfpdf2ecfc472483660$funcREMOVEWATERMARK; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; pdf16 Lcoldfusion/tagext/lang/PDFTag; LineNumberTable <clinit> 1       � �    � �     � �  �   "     � ް    �        � �    � �  �   !     ��    �        � �      �         �    �        � �    �  �   !     6�    �        � �     �   <     � �Y4SYHSYJSYLSYNS�    �        � �     �  � 	   �+� � :+� ,� :	+� :
+ � :+"� :-� (� .:-� 2:*46� <� B� F:*H6� <� B� F:*J6� <� B� F:*L6� <� B� F:*N6� <� B� F:-P� T-B� X-Z� ^`-� bY-4� eSY-H� eSYgS� kW-C� X-m� ^o-� bY-4� eSYgS� kW-D� X-q� ^s-� bY-J� eS� k� y-E� X-{� ^}-� bY- � eS� k� y
-~� e� y-� �Y�S�� �-� �YJS- � e� �-� �Y"S-"� e� �-� �Y�S�� �-M� X-�� ��� �Y� �� W-L� e�� ��~�� �� �� -N� X--� e� ��� �W-O� X-�� ��� �Y� �� W-N� e�� ��~�� �� �� -P� X--� e� ��� �W-�� T-� �� �� �:-R� X�-� e� �� �� ҙ �-Զ T-S� X-ֶ ^�-� bY-"� eS� k�-ڶ T�    �   �   � � �    �   �	 �   �
   �   �   � �   � / 0   �    �  	  �  
  �    � !   � 3   � G   � I   � K   � M   �   : �  ; �B �B �B �B �B �B �B �B �B �B �B �C �C �C �C �C �C �C �C �C �DDDDDDDDD �DE&E&E5E5E&E&E&E&EEBGDGDGDGDGBGYHYHYHYHMHjIjIjIjI^IJJJJsJ�K�K�K�K�K�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�M�N�N�N�N�N�N�N�N�N�M�O�O�O�O�O�O�O�O�O�O�O�OOO�O�O�O�O�O�O P P P P)P)PPPP�O �AQRQRQRQR7RzSzS�S�SzSzSzSzSzS     �   #     *� 
�    �        � �      �       ��� �� �� �Y� bY�SY�SY�SY�SY�SY6SY�SY� bY� �Y� bY�SY6SY�SY�S� �SY� �Y� bY�SY6SY�SY�S� �SY� �Y� bY�SY6SY�SY�S� �SY� �Y� bY�SY6SY�SY�S� �SY� �Y� bY�SY6SY�SY�S� �SS� � ޱ    �       � � �        