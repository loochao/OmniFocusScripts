FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	y	s
	This script marks the selected actions as complete and creates new actions in a "Waiting For" context to track replies.
	
	by Curt Clifton
	
	Copyright � 2007-2008, 2012, 2014, 2016 Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	version 1.1: Added feature to make new "waiting for" tasks have a due date relative to the original tasks date, rather than relative to today's date.
	version 1.0.2: Fixed to not lose links in note of item
	version 1.0.1: Fixed to work with Mac App Store version of OmniFocus 2 Pro
	version 1.0: Lots of improvements:
		� Updated for OmniFocus 2. 
		� Uses Notification Center instead of Growl. 
		� Handles a Waiting context that is a sub-context, instead of just top-level contexts. 
		� Added a property to allow adjusting due date of created task, but made the default be no due date.
		� Adds an paragraph to the new action�s note indicating when the �waiting for� task was created.
		� If the selected task is already a �waiting for� task, the new task won�t have the �Reply on:� prefix added twice, but it will get another paragraph indicating when the follow-up was sent.
	version 0.2: Removed Growl support
	version 0.1: Original release
     � 	 	� 
 	 T h i s   s c r i p t   m a r k s   t h e   s e l e c t e d   a c t i o n s   a s   c o m p l e t e   a n d   c r e a t e s   n e w   a c t i o n s   i n   a   " W a i t i n g   F o r "   c o n t e x t   t o   t r a c k   r e p l i e s . 
 	 
 	 b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 0 7 - 2 0 0 8 ,   2 0 1 2 ,   2 0 1 4 ,   2 0 1 6   C u r t i s   C l i f t o n 
 	 
 	 A l l   r i g h t s   r e s e r v e d . 
 	 
 	 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t : 
 	 
 	 	 "   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r . 
 	 	 
 	 	 "   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n . 
 	 	 
 	 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R S   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   O W N E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E . 
 	 
 	 v e r s i o n   1 . 1 :   A d d e d   f e a t u r e   t o   m a k e   n e w   " w a i t i n g   f o r "   t a s k s   h a v e   a   d u e   d a t e   r e l a t i v e   t o   t h e   o r i g i n a l   t a s k s   d a t e ,   r a t h e r   t h a n   r e l a t i v e   t o   t o d a y ' s   d a t e . 
 	 v e r s i o n   1 . 0 . 2 :   F i x e d   t o   n o t   l o s e   l i n k s   i n   n o t e   o f   i t e m 
 	 v e r s i o n   1 . 0 . 1 :   F i x e d   t o   w o r k   w i t h   M a c   A p p   S t o r e   v e r s i o n   o f   O m n i F o c u s   2   P r o 
 	 v e r s i o n   1 . 0 :   L o t s   o f   i m p r o v e m e n t s : 
 	 	 "   U p d a t e d   f o r   O m n i F o c u s   2 .   
 	 	 "   U s e s   N o t i f i c a t i o n   C e n t e r   i n s t e a d   o f   G r o w l .   
 	 	 "   H a n d l e s   a   W a i t i n g   c o n t e x t   t h a t   i s   a   s u b - c o n t e x t ,   i n s t e a d   o f   j u s t   t o p - l e v e l   c o n t e x t s .   
 	 	 "   A d d e d   a   p r o p e r t y   t o   a l l o w   a d j u s t i n g   d u e   d a t e   o f   c r e a t e d   t a s k ,   b u t   m a d e   t h e   d e f a u l t   b e   n o   d u e   d a t e . 
 	 	 "   A d d s   a n   p a r a g r a p h   t o   t h e   n e w   a c t i o n  s   n o t e   i n d i c a t i n g   w h e n   t h e    w a i t i n g   f o r    t a s k   w a s   c r e a t e d . 
 	 	 "   I f   t h e   s e l e c t e d   t a s k   i s   a l r e a d y   a    w a i t i n g   f o r    t a s k ,   t h e   n e w   t a s k   w o n  t   h a v e   t h e    R e p l y   o n :    p r e f i x   a d d e d   t w i c e ,   b u t   i t   w i l l   g e t   a n o t h e r   p a r a g r a p h   i n d i c a t i n g   w h e n   t h e   f o l l o w - u p   w a s   s e n t . 
 	 v e r s i o n   0 . 2 :   R e m o v e d   G r o w l   s u p p o r t 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        l      ��  ��    � �
	This string is matched against your contexts to find a context in which to place the new "waiting-for" action.  The matching is the same as in the context column in OmniFocus, so you don't need the entire contexxt name, just a unique fragment.
     �  � 
 	 T h i s   s t r i n g   i s   m a t c h e d   a g a i n s t   y o u r   c o n t e x t s   t o   f i n d   a   c o n t e x t   i n   w h i c h   t o   p l a c e   t h e   n e w   " w a i t i n g - f o r "   a c t i o n .     T h e   m a t c h i n g   i s   t h e   s a m e   a s   i n   t h e   c o n t e x t   c o l u m n   i n   O m n i F o c u s ,   s o   y o u   d o n ' t   n e e d   t h e   e n t i r e   c o n t e x x t   n a m e ,   j u s t   a   u n i q u e   f r a g m e n t . 
      j     �� �� &0 waitingforcontext waitingForContext  m        �    w a i t      l     ��������  ��  ��        l      ��  ��    k e
	This string is used as a prefix on the original item title when creating the "waiting-for" action.
     �   � 
 	 T h i s   s t r i n g   i s   u s e d   a s   a   p r e f i x   o n   t h e   o r i g i n a l   i t e m   t i t l e   w h e n   c r e a t i n g   t h e   " w a i t i n g - f o r "   a c t i o n . 
      j    �� �� 0 waitingprefix waitingPrefix  m         � ! !  R e p l y   o n :     " # " l     ��������  ��  ��   #  $ % $ l      �� & '��   & � �
	This string is used as a prefix for a paragraph added to the new item�s note that indicates when the original action was completed.
    ' � ( ( 
 	 T h i s   s t r i n g   i s   u s e d   a s   a   p r e f i x   f o r   a   p a r a g r a p h   a d d e d   t o   t h e   n e w   i t e m  s   n o t e   t h a t   i n d i c a t e s   w h e n   t h e   o r i g i n a l   a c t i o n   w a s   c o m p l e t e d . 
 %  ) * ) j    �� +�� 0 
noteprefix 
notePrefix + m     , , � - - " R e m i n d e r   s e n t   o n   *  . / . l     ��������  ��  ��   /  0 1 0 l      �� 2 3��   2 � �
	The number of days from base date that the newly created "waiting-for" action will be due. Set to a negative number to put no due date on the new action.
    3 � 4 48 
 	 T h e   n u m b e r   o f   d a y s   f r o m   b a s e   d a t e   t h a t   t h e   n e w l y   c r e a t e d   " w a i t i n g - f o r "   a c t i o n   w i l l   b e   d u e .   S e t   t o   a   n e g a t i v e   n u m b e r   t o   p u t   n o   d u e   d a t e   o n   t h e   n e w   a c t i o n . 
 1  5 6 5 j   	 �� 7�� 0 daysuntildue daysUntilDue 7 m   	 
������ 6  8 9 8 l     ��������  ��  ��   9  : ; : l      �� < =��   < � �
	If daysUntilDue is not negative, then this controls whether the date of the newly created "waiting-for" action is set relative to the original task's due date or relative to today's date.
    = � > >| 
 	 I f   d a y s U n t i l D u e   i s   n o t   n e g a t i v e ,   t h e n   t h i s   c o n t r o l s   w h e t h e r   t h e   d a t e   o f   t h e   n e w l y   c r e a t e d   " w a i t i n g - f o r "   a c t i o n   i s   s e t   r e l a t i v e   t o   t h e   o r i g i n a l   t a s k ' s   d u e   d a t e   o r   r e l a t i v e   t o   t o d a y ' s   d a t e . 
 ;  ? @ ? j    �� A�� .0 usetaskdateasbasedate useTaskDateAsBaseDate A m    ��
�� boovtrue @  B C B l     ��������  ��  ��   C  D E D l      �� F G��   F � z 
	This string is used in notifications if multiple items are processed. For single items, we use the actual item title. 
    G � H H �   
 	 T h i s   s t r i n g   i s   u s e d   i n   n o t i f i c a t i o n s   i f   m u l t i p l e   i t e m s   a r e   p r o c e s s e d .   F o r   s i n g l e   i t e m s ,   w e   u s e   t h e   a c t u a l   i t e m   t i t l e .   
 E  I J I j    �� K�� 00 multipleitemscompleted multipleItemsCompleted K m     L L � M M  M u l t i p l e   I t e m s J  N O N l     ��������  ��  ��   O  P Q P l      �� R S��   R D >
	The following properties are used for script notifications.
    S � T T | 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n s . 
 Q  U V U j    �� W�� "0 scriptsuitename scriptSuiteName W m     X X � Y Y  C u r t  s   S c r i p t s V  Z [ Z l     ��������  ��  ��   [  \ ] \ l     ^���� ^ r      _ ` _ m     ��
�� 
msng ` o      ���� 0 	itemtitle 	itemTitle��  ��   ]  a b a l  � c���� c O   � d e d O   � f g f k   � h h  i j i l   �� k l��   k   Gets target context    l � m m (   G e t s   t a r g e t   c o n t e x t j  n o n Q    N p q r p k    4 s s  t u t r    $ v w v n    " x y x 1     "��
�� 
ID   y n      z { z 4     �� |
�� 
cobj | m    ����  { l    }���� } I   �� ~ 
�� .OFOCFCCmnull���     ctxt ~ o    ���� &0 waitingforcontext waitingForContext  �� ���
�� 
kocl � m    ��
�� 
FCct��  ��  ��   w o      ���� 0 thecontextid theContextID u  ��� � r   % 4 � � � 6  % 2 � � � 4  % )�� �
�� 
FCfc � m   ' (����  � =  * 1 � � � 1   + -��
�� 
ID   � o   . 0���� 0 thecontextid theContextID � o      ���� ,0 thewaitingforcontext theWaitingForContext��   q R      ������
�� .ascrerr ****      � ****��  ��   r k   < N � �  � � � I  < K�� ���
�� .sysodisAaleR        TEXT � b   < G � � � b   < C � � � m   < = � � � � � L N o   c o n t e x t   f o u n d   w h o s e   n a m e   c o n t a i n s    � o   = B���� &0 waitingforcontext waitingForContext � m   C F � � � � �  ��   �  ��� � L   L N����  ��   o  ��� � O   O� � � � l  \� � � � � k   \� � �  � � � r   \ i � � � n   \ e � � � 1   a e��
�� 
valL � 2   \ a��
�� 
OTst � o      ���� $0 theselecteditems theSelectedItems �  � � � Z   j � � ����� � l  j s ����� � A   j s � � � l  j q ����� � I  j q�� ���
�� .corecnte****       **** � o   j m���� $0 theselecteditems theSelectedItems��  ��  ��   � m   q r���� ��  ��   � k   v � � �  � � � I  v ��� � �
�� .sysodisAaleR        TEXT � m   v y � � � � � T Y o u   m u s t   f i r s t   s e l e c t   a n   i t e m   t o   c o m p l e t e . � �� ���
�� 
as A � m   | ��
�� EAlTwarN��   �  ��� � L   � �����  ��  ��  ��   �  � � � X   �� ��� � � k   �� � �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 anitem anItem � o      ���� 0 	itemtitle 	itemTitle �  � � � r   � � � � � I  � ��� � �
�� .coreclon****      � **** � o   � ����� 0 anitem anItem � �� ���
�� 
insh � n   � � � � � 9   � ���
�� 
insl � o   � ����� 0 anitem anItem��   � o      ���� 0 thedupe theDupe �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
FCDd � o   � ����� 0 anitem anItem � o      ���� "0 originalduedate originalDueDate �  � � � r   � � � � � m   � ���
�� boovtrue � n       � � � 1   � ���
�� 
FCcd � o   � ����� 0 anitem anItem �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � #  Configure the duplicate item    � � � � :   C o n f i g u r e   t h e   d u p l i c a t e   i t e m �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 thedupe theDupe � o      ���� 0 oldname oldName �  � � � Z   � � � ����� � l  � � ����� � H   � � � � C   � � � � � o   � ����� 0 oldname oldName � o   � ����� 0 waitingprefix waitingPrefix��  ��   � r   � � � � � b   � � � � � o   � ����� 0 waitingprefix waitingPrefix � o   � ����� 0 oldname oldName � n       � � � 1   � ���
�� 
pnam � o   � ����� 0 thedupe theDupe��  ��   �  � � � r   � � � � b   � � � � b   � � � � o   � ��� 0 
noteprefix 
notePrefix � l  � ��~�} � c   � � � � l  � ��|�{ � I  ��z�y�x
�z .misccurdldt    ��� null�y  �x  �|  �{   � m  �w
�w 
ctxt�~  �}   � o  
�v
�v 
ret  � o      �u�u 0 texttoinsert textToInsert �  � � � I *�t � �
�t .TEXTOSinnull���     ctxt � o  �s�s 0 texttoinsert textToInsert � �r �q
�r 
insh  n  & 8  "&�p
�p 
insl n  " 4 "�o
�o 
cha  m   !�n�n  n   1  �m
�m 
FCno o  �l�l 0 thedupe theDupe�q   � 	 r  +2

 o  +,�k�k ,0 thewaitingforcontext theWaitingForContext n       m  /1�j
�j 
FCct o  ,/�i�i 0 thedupe theDupe	  r  3< m  34�h
�h 
msng n       1  7;�g
�g 
FCRp o  47�f�f 0 thedupe theDupe �e Z  =��d l =D�c�b A  =D o  =B�a�a 0 daysuntildue daysUntilDue m  BC�`�`  �c  �b   r  GP m  GH�_
�_ 
msng n       1  KO�^
�^ 
FCDd o  HK�]�] 0 thedupe theDupe�d   k  S�  !  Z  S{"#�\$" G  Se%&% l SY'�[�Z' H  SY(( o  SX�Y�Y .0 usetaskdateasbasedate useTaskDateAsBaseDate�[  �Z  & = \a)*) o  \_�X�X "0 originalduedate originalDueDate* m  _`�W
�W 
msng# r  hq+,+ I hm�V�U�T
�V .misccurdldt    ��� null�U  �T  , o      �S�S 0 basedate baseDate�\  $ r  t{-.- o  tw�R�R "0 originalduedate originalDueDate. o      �Q�Q 0 basedate baseDate! /�P/ r  |�010 [  |�232 l |4�O�N4 o  |�M�M 0 basedate baseDate�O  �N  3 ]  �565 m  ��L�L  Q�6 o  ���K�K 0 daysuntildue daysUntilDue1 n      787 1  ���J
�J 
FCDd8 o  ���I�I 0 thedupe theDupe�P  �e  �� 0 anitem anItem � o   � ��H�H $0 theselecteditems theSelectedItems � 9�G9 Z  ��:;�F�E: ?  ��<=< l ��>�D�C> I ���B?�A
�B .corecnte****       ****? o  ���@�@ $0 theselecteditems theSelectedItems�A  �D  �C  = m  ���?�? ; r  ��@A@ o  ���>�> 00 multipleitemscompleted multipleItemsCompletedA o      �=�= 0 	itemtitle 	itemTitle�F  �E  �G   � / ) (first document window whose index is 1)    � �BB R   ( f i r s t   d o c u m e n t   w i n d o w   w h o s e   i n d e x   i s   1 ) � n   O YCDC 1   U Y�<
�< 
FCcnD 4   O U�;E
�; 
FCdwE m   S T�:�: ��   g 4   �9F
�9 
docuF m   
 �8�8  e m    GG�                                                                                  OFOC  alis    X  Macintosh HD               �Ȗ�H+  z�OmniFocus.app                                                  ����t        ����  	                Applications    ���*      ��G�    z�  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  ��   b HIH l     �7�6�5�7  �6  �5  I JKJ l ��L�4�3L Z  ��MN�2�1M > ��OPO o  ���0�0 0 	itemtitle 	itemTitleP m  ���/
�/ 
msngN n ��QRQ I  ���.S�-�. 
0 notify  S TUT m  ��VV �WW 8 C o m p l e t e d   a n d   A w a i t i n g   R e p l yU X�,X o  ���+�+ 0 	itemtitle 	itemTitle�,  �-  R  f  ���2  �1  �4  �3  K YZY l     �*�)�(�*  �)  �(  Z [\[ l      �']^�'  ] � �
	Uses Notification Center to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
   ^ �__\ 
 	 U s e s   N o t i f i c a t i o n   C e n t e r   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
\ `a` i    bcb I      �&d�%�& 
0 notify  d efe o      �$�$ 0 thetitle theTitlef g�#g o      �"�"  0 thedescription theDescription�#  �%  c I    �!hi
�! .sysonotfnull��� ��� TEXTh o     � �   0 thedescription theDescriptioni �jk
� 
apprj o    �� "0 scriptsuitename scriptSuiteNamek �l�
� 
subtl o    	�� 0 thetitle theTitle�  a mnm l     ����  �  �  n o�o l     ����  �  �  �       �p    ,�� L Xqr�  p 	�������
�	�� &0 waitingforcontext waitingForContext� 0 waitingprefix waitingPrefix� 0 
noteprefix 
notePrefix� 0 daysuntildue daysUntilDue� .0 usetaskdateasbasedate useTaskDateAsBaseDate� 00 multipleitemscompleted multipleItemsCompleted�
 "0 scriptsuitename scriptSuiteName�	 
0 notify  
� .aevtoappnull  �   � ****���
� boovtrueq �c��st�� 
0 notify  � �u� u  ��� 0 thetitle theTitle�  0 thedescription theDescription�  s � ���  0 thetitle theTitle��  0 thedescription theDescriptiont ��������
�� 
appr
�� 
subt�� 
�� .sysonotfnull��� ��� TEXT� ��b  �� r ��v����wx��
�� .aevtoappnull  �   � ****v k    �yy  \zz  a{{ J����  ��  ��  w ���� 0 anitem anItemx 1����G����������������|������ � ��������������� ���������������������������������������������V��
�� 
msng�� 0 	itemtitle 	itemTitle
�� 
docu
�� 
kocl
�� 
FCct
�� .OFOCFCCmnull���     ctxt
�� 
cobj
�� 
ID  �� 0 thecontextid theContextID
�� 
FCfc|  �� ,0 thewaitingforcontext theWaitingForContext��  ��  
�� .sysodisAaleR        TEXT
�� 
FCdw
�� 
FCcn
�� 
OTst
�� 
valL�� $0 theselecteditems theSelectedItems
�� .corecnte****       ****
�� 
as A
�� EAlTwarN
�� 
pnam
�� 
insh
�� 
insl
�� .coreclon****      � ****�� 0 thedupe theDupe
�� 
FCDd�� "0 originalduedate originalDueDate
�� 
FCcd�� 0 oldname oldName
�� .misccurdldt    ��� null
�� 
ctxt
�� 
ret �� 0 texttoinsert textToInsert
�� 
FCno
�� 
cha 
�� .TEXTOSinnull���     ctxt
�� 
FCRp
�� 
bool�� 0 basedate baseDate��  Q��� 
0 notify  ����E�O��*�k/� 'b   ��l �k/�,E�O*�k/�[�,\Z�81E�W X  �b   %a %j OhO*a k/a ,T*a -a ,E` O_ j k a a a l OhY hO
_ [��l kh  �a ,E�O�a �a 4l E` O�a  ,E` !Oe�a ",FO_ a ,E` #O_ #b   b  _ #%_ a ,FY hOb  *j $a %&%_ &%E` 'O_ 'a _ a (,a )k/a 3l *O�_ �,FO�_ a +,FOb  j �_ a  ,FY @b  
 _ !� a ,& *j $E` -Y 	_ !E` -O_ -a .b   _ a  ,F[OY�O_ j k b  E�Y hUUUO�� )a /�l+ 0Y hascr  ��ޭ