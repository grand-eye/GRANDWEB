function doSearch() {
	var chknum = 0;
	var sField = new Array();
	$('#searchFrm').find('input:checkbox:checked').each(function() {
		sField[chknum] = $(this).val();
		chknum++;
	});
	if (chknum == 0)
	{
		alert('한개이상의 항목을 선택하여 주세요.');
		return false;
	}
	$('#sField').val(sField.join(","));

}