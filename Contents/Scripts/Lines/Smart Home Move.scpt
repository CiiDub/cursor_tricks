FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � �
  Smart Home Move
  Kendall Conrad of Angelwatt.com
  Acts like IDE home key. First will go to right before first visible character on line. Hit a second time will go to true home position of line.
  Created: 2010-07-31
  Updated: 2012-06-03
     � 	 	� 
     S m a r t   H o m e   M o v e 
     K e n d a l l   C o n r a d   o f   A n g e l w a t t . c o m 
     A c t s   l i k e   I D E   h o m e   k e y .   F i r s t   w i l l   g o   t o   r i g h t   b e f o r e   f i r s t   v i s i b l e   c h a r a c t e r   o n   l i n e .   H i t   a   s e c o n d   t i m e   w i l l   g o   t o   t r u e   h o m e   p o s i t i o n   o f   l i n e . 
     C r e a t e d :   2 0 1 0 - 0 7 - 3 1 
     U p d a t e d :   2 0 1 2 - 0 6 - 0 3 
   
  
 l     ��������  ��  ��     ��  l   Z ����  O   Z    O   Y    k   X       l   ��  ��    ' ! Accommodation for search windows     �   B   A c c o m m o d a t i o n   f o r   s e a r c h   w i n d o w s      Z    :  ����  G    $    G        =       !   1    ��
�� 
pnam ! m     " " � # #  F i n d  =     $ % $ 1    ��
�� 
pnam % m     & & � ' ' $ P a t t e r n   P l a y g r o u n d  =    " ( ) ( 1     ��
�� 
pnam ) m     ! * * � + + " M u l t i - F i l e   S e a r c h  k   ' 6 , ,  - . - O  ' 3 / 0 / I  + 2�� 1 2
�� .prcskcodnull���     **** 1 m   + ,���� ~ 2 �� 3��
�� 
faal 3 m   - .��
�� eMdsKcmd��   0 m   ' ( 4 4�                                                                                  sevs  alis    Z  Betty's SSD                    BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p    B e t t y ' s   S S D  -System/Library/CoreServices/System Events.app   / ��   .  5�� 5 L   4 6����  ��  ��  ��     6 7 6 l  ; ;�� 8 9��   8 1 + Grab line number and offset of text cursor    9 � : : V   G r a b   l i n e   n u m b e r   a n d   o f f s e t   o f   t e x t   c u r s o r 7  ; < ; O  ; ] = > = r   A \ ? @ ? J   A I A A  B C B 1   A D��
�� 
SLin C  D�� D 1   D G��
�� 
Ofse��   @ J       E E  F G F o      ���� 0 _n   G  H�� H o      ���� 0 _selectionstart  ��   > l  ; > I���� I 1   ; >��
�� 
pusl��  ��   <  J K J l  ^ ^�� L M��   L G A Grab offset of line in the document and the contents of the line    M � N N �   G r a b   o f f s e t   o f   l i n e   i n   t h e   d o c u m e n t   a n d   t h e   c o n t e n t s   o f   t h e   l i n e K  O P O O  ^ � Q R Q r   i � S T S J   i s U U  V W V 1   i l��
�� 
Ofse W  X�� X 1   l q��
�� 
pcnt��   T J       Y Y  Z [ Z o      ���� 0 
_linestart   [  \�� \ o      ���� 	0 _line  ��   R 4   ^ f�� ]
�� 
clin ] o   b e���� 0 _n   P  ^ _ ^ r   � � ` a ` \   � � b c b o   � ����� 0 _selectionstart   c o   � ����� 0 
_linestart   a o      ���� 0 _cursor   _  d e d r   � � f g f m   � �����   g o      ���� 
0 _smart   e  h i h l  � ��� j k��   j A ; Go through content of line looking for smart home position    k � l l v   G o   t h r o u g h   c o n t e n t   o f   l i n e   l o o k i n g   f o r   s m a r t   h o m e   p o s i t i o n i  m n m r   � � o p o I  � ��� q��
�� .corecnte****       **** q o   � ����� 	0 _line  ��   p o      ���� 0 _len   n  r s r l  � ��� t u��   t   Ensure line is not empty    u � v v 2   E n s u r e   l i n e   i s   n o t   e m p t y s  w x w Z  � � y z���� y =   � � { | { o   � ����� 0 _len   | m   � �����   z L   � �����  ��  ��   x  } ~ } l  � ���  ���    1 + Traverse line to find first non-whitespace    � � � � V   T r a v e r s e   l i n e   t o   f i n d   f i r s t   n o n - w h i t e s p a c e ~  � � � r   � � � � � I  � ��� ���
�� .sysontocTEXT       shor � m   � ����� ���   � o      ���� 	0 _nbsp   �  � � � r   � � � � � I  � ��� � �
�� .R*chFindnull���     ctxt � b   � � � � � b   � � � � � m   � � � � � � � 
 ( ^ [ \ s � o   � ����� 	0 _nbsp   � m   � � � � � � �  * # + - ] * ) � �� � �
�� 
Opts � K   � � � � �� ���
�� 
SMod � m   � ���
�� SModGrep��   � �� ���
�� 
FnIn � 4   � ��� �
�� 
clin � o   � ����� 0 _n  ��   � o      ���� 0 	theresult 	theResult �  � � � Z   � � ����� � n   � � � � � 1   � ���
�� 
Fnd? � o   � ����� 0 	theresult 	theResult � r   � � � � n   � � � � 1   ���
�� 
leng � l  � � ����� � n   � � � � � 1   � ���
�� 
MTxt � o   � ����� 0 	theresult 	theResult��  ��   � o      ���� 
0 _smart  ��  ��   �  � � � l �� � ���   � 4 . Only true if there was no starting whitespace    � � � � \   O n l y   t r u e   i f   t h e r e   w a s   n o   s t a r t i n g   w h i t e s p a c e �  � � � Z  # � ����� � =   � � � o  ���� 
0 _smart   � m  ����   � k   � �  � � � r   � � � m  ����  � o      ���� 
0 _smart   �  ��� � r   � � � m  ����  � o      ���� 0 _cursor  ��  ��  ��   �  � � � l $$�� � ���   � - ' Check if not at smart position already    � � � � N   C h e c k   i f   n o t   a t   s m a r t   p o s i t i o n   a l r e a d y �  ��� � Z  $X � ��� � � > $+ � � � o  $'���� 0 _cursor   � o  '*���� 
0 _smart   � l .E � � � � I .E�� ���
�� .miscslctnull��� ��� obj  � n  .A � � � n  6A � � � 9  =A��
�� 
cins � 4  6=�� �
�� 
cha  � o  9<���� 
0 _smart   � 4  .6�� �
�� 
clin � o  25���� 0 _n  ��   �   Go to smart home    � � � � "   G o   t o   s m a r t   h o m e��   � l HX � � � � I HX�� ���
�� .miscslctnull��� ��� obj  � n  HT � � � 8  PT��
�� 
cins � 4  HP�� �
�� 
clin � o  LO���� 0 _n  ��   �   Just go to start of line    � � � � 2   J u s t   g o   t o   s t a r t   o f   l i n e��    4   �� �
�� 
cwin � m    ����   m      � �~                                                                                  R*ch  alis       Betty's SSD                    BD ����
BBEdit.app                                                     ����            ����  
 cu             Applications  /:Applications:BBEdit.app/   
 B B E d i t . a p p    B e t t y ' s   S S D  Applications/BBEdit.app   / ��  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k    Z � �  ����  ��  ��   �   � , ����� " &�� * 4����������������~�}�|�{�z�y�x�w�v�u�t�s�r � ��q�p�o�n�m�l�k�j�i�h�g�f�e
�� 
cwin
�� 
pnam
�� 
bool�� ~
�� 
faal
�� eMdsKcmd
�� .prcskcodnull���     ****
�� 
pusl
�� 
SLin
�� 
Ofse
� 
cobj�~ 0 _n  �} 0 _selectionstart  
�| 
clin
�{ 
pcnt�z 0 
_linestart  �y 	0 _line  �x 0 _cursor  �w 
0 _smart  
�v .corecnte****       ****�u 0 _len  �t �
�s .sysontocTEXT       shor�r 	0 _nbsp  
�q 
Opts
�p 
SMod
�o SModGrep
�n 
FnIn�m 
�l .R*chFindnull���     ctxt�k 0 	theresult 	theResult
�j 
Fnd?
�i 
MTxt
�h 
leng
�g 
cha 
�f 
cins
�e .miscslctnull��� ��� obj ��[�W*�k/O*�,� 
 	*�,� �&
 	*�,� �& � 	���l UOhY hO*�, *�,*�,lvE[�k/E` Z[�l/E` ZUO*a _ / *�,*a ,lvE[�k/E` Z[�l/E` ZUO_ _ E` OjE` O_ j E` O_ j  hY hOa j E` Oa _ %a %a a  a !la "*a _ /a # $E` %O_ %a &,E _ %a ',a (,E` Y hO_ j  kE` OkE` Y hO_ _  *a _ /a )_ /a *4j +Y *a _ /a *3j +UUascr  ��ޭ