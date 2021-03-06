;字符
MAXASCII		=	255
MAXCHINESE	=	255
;显示模式
SYVIDEOMODE		=	0103H
DOSVIDEOMODE	=	03H
SCREEN_WIDTH	=	832			;在915的主板上，扫描线是832,注意此点
SCREEN_HEIGHT	=	600

;颜色的常量定义
BLACK	=	0
WHITE	=	1
LIGHTGRAY	=	2
DEEPBLUE	=	3
DARKBLACK	=	4
LIGHTBLACK	=	5
YELLOW	=	6
GREEN	=	7
RED	=	8
BLUE	=	9
;
HZCOUNT	=	89					;当前汉字提取了83个
;
;图象长度 高度常量
CHARWIDTH	=	8
CHARHEIGHT	=	16
DEFAULTBUTTONHEIGHT	=	32		;2*CHARHEIGHT
DEFAULTCAPTIONHEIGHT	=	26	;amend for show logo 2005-7-13 luobing
DEFAULTEDITBOXHEIGHT	=	24	;DEFAULTEDITBOXHEIGHT=DEFAULTBUTTONHEIGHT-CHARHEIGHT/2
;框架显示所用的常量
;为了显示鼠标，修改了一些宏的定义，增加了一些宏的定义
;以下的宏全部是用在103H模式下的
FRAME_LEFT	=	225
FRAME_TOP		=	170
FRAME_RIGHT	=	590
FRAME_BOTTOM	=	400
BUTTON_TOP_WAI	=	FRAME_TOP	+	70
BUTTON_LEFT_WAI	=	FRAME_LEFT	+	(FRAME_RIGHT-FRAME_LEFT)/2-8*CHARWIDTH
BUTTON_TOP_NEI	=	FRAME_BOTTOM	-	90
BUTTON_LEFT_NEI	=	BUTTON_LEFT_WAI
;lb
CURRENT_STR_LENGTH	=	11	;当前的内外网用的字符长度为11 汉字算两个
BUTTON_WIDTH	=	(CURRENT_STR_LENGTH+4)*CHARWIDTH-1
;logo
LOGO_WIDTH	=	24
LOGO_HEIGHT	=	24