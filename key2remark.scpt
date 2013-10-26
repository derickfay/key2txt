FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� Convert Keynote Presentation to Remark HTML

by Derick Fay
2013-10-26

usage:
Open a Keynote presentation, then run the script.  Remark ( http://gnab.github.io/remark/#1 ) HTML will be copied to the clipboard.

limitations:
- doesn't do anything with images since they are not readable with Applescript
- ignores transitions
- returns master slides as metadata but does nothing with them - this could be altered to select a class based on corresponding css
     � 	 	�   C o n v e r t   K e y n o t e   P r e s e n t a t i o n   t o   R e m a r k   H T M L 
 
 b y   D e r i c k   F a y 
 2 0 1 3 - 1 0 - 2 6 
 
 u s a g e : 
 O p e n   a   K e y n o t e   p r e s e n t a t i o n ,   t h e n   r u n   t h e   s c r i p t .     R e m a r k   (   h t t p : / / g n a b . g i t h u b . i o / r e m a r k / # 1   )   H T M L   w i l l   b e   c o p i e d   t o   t h e   c l i p b o a r d . 
 
 l i m i t a t i o n s : 
 -   d o e s n ' t   d o   a n y t h i n g   w i t h   i m a g e s   s i n c e   t h e y   a r e   n o t   r e a d a b l e   w i t h   A p p l e s c r i p t 
 -   i g n o r e s   t r a n s i t i o n s 
 -   r e t u r n s   m a s t e r   s l i d e s   a s   m e t a d a t a   b u t   d o e s   n o t h i n g   w i t h   t h e m   -   t h i s   c o u l d   b e   a l t e r e d   t o   s e l e c t   a   c l a s s   b a s e d   o n   c o r r e s p o n d i n g   c s s 
   
  
 l     ��������  ��  ��        l   } ����  O    }    l  |     k   |       l         r        m    ��
�� boovtrue  o      ���� 0 buildbybullet buildByBullet  u o uses the trick described here https://github.com/gnab/remark/issues/46 to simulate a build-in by bullet point      �   �   u s e s   t h e   t r i c k   d e s c r i b e d   h e r e   h t t p s : / / g i t h u b . c o m / g n a b / r e m a r k / i s s u e s / 4 6   t o   s i m u l a t e   a   b u i l d - i n   b y   b u l l e t   p o i n t        r         m    	 ! ! � " "  
 
   o      ���� 0 lfs     # $ # r     % & % m     ' ' � ( (   & o      ���� 0 mdresult mdResult $  ) * ) r     + , + m    ����   , o      ���� 0 x   *  - . - r     / 0 / n     1 2 1 2   ��
�� 
KnSd 2 4    �� 3
�� 
docu 3 m    ����  0 o      ���� 0 theshow theShow .  4 5 4 r    ( 6 7 6 n    & 8 9 8 1   $ &��
�� 
titl 9 n    $ : ; : 4   ! $�� <
�� 
KnSd < m   " #����  ; 4    !�� =
�� 
docu = m     ����  7 o      ���� 0 theshowtitle theShowTitle 5  >�� > X   )| ?�� @ ? k   9w A A  B C B l  9 9�� D E��   D   ignore skipped slides    E � F F ,   i g n o r e   s k i p p e d   s l i d e s C  G�� G Z   9w H I���� H =  9 > J K J n   9 < L M L 1   : <��
�� 
KSHd M o   9 :���� 0 myslide mySlide K m   < =��
�� boovfals I k   As N N  O P O l  A A�� Q R��   Q ) # collect the contents of the slides    R � S S F   c o l l e c t   t h e   c o n t e n t s   o f   t h e   s l i d e s P  T U T r   A H V W V n   A D X Y X 1   B D��
�� 
titl Y o   A B���� 0 myslide mySlide W o      ���� 0 thetitle theTitle U  Z [ Z r   I R \ ] \ n   I N ^ _ ^ 1   J N��
�� 
btxt _ o   I J���� 0 myslide mySlide ] o      ���� 0 thebody theBody [  ` a ` r   S ^ b c b n   S Z d e d 2  V Z��
�� 
cpar e o   S V���� 0 thebody theBody c o      ���� 0 
eachbullet 
eachBullet a  f g f r   _ h h i h n   _ d j k j 1   ` d��
�� 
KnSn k o   _ `���� 0 myslide mySlide i o      ���� 0 thenotes theNotes g  l m l r   i t n o n n   i p p q p 2  l p��
�� 
cpar q o   i l���� 0 thenotes theNotes o o      ���� 0 eachnote eachNote m  r s r r   u ~ t u t n   u z v w v 1   v z��
�� 
KnMP w o   u v���� 0 myslide mySlide u o      ���� 0 	themaster 	theMaster s  x y x l   ��������  ��  ��   y  z { z l   �� | }��   |  create the markdown    } � ~ ~ & c r e a t e   t h e   m a r k d o w n {   �  r    � � � � b    � � � � b    � � � � b    � � � � o    ����� 0 mdresult mdResult � m   � � � � � � �  m a s t e r :   � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 	themaster 	theMaster � o   � ����� 0 lfs   � o      ���� 0 mdresult mdResult �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �   ignore blank text fields    � � � � 2   i g n o r e   b l a n k   t e x t   f i e l d s �  � � � Z   � � � ����� � >  � � � � � o   � ����� 0 thetitle theTitle � m   � � � � � � � ( D o u b l e - c l i c k   t o   e d i t � r   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 mdresult mdResult � m   � � � � � � �  #   � o   � ����� 0 thetitle theTitle � o   � ����� 0 lfs   � o      ���� 0 mdresult mdResult��  ��   �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � m   � �����   � o      ���� 0 y   �  � � � X   � ��� � � Z   � � ����� � >  � � � � � c   � � � � � o   � ����� 0 i   � m   � ���
�� 
TEXT � m   � � � � � � � ( D o u b l e - c l i c k   t o   e d i t � k   �
 � �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 mdresult mdResult � m   � � � � � � �  -   � o   � ����� 0 i   � o   � ����� 0 lfs   � o      ���� 0 mdresult mdResult �  � � � r   � � � � � [   � � � � � o   � ����� 0 y   � m   � �����  � o      ���� 0 y   �  ��� � Z   �
 � ����� � A   � � � � � o   � ����� 0 y   � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� 0 
eachbullet 
eachBullet��  ��  ��   � Z   � � ����� � o   � ����� 0 buildbybullet buildByBullet � r   � � � � b   �  � � � b   � � � � � o   � ����� 0 mdresult mdResult � m   � � � � � � �  - - � o   � ����� 0 lfs   � o      ���� 0 mdresult mdResult��  ��  ��  ��  ��  ��  ��  �� 0 i   � o   � ����� 0 
eachbullet 
eachBullet �  � � � l ��������  ��  ��   �  � � � l �� � ���   � F @ comment out the following if�end if to exclude presenter notes     � � � � �   c o m m e n t   o u t   t h e   f o l l o w i n g   i f & e n d   i f   t o   e x c l u d e   p r e s e n t e r   n o t e s   �  � � � Z  U � ����� � >  � � � o  ���� 0 eachnote eachNote � J  ����   � k  Q � �  � � � l & � � � � r  & � � � b  $ � � � b  " � � � o  ���� 0 mdresult mdResult � m  ! � � � � �  ? ? ? � o  "#���� 0 lfs   � o      ���� 0 mdresult mdResult � 4 .use Remark Markdown format for presenter notes    � � � � \ u s e   R e m a r k   M a r k d o w n   f o r m a t   f o r   p r e s e n t e r   n o t e s �  ��� � X  'Q ��� � � Z  9L � ����� � > 9> � � � o  9:���� 0 i   � m  := � � �     � r  AH b  AF b  AD o  AB���� 0 mdresult mdResult o  BC���� 0 i   o  DE���� 0 lfs   o      ���� 0 mdresult mdResult��  ��  �� 0 i   � o  *-���� 0 eachnote eachNote��  ��  ��   �  l VV��������  ��  ��   	
	 l VV��   a [ add a new slide unless this is the last slide - i.e. avoid having a blank slide at the end    � �   a d d   a   n e w   s l i d e   u n l e s s   t h i s   i s   t h e   l a s t   s l i d e   -   i . e .   a v o i d   h a v i n g   a   b l a n k   s l i d e   a t   t h e   e n d
  r  V[ [  VY o  VW�~�~ 0 x   m  WX�}�}  o      �|�| 0 x   �{ Z  \s�z�y A  \c o  \]�x�x 0 x   l ]b�w�v I ]b�u�t
�u .corecnte****       **** o  ]^�s�s 0 theshow theShow�t  �w  �v   r  fo b  fm b  fk  o  fg�r�r 0 mdresult mdResult  m  gj!! �""  - - - o  kl�q�q 0 lfs   o      �p�p 0 mdresult mdResult�z  �y  �{  ��  ��  ��  �� 0 myslide mySlide @ o   , -�o�o 0 theshow theShow��    N H Change to "Keynote" if you haven't installed Oct 2013 version of iWork      �## �   C h a n g e   t o   " K e y n o t e "   i f   y o u   h a v e n ' t   i n s t a l l e d   O c t   2 0 1 3   v e r s i o n   o f   i W o r k    m     $$�                                                                                  keyn  alis    n  	Dragonfly                  �V+H+   ��Keynote 5.3.app                                                 ���sV�        ����  	                	iWork '09     �V��      �s�z     ����  2Dragonfly:Applications: iWork '09: Keynote 5.3.app     K e y n o t e   5 . 3 . a p p   	 D r a g o n f l y  &Applications/iWork '09/Keynote 5.3.app  / ��  ��  ��    %&% l     �n�m�l�n  �m  �l  & '(' l ~�)�k�j) r  ~�*+* b  ~�,-, b  ~�./. b  ~�010 b  ~�232 m  ~�44 �55 V < ! D O C T Y P E   h t m l > 
 < h t m l > 
     < h e a d > 
         < t i t l e >3 o  ���i�i 0 theshowtitle theShowTitle1 m  ��66 �77� < / t i t l e > 
         < m e t a   h t t p - e q u i v = ' C o n t e n t - T y p e '   c o n t e n t = ' t e x t / h t m l ;   c h a r s e t = U T F - 8 ' / > 
         < s t y l e   t y p e = ' t e x t / c s s ' > 
             / *   S l i d e s h o w   s t y l e s   * / 
         < / s t y l e > 
     < / h e a d > 
     < b o d y > 
         < t e x t a r e a   i d = ' s o u r c e ' > 
/ o  ���h�h 0 mdresult mdResult- m  ��88 �99� < / t e x t a r e a > 
         < s c r i p t   s r c = ' h t t p : / / g n a b . g i t h u b . i o / r e m a r k / d o w n l o a d s / r e m a r k - 0 . 5 . 9 . m i n . j s '   t y p e = ' t e x t / j a v a s c r i p t ' > 
         < / s c r i p t > 
         < s c r i p t   t y p e = ' t e x t / j a v a s c r i p t ' > 
             v a r   s l i d e s h o w   =   r e m a r k . c r e a t e ( ) ; 
         < / s c r i p t > 
     < / b o d y > 
 < / h t m l >+ o      �g�g 0 mdresult mdResult�k  �j  ( :;: l     �f�e�d�f  �e  �d  ; <�c< l ��=�b�a= I ���`>�_
�` .JonspClpnull���     ****> o  ���^�^ 0 mdresult mdResult�_  �b  �a  �c       �]?@�]  ? �\
�\ .aevtoappnull  �   � ****@ �[A�Z�YBC�X
�[ .aevtoappnull  �   � ****A k    �DD  EE 'FF <�W�W  �Z  �Y  B �V�U�V 0 myslide mySlide�U 0 i  C *$�T !�S '�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�> ��= � ��<�; � � � � �!468�:�T 0 buildbybullet buildByBullet�S 0 lfs  �R 0 mdresult mdResult�Q 0 x  
�P 
docu
�O 
KnSd�N 0 theshow theShow
�M 
titl�L 0 theshowtitle theShowTitle
�K 
kocl
�J 
cobj
�I .corecnte****       ****
�H 
KSHd�G 0 thetitle theTitle
�F 
btxt�E 0 thebody theBody
�D 
cpar�C 0 
eachbullet 
eachBullet
�B 
KnSn�A 0 thenotes theNotes�@ 0 eachnote eachNote
�? 
KnMP�> 0 	themaster 	theMaster
�= 
pnam�< 0 y  
�; 
TEXT
�: .JonspClpnull���     ****�X��zeE�O�E�O�E�OjE�O*�k/�-E�O*�k/�k/�,E�OR�[��l kh  ��,f 7��,E` O�a ,E` O_ a -E` O�a ,E` O_ a -E` O�a ,E` O�a %_ a ,%�%E�O_ a  �a %_ %�%E�Y hOjE` O __ [��l kh �a &a   >�a !%�%�%E�O_ kE` O_ _ j  � �a "%�%E�Y hY hY h[OY��O_ jv 9�a #%�%E�O )_ [��l kh �a $ š%�%E�Y h[OY��Y hO�kE�O��j  �a %%�%E�Y hY h[OY��UOa &�%a '%�%a (%E�O�j )ascr  ��ޭ