/*显示错误提示
*currObj 事件触发对象
*errorText 错误提示的文本
*/
function errorShow(currObj,errorText){
	currObj.parents('.form-item').addClass('error');
	currObj.closest('.error-tip').html(errorText);
}
/*隐藏错误提示
*currObj 事件触发对象
*/
function errorHide(currObj){
	currObj.parents('.form-item').removeClass('error');
}
//清空当前输入框
$('.icon-clear').on('click',function(){
	$(this).parents('.form-item').find('input').val('');
	$(this).parents('.form-item').removeClass('error');
});
/*弹框显示和隐藏
 * obj 弹框对象
 */
function dialogShow(obj,callback){
	obj.show();
	if(typeof(callback)==='function'){
		callback();
	}
}
function dialogHide(obj,callback){
	obj.hide();
	if(typeof(callback)==='function'){
		callback();
	}
}
function tioDialogShow(obj,callback){
	obj.show();
	setTimeout(function(){
		obj.fadeOut();
		if(typeof(callback)==='function'){
			callback();
		}
	},1000);
}

//显示退出dialog
$('.exit-user').on('click',function(){
	dialogShow($('.exit-dialog'));
});
//弹框x按钮
$('.icon-close').on('click',function(){
	dialogHide($('.page-cover'));
});

//ie placeholder
if (!('placeholder' in document.createElement('input'))) {
	$('input[placeholder],textarea[placeholder]').each(function() {
		var that = $(this), text = that.attr('placeholder');
		if (that.val() === "") {
			that.val(text).addClass('placeholder');
		}
		that.focus(function() {
			if (that.val() === text) {
				that.val("").removeClass('placeholder');
			}
		}).blur(function() {
			if (that.val() === "") {
				that.val(text).addClass('placeholder');
			}
		}).closest('form').submit(function() {
			if (that.val() === text) {
				that.val('');
			}
		});
	});
}