����  -� 
SourceFile 1/CFIDE/administrator/security/cfadminpassword.cfm  cfcfadminpassword2ecfm1453039139  coldfusion/runtime/CFPage  <init> ()V  
  	 bindPageVariables D(Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)V   coldfusion/runtime/CfJspPage 
   PASSWORD_OLDPASSWORD_ERROR Lcoldfusion/runtime/Variable;  bindPageVariable r(Ljava/lang/String;Lcoldfusion/runtime/VariableScope;Lcoldfusion/runtime/LocalScope;)Lcoldfusion/runtime/Variable;  
    	   RUNTIME   	   ISALLOWCONCLOGIN   	    CHECKCSRFTOKEN " " 	  $ ALLOWCONCLOGIN & & 	  ( ERR_SEEDLENGTH * * 	  , ISADMINROLESAVAILABLE . . 	  0 ADMIN 2 2 	  4 CFCATCH 6 6 	  8 ERROR_ALLOWCONCLOGIN : : 	  < FACTORY > > 	  @ GETCSRFTOKEN B B 	  D TOKEN F F 	  H PASSWORD_CONFIRM_ERROR J J 	  L ERROR_TOGGLE N N 	  P FORM R R 	  T 	SCRIPTSRC V V 	  X ERROR_SET_SEED Z Z 	  \  ERROR_TOGGLE_SINGLEADMINPASSWORD ^ ^ 	  ` AERRORMESSAGES b b 	  d PASSWORD_EMPTY_ERROR f f 	  h 	LOGACTION j j 	  l REQUEST n n 	  p SECURITYCFC r r 	  t 	LOGINUSER v v 	  x 	VARIABLES z z 	  | BERRORSEXIST ~ ~ 	  � RESULT � � 	  � com.macromedia.SourceModTime  [�;�� pageContext #Lcoldfusion/runtime/NeoPageContext; � �	  � getOut ()Ljavax/servlet/jsp/JspWriter; � � javax/servlet/jsp/JspContext �
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
  � concat &(Ljava/lang/String;)Ljava/lang/String; � �
 � � setName � �
 � � 	hasEndTag � � coldfusion/tagext/GenericTag �
 � � _emptyTcfTag !(Ljavax/servlet/jsp/tagext/Tag;)Z � �
  � java �  coldfusion.server.ServiceFactory � CreateObject 8(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object; � �
  � set � � coldfusion/runtime/Variable �
 � � _get 1(Lcoldfusion/runtime/Variable;)Ljava/lang/Object; � 
  getRuntimeService java/lang/Object _invoke K(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
 	 getCFFormScriptSrc 


<script src=" write � java/io/Writer
 $class$coldfusion$tagext$io$OutputTag coldfusion.tagext.io.OutputTag �	  coldfusion/tagext/io/OutputTag 
doStartTag ()I
 _autoscalarize 
   doAfterBody"
# doEndTag% coldfusion/tagext/QueryLoop'
(& doCatch (Ljava/lang/Throwable;)V*+
(, 	doFinally. 
/ v/ajax/jquery/jquery.js" type="text/javascript"></script>
<script src="../sha1.js" type="text/javascript" ></script>
1 'class$coldfusion$tagext$lang$IncludeTag !coldfusion.tagext.lang.IncludeTag43 �	 6 !coldfusion/tagext/lang/IncludeTag8 pstrength.cfm: setTemplate< �
9= 
? _whitespace %(Ljava/io/Writer;Ljava/lang/String;)VAB
 C ../auditlog.cfmE f

<script type="text/javascript">
$(function() {
$('.password').pstrength();
});
</script>


G SECURITYI _resolveK �
 L isAdminSecurityEnabledN _boolean (Ljava/lang/Object;)ZPQ
 �R isAdminUserIdRequiredT isRootAdminUserV NOTROOTADMINX trueZ _structSetAt :(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)V\]
 ^ 	cfinclude` templateb GetContextRootd �
 e "/CFIDE/administrator/forbidden.cfmg %class$coldfusion$tagext$lang$AbortTag coldfusion.tagext.lang.AbortTagji �	 l coldfusion/tagext/lang/AbortTagn (class$coldfusion$tagext$lang$ImportedTag "coldfusion.tagext.lang.ImportedTagqp �	 s "coldfusion/tagext/lang/ImportedTagu l10nw 
../cftags/y admin{ :(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V �}
v~ &coldfusion/runtime/AttributeCollection� id� err_seedLength� var� ([Ljava/lang/Object;)V �
�� setAttributecollection (Ljava/util/Map;)V��  coldfusion/tagext/lang/ModuleTag�
��
� 	_pushBody _(Ljavax/servlet/jsp/tagext/BodyTag;ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � !Seed must be minimum 8 characters�
�# _popBody =(ILjavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;��
 � #javax/servlet/jsp/tagext/TagSupport�
�&
�,
�/ password_oldpassword_error� Old password is incorrect� LOCALE� REQUEST.LOCALE� en� checkSimpleParameter V(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V��
 � 
LOCALEFILE� java/lang/StringBuffer� resources/security_�  �
�� append ,(Ljava/lang/String;)Ljava/lang/StringBuffer;��
�� .cfm� toString� �
�.



<SCRIPT TYPE="text/javascript">
<!--
// Check whether seed entered is mimimum 8 characters

function validateSeed()
{
	var seedField = document.security.seed;
	var seedval = seedField.value.replace(/^\s+|\s+$/g,"")
	var length = seedval.length;

	if (length > 0 && length <8 )
	{
		� alert('� ');�S
		seedField.focus();
		seedField.select();
		return false;
	}
	else
    {
        transformPasswordFields();
		return true;
    }
}

function transformPasswordFields()
{
    var pwdFields = [document.security.cfadmin_oldpassword, document.security.cfadmin_Newpassword, document.security.cfadmin_NewpasswordConfirm];
    for(var i=0; i < pwdFields.length; i++)
    {
        var value = pwdFields[i].value.replace(/^\s+|\s+$/gm,'');
        var length = value.length;
        if(length > 0)
            pwdFields[i].value = hex_sha1(value);
    }
}
// -->
</SCRIPT>


� false� 2(Lcoldfusion/runtime/Variable;Ljava/lang/Object;)V��
 � ArrayNew (I)Ljava/util/List;��
 � _Array 2(Ljava/lang/Object;)Lcoldfusion/runtime/FastArray;��
 �� setArray !(Lcoldfusion/runtime/FastArray;)V��
 �� password_confirm_error� \Your password could not be changed because the new and confirmation passwords did not match.� password_oldpassword_error1� ?Password could not be changed as the old password is incorrect.� password_empty_error� Password can not be blank.� 	component� CFIDE.adminapi.security� ADMINSUBMIT� FORM.ADMINSUBMIT�  isDefinedCanonicalVariableAndKey D(Lcoldfusion/runtime/Variable;Ljava/lang/String;Ljava/lang/String;)Z��
 � _Object (Z)Ljava/lang/Object;��
 �� REQUEST.SECURITY�  � 	CSRFTOKEN� FORM.CSRFTOKEN� checkCSRFToken� SECTABKEYNAME  
_invokeUDF f(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;[Ljava/lang/Object;)Ljava/lang/Object;
  CFADMIN_OLDPASSWORD Trim �
 	 CFADMIN_NEWPASSWORD CFADMIN_NEWPASSWORDCONFIRM Len (Ljava/lang/Object;)I
  (I)Ljava/lang/Object;�
 � _compare (Ljava/lang/Object;D)D
  _List $(Ljava/lang/Object;)Ljava/util/List;
 � ArrayAppend %(Ljava/util/List;Ljava/lang/Object;)Z
   FORM.CFADMIN_NEWPASSWORD" FORM.CFADMIN_NEWPASSWORDCONFIRM$ checkAdminPassword& Compare '(Ljava/lang/String;Ljava/lang/String;)I()
 * setAdminPassword, BRESETCOOKIE. _factor0 O(Ljavax/servlet/jsp/tagext/Tag;Ljavax/servlet/jsp/JspWriter;)Ljava/lang/Object;01
 2 VARIABLES.BRESETCOOKIE4 isAllowConcurrentAdminLogin6 *class$coldfusion$tagext$security$LogoutTag $coldfusion.tagext.security.LogoutTag98 �	 ; $coldfusion/tagext/security/LogoutTag= current? 
setSessionA �
>B allD 	loginuserF %coldfusion/runtime/ArgumentCollectionH adminPasswordJ )([Ljava/lang/Object;[Ljava/lang/Object;)V L
IM b(Ljava/lang/Object;Ljava/lang/String;Lcoldfusion/runtime/CFPage;Ljava/util/Map;)Ljava/lang/Object;O
 P *coldfusion/runtime/TransientVariableHolderR &(Lcoldfusion/runtime/NeoPageContext;)V T
SU SEEDW 	FORM.SEEDY '(Ljava/lang/Object;Ljava/lang/String;)D[
 \ setSeed^ 	logaction` "has set the ColdFusion server seedb unwrap ,(Ljava/lang/Throwable;)Ljava/lang/Throwable;de coldfusion/runtime/NeoExceptiong
hf t28 [Ljava/lang/String; Anyljk	 n findThrowableTarget +(Ljava/lang/Throwable;[Ljava/lang/String;)Ipq
hr bind '(Ljava/lang/String;Ljava/lang/Object;)Vtu
Sv 
					x error_set_seedz 
						There was an error while updating passwords with new seed.<br/>
						Please check logs for more details.</br>
						| MESSAGE~ D(Lcoldfusion/runtime/Variable;[Ljava/lang/String;)Ljava/lang/Object; ��
 � EncodeForHTML� �
 � <br/>
						� DETAIL� 
				� 

				� unbind� 
S� _factor1�1
 � FORM.ALLOWCONCLOGIN� SECURITYAPI� setAllowConcurrentAdminLogin� Nhas updated concurrent login sessions configuration for Administrator console.� t29�k	 � error_allowconclogin� �
						There was an error while updating concurrent login sessions flag.<br/>
						Please check logs for more details.</br>
						� 	ADMINAUTH� FORM.ADMINAUTH� none� setAdminSecurityEnabled� t30�k	 � error_toggle� G
						Unable to set Administrator authentication switch.<br/>
						� _factor2�1
 � username� setLoginUserIdRequired� t31�k	 �  error_toggle_singleadminpassword� E
						Unable to set Administrator authentication type.<br/>
						� #class$coldfusion$tagext$lang$LogTag coldfusion.tagext.lang.LogTag�� �	 � coldfusion/tagext/lang/LogTag� audit� setFile� �
�� setApplication� �
�� cflog� text� User � ] has set Administrator authentication type to: Separate user name and password authentication� setText� �
�� H has set Administrator authentication type to: No authentication needed � password� J has set Administrator authentication type to: Use a single password only � _factor3�1
 � adminpasswordpagename� pagename� !ColdFusion Administrator password� ../header.cfm� )class$coldfusion$tagext$html$form$FormTag #coldfusion.tagext.html.form.FormTag�� �	 � #coldfusion/tagext/html/form/FormTag� security�
� � cfform� action� 	setAction� �
�� POST� 	setMethod� �
�� return validateSeed() setOnSubmit �
�
� ../include/buttonbar.cfm ../include/margintop.cfm	 ../include/errors.cfm \
	<script language="javaScript">
	top.frame_nav.document.location.reload();
	</script>
	 

 1

<input type="hidden" name="csrftoken" value=" getCSRFToken ">

<h2 class="pageHeader"> pageHeader_adminpassword 
Security &gt; Administrator 4
</h2>
<br>

<label for="cfadmin_password">
<b> cfadmin_password (ColdFusion Administration Authentication </b><br/>
</label>
	! cfadmin_password_explanation#�
		You should restrict access to the ColdFusion Administrator to trusted
		users. By default the ColdFusion Administrator requires authentication to access
		these pages. However, if you configure your web server to restrict access to
		these pages, you can disable this authentication and
		rely on your web server's security instead. (Consult your web server
		documentation for details on securing pages.)
	% 
<br/>
<br/>
' cfadmin_username_explanation) 7
		Select the type of Administrator authentication:
	+ �<br/>
<table width="100%">
<tr width="100%"><td>&nbsp;&nbsp;&nbsp;</td><td colspan="2">
<input name="AdminAuth" type="RADIO" value="password"
- 
	checked
/ 0
>
<b>
<label for="cfadmin_singlepassword">
1 cfadmin_singlepassword3 $Use a single password only (default)5 _factor471
 8 </label>
</b>
</td></tr>

: IsAdminRolesAvailable< z
	<tr width="100%"><td>&nbsp;&nbsp;&nbsp;</td><td colspan="2">
	<input name="AdminAuth" type="RADIO" value="username"
	> 
		checked
	@ /
	>
	<b>
	<label for="cfadmin_usernames">
	B cfadmin_usernamesD FSeparate user name and password authentication (allows multiple users)F </label>
	</b>
	</td></tr>
H �

<tr width="100%"><td>&nbsp;&nbsp;&nbsp;</td><td colspan="2">
<input name="AdminAuth" type="RADIO" value="none" id="cfadmin_password"
	J 2
>
<b>
<label for="cfadmin_securitydisabled">
L cfadmin_securitydisabledN *No authentication needed (not recommended)P �</label>
</b>
</td></tr>

</table>

<br/> <br/>

<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#R 	GRAYLIGHTT &" class="cellBlueTopAndBottom">
		<b>V errorheaderX Root Administrator PasswordZ &</b>
	</td>
</tr>
</table>

<p>
\ cfadmin_changePassword^ �
To change the ColdFusion Administrator password for the root administrative user,
enter old password, new password and then confirm
` _factor5b1
 c v
</p>
<table border="0" cellpadding="5" cellspacing="0">
<tr><td valign="top">
<label for="cfadmin_oldpassword">
e cfadmin_oldpasswordg Old Passwordi �</label></td><td>
<input name="cfadmin_oldpassword" id="cfadmin_oldpassword" type="password" size=15 maxlength="50" onFocus="select()" value="" autocomplete="off" style="width:99%">
</td></tr>
<tr><td valign="top">
<label for="cfadmin_Newpassword">
k cfadmin_Newpasswordm New Passwordo</label></td><td>
<input name="cfadmin_Newpassword" id="cfadmin_Newpassword" type="password" size=15 class="password" maxlength="50" onFocus="select()" value="" autocomplete="off" style="width:99%">
</td></tr>
<tr><td valign="top">
<label for="cfadmin_NewpasswordConfirm">
q cfadmin_NewpasswordConfirms Confirm Passwordu �</label></td><td>
<input name="cfadmin_NewpasswordConfirm" id="cfadmin_NewpasswordConfirm" type="PASSWORD" size=15 maxlength="50" onFocus="select()" value="" autocomplete="off" style="width:99%">
<br>
w cfadmin_passwordlengthy (50-character limit.){ 
</td></tr>
</table>
<br/><br/>
<p>
<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#} 
seedHeader Password Seed� _factor6�1
 � cfadmin_changeSeed� @
To specify a new seed value to encrypt data source passwords
� !
</p>

<label for="newSeed">
� newSeed� New Seed� r</label>
<input name="seed" id="seed" type="text" size="50" maxlength="500" onFocus="select()" value=""> &nbsp;
� cfadmin_seedlength� .(8-character minimum and 500-character limit.)� j

<br/><br/>


<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tr>
	<td bgcolor="#� concurrentloginheader� Concurrent Login Session� �</b>
	</td>
</tr>
</table>

<p>
		<input name="allowconclogin" type="CHECKBOX" class="text" value="true" id="allowconclogin" � checked� !>
		<label for="allowconclogin">� allowconcloginLabel� @<b>Allow concurrent login sessions for Administrator Console</b>� _factor7�1
 � "</label><br>
</p>
<br/><br/>

� _factor8�1
 � ../include/marginbottom.cfm� ../footer.cfm�
�#
�&
�,
�/ _factor9�1
 � metaData Ljava/lang/Object;��	 � getMetadata ()Ljava/lang/Object; this "Lcfcfadminpassword2ecfm1453039139; LocalVariableTable Code varscope "Lcoldfusion/runtime/VariableScope; locscope Lcoldfusion/runtime/LocalScope; __factorParent out Ljavax/servlet/jsp/JspWriter; 	include29 #Lcoldfusion/tagext/lang/IncludeTag; 	include30 	include31 output32  Lcoldfusion/tagext/io/OutputTag; mode32 I t9 t10 Ljava/lang/Throwable; t11 t12 output52 mode52 t15 t16 t17 t18 t19 t20 t21 t22 LineNumberTable java/lang/Throwable� cookie0 !Lcoldfusion/tagext/net/CookieTag; output1 mode1 t7 t8 include2 include3 include4 abort5 !Lcoldfusion/tagext/lang/AbortTag; module6 $Lcoldfusion/tagext/lang/ImportedTag; mode6 module7 mode7 t25 t26 t27 output9 mode9 t33 t34 t35 t36 module11 mode11 t39 t40 t41 t42 t43 t44 module12 mode12 t47 t48 t49 t50 t51 t52 module13 mode13 t55 t56 t57 t58 t59 t60 module27 mode27 t63 t64 t65 t66 t67 t68 	include28 form56 %Lcoldfusion/tagext/html/form/FormTag; mode56 t72 	include53 t74 	include54 t76 	include55 t78 t79 t80 t81 t82 t83 t84 module42 mode42 t6 module43 mode43 t14 module44 mode44 t23 t24 module45 mode45 t32 module46 mode46 t38 module47 mode47 module48 mode48 module49 mode49 module50 mode50 module51 mode51 logout14 &Lcoldfusion/tagext/security/LogoutTag; logout15 ,Lcoldfusion/runtime/TransientVariableHolder; #Lcoldfusion/runtime/AbortException; Ljava/lang/Exception; __cfcatchThrowable0 output17 mode17 module16 mode16 !coldfusion/runtime/AbortExceptionS java/lang/ExceptionU runPage module33 mode33 module34 mode34 module35 mode35 module36 mode36 module37 mode37 module38 mode38 module39 mode39 module40 mode40 module41 mode41 t4 t5 __cfcatchThrowable1 output19 mode19 module18 mode18 t13 __cfcatchThrowable2 output21 mode21 module20 mode20 t37 <clinit> __cfcatchThrowable3 output23 mode23 module22 mode22 log24 Lcoldfusion/tagext/lang/LogTag; log25 log26 1     )                 "     &     *     .     2     6     :     >     B     F     J     N     R     V     Z     ^     b     f     j     n     r     v     z     ~     �     � �    �   3 �   i �   p �   8 �   jk   �k   �k   �k   � �   � �   ��    �� �   "     ���   �       ��      �  �    W*+,� **+,� � **+,� � **+,� � !**#+,� � %**'+,� � )**++,� � -**/+,� � 1**3+,� � 5**7+,� � 9**;+,� � =**?+,� � A**C+,� � E**G+,� � I**K+,� � M**O+,� � Q**S+,� � U**W+,� � Y**[+,� � ]**_+,� � a**c+,� � e**g+,� � i**k+,� � m**o+,� � q**s+,� � u**w+,� � y**{+,� � }**+,� � �**�+,� � ��   �       W��    W��   W��     �   #     *� 
�   �       ��   �1 �  2    �*�7+� ��9:*� ��>� �� � �*�7+� ��9:*� �
�>� �� � �*�7+� ��9:*� ��>� �� � �**� U�����Y�S� W**� qJ�����S� y*� +� ��:*$� �� ��Y6� ,��$����)� :	� #	�� � #:

�-� � :� �:�0�*,�D*,�D*�4+� ��:*,� �� ��Y6� b*,�9� :� ��*,�d� :� l�*,��� :� X�*,��� :� D�,���$����)� :� #�� � #:�-� � :� �:�0�*�  � ��� � �����Tm��s�������������������Tm��s��������������������������� �   �   ���    �� �   ���   � ��   ���   ���   ���   ���   ���   ��� 	  ��� 
  ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ���   ��� �   � &     F F . t t \ �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �! �$ �!8, �1 �  � 
 U  
�*� �+� �� �:*� ��� ���*�� �Y�S� ȸ �� Ҷ �� ����*� �*� � �� Ҷ �� �� � �*� A*� �*��� �� �*� *	� �***� A���
� �*� Y*
� �***� ���
� �,�*�+� ��:*� �� ��Y6� ,**� Y�!� ζ�$����)� :� #�� � #:�-� � :	� 	�:
�0�
,2�*�7+� ��9:*� �;�>� �� � �*,@�D*�7+� ��9:*� �F�>� �� � �,H�*� �**o� �YJS�MO��
Y�S� %W*� �**o� �YJS�MU��
�S� �*� �**o� �YJS�MW��
�S�� }*o� �YYS[�_*�7+� ��9:*� �ac*� �*�fh� �� Ҷ>� �� � �*�m+� ��o:*� �� �� � �*�t+� ��v:*!� �xz|���Y�Y�SY�SY�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���*�t+� ��v:*"� �xz|���Y�Y�SY�SY�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���**� q�����*o� �Y�S��Y���*o� �Y�S� ȸ ζ�������_,¶*�	+� ��:*>� �� ��Y6 � (,Ķ,**� -�!� ζ,ƶ�$����)� :!� #!�� � #:""�-� � :#� #�:$�0�$,ȶ**� �ʶ�*,@�D*� e*Z� �*�Ѹն�*�t+� ��v:%*\� �%xz|�%��Y�Y�SY�SY�SY�S����%� �%��Y6&� 6*%&,��M,ݶ%������ � :'� '�:(*&,��M�(%��� :)� #)�� � #:*%*��� � :+� +�:,%���,*�t+� ��v:-*]� �-xz|�-��Y�Y�SY�SY�SY�S����-� �-��Y6.� 6*-.,��M,�-������ � :/� /�:0*.,��M�0-��� :1� #1�� � #:2-2��� � :3� 3�:4-���4*�t+� ��v:5*^� �5xz|�5��Y�Y�SY�SY�SY�S����5� �5��Y66� 6*56,��M,�5������ � :7� 7�:8*6,��M�85��� :9� #9�� � #::5:��� � :;� ;�:<5���<*� u*`� �*�� �� �**� U�����Y�S� W**� qJ�����S� '*+,��� �*+,��� �*+,��� �*� !*� �**o� �Y�S�M7��
� �*�t+� ��v:=*� �=xz|�=��Y�Y�SY�SY�SY�S����=� �=��Y6>� 6*=>,��M,�=������ � :?� ?�:@*>,��M�@=��� :A� #A�� � #:B=B��� � :C� C�:D=���D*�7+� ��9:E*� �E�>E� �E� � �*��8+� ���:F*� �F��F��*�� �Y�S� ȸ �� Ҷ�F�� F�F� �F�Y6G� �*FG,��M*F,��� :H� Ҩ
H�*,�D*�75F� ��9:I*�� �I��>I� �I� � :J� �� �J�*�76F� ��9:K*�� �K�>K� �K� � :L� X� �L�*�77F� ��9:M*�� �M��>M� �M� � :N� � WN�F����1� � :O� O�:P*G,��M�PF��� :Q� #Q�� � #:RFR��� � :S� S�:TF���T*� P ��� �)�)�&)�).)�����7C�=@C��7R�=@R�COR�RWR���������������������������������������������������������������������������Sor�rwr�H�������H���������������7:�:?:�Zf�`cf�Zu�`cu�fru�uzu�x�������m�������m���������������	q	�
S�	�	�
S�	�

S�

?
S�
E
P
S�
S
X
S�	f	�
�	�	�
�	�

�

?
�
E
s
�
y
|
�	f	�
��	�	�
��	�

��

?
��
E
s
��
y
|
��

�
��
�
�
�� �  T U  
���    
�� �   
���   
� ��   
���   
���   
���   
���   
���   
��� 	  
��� 
  
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
���   
�j�   
���   
���   
���   
���    
��� !  
��� "  
��� #  
��� $  
��� %  
��� &  
��� '  
� � (  
�� )  
�� *  
�� +  
�� ,  
�� -  
�� .  
�� /  
�� 0  
�	� 1  
�
� 2  
�� 3  
�� 4  
�� 5  
�� 6  
�� 7  
�� 8  
�� 9  
�� :  
�� ;  
�� <  
�� =  
�� >  
�� ?  
�� @  
�� A  
�� B  
�� C  
�� D  
�� E  
� F  
� � G  
�!� H  
�"� I  
�#� J  
�$� K  
�%� L  
�&� M  
�'� N  
�(� O  
�)� P  
�*� Q  
�+� R  
�,� S  
�-� T�  Z �                 E  E  L  L  L  L  E  E     j  u  u  w  w  t  t  t  t  j  � 	 � 	 � 	 � 	 � 	 � 	  	 � 
 � 
 � 
 � 
 � 
 � 
 � 
 j  �  �  �  �  �  � W W A � � u � � � � � � � � � � � � � � � � . . . . ! ! V V V V Z Z V V 4 w � � � !� !� !� !� !� "� "� "� "c "6 +6 +M -M -S -S -S -S -i -i -I -I -I -I -< -< ,� >� >� >� >� >| > Y Y$ Z$ Z# Z# Z# Z# Z Z Zd \d \p \p \. \, ], ]8 ]8 ]� ]� ^� ^  ^  ^� ^� `� `� `� `� `� `� `� `� `� `� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a� a������QQ]]���	)	)	7	7	7	7	R	R	Z	Z	��	��	��	��	��	��
%�
%�
�	 �1 �  X  ,  �,f�*�t*+� ��v:*�� �xz|���Y�Y�SYhS����� ���Y6� 6*,��M,j������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,l�*�t++� ��v:*�� �xz|���Y�Y�SYnS����� ���Y6� 6*,��M,p������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,r�*�t,+� ��v:*�� �xz|���Y�Y�SYtS����� ���Y6� 6*,��M,v������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,x�*�t-+� ��v:*�� �xz|���Y�Y�SYzS����� ���Y6� 6*,��M,|������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,~�,*o� �YUS� ȸ ζ,W�*�t.+� ��v:$*�� �$xz|�$��Y�Y�SY�S����$� �$��Y6%� 6*$%,��M,��$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��9<�<A<�\h�beh�\w�bew�htw�w|w��� �  �� ,�&),�� ;�&);�,8;�;@;����������������������������������������|�������|��������������� �  � ,  ���    �� �   ���   � ��   �.�   �/�   �0�   ���   ���   ��� 	  ��� 
  ���   �1�   �2�   �3�   ���   ���   ���   ���   ���   �4�   �5�   ���   �6�   �7�   ���   ���   ���   �8�   �9�   ���   ���   �:�    ��� !  ��� "  ��� #  �;� $  �<� %  �=� &  ��� '  � � (  �� )  �� *  �� +�   R  >� >� ��� ������������S������l�l�5� �1 �  �  ,  ,]�*�t/+� ��v:*�� �xz|���Y�Y�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,��*�t0+� ��v:*�� �xz|���Y�Y�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��*�t1+� ��v:*�� �xz|���Y�Y�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,��,*o� �YUS� ȸ ζ,W�*�t2+� ��v:*�� �xz|���Y�Y�SY�S����� ���Y6� 6*,��M,�������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,��**� !�!�S� 
,��,��*�t3+� ��v:$*�� �$xz|�$��Y�Y�SY�S����$� �$��Y6%� 6*$%,��M,��$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( Y u x� x } x� N � �� � � �� N � �� � � �� � � �� � � ��9<�<A<�\h�beh�\w�bew�htw�w|w��� �  �� ,�&),�� ;�&);�,8;�;@;����������������"�������������������������������� �  � ,  ��    � �   ��    ��   >�   ?�   0�   ��   ��   �� 	  �� 
  ��   @�   A�   3�   ��   ��   ��   ��   ��   B�   C�   ��   6�   7�   ��   ��   ��   D�   E�   ��   ��   :�    �� !  �� "  �� #  F� $  G� %  =� &  �� '   � (  � )  � *  � +�   ^  >� >� ��� ��������T�T�T�T�S�����q�5�5�5�����Q� 01 �  �    �*� I�� �**� U���� *� I*S� �Y�S� ȶ �*k� �**� %��*�Y**� I�!SY*o� �YS� �S�W*S� �YS*p� �*S� �YS� ȸ θ
�_*S� �YS*q� �*S� �YS� ȸ θ
�_*S� �YS*r� �*S� �YS� ȸ θ
�_*s� �*S� �YS� ȸ���t|��Y�S� -W*s� �*S� �YS� ȸ���~����S� **� �[� �*v� �**� e�!�**� i�!�!W**� U#���Y�S� W**� U%���Y�S� -W*y� �*S� �YS� ȸ���t|���S�%*{� �***� u�'�Y*S� �YS� �SY[S�
�S�� **� �[� �*~� �**� e�!�**� �!�!W* �� �*S� �YS� ȸ �*S� �YS� ȸ θ+���~��� +*� �[� �* �� �**� e�!�**� M�!�!W**� ��!�S�� J* �� �***� u�-�Y*S� �YS� �SY[S�
W*{� �Y/S[�_*�   �   *   ���    �� �   ���   � �� �  b �  f  f  f  f   f  g  g  g  g  g  g  g  g 
 g 
 g  i  i  i  i  i 
 g 8 k 8 k J k J k U k U k 8 k 8 k 8 k } p } p } p } p } p } p } p } p j p � q � q � q � q � q � q � q � q � q � r � r � r � r � r � r � r � r � r � s � s � s � s
 s
 s � s � s � s � s% s% s% s% s; s; s% s% s% s% s � s � sR uR uR uR uN u^ v^ v^ v^ vi vi v^ v^ v^ v � sv xv xv xv xz xz x} x} xu xu xu xu x� x� x� x� x� x� x� x� x� x� x� x� xu xu xu xu x� y� y� y� y� y� y� y� y� y� yu yu y� {� {� {� { { {� {� {� {� {� {� { } } } } }  ~  ~  ~  ~+ ~+ ~  ~  ~  ~� {> �> �> �> �Q �Q �Q �Q �> �> �j �j �> �> �> �> �> �> �} �} �} �} �y �� �� �� �� �� �� �� �� �� �> �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �u x �1 �      *+,�3� �**� ��!�S���Y�S� W**� }/5���Y�S� W*{� �Y/S� ȸS� �*� )* �� �**o� �YJS�M7��
� �**� )�!�S� 4*�<+� ��>:* �� �@�C� �� � �� 1*�<+� ��>:* �� �E�C� �� � �*� 5* �� �**� y�G*�IY� �YKS�Y*S� �YS� �S�N�Q� ��SY*� ��V:**� UXZ���Y�S� .W* �� �*S� �YXS� ȸ θ
��]�~���S� Z* �� �**o� �YJS�M_�Y*S� �YXS� �S�
W* �� �**� m�a*�YcS�W�"�(:�:�i:		�o�s�  �           7	�w*� �[� �*�+� ��:
* �� �
� �
�Y6�@*,y�D*�t
� ��v:* �� �xz|���Y�Y�SY{SY�SY{S����� ���Y6� �*,��M,}�,* �� �**� 9� �YS��� θ��,��,* �� �**� 9� �Y�S��� θ��*,y�D������ � :� �:*,��M���� :� )� q� ��� � #:��� � :� �:���*,��D
�$���
�)� :� &� o�� � #:
�-� � :� �:
�0�*,��D*� �* �� �**� e�!�**� ]�!�!��� �� �� � :� �:���*� ��"��CO�ILO��C^�IL^�O[^�^c^�7C��I�������7C��I���������������;��T;��V;����C��I����������� �     ��    � �   ��    ��   HI   JI   0K   �L   �M   N� 	  O� 
  P�   Q�   R�   3�   ��   ��   ��   ��   ��   ��   ��   ��   6�   7�   �� �  6 �   c  �  �  �  �  �  �  �  � % � % � % � % � ) � ) � , � , � $ � $ � $ � $ �  �  �  �  � = � = � = � = �  �  � ^ � ^ � ^ � ^ � S � S � | � | � � � � � � � � � � � � � � � | � � � � � � � � � � � � � � � � � � �  �< �< �< �< �@ �@ �C �C �; �; �; �; �[ �[ �[ �[ �[ �[ �q �q �[ �[ �[ �[ �; �; �� �� �� �� �� �� �� �� �� �� �� �� �; �; � � � � � � �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �J � �� �� �� �� �� �� �� �� �� �� �� �� �. � W� �   l     $*� �� �L*� �N*� ��� �*-+��� ��   �   *    $��     $��    $ ��    $ � � �       71 �  �  ,  I,�,*.� �**� E�*�Y*o� �YS� �S�� ζ,�*�t!+� ��v:*0� �xz|���Y�Y�SYS����� ���Y6� 6*,��M,������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,�*�t"+� ��v:*6� �xz|���Y�Y�SYS����� ���Y6� 6*,��M, ������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,"�*�t#+� ��v:*8� �xz|���Y�Y�SY$S����� ���Y6� 6*,��M,&������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,(�*�t$+� ��v:*B� �xz|���Y�Y�SY*S����� ���Y6� 6*,��M,,������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#,.�*H� �**o� �YJS�MU��
�S�� 
,0�,2�*�t%+� ��v:$*N� �$xz|�$��Y�Y�SY4S����$� �$��Y6%� 6*$%,��M,6�$������ � :&� &�:'*%,��M�'$��� :(� #(�� � #:)$)��� � :*� *�:+$���+*� ( � � �� � � �� � � �� � � �� � � �� � � �� � � �� � � ��Xtw�w|w�M�������M���������������8;�;@;�[g�adg�[v�adv�gsv�v{v���������+�%(+��:�%(:�+7:�:?:������ ���'�!$'��6�!$6�'36�6;6� �  � ,  I��    I� �   I��   I ��   IX�   IY�   I0�   I��   I��   I�� 	  I�� 
  I��   IZ�   I[�   I3�   I��   I��   I��   I��   I��   I\�   I]�   I��   I6�   I7�   I��   I��   I��   I^�   I_�   I��   I��   I:�    I�� !  I�� "  I�� #  I`� $  Ia� %  I=� &  I�� '  I � (  I� )  I� *  I� +�   ~  . . !. !. . . . . . y0 y0 B0=6=6688�8�B�B�BYHYHYHYHYHYHYH�N�N�N b1 �  �  $  �,;�*R� �**� 1�=*���S�,?�*U� �**o� �YJS�MU��
�S� 
,A�,C�*�t&+� ��v:*[� �xz|���Y�Y�SYES����� ���Y6� 6*,��M,G������� � :� �:*,��M���� :� #�� � #:		��� � :
� 
�:���,I�,K�*b� �**o� �YJS�MO��
�S�� 
,A�,M�*�t'+� ��v:*h� �xz|���Y�Y�SYOS����� ���Y6� 6*,��M,Q������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,S�,*o� �YUS� ȸ ζ,W�*�t(+� ��v:*s� �xz|���Y�Y�SYYS����� ���Y6� 6*,��M,[������� � :� �:*,��M���� :� #�� � #:��� � :� �:���,]�*�t)+� ��v:*y� �xz|���Y�Y�SY_S����� ���Y6� 6*,��M,a������� � :� �:*,��M���� : � # �� � #:!!��� � :"� "�:#���#*�   � � �� � � �� � �� � �� � �� � ��������������������������������������������������������_{~�~�~�T�������T��������������� �  j $  ���    �� �   ���   � ��   �b�   �c�   �0�   ���   ���   ��� 	  ��� 
  ���   �d�   �e�   �3�   ���   ���   ���   ���   ���   �f�   �g�   ���   �6�   �7�   ���   ���   ���   �h�   �i�   ���   ���   �:�    ��� !  ��� "  ��� #�   �   R R R R 5U 5U 5U �[ �[ d[ R6b6b6b6b6b6b6b�h�hgh,r,r,r,r+r�s�sIsDyDyy �1 �  �  ,  ĻSY*� ��V:**� U'����Y�S� -W* �� �*S� �Y'S� ȸ θ
��]�~���S� W* �� �**o� �Y�S�M��Y[S�
W* �� �**� m�a*�Y�S�W� ,* �� �**o� �Y�S�M��Y�S�
W�#�):�:�i:���s�   �           7�w*� �[� �*�+� ��:* Ŷ �� ��Y6	�@*,y�D*�t� ��v:
* ƶ �
xz|�
��Y�Y�SY�SY�SY�S����
� �
��Y6� �*
,��M,��,* ɶ �**� 9� �YS��� θ��,��,* ʶ �**� 9� �Y�S��� θ��*,y�D
������ � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,��D�$����)� :� &� o�� � #:�-� � :� �:�0�*,��D*� �* ζ �**� e�!�**� =�!�!��� �� �� � :� �:����SY*� ��V:**� U�����Y�S� #W*S� �Y�S� ���]�~����S� 6* ֶ �**o� �YJS�M��Y�S�
W� ,* ض �**o� �YJS�M��Y[S�
W�#�):�:�i:���s�   �           7�w*� �[� �*�+� ��:* ߶ �� ��Y6�@*,y�D*�t� ��v:* � �xz|���Y�Y�SY�SY�SY�S����� ���Y6� �*,��M,��,* � �**� 9� �YS��� θ��,��,* � �**� 9� �Y�S��� θ��*,y�D������ � : �  �:!*,��M�!��� :"� )� q� �"�� � #:##��� � :$� $�:%���%*,��D�$����)� :&� &� o&�� � #:''�-� � :(� (�:)�0�)*,��D*� �* � �**� e�!�**� Q�!�!��� �� �� � :*� *�:+���+*� .�
���3?�9<?��3N�9<N�?KN�NSN�'3��9~������'3��9~��������������  � �T  � �V  ��� �3��9~����������e�������Z���Z�������V�JV�PSV���e�Je�PSe�Vbe�eje���T��V�������J��P������� �  � ,  ���    �� �   ���   � ��   �jK   �kL   �0M   �l�   �m�   �n� 	  �o� 
  �p�   ���   �q�   �3�   ���   ���   ���   ���   ���   ���   ���   ���   �6�   �7K   ��L   ��M   �r�   �s�   �t�   �u�   �v�   �:�    ��� !  ��� "  ��� #  ��� $  �w� %  �=� &  ��� '  � � (  �� )  �� *  �� +�  � �  �  �  �  �  �  �  �  �  �  �  �  � , � , � , � , � , � , � A � A � , � , � , � , �  �  � u � u � [ � [ � [ � � � � � � � � � � � � � � � � � � � � � � � � �  �  � � � � � � �r �r �~ �~ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �: � �� �� �� �� �� �� �� �� �� �� �� �� �   � � � � � � � � � � � � � � �, �, � � � � � � �b �b �H �H �H �� �� �t �t �t � � �� �� �� �� �� �� �> �> �J �J �~ �~ �~ �~ �~ �~ �~ �~ �v �� �� �� �� �� �� �� �� �� � �� �� �� �� �� �� �� �� �� �� �� �~ �~ �� � x  �   �     ��� �� �� ��5� ��7k� ��mr� ��t:� ��<� �YmS�o� �YmS��� �YmS��� �YmS��¸ ����� ����Y������   �       ���   �1 �  	�    ̻SY*� ��V:**� U�����Y�S� #W*S� �Y�S� ���]�~����S� 6* � �**o� �Y�S�M��Y[S�
W� ,* � �**o� �Y�S�M��Y�S�
W�%�+:�:�i:���s�     �           7�w*� �[� �*�+� ��:* �� �� ��Y6	�@*,y�D*�t� ��v:
* �� �
xz|�
��Y�Y�SY�SY�SY�S����
� �
��Y6� �*
,��M,��,* �� �**� 9� �YS��� θ��,��,* �� �**� 9� �Y�S��� θ��*,y�D
������ � :� �:*,��M�
��� :� )� q� ��� � #:
��� � :� �:
���*,��D�$����)� :� &� o�� � #:�-� � :� �:�0�*,��D*� �*� �**� e�!�**� a�!�!��� �� �� � :� �:���**� ��!�S���**� U�����Y�S� #W*S� �Y�S� ���]�~����S� j*��+� ���:*� �ȶ����һ�YԷ�*� �*� ��ֶ���� Ҷ�� �� � ��J**� U�����Y�S� #W*S� �Y�S� ���]�~����S� j*��+� ���:*� �ȶ����һ�YԷ�*� �*� ��۶���� Ҷ�� �� � �� �**� U�����Y�S� #W*S� �Y�S� �ݸ]�~����S� g*��+� ���:*� �ȶ����һ�YԷ�*� �*� ��߶���� Ҷ�� �� � �*� q�������f��f&�&�#&�&+&� �b�Vb�\_b� �q�Vq�\_q�bnq�qvq�  � �T  � �V  ��� ���V��\������� �     ���    �� �   ���   � ��   �jK   �kL   �0M   �y�   �z�   �{� 	  �|� 
  �}�   ���   �q�   �3�   ���   ���   ���   ���   ���   ���   ���   ���   �6�   �~   ��   �� �   �  �  �  �  �  �  �  �  �  �  �  �  � & � & � 6 � 6 � & � & � & � & �  �  � l � l � R � R � R � � � � � ~ � ~ � ~ �  �  � � � � � � � � � � � � �J �J �V �V �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � �������������   ���������������������������44LLYYYY``HH�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�����������))))--00((((AAQQAAAA((~~����������f(�
��       �    �