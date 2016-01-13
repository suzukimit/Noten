function initMeter(val) {
	$('#abc_phrase_meter').append($("<option>").val("1/2").text("1/2"));
	$('#abc_phrase_meter').append($("<option>").val("2/2").text("2/2"));
	$('#abc_phrase_meter').append($("<option>").val("3/4").text("3/4"));
	$('#abc_phrase_meter').append($("<option>").val("4/4").text("4/4"));
	$('#abc_phrase_meter').append($("<option>").val("5/4").text("5/4"));
	$('#abc_phrase_meter').append($("<option>").val("5/8").text("5/8"));
	$('#abc_phrase_meter').append($("<option>").val("6/8").text("6/8"));
	$('#abc_phrase_meter').append($("<option>").val("7/8").text("7/8"));
	$('#abc_phrase_meter').append($("<option>").val("8/8").text("8/8"));
	$('#abc_phrase_meter').append($("<option>").val("9/8").text("9/8"));
	$('#abc_phrase_meter').append($("<option>").val("9/8").text("9/8"));
	if (val == '' || val == null) {
		val = '4/4';
	}
	$('#abc_phrase_meter').val(val);
}

function initLength(val) {
	$('#abc_phrase_length').append($("<option>").val("1/2").text("1/2"));
	$('#abc_phrase_length').append($("<option>").val("1/4").text("1/4"));
	$('#abc_phrase_length').append($("<option>").val("1/8").text("1/8"));
	$('#abc_phrase_length').append($("<option>").val("1/16").text("1/16"));
	if (val == '' || val == null) {
		val = '1/8';
	}
	$('#abc_phrase_length').val(val);
}

function initKey(val) {
	$('#abc_phrase_key').append($("<option>").val("C").text("C"));
	$('#abc_phrase_key').append($("<option>").val("F").text("F"));
	$('#abc_phrase_key').append($("<option>").val("Bb").text("Bb"));
	$('#abc_phrase_key').append($("<option>").val("Eb").text("Eb"));
	$('#abc_phrase_key').append($("<option>").val("Ab").text("Ab"));
	$('#abc_phrase_key').append($("<option>").val("Db").text("Db"));
	$('#abc_phrase_key').append($("<option>").val("Gb").text("Gb"));
	$('#abc_phrase_key').append($("<option>").val("B").text("B"));
	$('#abc_phrase_key').append($("<option>").val("E").text("E"));
	$('#abc_phrase_key').append($("<option>").val("A").text("A"));
	$('#abc_phrase_key').append($("<option>").val("D").text("D"));
	$('#abc_phrase_key').append($("<option>").val("G").text("G"));
	if (val == '' || val == null) {
		val = 'C';
	}
	$('#abc_phrase_key').val(val);
}

//要素追加用メソッド
function add(selecter, val, text) {
	$(selecter).append($("<option>").val(val).text(text));
}
