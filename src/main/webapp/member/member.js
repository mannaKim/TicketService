function go_login(){
	alert("로그인을 먼저 해주세요.");
	location.href="ticket.do?command=loginForm";
}

function loginCheck(){
	if(document.loginFrm.id.value==""){
		alert("아이디는 필수 입력사항입니다.");
		document.loginFrm.id.focus();
		return false;
	}else if(document.loginFrm.pwd.value==""){
		alert("비밀번호는 필수 입력사항입니다.");
		document.loginFrm.pwd.focus();
		return false;
	}else{
		return true;
	}
}

function checkAll(){
	if(document.getElementById("termAll").checked==true){ 
		//id가 termAll인 checkbox의 값이 true라면
		for(var i=0;i<3;i++) document.getElementsByName("term_agreement")[i].checked=true;
		//name이 term_agreement인 checkbox들의 값을 모두 true로 바꾼다.
	}
	if(document.getElementById("termAll").checked==false){
		//id가 all인 checkbox의 값이 false라면
		for(var i=0;i<3;i++) document.getElementsByName("term_agreement")[i].checked=false;  
		//name이 term_agreement인 checkbox들의 값을 모두 false로 바꾼다.
	}
}

function checkAllList(){
	checkCount = 0;
	for(var i=0;i<3;i++) {
		if(document.getElementsByName("term_agreement")[i].checked==false){
			checkCount++;
		}		
	}
	if(checkCount>0) document.getElementById("termAll").checked = false;
	if(checkCount == 0) document.getElementById("termAll").checked = true;
}

function showTerm(num){
	var url = "ticket.do?command=showTerm&num="+num;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=400, scrollbars=yes, top=500, left=500";
	window.open(url,"Term",opt);
}

function go_joinForm(){
	if(document.termFrm.term_agreement[0].checked==false){
		alert("이용약관에 동의 후 가입을 진행해주세요.");
	}else if(document.termFrm.term_agreement[1].checked==false){
		alert("개인정보 수집 및 이용 동의 후 가입을 진행해주세요.");
	}else{
		location.href="ticket.do?command=joinForm";
	}
}

function idcheck(){
	if(document.joinFrm.id.value==""){
		alert("아이디를 입력하고 중복체크를 진행하세요.");
		document.joinFrm.id.focus();
		return;
	}
	var url = "ticket.do?command=idCheckForm&id="+document.joinFrm.id.value;
	var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	window.open(url,"IdCheck",opt);
}

function qna() {
	location.href="ticket.do?command=qna";
}

function go_form(){
	location.href="ticket.do?command=qnaWriteForm";
}

function go_write(){
	if (document.formm.name.value == "") {
		alert("제목을 입력해주세요"); 	    
	    document.formm.name.focus();
	} else if(document.formm.content.value == "") {
	    alert("내용를 입력해 주세요.");	    
	    document.formm.content.focus();
	}  else{
		return true;
	}
}

function go_reform(){
	location.href="ticket.do?command=reviewWriteForm";
}

function go_rewrite(){
	location.href="ticket.do?command=reviewWrite";
}
