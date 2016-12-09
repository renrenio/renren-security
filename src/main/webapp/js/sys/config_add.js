var id = T.p("id");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增参数",
		config:{}
	},
	created: function() {
		if(id != null){
			this.title = "修改参数";
			this.getInfo(id)
		}
    },
	methods: {
		getInfo: function(id){
			$.get("../sys/config/info/"+id, function(r){
                vm.config = r.config;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.config.id == null ? "../sys/config/save" : "../sys/config/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.config),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.back();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		back: function (event) {
			history.go(-1);
		}
	}
});