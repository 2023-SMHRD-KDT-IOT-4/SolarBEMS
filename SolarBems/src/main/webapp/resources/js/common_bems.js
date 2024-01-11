/* Bems 공통 js */

// Spinner Btn 적용/해제
const applySpinnerBtn = (id, btnValue, flag) => {

	let btnVal = flag ? '<span class="spinner-border spinner-border-sm"></span>' : btnValue ;
	$('#'+id).prop('disabled', flag);
	$('#'+id).html(btnVal);
    
} 
