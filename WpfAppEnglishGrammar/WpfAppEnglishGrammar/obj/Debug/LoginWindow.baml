   M S B A M L   `   `   `  ����O  KWpfAppEnglishGrammar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:WpfAppEnglishGrammarWpfAppEnglishGrammar  5   	   &     WpfAppEnglishGrammar.LoginWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:WpfAppEnglishGrammar     5   	   -   5          �Name$  loginWindow��5   	    � Title$ LoginWindow��5   	   $��293.633��6   $��409.84��6.    � Icon$ Images/R2d2.ico��6=    � 
ResizeMode$ NoResize=�6T   ��5	      �� 5
   
    �� ImageSource$ Images\2.jpg��6    j� Stretch$ UniformToFill=�60    j� TileMode$ FlipXY=�6H    � 	Resources 5         FontStarJediRounded �� Property	 �� Value  ButtonStyle
 �� 
TargetType �� 
TargetType ��Name �� CornerRadius ��Name �� TextAlignment �� Triggers P� Property P� Value �� 
TargetName��%P  &	        &	 X     �� 5   
   .�5      ��  � ��$"	 Resources/#Star Jedi Rounded)�65   5      �� 5   
   "
 ��6$   .�5      ��  � ��
	 ���� 6+   �� 5       � ��$		 135��6&   �� 5       � ��$	 35��6'   �� 5       � ��$	 0q�60   �� 5       � ��$	 20,0,0,0q�6'   �� 5       � ��	 5      �� 5      " ��6&   .R�5      �� $ ButtonBorder��6!   $ 5��67   $��30��6H   $	��120��6T   
������ $��Center=�5   :   $��Center=�6W   
�������$��4,4,4,4q�6�   ._�5      �� $ 
ButtonText��6(   $��20(�6<   
�������$ Center=�6]   $��Center=�5   (   #���   6E   $��Center=�6t   #��z��5   (   5      5        5!      P� 5#       �@J�IsMouseOver . . �5$   "   �� $ ButtonBorder��6)    � ��
	 � ���6Z   �� 5%   "   $ 
ButtonText��6)    � ��
	 � ���6W   5&      P� 5'       �@J�IsMouseOver .  . �5(   "   �� $ ButtonBorder��6)    � ��
	 �����6Z   �� 5)   "   $ 
ButtonText��6)    � ��
	 �����6W   5*      5,      5.      5/      51      .��52      � $
��Left=�6   $	��234��6&   $��
30,10,30,0q�63   $��Center=�6G   $	��340��6b    J� RenderTransformOrigin$ 0.5,0.5&�6n   .+�54   
   �� -   5         ��Name$ loginButton��54      $��Login��6&   $��2��66   $��Right=�6C   #��[ 6_   $��Bottom=�6�   $	��145��6�   $��44��6�   $��20(�6�   
�������
���   ���6�   Z� 6  �� 55   
   -   5        $ registerButton��55      $��Register��6)   $
��Left=�6=   #��[ 6X   $��Bottom=�6~   $	��145��6�   $��44��6�   $��20(�6�   
�������
���   ���6�   Z� 6  G� 56   
   -   5         G�Name$ 
tbPassword��56      $
��Left=�6*   $��23��6E   $��1��6Q   $��177,129,0,0q�6^   $	��Top=�6t   $	��120��6�   ���	#FFC5A2586�   �� 57   
   -   5         ��Name$ tbLogin��57      $
��Left=�6#   $��23��6>   $��
177,81,0,0q�6J    �� TextWrapping$
 Wrap=�6^   $	��Top=�6r   $	��120��6�   $��0��6�   ���	#FFC5A2586�   �� 58   
   -   5         ��Name$ label��58      $��Password��6   $
��Left=�62   $��
34,122,0,0q�6M   $	��Top=�6a   $��20(�6y   #���   6�   
�������6�   �� 59   
   -   5        $ 
label_Copy��59      $��Login��6$   $
��Left=�64   $��	34,74,0,0q�6O   $	��Top=�6b   $��20(�6z   #���   6�   
�������6�   5:      5;      