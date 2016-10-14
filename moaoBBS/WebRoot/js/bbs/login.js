window.defaultStatus = "The wonderful BBS";	
/*login js*/
thisPLoc = parent.document.location.host;
function showPanel(){
	 window.scrollTo(0,0); 
	 document.getElementById('Panel').style.display = 'block';
	 var box1=document.getElementById('fade');
	 box1.style.display='block';
	 document.body.style.overflow='hidden';
	 box1.style.height=document.body.clientHeight;
	 document.getElementById('frame').src = "http://"+thisPLoc+"/moaoBBS/user/getlogin";
	 document.body.scrollTo(0,0);
 }
 function hidePanel(){
	 document.getElementById('Panel').style.display = 'none';
	 document.getElementById('fade').style.display='none';
	 document.body.style.overflow='visible';
 }
 function showOtherInfo(){
	 alert("说了是即将来临，着什么急，程序猿比你还着急。乖乖点击确定，回去吧！");
 }
 function addPraise(){
	 alert("【赞~\(≧▽≦)/~】成功");
 }
 function addBad(){
	 alert("【踩/(ㄒoㄒ)/~~】成功");
 }