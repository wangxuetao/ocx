<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
    
        <style type="text/css" media="screen"> 
            html, body  { height:100%; }
            body { margin:0; padding:0; overflow:auto; text-align:center; 
                   background-color: #ffffff; }   
            object:focus { outline:none; }
            #flashContent { display:none; }
        </style>
        
        <link rel="stylesheet" type="text/css" href="/page/swf/history/history.css" />
        <script type="text/javascript" src="/page/swf/history/history.js"></script>
            
        <script type="text/javascript" src="/page/swf/swfobject.js"></script>
        <script type="text/javascript" src="/page/swf/jquery.min.js"></script>
        <script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = "11.1.0";
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = "playerProductInstall.swf";
            var flashvars = {};
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            var attributes = {};
            attributes.id = "camera";
            attributes.name = "camera";
            attributes.align = "middle";
            swfobject.embedSWF(
                "/page/swf/camera.swf", "flashContent", 
                "400", "330", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        </script>
        
        <div id="flashContent">
            <p>
                To view this page ensure that Adobe Flash Player version 
                11.1.0 or greater is installed. 
            </p>
            <script type="text/javascript"> 
                var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://"); 
                document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
                                + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
            </script> 
        </div>
        
        <noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="400" height="330" id="camera">
                <param name="movie" value="/page/swf/camera.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="/page/swf/camera.swf" width="400" height="330">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                    <p> 
                        Either scripts and active content are not permitted to run or Adobe Flash Player version
                        11.1.0 or greater is not installed.
                    </p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </noscript>     
        
        <script type="text/javascript">
        
        function test2(ph) {
        
        	$("#pp").html('<img src="data:image/jpeg;base64,'+ph+'"/>');
        }
        
        function savePhoto(avatar) {
         $.ajax({  
                    type : "POST",  //提交方式  
                    async: false,
                    url : "http://127.0.0.1:8080/savePhoto.html?uu=" + new Date().getTime(),//路径  
                    data : {  
                        "avatar" : avatar
                    },//数据，这里使用的是Json格式进行传输  
                    success : function(result) {//返回数据根据结果进行相应的处理  
                       alert(result.message);
                       
                    },
                    error: function(data){
					    alert(data);
					}
                });  
        }
        
        function savePhoto2() {
         $.ajax({  
                    type : "POST",  //提交方式  
                    async:true,
                    dataType : "json",
                    url : "http://127.0.0.1:8080/savePhoto.html",//路径  
                    data : {  
                        "avatar" : "hhhhhhhhhh"
                    },//数据，这里使用的是Json格式进行传输  
                    success : function(result) {//返回数据根据结果进行相应的处理  
                       alert(result);
                       
                    },
                    error: function(data){
					    alert(data);
					}
                });  
        }
        	
        </script> 