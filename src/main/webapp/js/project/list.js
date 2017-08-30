	$(function() {
		var datePks=$("#queryForm").find("input.datetime");
		datePks.each(function(index,element){
			$(this).datetimepicker({
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				format:"yyyy-mm-dd"
			});
			//避免和浏览器的记忆下拉冲突
			$(this).attr("readonly","readonly");
		});
		$("#btnExport").click(function(){
			$("#queryForm").attr("action", export_url);
			$("#queryForm").submit();
		});
		$("#btnQuery").click(function(){
			$("#queryForm").attr("action", query_url);
			$("#queryForm").submit();
		});
		
		
		setBtnText(old);
		$("label.checkbox > input").click(function(e) {
			e.stopPropagation();//实现多选
			var chkd="";
			var cbx = $("input[type=checkbox]");
			cbx.each(function() {
				if(this.checked)
					chkd += this.value+",";
			});
			setBtnText(chkd);
		});
		$("label.checkbox > input").each(function() {
			if (old.indexOf(this.value) >= 0) {
				this.checked = "checked";
			}
		});
	});
	function setBtnText(txt){
		if(txt && txt!="null"){
			$("span.multiselect-selected-text").html(txt.length>10?txt.substring(0,9)+"...":txt);//represent
		}else{
			$("span.multiselect-selected-text").html("当前状态");//represent
		}
	}