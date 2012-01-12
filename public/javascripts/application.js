// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var oFCKeditor = false

J('document').ready(function(){
	J('#javascript_off').hide()
	J('#layout').show()
})

function wysiwyg_switch(){
	new Ajax.Request('/cms/admin/flip_setting?setting=wysiwyg', {
		asynchronous:true, evalScripts:true, onLoading:function(request){
			J('wysiwyg_switch').html('<h3>Loading</h3>')
		}
	});
	wysiwyg_flip();
}

function wysiwyg_flip(){
	if(oFCKeditor){
		ta = J('.wysiwyg_container textarea')
		J('.wysiwyg_container').html( '<textarea id="'+ta.attr('id')+'" name="'+ta.attr('name')+'">'+ta.val()+'</textarea>' )
		oFCKeditor = false
		J('#wysiwyg_switch_link').text('Turn On WYSIWYG')
	} else {
		if(!oFCKeditor){
			oFCKeditor = new FCKeditor(J('.wysiwyg_container textarea').attr('id'), '100%', '200px', 'Simple');
			oFCKeditor.BasePath = "/javascripts/fckeditor/"
			oFCKeditor.Config['CustomConfigurationsPath'] = '/javascripts/fckcustom.js';
			J('#wysiwyg_switch_link').text('Turn Off WYSIWYG')
		}
		oFCKeditor.ReplaceTextarea();
	}
}