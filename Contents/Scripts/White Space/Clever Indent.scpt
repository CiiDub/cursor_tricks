FasdUAS 1.101.10   ��   ��    k             l     ��  ��      Sub-routines     � 	 	    S u b - r o u t i n e s   
  
 l     ��  ��    } w Input: String, Regex and Sub-Capture Group  | Output: Record with entry success:bool and optional entry capture:string     �   �   I n p u t :   S t r i n g ,   R e g e x   a n d   S u b - C a p t u r e   G r o u p     |   O u t p u t :   R e c o r d   w i t h   e n t r y   s u c c e s s : b o o l   a n d   o p t i o n a l   e n t r y   c a p t u r e : s t r i n g      i         I      �� ���� 0 
teststring 
testString      o      ���� 0 search_this        o      ���� 	0 regex     ��  o      ���� 	0 cap_g  ��  ��    k     ]       r         b         n     	   !   1    	��
�� 
psxp ! l     "���� " I    �� # $
�� .earsffdralis        afdr # m     ��
�� afdmasup $ �� %��
�� 
from % m    ��
�� fldmfldu��  ��  ��    m   	 
 & & � ' ' � B B E d i t / P a c k a g e s / C u r s o r   T r i c k s . b b p a c k a g e / C o n t e n t s / R e s o u r c e s / c h e c k _ s t r i n g . r b  o      ���� 0 _script     (�� ( Q    ] ) * + ) k    P , ,  - . - r    , / 0 / I   *�� 1��
�� .sysoexecTEXT���     TEXT 1 b    & 2 3 2 b    $ 4 5 4 b    " 6 7 6 b     8 9 8 b     : ; : b     < = < b     > ? > m     @ @ � A A 
 r u b y   ? n     B C B 1    ��
�� 
strq C o    ���� 0 _script   = m     D D � E E    ; n     F G F 1    ��
�� 
strq G o    ���� 0 search_this   9 m     H H � I I    7 n    ! J K J 1    !��
�� 
strq K o    ���� 	0 regex   5 m   " # L L � M M    3 o   $ %���� 	0 cap_g  ��   0 o      ���� 0 x   .  N O N r   - 6 P Q P I   - 4�� R���� 0 thesplit theSplit R  S T S o   . /���� 0 x   T  U�� U m   / 0 V V � W W %���  ��   Q o      ���� 0 caps   O  X�� X L   7 P Y Y K   7 O Z Z �� [ \�� 0 success   [ m   8 9��
�� boovtrue \ �� ] ^�� 0 captured   ] l  : A _���� _ n   : A ` a ` 4   ; @�� b
�� 
cobj b m   > ?����  a o   : ;���� 0 caps  ��  ��   ^ �� c���� 0 sub_cap   c l  D K d���� d n   D K e f e 4   E J�� g
�� 
cobj g m   H I����  f o   D E���� 0 caps  ��  ��  ��  ��   * R      ������
�� .ascrerr ****      � ****��  ��   + L   X ] h h K   X \ i i �� j���� 0 success   j m   Y Z��
�� boovfals��  ��     k l k l     ��������  ��  ��   l  m n m i     o p o I      �� q���� 0 thesplit theSplit q  r s r o      ���� 0 	thestring 	theString s  t�� t o      ���� 0 thedelimiter theDelimiter��  ��   p k      u u  v w v l     �� x y��   x . ( save delimiters to restore old settings    y � z z P   s a v e   d e l i m i t e r s   t o   r e s t o r e   o l d   s e t t i n g s w  { | { r      } ~ } n      �  1    ��
�� 
txdl � 1     ��
�� 
ascr ~ o      ���� 0 olddelimiters oldDelimiters |  � � � l   �� � ���   � - ' set delimiters to delimiter to be used    � � � � N   s e t   d e l i m i t e r s   t o   d e l i m i t e r   t o   b e   u s e d �  � � � r     � � � o    ���� 0 thedelimiter theDelimiter � n      � � � 1    
��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   create the array    � � � � "   c r e a t e   t h e   a r r a y �  � � � r     � � � n     � � � 2    ��
�� 
citm � o    ���� 0 	thestring 	theString � o      ���� 0 thearray theArray �  � � � l   �� � ���   �   restore the old setting    � � � � 0   r e s t o r e   t h e   o l d   s e t t i n g �  � � � r     � � � o    ���� 0 olddelimiters oldDelimiters � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � l   �� � ���   �   return the result    � � � � $   r e t u r n   t h e   r e s u l t �  ��� � L     � � o    ���� 0 thearray theArray��   n  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 3 - Reset selection after cleaning up whitespace    � � � � Z   R e s e t   s e l e c t i o n   a f t e r   c l e a n i n g   u p   w h i t e s p a c e �  � � � i     � � � I      �� ����� 0 reset_selection   �  � � � o      ���� 0 c   �  ��� � o      ���� 0 c_l  ��  ��   � O     � � � I   �� ���
�� .miscslctnull��� ��� obj  � l    ����� � 7   �� � �
�� 
cha  � l    ����� � \     � � � o    ���� 0 c   � m    ���� ��  ��   � l    ����� � \     � � � o    ���� 0 c_l   � m    ���� ��  ��  ��  ��  ��   � n      � � � 4    �� �
�� 
cwin � m    ����  � m      � �~                                                                                  R*ch  alis       Betty's SSD                    BD ����
BBEdit.app                                                     ����            ����  
 cu             Applications  /:Applications:BBEdit.app/   
 B B E d i t . a p p    B e t t y ' s   S S D  Applications/BBEdit.app   / ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 clean_up_whitespace   �  � � � o      ���� 0 _captured_of   �  � � � o      ���� 0 _cursor   �  ��� � o      ���� 0 _cursor_length  ��  ��   � O     : � � � Z    9 � ����� � =     � � � n     � � � 4    �� �
�� 
cha  � m   	 
������ � o    ���� 0 _captured_of   � m     � � � � �    � k    5 � �  � � � r    # � � � m     � � � � �   � n       � � � 1     "��
�� 
pcnt � 7    �� � �
�� 
cha  � l    ����� � \     � � � o    ���� 0 _cursor   � m    ���� ��  ��   � l    ���� � \     � � � o    �~�~ 0 _cursor   � m    �}�} ��  �   �  ��| � Z  $ 5 � ��{�z � A   $ ' � � � o   $ %�y�y 0 _cursor   � o   % &�x�x 0 _cursor_length   � n  * 1 � � � I   + 1�w ��v�w 0 reset_selection   �  � � � o   + ,�u�u 0 _cursor   �  ��t � o   , -�s�s 0 _cursor_length  �t  �v   �  f   * +�{  �z  �|  ��  ��   � n      � � � 4    �r �
�r 
docu � m    �q�q  � m      � �~                                                                                  R*ch  alis       Betty's SSD                    BD ����
BBEdit.app                                                     ����            ����  
 cu             Applications  /:Applications:BBEdit.app/   
 B B E d i t . a p p    B e t t y ' s   S S D  Applications/BBEdit.app   / ��   �  �  � l     �p�o�n�p  �o  �n     l     �m�m    
 Clippings    �    C l i p p i n g s  l     �l	�l   J D This is the equivalent to ../../../ POSIX path. Thank you Dr. Drang   	 �

 �   T h i s   i s   t h e   e q u i v a l e n t   t o   . . / . . / . . /   P O S I X   p a t h .   T h a n k   y o u   D r .   D r a n g  l    �k�j O     r     c     n     m    �i
�i 
ctnr n     m    �h
�h 
ctnr n     m   	 �g
�g 
ctnr l   	�f�e I   	�d�c
�d .earsffdralis        afdr  f    �c  �f  �e   m    �b
�b 
ctxt o      �a�a 
0 c_path   m     �                                                                                  MACS  alis    >  Betty's SSD                    BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    B e t t y ' s   S S D  &System/Library/CoreServices/Finder.app  / ��  �k  �j    l   �`�_ r     !  b    "#" n    $%$ 1    �^
�^ 
psxp% o    �]�] 
0 c_path  # m    && �''  R e s o u r c e s /! o      �\�\ 0 home  �`  �_   ()( l   %*�[�Z* r    %+,+ 4    #�Y-
�Y 
psxf- l   ".�X�W. b    "/0/ o     �V�V 0 home  0 m     !11 �22  o n e _ o v e r�X  �W  , o      �U�U 0 one_over  �[  �Z  ) 343 l  & .5�T�S5 r   & .676 4   & ,�R8
�R 
psxf8 l  ( +9�Q�P9 b   ( +:;: o   ( )�O�O 0 home  ; m   ) *<< �==  w r a p p e d�Q  �P  7 o      �N�N 0 wrapped  �T  �S  4 >?> l  / 7@�M�L@ r   / 7ABA 4   / 5�KC
�K 
psxfC l  1 4D�J�ID b   1 4EFE o   1 2�H�H 0 home  F m   2 3GG �HH 
 e n d e d�J  �I  B o      �G�G 	0 ended  �M  �L  ? IJI l  8 BK�F�EK r   8 BLML 4   8 >�DN
�D 
psxfN l  : =O�C�BO b   : =PQP o   : ;�A�A 0 home  Q m   ; <RR �SS  b l o c k _ p a r a m�C  �B  M o      �@�@ 0 block_param  �F  �E  J TUT l  C OV�?�>V r   C OWXW 4   C K�=Y
�= 
psxfY l  E JZ�<�;Z b   E J[\[ o   E F�:�: 0 home  \ m   F I]] �^^  b a s h _ l o o p�<  �;  X o      �9�9 0 	bash_loop  �?  �>  U _`_ l  P \a�8�7a r   P \bcb 4   P X�6d
�6 
psxfd l  R We�5�4e b   R Wfgf o   R S�3�3 0 home  g m   S Vhh �ii  b a s h _ i f�5  �4  c o      �2�2 0 bash_if  �8  �7  ` jkj l  ] il�1�0l r   ] imnm 4   ] e�/o
�/ 
psxfo l  _ dp�.�-p b   _ dqrq o   _ `�,�, 0 home  r m   ` css �tt  b a s h _ c a s e�.  �-  n o      �+�+ 0 	bash_case  �1  �0  k uvu l  j vw�*�)w r   j vxyx 4   j r�(z
�( 
psxfz l  l q{�'�&{ b   l q|}| o   l m�%�% 0 home  } m   m p~~ �  b a s h _ e l i f�'  �&  y o      �$�$ 0 	bash_elif  �*  �)  v ��� l     �#�"�!�#  �"  �!  � ��� l  w ~�� �� r   w ~��� m   w z�� ��� N [ { \ [ ( ' " \ ` ]   ? $ | ( < [ a - z ] * )   ? [ 0 - 9 a - z " =   ] * > $� o      �� 0 open_bracket  �   �  � ��� l   ����� r    ���� m    ��� ��� 8 ^   ? [ \ ] } ) ' " \ ` ] | ^   ? < / [ a - z ] +   ? >� o      �� 0 close_bracket  �  �  � ��� l     ����  �  �  � ��� l  ������ O   ����� k   ���� ��� Q   � ����� r   � ���� n   � ���� 1   � ��
� 
SoLn� 4   � ���
� 
docu� m   � ��� � o      �� 0 doc_lang  � R      ���
� .ascrerr ****      � ****�  �  � r   � ���� m   � ��� ���  m i s s i n g   v a l u e� o      �� 0 doc_lang  � ��� r   � ���� n   � ���� 1   � ��
� 
SLin� 1   � ��
� 
pusl� o      �
�
 0 
start_line  � ��� r   � ���� n   � ���� 1   � ��	
�	 
Ofse� 4   � ���
� 
clin� o   � ��� 0 
start_line  � o      �� 0 line_offset  � ��� r   � ���� n   � ���� 1   � ��
� 
leng� 4   � ���
� 
clin� o   � ��� 0 
start_line  � o      �� 0 line_length  � ��� l  � ��� ���  �   ��  � ��� r   � ���� n   � ���� 1   � ���
�� 
ELin� 1   � ���
�� 
pusl� o      ���� 0 end_line  � ��� r   ���� n   � ���� 1   � ���
�� 
Ofse� 4   � ����
�� 
clin� o   � ����� 0 end_line  � o      ���� 0 end_line_offset  � ��� r  ��� n  ��� 1  
��
�� 
leng� 4  
���
�� 
clin� o  	���� 0 end_line  � o      ���� 0 end_line_length  � ��� l ��������  ��  ��  � ��� r   ��� n  ��� 1  ��
�� 
Ofse� 1  ��
�� 
pusl� o      ���� 
0 cursor  � ��� r  !2��� [  !.��� l !*������ n  !*��� 1  &*��
�� 
leng� 1  !&��
�� 
pusl��  ��  � o  *-���� 
0 cursor  � o      ���� 0 cursor_length  � ��� r  3@��� I 3<�����
�� .corecnte****       ****� 2 38��
�� 
clin��  � o      ���� 0 
doc_length  � ��� l AA��������  ��  ��  � ���� O  A���� k  J��� ��� l JJ������  � c ] Set start_text to text on the current line between the cursor and the beginning of the line.   � ��� �   S e t   s t a r t _ t e x t   t o   t e x t   o n   t h e   c u r r e n t   l i n e   b e t w e e n   t h e   c u r s o r   a n d   t h e   b e g i n n i n g   o f   t h e   l i n e .� ��� l JJ������  � F @ The cursor sits on top of one character so it is offset by one.   � ��� �   T h e   c u r s o r   s i t s   o n   t o p   o f   o n e   c h a r a c t e r   s o   i t   i s   o f f s e t   b y   o n e .� ��� l JJ������  � > 8 Set start_text to empty string if at beginning of line.   � ��� p   S e t   s t a r t _ t e x t   t o   e m p t y   s t r i n g   i f   a t   b e g i n n i n g   o f   l i n e .� ��� Z  J}������ =  JQ� � o  JM���� 0 line_offset    o  MP���� 
0 cursor  � r  T[ m  TW �   o      ���� 0 
start_text  ��  � r  ^} c  ^y n  ^u	
	 1  qu��
�� 
pcnt
 7 ^q��
�� 
cha  o  ei���� 0 line_offset   l jp���� \  jp o  kn���� 
0 cursor   m  no���� ��  ��   m  ux��
�� 
TEXT o      ���� 0 
start_text  �  l ~~����   C = Set end_text to line text (including) cursor to end of line.    � z   S e t   e n d _ t e x t   t o   l i n e   t e x t   ( i n c l u d i n g )   c u r s o r   t o   e n d   o f   l i n e .  l ~~����   @ : Set end_text to empty sting when at end of line/document.    � t   S e t   e n d _ t e x t   t o   e m p t y   s t i n g   w h e n   a t   e n d   o f   l i n e / d o c u m e n t .  Z  ~��� @  ~�  o  ~����� 0 cursor_length    [  ��!"! o  ������ 0 end_line_offset  " o  ������ 0 end_line_length   r  ��#$# m  ��%% �&&  $ o      ���� 0 end_text  ��   k  ��'' ()( r  ��*+* m  ������  + o      ���� 0 	ll_offset  ) ,-, Z ��./����. =  ��010 o  ������ 0 
doc_length  1 o  ������ 0 end_line  / r  ��232 m  ������ 3 o      ���� 0 	ll_offset  ��  ��  - 4��4 r  ��565 c  ��787 n  ��9:9 1  ����
�� 
pcnt: 7 ����;<
�� 
cha ; o  ������ 0 cursor_length  < l ��=����= \  ��>?> [  ��@A@ o  ������ 0 end_line_offset  A o  ������ 0 end_line_length  ? o  ������ 0 	ll_offset  ��  ��  8 m  ����
�� 
TEXT6 o      ���� 0 end_text  ��   BCB l ����������  ��  ��  C DED l ����FG��  F ] W Check the line in front (start_text) and behind (end_text) the cursor against a regex.   G �HH �   C h e c k   t h e   l i n e   i n   f r o n t   ( s t a r t _ t e x t )   a n d   b e h i n d   ( e n d _ t e x t )   t h e   c u r s o r   a g a i n s t   a   r e g e x .E IJI r  ��KLK n ��MNM I  ����O���� 0 
teststring 
testStringO PQP o  ������ 0 
start_text  Q RSR o  ������ 0 open_bracket  S T��T m  ��UU �VV  ��  ��  N  f  ��L o      ���� 0 start_results  J WXW r  ��YZY n ��[\[ I  ����]���� 0 
teststring 
testString] ^_^ o  ������ 0 end_text  _ `a` o  ������ 0 close_bracket  a b��b m  ��cc �dd  ��  ��  \  f  ��Z o      ���� 0 end_results  X efe l ����������  ��  ��  f ghg l ����������  ��  ��  h iji l ����kl��  k  ## INDENTION LOGIC    l �mm & # #   I N D E N T I O N   L O G I C  j non l ����������  ��  ��  o pqp l ����������  ��  ��  q rsr l ����tu��  t "  Note: Indent wrapped cursor   u �vv 8   N o t e :   I n d e n t   w r a p p e d   c u r s o rs wxw l ����yz��  y E ? If there is a bracketing character on both sides of the cursor   z �{{ ~   I f   t h e r e   i s   a   b r a c k e t i n g   c h a r a c t e r   o n   b o t h   s i d e s   o f   t h e   c u r s o rx |}| Z  ��~����~ F  ���� n  ���� o  ����� 0 success  � o  ������ 0 start_results  � n  ��� o  
���� 0 success  � o  
���� 0 end_results   k  ~�� ��� l ������  �   Whitespace clean up.   � ��� *   W h i t e s p a c e   c l e a n   u p .� ��� l ������  � M G I allowed for an optional space when detecting the bracket characters.   � ��� �   I   a l l o w e d   f o r   a n   o p t i o n a l   s p a c e   w h e n   d e t e c t i n g   t h e   b r a c k e t   c h a r a c t e r s .� ��� l ������  � h b Because I like to pad my brackets, I even have a clipping for it, I figured it could be an issue.   � ��� �   B e c a u s e   I   l i k e   t o   p a d   m y   b r a c k e t s ,   I   e v e n   h a v e   a   c l i p p i n g   f o r   i t ,   I   f i g u r e d   i t   c o u l d   b e   a n   i s s u e .� ��� l ������  � ? 9 Also tapping a space is an easy way to dismiss autofill.   � ��� r   A l s o   t a p p i n g   a   s p a c e   i s   a n   e a s y   w a y   t o   d i s m i s s   a u t o f i l l .� ��� l ��������  ��  ��  � ��� n (��� I  (������� 0 clean_up_whitespace  � ��� l ������ n  ��� o  ���� 0 captured  � o  ���� 0 start_results  ��  ��  � ��� o  !���� 
0 cursor  � ���� o  !$���� 0 cursor_length  ��  ��  �  f  � ��� l ))����~��  �  �~  � ��� l ))�}���}  � V P clean_up_whitespace handler but uses cursor_length instead of cursor for range.   � ��� �   c l e a n _ u p _ w h i t e s p a c e   h a n d l e r   b u t   u s e s   c u r s o r _ l e n g t h   i n s t e a d   o f   c u r s o r   f o r   r a n g e .� ��� Z  )w���|�{� =  )9��� n  )5��� 4  05�z�
�z 
cha � m  34�y�y � l )0��x�w� n  )0��� o  ,0�v�v 0 captured  � o  ),�u�u 0 end_results  �x  �w  � m  58�� ���   � k  <s�� ��� r  <Y��� m  <?�� ���  � n      ��� 1  TX�t
�t 
pcnt� 7 ?T�s��
�s 
cha � l FL��r�q� \  FL��� o  GJ�p�p 0 cursor_length  � m  JK�o�o �r  �q  � l MS��n�m� \  MS��� o  NQ�l�l 0 cursor_length  � m  QR�k�k �n  �m  � ��j� Z Zs���i�h� A  Za��� o  Z]�g�g 
0 cursor  � o  ]`�f�f 0 cursor_length  � n do��� I  eo�e��d�e 0 reset_selection  � ��� o  eh�c�c 
0 cursor  � ��b� o  hk�a�a 0 cursor_length  �b  �d  �  f  de�i  �h  �j  �|  �{  � ��� l xx�`�_�^�`  �_  �^  � ��]� L  x~�� I x}�\��[
�\ .R*chIGlonull���     file� o  xy�Z�Z 0 wrapped  �[  �]  ��  ��  } ��� l ���Y�X�W�Y  �X  �W  � ��� l ���V���V  � . (# LANGUAGE SPECIFIC/SPECIAL CASES BEGINS   � ��� P #   L A N G U A G E   S P E C I F I C / S P E C I A L   C A S E S   B E G I N S� ��� l ���U�T�S�U  �T  �S  � ��� l ���R���R  �   Note: Ruby   � ���    N o t e :   R u b y� ��� Z  �K���Q�P� =  ����� o  ���O�O 0 doc_lang  � m  ���� ���  R u b y� k  �G�� ��� r  ����� m  ���� ���  d o   \ | $ | {   ? \ | $� o      �N�N 0 param_regex  � ��� r  ��� � m  �� � � ^ [ 	   ] * c l a s s   [ A - Z ] [ a - z ] +   ? | d e f   [ a - z ] +   ? . *   ? | i f   . +   ? | u n l e s s   . +   ? | c a s e   . +   ? | w h i l e   . +   ? | u n t i l   . +   ? | b e g i n   ? | r e s c u e   ?  o      �M�M 0 
ruby_regex  �  r  �� m  �� �  d o   ? ( \ | . * \ | ) ?   ? o      �L�L 0 do_regex   	
	 r  �� n �� I  ���K�J�K 0 
teststring 
testString  o  ���I�I 0 
start_text    o  ���H�H 0 param_regex   �G m  �� �  �G  �J    f  �� o      �F�F 0 param_results  
  r  �� n �� I  ���E�D�E 0 
teststring 
testString  o  ���C�C 0 
start_text    !  o  ���B�B 0 
ruby_regex  ! "�A" m  ��## �$$  �A  �D    f  �� o      �@�@ 0 ruby_results   %&% r  ��'(' n ��)*) I  ���?+�>�? 0 
teststring 
testString+ ,-, o  ���=�= 0 
start_text  - ./. o  ���<�< 0 do_regex  / 0�;0 m  ��11 �22  �;  �>  *  f  ��( o      �:�: 0 
do_results  & 343 Z  ��56�9�85 n  ��787 o  ���7�7 0 success  8 o  ���6�6 0 param_results  6 L  ��99 I ���5:�4
�5 .R*chIGlonull���     file: o  ���3�3 0 block_param  �4  �9  �8  4 ;<; Z  �=>�2�1= n  ��?@? o  ���0�0 0 success  @ o  ���/�/ 0 ruby_results  > k  AA BCB l �.DE�.  D   Whitespace clean up.   E �FF *   W h i t e s p a c e   c l e a n   u p .C GHG n IJI I  �-K�,�- 0 clean_up_whitespace  K LML l 	N�+�*N n  	OPO o  	�)�) 0 captured  P o  �(�( 0 ruby_results  �+  �*  M QRQ o  	�'�' 
0 cursor  R S�&S o  �%�% 0 cursor_length  �&  �,  J  f  H T�$T L  UU I �#V�"
�# .R*chIGlonull���     fileV o  �!�! 	0 ended  �"  �$  �2  �1  < W� W Z  GXY��X n  'Z[Z o  "&�� 0 success  [ o  "�� 0 
do_results  Y k  *C\\ ]^] l **�_`�  _   Whitespace clean up.   ` �aa *   W h i t e s p a c e   c l e a n   u p .^ bcb n *<ded I  +<�f�� 0 clean_up_whitespace  f ghg l +2i��i n  +2jkj o  .2�� 0 captured  k o  +.�� 0 
do_results  �  �  h lml o  25�� 
0 cursor  m n�n o  58�� 0 cursor_length  �  �  e  f  *+c o�o L  =Cpp I =B�q�
� .R*chIGlonull���     fileq o  =>�� 	0 ended  �  �  �  �  �   �Q  �P  � rsr l LL����  �  �  s tut l LL�
vw�
  v   Note: AppleScript   w �xx $   N o t e :   A p p l e S c r i p tu yzy Z  Lp{|�	�{ =  LS}~} o  LO�� 0 doc_lang  ~ m  OR ���  A p p l e S c r i p t| k  Vl�� ��� r  V]��� m  VY�� ��� ^ [ 	   ] * ( ? : i f   . +   t h e n   ? | t e l l   . +   ? | t r y   ? | c o n s i d e r i n g   . +   ? | i g n o r i n g   . +   ? | r e p e a t   ? . *   ? | w i t h   ( t i m e o u t | t r a n s a c t i o n )   . +   ? | u s i n g   t e r m s   f r o m   . +   ? )� o      �� 0 	osa_regex  � ��� r  ^e��� m  ^a�� ��� � i f | t e l l | t r y | c o n s i d e r i n g | i g n o r i n g | r e p e a t | t i m e o u t | t r a n s a c t i o n | u s i n g   t e r m s   f r o m� o      �� 0 keyword_regex  � ��� r  fm��� m  fi�� ��� h ^ [   	 ] ? ( ? : ( o n | t o )   ( ? ! e r r o r ) ( [ a - z A - Z _ - ] + ) [ ( ] ? . * [ ) ] ?   ? )� o      �� 0 handler_regex  � ��� r  n���� n n|��� I  o|���� 0 
teststring 
testString� ��� o  or�� 0 
start_text  � ��� o  ru� �  0 	osa_regex  � ���� m  ux�� ���  ��  �  �  f  no� o      ���� 0 osa_results  � ��� r  ����� n ����� I  ��������� 0 
teststring 
testString� ��� o  ������ 0 
start_text  � ��� o  ������ 0 handler_regex  � ���� m  ���� ���  2��  ��  �  f  ��� o      ���� 0 handler_results  � ��� Z  �������� =  ����� o  ������ 
0 cursor  � o  ������ 0 cursor_length  � k  ���� ��� r  ����� m  ������  � o      ���� 0 sel_space_offset  � ���� r  ����� m  ���� ���     � o      ���� 0 ender_spacer  ��  ��  � k  ���� ��� r  ����� m  ������ � o      ���� 0 sel_space_offset  � ���� r  ����� m  ���� ���   � o      ���� 0 ender_spacer  ��  � ��� Z  �������� n  ����� o  ������ 0 success  � o  ������ 0 osa_results  � k  ��� ��� r  ����� n ����� I  ��������� 0 
teststring 
testString� ��� l �������� n  ����� o  ������ 0 captured  � o  ������ 0 osa_results  ��  ��  � ��� o  ������ 0 keyword_regex  � ���� m  ���� ���  ��  ��  �  f  ��� o      ���� 0 keyword_results  � ��� r  ����� b  ����� b  ����� o  ������ 0 ender_spacer  � l �������� n  ����� o  ������ 0 captured  � o  ������ 0 keyword_results  ��  ��  � 1  ����
�� 
lnfd� n      ��� 1  ����
�� 
pcnt� 4  �����
�� 
cha � o  ������ 0 cursor_length  � ��� I ������
�� .miscslctnull��� ��� obj � l ������� 7 �����
�� 
cha � o  ���� 
0 cursor  � l ������ \  ��� o  ���� 0 cursor_length  � o  ���� 0 sel_space_offset  ��  ��  ��  ��  ��  � ���� L  �� I �����
�� .R*chIGlonull���     file� o  ���� 	0 ended  ��  ��  ��  ��  � ���� Z   l������� n   (   o  #'���� 0 success   o   #���� 0 handler_results  � k  +h  r  +G b  +: b  +6	
	 o  +.���� 0 ender_spacer  
 l .5���� n  .5 o  15���� 0 sub_cap   o  .1���� 0 handler_results  ��  ��   1  69��
�� 
lnfd n       1  BF��
�� 
pcnt 4  :B��
�� 
cha  o  >A���� 0 cursor_length    I Ha����
�� .miscslctnull��� ��� obj  l H]���� 7 H]��
�� 
cha  o  OS���� 
0 cursor   l T\���� \  T\ o  UX���� 0 cursor_length   o  X[���� 0 sel_space_offset  ��  ��  ��  ��  ��   �� L  bh I bg����
�� .R*chIGlonull���     file o  bc���� 	0 ended  ��  ��  ��  ��  ��  �	  �  z  l qq��������  ��  ��     l qq��!"��  !   Note: Bash   " �##    N o t e :   B a s h  $%$ Z  q�&'����& G  q�()( =  qx*+* o  qt���� 0 doc_lang  + m  tw,, �-- " U n i x   S h e l l   S c r i p t) =  {�./. o  {~���� 0 doc_lang  / m  ~�00 �11  S h e l l   W o r k s h e e t' k  ��22 343 r  ��565 m  ��77 �88 f ^ [   	 ] * ( i f | e l i f | c a s e )   ? ( \ [ . + \ ] | [ a - z A - Z @ $ # _ \ ( \ ) ] +   i n )6 o      ���� 0 
bash_regex  4 9:9 r  ��;<; m  ��== �>> � ^ [   	 ] * ( w h i l e   ? | u n t i l   ? | s e l e c t   ? | f o r   ? ) ( \ [ . + \ ] | [ a - z A - Z @ $ # _ \ ( \ ) ] +   i n   [ a - z A - Z @ $ # _ \ ( \ ) ] + )   ?< o      ���� 0 bash_loops_regex  : ?@? l ����������  ��  ��  @ ABA r  ��CDC n ��EFE I  ����G���� 0 
teststring 
testStringG HIH o  ������ 0 
start_text  I JKJ o  ������ 0 bash_loops_regex  K L��L m  ��MM �NN  ��  ��  F  f  ��D o      ���� 0 bash_loops_results  B OPO Z  ��QR����Q n  ��STS o  ������ 0 success  T o  ������ 0 bash_loops_results  R k  ��UU VWV n ��XYX I  ����Z���� 0 clean_up_whitespace  Z [\[ l ��]����] n  ��^_^ o  ������ 0 captured  _ o  ������ 0 bash_loops_results  ��  ��  \ `a` o  ������ 
0 cursor  a b��b o  ������ 0 cursor_length  ��  ��  Y  f  ��W c��c L  ��dd I ����e��
�� .R*chIGlonull���     filee o  ������ 0 	bash_loop  ��  ��  ��  ��  P fgf r  ��hih n ��jkj I  ����l���� 0 
teststring 
testStringl mnm o  ������ 0 
start_text  n opo o  ������ 0 
bash_regex  p q��q m  ��rr �ss  1��  ��  k  f  ��i o      ���� 0 bash_results  g t��t Z  ��uv����u n  ��wxw o  ���� 0 success  x o  ���~�~ 0 bash_results  v k  �~yy z{z Z  �"|}�}�|| =  � ~~ n  ����� o  ���{�{ 0 sub_cap  � o  ���z�z 0 bash_results   m  ���� ���  i f} k  �� ��� n ��� I  �y��x�y 0 clean_up_whitespace  � ��� l ��w�v� n  ��� o  �u�u 0 captured  � o  �t�t 0 bash_results  �w  �v  � ��� o  �s�s 
0 cursor  � ��r� o  �q�q 0 cursor_length  �r  �x  �  f  � ��p� L  �� I �o��n
�o .R*chIGlonull���     file� o  �m�m 0 bash_if  �n  �p  �}  �|  { ��� Z  #P���l�k� =  #.��� n  #*��� o  &*�j�j 0 sub_cap  � o  #&�i�i 0 bash_results  � m  *-�� ���  c a s e� k  1L�� ��� n 1C��� I  2C�h��g�h 0 clean_up_whitespace  � ��� l 29��f�e� n  29��� o  59�d�d 0 captured  � o  25�c�c 0 bash_results  �f  �e  � ��� o  9<�b�b 
0 cursor  � ��a� o  <?�`�` 0 cursor_length  �a  �g  �  f  12� ��_� L  DL�� I DK�^��]
�^ .R*chIGlonull���     file� o  DG�\�\ 0 	bash_case  �]  �_  �l  �k  � ��[� Z  Q~���Z�Y� =  Q\��� n  QX��� o  TX�X�X 0 sub_cap  � o  QT�W�W 0 bash_results  � m  X[�� ���  e l i f� k  _z�� ��� n _q��� I  `q�V��U�V 0 clean_up_whitespace  � ��� l `g��T�S� n  `g��� o  cg�R�R 0 captured  � o  `c�Q�Q 0 bash_results  �T  �S  � ��� o  gj�P�P 
0 cursor  � ��O� o  jm�N�N 0 cursor_length  �O  �U  �  f  _`� ��M� L  rz�� I ry�L��K
�L .R*chIGlonull���     file� o  ru�J�J 0 	bash_elif  �K  �M  �Z  �Y  �[  ��  ��  ��  ��  ��  % ��� l ���I�H�G�I  �H  �G  � ��� l ���F���F  �   Note: Fish   � ���    N o t e :   F i s h� ��� Z  �����E�D� =  ����� o  ���C�C 0 doc_lang  � m  ���� ���  F i s h   S h e l l� k  ���� ��� r  ����� m  ���� ��� � ^ [ 	   ] * f u n c t i o n   [ a - z _ ] +   ? . *   ? | i f   . +   ? | s w i t c h   . +   ? | w h i l e   . +   ? | f o r   [ \ w ] +   i n   . +   ? | b e g i n   ?� o      �B�B 0 
fish_regex  � ��� r  ����� n ����� I  ���A��@�A 0 
teststring 
testString� ��� o  ���?�? 0 
start_text  � ��� o  ���>�> 0 
fish_regex  � ��=� m  ���� ���  �=  �@  �  f  ��� o      �<�< 0 fish_results  � ��;� Z  �����:�9� n  ����� o  ���8�8 0 success  � o  ���7�7 0 fish_results  � k  ���� ��� l ���6���6  �   Whitespace clean up.   � ��� *   W h i t e s p a c e   c l e a n   u p .� ��� n ����� I  ���5��4�5 0 clean_up_whitespace  � ��� l �� �3�2  n  �� o  ���1�1 0 captured   o  ���0�0 0 fish_results  �3  �2  �  o  ���/�/ 
0 cursor   �. o  ���-�- 0 cursor_length  �.  �4  �  f  ��� �, L  �� I ���+�*
�+ .R*chIGlonull���     file o  ���)�) 	0 ended  �*  �,  �:  �9  �;  �E  �D  � 	
	 l ���(�'�&�(  �'  �&  
  l ���%�%   , &# LANGUAGE SPECIFIC/SPECIAL CASES ENDS    � L #   L A N G U A G E   S P E C I F I C / S P E C I A L   C A S E S   E N D S  l ���$�#�"�$  �#  �"    l ���!�!   4 . Note: Character Pairing ( Brackets and Tags )    � \   N o t e :   C h a r a c t e r   P a i r i n g   (   B r a c k e t s   a n d   T a g s   )  l ��� �    W Q Character Pairing removed. Its redundent and I didn't like how I implemented it.    � �   C h a r a c t e r   P a i r i n g   r e m o v e d .   I t s   r e d u n d e n t   a n d   I   d i d n ' t   l i k e   h o w   I   i m p l e m e n t e d   i t .  l ����   : 4 But if I deside to redo it, this is the spot ? ? ?.    �   h   B u t   i f   I   d e s i d e   t o   r e d o   i t ,   t h i s   i s   t h e   s p o t  !�  '  !� . !"! l ������  �  �  " #$# l ���%&�  % !  Note: The simple indention   & �'' 6   N o t e :   T h e   s i m p l e   i n d e n t i o n$ (�( L  ��)) I ���*�
� .R*chIGlonull���     file* o  ���� 0 one_over  �  �  � 4  AG�+
� 
docu+ m  EF�� ��  � n   � �,-, 4   � ��.
� 
cwin. m   � ��� - m   � �//~                                                                                  R*ch  alis       Betty's SSD                    BD ����
BBEdit.app                                                     ����            ����  
 cu             Applications  /:Applications:BBEdit.app/   
 B B E d i t . a p p    B e t t y ' s   S S D  Applications/BBEdit.app   / ��  �  �  �       �012345�  0 ������ 0 
teststring 
testString� 0 thesplit theSplit� 0 reset_selection  � 0 clean_up_whitespace  
� .aevtoappnull  �   � ****1 � ��
67�	� 0 
teststring 
testString� �8� 8  ���� 0 search_this  � 	0 regex  � 	0 cap_g  �
  6 ����� ��� 0 search_this  � 	0 regex  � 	0 cap_g  � 0 _script  �  0 x  �� 0 caps  7 ���������� & @�� D H L�� V����������������
�� afdmasup
�� 
from
�� fldmfldu
�� .earsffdralis        afdr
�� 
psxp
�� 
strq
�� .sysoexecTEXT���     TEXT�� 0 thesplit theSplit�� 0 success  �� 0 captured  
�� 
cobj�� 0 sub_cap  �� ��  ��  �	 ^���l �,�%E�O D��,%�%��,%�%��,%�%�%j E�O*��l+ E�O�e�a k/Ea �a l/Ea W X  �fl2 �� p����9:���� 0 thesplit theSplit�� ��;�� ;  ������ 0 	thestring 	theString�� 0 thedelimiter theDelimiter��  9 ���������� 0 	thestring 	theString�� 0 thedelimiter theDelimiter�� 0 olddelimiters oldDelimiters�� 0 thearray theArray: ������
�� 
ascr
�� 
txdl
�� 
citm�� ��,E�O���,FO��-E�O���,FO�3 �� �����<=���� 0 reset_selection  �� ��>�� >  ������ 0 c  �� 0 c_l  ��  < ������ 0 c  �� 0 c_l  =  �������
�� 
cwin
�� 
cha 
�� .miscslctnull��� ��� obj �� ��k/ *[�\[Z�k\Z�l2j U4 �� �����?@���� 0 clean_up_whitespace  �� ��A�� A  �������� 0 _captured_of  �� 0 _cursor  �� 0 _cursor_length  ��  ? �������� 0 _captured_of  �� 0 _cursor  �� 0 _cursor_length  @  ����� � �����
�� 
docu
�� 
cha 
�� 
pcnt�� 0 reset_selection  �� ;��k/ 4��i/�  *�*[�\[Z�k\Z�k2�,FO�� )��l+ Y hY hU5 ��B����CD��
�� .aevtoappnull  �   � ****B k    �EE FF GG (HH 3II >JJ IKK TLL _MM jNN uOO �PP �QQ �����  ��  ��  C  D }����������&����1��<��G��R��]��h��s��~��������/�����������������������������������������������������%����U����c��������������������������#��1������������������������~�}�|�{,07�z=�yM�xr�w������v��u
�� .earsffdralis        afdr
�� 
ctnr
�� 
ctxt�� 
0 c_path  
�� 
psxp�� 0 home  
�� 
psxf�� 0 one_over  �� 0 wrapped  �� 	0 ended  �� 0 block_param  �� 0 	bash_loop  �� 0 bash_if  �� 0 	bash_case  �� 0 	bash_elif  �� 0 open_bracket  �� 0 close_bracket  
�� 
cwin
�� 
docu
�� 
SoLn�� 0 doc_lang  ��  ��  
�� 
pusl
�� 
SLin�� 0 
start_line  
�� 
clin
�� 
Ofse�� 0 line_offset  
�� 
leng�� 0 line_length  
�� 
ELin�� 0 end_line  �� 0 end_line_offset  �� 0 end_line_length  �� 
0 cursor  �� 0 cursor_length  
�� .corecnte****       ****�� 0 
doc_length  �� 0 
start_text  
�� 
cha 
�� 
pcnt
�� 
TEXT�� 0 end_text  �� 0 	ll_offset  �� 0 
teststring 
testString�� 0 start_results  �� 0 end_results  �� 0 success  
�� 
bool�� 0 captured  �� 0 clean_up_whitespace  �� 0 reset_selection  
�� .R*chIGlonull���     file�� 0 param_regex  �� 0 
ruby_regex  �� 0 do_regex  �� 0 param_results  �� 0 ruby_results  �� 0 
do_results  �� 0 	osa_regex  �� 0 keyword_regex  �� 0 handler_regex  �� 0 osa_results  �� 0 handler_results  �� 0 sel_space_offset  � 0 ender_spacer  �~ 0 keyword_results  
�} 
lnfd
�| .miscslctnull��� ��� obj �{ 0 sub_cap  �z 0 
bash_regex  �y 0 bash_loops_regex  �x 0 bash_loops_results  �w 0 bash_results  �v 0 
fish_regex  �u 0 fish_results  ���� )j �,�,�,�&E�UO��,�%E�O*���%/E�O*���%/E�O*���%/E�O*���%/E` O*��a %/E` O*��a %/E` O*��a %/E` O*��a %/E` Oa E` Oa E` Oa a k/P *a k/a  ,E` !W X " #a $E` !O*a %,a &,E` 'O*a (_ '/a ),E` *O*a (_ '/a +,E` ,O*a %,a -,E` .O*a (_ ./a ),E` /O*a (_ ./a +,E` 0O*a %,a ),E` 1O*a %,a +,_ 1E` 2O*a (-j 3E` 4O*a k/�_ *_ 1  a 5E` 6Y !*[a 7\[Z_ *\Z_ 1k2a 8,a 9&E` 6O_ 2_ /_ 0 a :E` ;Y AjE` <O_ 4_ .  
kE` <Y hO*[a 7\[Z_ 2\Z_ /_ 0_ <2a 8,a 9&E` ;O)_ 6_ a =m+ >E` ?O)_ ;_ a @m+ >E` AO_ ?a B,E	 _ Aa B,Ea C& m)_ ?a D,_ 1_ 2m+ EO_ Aa D,a 7k/a F  <a G*[a 7\[Z_ 2k\Z_ 2k2a 8,FO_ 1_ 2 )_ 1_ 2l+ HY hY hO�j IY hO_ !a J  �a KE` LOa ME` NOa OE` PO)_ 6_ La Qm+ >E` RO)_ 6_ Na Sm+ >E` TO)_ 6_ Pa Um+ >E` VO_ Ra B,E _ j IY hO_ Ta B,E )_ Ta D,_ 1_ 2m+ EO�j IY hO_ Va B,E )_ Va D,_ 1_ 2m+ EO�j IY hY hO_ !a W a XE` YOa ZE` [Oa \E` ]O)_ 6_ Ya ^m+ >E` _O)_ 6_ ]a `m+ >E` aO_ 1_ 2  jE` bOa cE` dY kE` bOa eE` dO_ _a B,E Y)_ _a D,_ [a fm+ >E` gO_ d_ ga D,%_ h%*a 7_ 2/a 8,FO*[a 7\[Z_ 1\Z_ 2_ b2j iO�j IY hO_ aa B,E B_ d_ aa j,%_ h%*a 7_ 2/a 8,FO*[a 7\[Z_ 1\Z_ 2_ b2j iO�j IY hY hO_ !a k 
 _ !a l a C& �a mE` nOa oE` pO)_ 6_ pa qm+ >E` rO_ ra B,E  )_ ra D,_ 1_ 2m+ EO_ j IY hO)_ 6_ na sm+ >E` tO_ ta B,E �_ ta j,a u   )_ ta D,_ 1_ 2m+ EO_ j IY hO_ ta j,a v   )_ ta D,_ 1_ 2m+ EO_ j IY hO_ ta j,a w   )_ ta D,_ 1_ 2m+ EO_ j IY hY hY hO_ !a x  Ha yE` zO)_ 6_ za {m+ >E` |O_ |a B,E )_ |a D,_ 1_ 2m+ EO�j IY hY hO�j IUU ascr  ��ޭ