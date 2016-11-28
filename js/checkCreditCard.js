function checkCreditCard(string) {
	re = /^\d{4}-\d{4}-\d{4}-\d{4}$/;
	if (!re.test(string))
		alert("不通過！");
	else
		alert("通過！");
}
