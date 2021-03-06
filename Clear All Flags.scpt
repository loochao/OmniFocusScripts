FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	This script clears every flag in the front OmniFocus database.
			
	version 0.1, by Curt Clifton
	
	Copyright � 2010, Curtis Clifton
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	version 0.1: Original release
     � 	 	 
 	 T h i s   s c r i p t   c l e a r s   e v e r y   f l a g   i n   t h e   f r o n t   O m n i F o c u s   d a t a b a s e . 
 	 	 	 
 	 v e r s i o n   0 . 1 ,   b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 1 0 ,   C u r t i s   C l i f t o n 
 	 
 	 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t : 
 	 
 	 	 "   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r . 
 	 	 
 	 	 "   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n . 
 	 	 
 	 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R S   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   O W N E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E . 
 	 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        l      ��  ��    M G
	The following properties are used for script notification via Growl.
     �   � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n   v i a   G r o w l . 
      j     �� �� 0 growlappname growlAppName  m        �    C u r t ' s   S c r i p t s      j    �� �� 20 scriptstartnotification scriptStartNotification  m       �    S c r i p t   B e g a n      j    �� �� 40 scriptfinishnotification scriptFinishNotification  m       �     S c r i p t   C o m p l e t e d     !   j   	 �� "�� ,0 defaultnotifications defaultNotifications " J   	  # #  $�� $ o   	 
���� 40 scriptfinishnotification scriptFinishNotification��   !  % & % j    �� '�� $0 allnotifications allNotifications ' b     ( ) ( o    ���� ,0 defaultnotifications defaultNotifications ) J     * *  +�� + o    ���� 20 scriptstartnotification scriptStartNotification��   &  , - , j    �� .�� 00 iconloaningapplication iconLoaningApplication . m     / / � 0 0  O m n i F o c u s . a p p -  1 2 1 l     ��������  ��  ��   2  3 4 3 l      �� 5 6��   5  
	Main entry point.
    6 � 7 7 ( 
 	 M a i n   e n t r y   p o i n t . 
 4  8 9 8 l    ! :���� : Q     ! ; < = ; r     > ? > I   �� @ A
�� .sysodlogaskr        TEXT @ m     B B � C C d R e a l l y   c l e a r   e v e r y   f l a g   i n   t h e   O m n i F o c u s   d a t a b a s e ? A �� D E
�� 
btns D J    	 F F  G H G m     I I � J J  C l e a r   F l a g s H  K�� K m     L L � M M  C a n c e l��   E �� N O
�� 
dflt N m   
  P P � Q Q  C a n c e l O �� R S
�� 
cbtn R m     T T � U U  C a n c e l S �� V W
�� 
appr V m     X X � Y Y " C l e a r   E v e r y   F l a g ? W �� Z��
�� 
disp Z m    ��
�� stic   ��   ? o      ���� 0 theresponse theResponse < R      ������
�� .ascrerr ****      � ****��  ��   = L    !����  ��  ��   9  [ \ [ l  " M ]���� ] O   " M ^ _ ^ k   ( L ` `  a b a l  ( (��������  ��  ��   b  c d c O   ( J e f e r   1 I g h g m   1 2��
�� boovfals h n       i j i 1   D H��
�� 
FCfl j l  2 D k���� k 6  2 D l m l 2   2 7��
�� 
FCft m =  : C n o n 1   ; ?��
�� 
FCfl o m   @ B��
�� boovtrue��  ��   f 4  ( .�� p
�� 
docu p m   , -����  d  q�� q l  K K��������  ��  ��  ��   _ m   " % r r�                                                                                  OFOC  alis    X  Macintosh HD               ��GH+     qOmniFocus.app                                                   O�5ȬM�        ����  	                Applications    ���      Ȭ��       q  'Macintosh HD:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  ��   \  s t s l  N ^ u���� u n  N ^ v w v I   O ^�� x���� 
0 notify   x  y z y m   O R { { � | |  F l a g s   C l e a r e d z  } ~ } m   R U   � � � V F l a g s   c l e a r e d   o n   a l l   i t e m s   i n   t h e   d a t a b a s e . ~  ��� � o   U Z���� 40 scriptfinishnotification scriptFinishNotification��  ��   w  f   N O��  ��   t  � � � l     ��������  ��  ��   �  � � � l      �� � ���   �
	Uses Growl to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
	theNotificationKind � a string giving the notification kind (must be an element of allNotifications)
    � � � � 
 	 U s e s   G r o w l   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
 	 t h e N o t i f i c a t i o n K i n d      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   k i n d   ( m u s t   b e   a n   e l e m e n t   o f   a l l N o t i f i c a t i o n s ) 
 �  ��� � i     � � � I      �� ����� 
0 notify   �  � � � o      ���� 0 thetitle theTitle �  � � � o      ����  0 thedescription theDescription �  ��� � o      ���� *0 thenotificationkind theNotificationKind��  ��   � O     4 � � � k    3 � �  � � � I   !���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � o    ���� 0 growlappname growlAppName � �� � �
�� 
anot � o    ���� $0 allnotifications allNotifications � �� � �
�� 
dnot � o    ���� ,0 defaultnotifications defaultNotifications � �� ���
�� 
iapp � o    ���� 00 iconloaningapplication iconLoaningApplication��   �  ��� � I  " 3���� �
�� .notifygrnull��� ��� null��   � �� � �
�� 
name � o   $ %���� *0 thenotificationkind theNotificationKind � �� � �
�� 
titl � o   & '���� 0 thetitle theTitle � �� � �
�� 
appl � o   ( -���� 0 growlappname growlAppName � �� ���
�� 
desc � o   . /����  0 thedescription theDescription��  ��   � m      � �2                                                                                  GRRR  alis    �  Macintosh HD               ��GH+   }�GrowlHelperApp.app                                              }����0        ����  	                	Resources     ���      ��6p     }� }� }� |s   �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  ��       
�� �    � � / � ���   � ������������������ 0 growlappname growlAppName�� 20 scriptstartnotification scriptStartNotification�� 40 scriptfinishnotification scriptFinishNotification�� ,0 defaultnotifications defaultNotifications�� $0 allnotifications allNotifications�� 00 iconloaningapplication iconLoaningApplication�� 
0 notify  
�� .aevtoappnull  �   � **** � �� ���  �    � �� ���  �     � �� ����� � ����� 
0 notify  �� �� ���  �  �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKind��   � �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKind �  ���������������������
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null
�� 
name
�� 
titl
�� 
desc
�� .notifygrnull��� ��� null�� 5� 1*�b   �b  �b  �b  � O*���b   �� 
U � �� ���~ � ��}
�� .aevtoappnull  �   � **** � k     ^ � �  8 � �  [ � �  s�|�|  �  �~   �   �  B�{ I L�z P�y T�x X�w�v�u�t�s�r�q r�p�o ��n { �m
�{ 
btns
�z 
dflt
�y 
cbtn
�x 
appr
�w 
disp
�v stic   �u 

�t .sysodlogaskr        TEXT�s 0 theresponse theResponse�r  �q  
�p 
docu
�o 
FCft �  
�n 
FCfl�m 
0 notify  �} _ ����lv��������� E�W 	X  hOa  &*a k/ f*a -a [a ,\Ze81a ,FUOPUO)a a b  m+ ascr  ��ޭ