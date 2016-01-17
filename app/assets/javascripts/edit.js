//AbcEdit（非表示）の更新
function updateAbcArea() {
	var t = 'T: ' + $('#abc_phrase_tytle').val();
	var m = 'M: ' + $('#abc_phrase_meter').val();
	var l = 'L: ' + $('#abc_phrase_length').val();
	var r = 'R: ' + $('#abc_phrase_reference').val();
	var k = 'K: ' + $('#abc_phrase_key').val();
	var abc = $('#abc_phrase_abc').val();
	var abcText = 'X: 1' + '\n' + t + '\n' + m + '\n' + l + '\n' + r + '\n' + k + '\n' + abc;
	$('#area').text(abcText);
	$('#area').trigger('change');
}

//一番上の楽譜を表示させる
//TODO 無理やりボタン押してajaxってな感じだけど、もうちょいスマートにやりたい
function showTopPhrase() {
  $('#phrase_list div:first a:first').click()
}


//イベントリスナの登録
$(function(){
	$('#abc_phrase_tytle, #abc_phrase_reference, #abc_phrase_abc').keyup(function() {
		updateAbcArea();
	});
	$('#abc_phrase_meter, #abc_phrase_length, #abc_phrase_key').change(function() {
		updateAbcArea();
	});
});

