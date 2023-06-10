/**
 * 
 */
function useId() {
	// 중복 확인된 아이디를 회원가입 폼에 넣어준다.
	opener.document.memberJoinForm.id.value = document.memberIdCheckForm.id.value;
	// 새로 열린 창 닫기
	self.close();
}