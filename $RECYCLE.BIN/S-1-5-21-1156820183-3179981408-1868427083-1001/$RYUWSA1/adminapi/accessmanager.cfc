����  -� 
SourceFile !/CFIDE/adminapi/accessmanager.cfc 1cfaccessmanager2ecfc103390807$funcCHECKADMINROLES  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   ISROOT  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   
ISADMINAPI  coldfusion/runtime/CfJspPage ! pageContext #Lcoldfusion/runtime/NeoPageContext; # $	 " % getOut ()Ljavax/servlet/jsp/JspWriter; ' ( javax/servlet/jsp/JspContext *
 + ) parent Ljavax/servlet/jsp/tagext/Tag; - .	 " / get (I)Ljava/lang/Object; 1 2 %coldfusion/runtime/ArgumentCollection 4
 5 3 REQUIREDROLES 7   9 put 8(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object; ; <
 5 = getVariable  (I)Lcoldfusion/runtime/Variable; ? @
 5 A CHECKALLROLES C true E boolean G 3coldfusion/tagext/validation/CFTypeValidatorFactory I BOOL_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; K L	 J M _validateArgWithValidator �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; O P
  Q 
		
		 S _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V U V
 " W *coldfusion/runtime/TransientVariableHolder Y &(Lcoldfusion/runtime/NeoPageContext;)V  [
 Z \ 
			 ^ FCONTEXT ` _setCurrentLineNo (I)V b c
 " d GetPageContext %()Lcoldfusion/runtime/NeoPageContext; f g coldfusion/runtime/CFPage i
 j h getFusionContext l java/lang/Object n _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; p q
 " r _set '(Ljava/lang/String;Ljava/lang/Object;)V t u
 " v _get &(Ljava/lang/String;)Ljava/lang/Object; x y
 " z 
isAdminAPI | set (Ljava/lang/Object;)V ~  coldfusion/runtime/Variable �
 � � _isNull (Ljava/lang/Object;Z)Z � �
 " � _Object (Z)Ljava/lang/Object; � � coldfusion/runtime/Cast �
 � � _boolean (Ljava/lang/Object;)Z � �
 � � isFlashRemoting � 
				 � setIsAdminAPI � false � 

			
			 � SECURITY � isRootAdminUser � _autoscalarize � y
 " � arguments.requiredRoles � 	IsDefined (Ljava/lang/String;)Z � �
 j � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 � � jrun � ListContains '(Ljava/lang/String;Ljava/lang/String;)I � �
 j � � 2
 � � _compare (Ljava/lang/Object;D)D � �
 " � 
standalone � j2ee � 
enterprise � standard � windows � unix � 
		
			
			 � isAdminUser � admin � IsUserInRole � �
 j � coldfusion.adminapi � %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
 " � coldfusion/tagext/lang/ThrowTag � cfthrow � message � INVALIDUSER � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
 " � 
setMessage (Ljava/lang/String;)V � �
 � � cfadminapiSecurityError � setType � �
 � � 	errorcode � CFACCESSDENIED � setErrorcode � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
  � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z
 " 

			
			 ROLE 
				
			
 , bindPageVariable P(Ljava/lang/String;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;
 " java/util/StringTokenizer '(Ljava/lang/String;Ljava/lang/String;)V 
 	nextToken ()Ljava/lang/String;
 
					
					 Trim &(Ljava/lang/String;)Ljava/lang/String;
 j 
					! 5jrun,standalone,j2ee,enterprise,standard,windows,unix# 
						% CFLOOP' checkRequestTimeout) �
 "* hasMoreTokens ()Z,-
. ISINROLE0 
		2 unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;45 coldfusion/runtime/NeoException7
86 t0 [Ljava/lang/String; java/lang/String< ANY>:;	 @ findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)IBC
8D CFCATCHF bindH u
 ZI unbindK 
 ZL 			
			
			N 
	P checkAdminRolesR metaData Ljava/lang/Object;TU	 V &coldfusion/runtime/AttributeCollectionX nameZ access\ public^ output` hintb ^Checks whether the current user is in the required administrative roles, else throws an error.d 
Parametersf REQUIREDh Noj DEFAULTl HINTn List of required roles.p NAMEr requiredRolest ([Ljava/lang/Object;)V v
Yw TYPEy checkAllRoles{ getMetadata ()Ljava/lang/Object; this 3Lcfaccessmanager2ecfc103390807$funcCHECKADMINROLES; LocalVariableTable Code getName 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t14 ,Lcoldfusion/runtime/TransientVariableHolder; t15 throw2 !Lcoldfusion/tagext/lang/ThrowTag; t17 t18 Ljava/lang/String; t19 t20 I t21 t22 Ljava/util/StringTokenizer; throw3 t24 t25 t26 t27 t28 t29 throw4 t31 t32 #Lcoldfusion/runtime/AbortException; t33 Ljava/lang/Exception; __cfcatchThrowable0 Ljava/lang/Throwable; t35 t36 LineNumberTable !coldfusion/runtime/AbortException� java/lang/Exception� java/lang/Throwable� <clinit> 	getOutput 1       � �   :;   TU    }~ �   "     �W�   �       �   � �   "     S�   �       �   �� �         �   �       �   �� �   -     �=Y8SYDS�   �       �   �� �  �  %  d+� � :+� ,� :	+� :
+ � :-� &� ,:-� 0:� 6� 8:� >W� B:� 6� DF� >W*DH� B� N� R:-T� X� ZY-� &� ]:-_� X-a-� e--� e-� km� o� s� w-_� X- � e--a� {}� o� s� �-_� X-a� ��� �Y� �� W-!� e--a� {�� o� s� �� 2-�� X-"� e--a� {�� oY�S� sW-_� X� ;-a� ��� /-�� X-$� e--a� {�� oYFS� sW-_� X-�� X
-)� e--�� {�� o� s� �-_� X-� �Y� ��IW-+� e-�� ��� �Y� ��0W-,� e-8� �� ��� �� �� ��~�� �Y� �� (W--� e-8� �� ��� �� �� ��~�� �Y� �� (W-.� e-8� �� ��� �� �� ��~�� �Y� �� (W-/� e-8� �� ��� �� �� ��~�� �Y� �� (W-0� e-8� �� ��� �� �� ��~�� �Y� �� (W-1� e-8� �� �¸ �� �� ��~�� �Y� �� (W-2� e-8� �� �ĸ �� �� ��~�� �� �� -�� X:��-_� X-ƶ X-� �� ��� �Y� �� TW-8� e--�� {�� o� s� ��� �Y� �� W-8� e-ʶ ��� �Y� �� W-8� e-϶ ��� �� �� r-�� X-� �� �� �:-9� e��-� �� �� � �� ���-�� �� �� � ���� :�6�-_� X-� X-	:� w-� X-D� �� ��`-�� X-8� �� �::6-	+�:�Y�:��:� �-� X-	-A� e-	� �� �� � w-"� X-� �� ��� �Y� �� 6W-� �Y� �� (W-C� e$-	� �� �� �� �� ��~� �Y� �� W-D� e--	� �� ��� �� �� ^-&� X-� �� �� �:-E� e��-� �� �� � �� ���� :���-"� X-�� X(�+`6�/���-_� X�<-�� X-1�� w-�� X-8� �� �::6-	+�:�Y�:� u�:� �-"� X-K� e--K� e-	� �� �� � ͙ *-&� X-1F� w-&� X� (-"� X-�� X(�+`6�/���-�� X-1� �� ��� ]-"� X-� �� �� �:-Q� e��-� �� �� � �� ���� :� ��-�� X-_� X-3� X� b� �:  �:!!�9:""�A�E�      5           G"�J-_� X"�-3� X� !�� � F:#� #�:$�M-O� X-Y� e--a� {�� oY- � �S� sW-3� X�$-Q� X�  �������D��J������� �������D��J������� �����D�J�������� �  t %  d�    d��   d�U   d��   d��   d��   d�U   d - .   d �   d � 	  d � 
  d �   d 7�   d C�   d��   d�U   d��   d�U   d��   d��   d��   d��   d��   d��   d�U   d��   d��   d��   d��   d��   d��   d�U   d��    d�� !  d�� "  d�� #  d�U $�  ^�    B  B  ^  ^  �  �  �  �  �  �  �  �  �   �   �   �   �   �   �   �   �   � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! � ! " ", ", " " " " "> #> #> #> #> #> #Y $Y $g $g $X $X $X $X $> # � !~ )� )� )� )� )� )� )~ )~ )� *� *� *� *� +� +� +� +� +� +� +� +� +� +� ,� ,� ,� ,� ,� ,� ,� ,� ,� ,� ,� ,� ,� ,� -� -� -� - - -� -� - - -� -� -� -� -� -� -� -� -& .& .& .& ./ ./ .& .& .7 .7 .& .& .& .& .� .� .� .� .R /R /R /R /[ /[ /R /R /c /c /R /R /R /R /� /� /� /� /~ 0~ 0~ 0~ 0� 0� 0~ 0~ 0� 0� 0~ 0~ 0~ 0~ 0� 0� 0� 0� 0� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 1� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� 2� ,� ,� ,� ,� +� + 3� * 7 7 7 7 7 7 7 78 88 87 87 87 87 87 87 87 87 8^ 8^ 8] 8] 8] 8] 8] 8] 8] 8] 87 87 87 87 8w 8w 8v 8v 8v 8v 8v 8v 8v 8v 87 87 87 87 8 8 8� 9� 9� 9� 9� 9� 9� 9� 9� 9� 9� 9 7 < < < <� <� < > >% ?% ?% ?% ?s As As As As As As As Ai Ai A� B� B� B� B� B� B� B� B� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� C� D� D� D� D� D� D� D� D� D� D� D� D E E E E. E. E E� Bl ?% ?� I� I� I� I� I� I� J� J� J� J� K� K� K� K� K� K� K� K L L L L  L  L M� K7 J� JB PB PB PB PB PB Pu Qu Qu Qu Q� Q� QZ QB Pz H >� U5 Y5 YC YC Y4 Y4 Y4 Y4 Y      �   #     *� 
�   �       �   �  �       �Ӹ ٳ ��=Y?S�A�YY
� oY[SYSSY]SY_SYaSY�SYcSYeSYgSY	� oY�YY� oYiSYkSYmSY:SYoSYqSYsSYuS�xSY�YY� oYiSYkSYzSYHSYmSYFSYsSY|S�xSS�x�W�   �       ��   � �   !     ��   �       �        ����  - 
SourceFile !/CFIDE/adminapi/accessmanager.cfc /cfaccessmanager2ecfc103390807$funcCANACCESSPAGE  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ISADMINAPI  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - PAGE / string 1 getVariable  (I)Lcoldfusion/runtime/Variable; 3 4 %coldfusion/runtime/ArgumentCollection 6
 7 5 3coldfusion/tagext/validation/CFTypeValidatorFactory 9 STRING_VALIDATOR .Lcoldfusion/tagext/validation/CFTypeValidator; ; <	 : = _validateRequiredArg �(Ljava/lang/String;Ljava/lang/String;Lcoldfusion/runtime/Variable;Lcoldfusion/tagext/validation/CFTypeValidator;)Lcoldfusion/runtime/Variable; ? @
  A 
		 C _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V E F
   G *coldfusion/runtime/TransientVariableHolder I &(Lcoldfusion/runtime/NeoPageContext;)V  K
 J L 
			 N FCONTEXT P _setCurrentLineNo (I)V R S
   T GetPageContext %()Lcoldfusion/runtime/NeoPageContext; V W coldfusion/runtime/CFPage Y
 Z X getFusionContext \ java/lang/Object ^ _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; ` a
   b _set '(Ljava/lang/String;Ljava/lang/Object;)V d e
   f _get &(Ljava/lang/String;)Ljava/lang/Object; h i
   j 
isAdminAPI l set (Ljava/lang/Object;)V n o coldfusion/runtime/Variable q
 r p _isNull (Ljava/lang/Object;Z)Z t u
   v _Object (Z)Ljava/lang/Object; x y coldfusion/runtime/Cast {
 | z _boolean (Ljava/lang/Object;)Z ~ 
 | � isFlashRemoting � 
				 � setIsAdminAPI � false � true � 

			
			 � SECURITY � canAccessPage � _autoscalarize � i
   � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � ANY � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � CFCATCH � bind � e
 J � unbind � 
 J � 			
			
			 � 
	 � metaData Ljava/lang/Object; � �	  � boolean � &coldfusion/runtime/AttributeCollection � name � access � public � output � 
returntype � hint � GIndicates whether or not the current user can access the specified page � 
Parameters � REQUIRED � TYPE � NAME � page � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 1Lcfaccessmanager2ecfc103390807$funcCANACCESSPAGE; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getReturnType getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t12 ,Lcoldfusion/runtime/TransientVariableHolder; t13 t14 #Lcoldfusion/runtime/AbortException; t15 Ljava/lang/Exception; __cfcatchThrowable2 Ljava/lang/Throwable; t17 t18 LineNumberTable !coldfusion/runtime/AbortException � java/lang/Exception � java/lang/Throwable  <clinit> 	getOutput 1       � �    � �   	  � �  �   "     � ��    �        � �    � �  �   !     ��    �        � �    � �  �         �    �        � �    � �  �   !     ��    �        � �    � �  �   (     
� �Y0S�    �       
 � �    � �  �  f    +� � :+� ,� :	+� :
-� $� *:-� .:*02� 8� >� B:-D� H� JY-� $� M:-O� H-Q-x� U--x� U-� []� _� c� g-O� H
-y� U--Q� km� _� c� s-O� H-Q� w�� }Y� �� W-z� U--Q� k�� _� c� �� 2-�� H-{� U--Q� k�� _Y�S� cW-O� H� ;-Q� w�� /-�� H-}� U--Q� k�� _Y�S� cW-O� H-�� H- �� U--�� k�� _Y-0� �S� c:� l�-D� H� ^� �:�:� �:� �� ��    1           �� �-O� H�-D� H� �� � E:� �:� �-�� H- �� U--Q� k�� _Y-� �S� cW-D� H�-�� H�  Th| �ny| � Th� �ny� � Th�ny�|�����  �   �    � �     � �    � �    � �    � �    � �    � �    + ,     �     � 	    � 
   / �    � �    � �    � �    � �    � �    � �    � �  �  6 M   u l x l x e x e x e x e x \ x \ x � y � y � y � y � y � y � y � y � y � z � z � z � z � z � z � z � z � z � z � z � z � z � z � z � z � { � { � { � { � { � { � { � { | | | | | |! }! }/ }/ }  }  }  }  } | � zN �N �\ �\ �M �M �M �M �M �� �� �� �� �� �� �� �� �� � G w     �   #     *� 
�    �        � �      �   �     �� �Y�S� �� �Y� _Y�SY�SY�SY�SY�SY�SY�SY�SY�SY	�SY
�SY� _Y� �Y� _Y�SY�SY�SY2SY�SY�S� �SS� ճ ��    �       � � �    �  �   !     ��    �        � �        ����  - 
SourceFile !/CFIDE/adminapi/accessmanager.cfc 4cfaccessmanager2ecfc103390807$funcCHECKROOTADMINUSER  coldfusion/runtime/UDFMethod  <init> ()V  
  	 coldfusion/util/Key  	ARGUMENTS Lcoldfusion/util/Key;  	   bindInternal F(Lcoldfusion/util/Key;Ljava/lang/Object;)Lcoldfusion/runtime/Variable;   coldfusion/runtime/LocalScope 
   THIS  	   
ISADMINAPI  1(Ljava/lang/String;)Lcoldfusion/runtime/Variable;  
   coldfusion/runtime/CfJspPage  pageContext #Lcoldfusion/runtime/NeoPageContext; ! "	   # getOut ()Ljavax/servlet/jsp/JspWriter; % & javax/servlet/jsp/JspContext (
 ) ' parent Ljavax/servlet/jsp/tagext/Tag; + ,	   - 
		 / _whitespace %(Ljava/io/Writer;Ljava/lang/String;)V 1 2
   3 *coldfusion/runtime/TransientVariableHolder 5 &(Lcoldfusion/runtime/NeoPageContext;)V  7
 6 8 
			 : FCONTEXT < _setCurrentLineNo (I)V > ?
   @ GetPageContext %()Lcoldfusion/runtime/NeoPageContext; B C coldfusion/runtime/CFPage E
 F D getFusionContext H java/lang/Object J _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; L M
   N _set '(Ljava/lang/String;Ljava/lang/Object;)V P Q
   R _get &(Ljava/lang/String;)Ljava/lang/Object; T U
   V 
isAdminAPI X set (Ljava/lang/Object;)V Z [ coldfusion/runtime/Variable ]
 ^ \ _isNull (Ljava/lang/Object;Z)Z ` a
   b _Object (Z)Ljava/lang/Object; d e coldfusion/runtime/Cast g
 h f _boolean (Ljava/lang/Object;)Z j k
 h l isFlashRemoting n 
				 p setIsAdminAPI r false t true v 

			 x SECURITY z isRootAdminUser | %class$coldfusion$tagext$lang$ThrowTag Ljava/lang/Class; coldfusion.tagext.lang.ThrowTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � ~ 	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
   � coldfusion/tagext/lang/ThrowTag � cfthrow � message � INVALIDUSER � _autoscalarize � U
   � _String &(Ljava/lang/Object;)Ljava/lang/String; � �
 h � _validateTagAttrValue \(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; � �
   � 
setMessage (Ljava/lang/String;)V � �
 � � cfadminapiSecurityError � setType � �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
   � unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable; � � coldfusion/runtime/NeoException �
 � � t0 [Ljava/lang/String; java/lang/String � ANY � � �	  � findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)I � �
 � � CFCATCH � bind � Q
 6 � unbind � 
 6 � 			
			
			 � 
	 � checkRootAdminUser � metaData Ljava/lang/Object; � �	  � &coldfusion/runtime/AttributeCollection � name � access � public � output � hint � MChecks whether the current user is the root admin user, else throws an error. � 
Parameters � ([Ljava/lang/Object;)V  �
 � � getMetadata ()Ljava/lang/Object; this 6Lcfaccessmanager2ecfc103390807$funcCHECKROOTADMINUSER; LocalVariableTable Code getName ()Ljava/lang/String; 	getAccess ()I getParamList ()[Ljava/lang/String; runFunction �(Lcoldfusion/runtime/LocalScope;Ljava/lang/Object;Lcoldfusion/runtime/CFPage;Lcoldfusion/runtime/ArgumentCollection;)Ljava/lang/Object; __localScope Lcoldfusion/runtime/LocalScope; instance 
parentPage Lcoldfusion/runtime/CFPage; __arguments 'Lcoldfusion/runtime/ArgumentCollection; out Ljavax/servlet/jsp/JspWriter; value Lcoldfusion/runtime/Variable; t11 ,Lcoldfusion/runtime/TransientVariableHolder; throw5 !Lcoldfusion/tagext/lang/ThrowTag; t13 t14 #Lcoldfusion/runtime/AbortException; t15 Ljava/lang/Exception; __cfcatchThrowable1 Ljava/lang/Throwable; t17 t18 LineNumberTable !coldfusion/runtime/AbortException java/lang/Exception java/lang/Throwable <clinit> 	getOutput 1       ~     � �    � �     � �  �   "     � װ    �        � �    � �  �   !     Ӱ    �        � �    � �  �         �    �        � �    � �  �   #     � ��    �        � �    � �  �  �    S+� � :+� ,� :	+� :
-� $� *:-� .:-0� 4� 6Y-� $� 9:-;� 4-=-`� A--`� A-� GI� K� O� S-;� 4
-a� A--=� WY� K� O� _-;� 4-=� c�� iY� m� W-b� A--=� Wo� K� O� m� 2-q� 4-c� A--=� Ws� KYuS� OW-;� 4� ;-=� c�� /-q� 4-e� A--=� Ws� KYwS� OW-;� 4-y� 4-h� A--{� W}� K� O� m�� \-q� 4-� �� �� �:-i� A��-�� �� �� �� ��� �� �� �� :� t�-;� 4-0� 4� ^� �:�:� �:� �� Ū    1           �� �-;� 4�-0� 4� �� � D:� �:� �-϶ 4-p� A--=� Ws� KY-� �S� OW-0� 4�-Ѷ 4�  A����� A����� A����  �   �   S � �    S � �   S � �   S � �   S � �   S    S �   S + ,   S    S  	  S  
  S   S   S �   S	
   S   S   S   S �   R T   ^ Y ` Y ` R ` R ` R ` R ` I ` I ` q a z a z a y a y a y a y a q a q a � b � b � b � b � b � b � b � b � b � b � b � b � b � b � b � b � c � c � c � c � c � c � c � c � d � d � d � d � d � d e e e e e e e e � d � b: h: h9 h9 h9 h9 h9 h9 ht it it it i� i� iY i9 h� l& p& p4 p4 p% p% p% p% p 4 _     �   #     *� 
�    �        � �      �   z     \�� �� �� �Y�S� �� �Y
� KY�SY�SY�SY�SY�SYuSY�SY�SY�SY	� KS� � ױ    �       \ � �    �  �   !     u�    �        � �        ����  -B 
SourceFile !/CFIDE/adminapi/accessmanager.cfc cfaccessmanager2ecfc103390807  coldfusion/runtime/CFComponent  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   CFACCESSDENIED Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   REQUEST   	   SECURITY   	    FACTORY " " 	  $ com.macromedia.SourceModTime  [�;�[ pageContext #Lcoldfusion/runtime/NeoPageContext; ) *	  + getOut ()Ljavax/servlet/jsp/JspWriter; - . javax/servlet/jsp/JspContext 0
 1 / parent Ljavax/servlet/jsp/tagext/Tag; 3 4	  5 Cp1252 7 setPageEncoding (Ljava/lang/String;)V 9 : !coldfusion/runtime/NeoPageContext <
 = ; set (Ljava/lang/Object;)V ? @ coldfusion/runtime/Variable B
 C A LOCALE E REQUEST.LOCALE G _setCurrentLineNo (I)V I J
  K java M java.util.Locale O CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; Q R coldfusion/runtime/CFPage T
 U S 
getDefault W java/lang/Object Y _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object; [ \
  ] getLanguage _ checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V a b
  c  coldfusion.server.ServiceFactory e _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; g h
  i getSecurityService k 	VARIABLES m java/lang/String o 
LOCALEFILE q java/lang/StringBuffer s resources/adminapi_ u  :
 t w _resolveAndAutoscalarize 9(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object; y z
  { _String &(Ljava/lang/Object;)Ljava/lang/String; } ~ coldfusion/runtime/Cast �
 �  append ,(Ljava/lang/String;)Ljava/lang/StringBuffer; � �
 t � .cfm � toString ()Ljava/lang/String; � �
 Z � _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V � �
  � (class$coldfusion$tagext$lang$ImportedTag Ljava/lang/Class; "coldfusion.tagext.lang.ImportedTag � forName %(Ljava/lang/String;)Ljava/lang/Class; � � java/lang/Class �
 � � � �	  � _initTag P(Ljava/lang/Class;ILjavax/servlet/jsp/tagext/Tag;)Ljavax/servlet/jsp/tagext/Tag; � �
  � "coldfusion/tagext/lang/ImportedTag � l10n � /CFIDE/adminapi/customtags � admin � setName :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V � �
 � � &coldfusion/runtime/AttributeCollection � id � invalidUser � var � file � ([Ljava/lang/Object;)V  �
 � � setAttributecollection (Ljava/util/Map;)V � �  coldfusion/tagext/lang/ModuleTag �
 � � 	hasEndTag (Z)V � � coldfusion/tagext/GenericTag �
 � � 
doStartTag ()I � �
 � � 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � 9The current user is not authorized to invoke this method. � write � : java/io/Writer �
 � � doAfterBody � �
 � � _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter; � �
  � doEndTag � � #javax/servlet/jsp/tagext/TagSupport �
 � � doCatch (Ljava/lang/Throwable;)V � �
 � � 	doFinally � 
 � � canAccessPage Lcoldfusion/runtime/UDFMethod; /cfaccessmanager2ecfc103390807$funcCANACCESSPAGE �
 � 	 � �	  � CANACCESSPAGE � registerUDF 3(Ljava/lang/String;Lcoldfusion/runtime/UDFMethod;)V � �
  � checkAdminRoles 1cfaccessmanager2ecfc103390807$funcCHECKADMINROLES �
 � 	 � �	  � CHECKADMINROLES � checkRootAdminUser 4cfaccessmanager2ecfc103390807$funcCHECKROOTADMINUSER �
 � 	 � �	  CHECKROOTADMINUSER metaData Ljava/lang/Object;	  _implicitMethods Ljava/util/Map;	
	  name accessmanager displayname Access Manager hint kProvides functions to check  whether the current user has the access rights required for invoking functions Name 	Functions	 �	 �	 � getMetadata ()Ljava/lang/Object; this Lcfaccessmanager2ecfc103390807; LocalVariableTable Code _setImplicitMethods implicitMethods varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; registerUDFs runPage out Ljavax/servlet/jsp/JspWriter; value module1 $Lcoldfusion/tagext/lang/ImportedTag; mode1 I t6 Ljava/lang/Throwable; t7 t8 t9 t10 t11 LineNumberTable java/lang/Throwable= _getImplicitMethods ()Ljava/util/Map; <clinit> 1     
                 "     � �    � �    � �    � �      
	
     ! %   "     ��   $       "#   & � %   -     +��   $       "#     '
     %   i     7*+,� **+,� � **+,� � **+,� � !**#+,� � %�   $        7"#     7()    7*+  ,  %   ;     *� � �*�� �� �*�� ��   $       "#   -! %  [    �*� ,� 2L*� 6N*� ,8� >*� � D**� FH*� L**� L**� L*NP� VX� Z� ^`� Z� ^� d*� %*� L*Nf� V� D*� !*� L***� %� jl� Z� ^� D*n� pYrS� tYv� x*� pYFS� |� �� ��� �� �� �*� �-� �� �:*� L���� �� �Y� ZY�SY�SY�SY�SY�SY*n� pYrS� |S� �� �� �� �Y6� 5*+� �L+϶ �� ך��� � :� �:*+� �L�� �� :� #�� � #:		� � � :
� 
�:� �� /JM>MRM>$my>svy>$m�>sv�>y��>���> $   z   �"#    �./   �0   � 3 4   �12   �34   �56   �7   �8   �96 	  �:6 
  �; <   � ;  
  
  
  
  
  
   =  =  ?  ?  <  <  5  5  .  .  .  .  d  d  f  f  c  c  c  c  Y  y  y  x  x  x  x  n  �  �  �  �  �  �  �  �  �  �  �  �  �  Y  �  �  �  �      �       %   #     *� 
�   $       "#   ?@ %   "     ��   $       "#   A  %   � 	    ��� �� �� �Y� � � �Y� �� �� �Y� �� �Y
� ZYSYSYSYSYSYSYSYSYSY	� ZY�SY�SY�SS� ���   $       �"#  <     q u q u w  w  } ^ } ^       &    '