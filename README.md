# 用于ZUCC南校区寝室内外网同时访问的BAT命令行批处理脚本  
[![A-batchfile-for-ZUCC version](https://img.shields.io/badge/version-V07-blue.svg)](https://github.com/HDsky/A-batchfile-for-ZUCC)

## 版本说明：最新版（其他版本见程序内说明）  
- 本程序适用于ZUCC南校区所有学生寝室（明德三除外），可使电脑在不用中断宽带连接的情况下访问内网。
- 如遇防毒软件警报，系误报，本人保证程序绝无病毒，有些提示修改系统关键信息请点击允许。
- 每次需要用到内外网同时访问前请使用本程序，失效后如需内外网同时访问需再次使用本程序。
- 目前仅支持win7及以上简体中文系统，新版本支持一键自动设置静态路由-。-
- V07版本恢复了自动获取管理员的功能，欢迎反馈。（如无意外这将会是最后一个版本）
- 如有需要请访问 https://hdsky.pw/ 尝试设置开机启动（过段时间会写）
- 如有需要请联系hd852025@hotmail.com 偶然瞄到我会回复的。
- 建议使用最新版的程序，欢迎zuccer的小伙伴交流反馈BUG  

##日志
2016/12/20  上传V07版本，同时更新README。V07版本在我偶然间获取到bat提权的方法后重新加入了提权模块。
2016/11/7  上传V06版本，同时更新README。V06版本增加了一些静态路由，感谢ZJU的学长提供的建议，我在使用NHD下载上传的时候认识到这个问题的严重性，在此表示感谢@wfwf1997

## 最后想说点什么 
0.0很久以前写的BAT自动运行脚本，用于ZUCC南校区寝室同时内外网访问0.0  
感觉写的还是比较渣，基本都是在造轮子，不过在不断改版本的过程中也在不断完善，从第一个版本到最后一个版本变化还是挺大的。  
原理就是调用CMD命令中的route命令让10开头的IP地址都走内网的网关，没办法解决的就是寝室内网DHCP自动分配（实现固定IP比较麻烦），无法实现程序永久有效，只能使用前开一次（事实上电信用户可以设置为计划任务，这样就可以在后台自动运行了）。
事实上上可以写出永久有效的命令，但是考虑到放假同学要拿回家或者带着电脑去实习等问题，还是不做为好。  
虽说后面有些刷版本号的嫌疑>_<，但确实是在针对学校移动DNS劫持问题在不断解决。   
#### ~~未来的打算  （这个没有了）~~
~~打算以后用C++重新写一份，实现检查版本号自动更新什么的0.0，写的BAT加上EXE的壳基本被市面杀软误报QAQ（大数字说的就是你）。~~

##License 
本程序遵从WTFPL协议[![WTFPL](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)](http://www.wtfpl.net/)

>      DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE  
>  
>               Version 2, December 2004 
>
> Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 
>
> Everyone is permitted to copy and distribute verbatim or modified 
> copies of this license document, and changing it is allowed as long 
> as the name is changed. 
>
>            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
>   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION  
>   
>   0 . You just DO WHAT THE FUCK YOU WANT TO.
