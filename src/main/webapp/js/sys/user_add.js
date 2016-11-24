//用户ID
var userId = T.p("userId");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增管理员",
		roleList:{},
		user:{
			status:1,
			roleIdList:[]
		}
	},
	created: function() {
		if(userId != null){
			this.title = "修改管理员";
			this.getUser(userId)
		}
		//获取角色信息
		this.getRoleList();
    },
	methods: {
		getUser: function(userId){
			this.$http.get("../sys/user/info/"+userId).then((r) => {
                this.user = r.body.user;
            });
		},
		getRoleList: function(){
			this.$http.get("../sys/role/select").then((r) => {
                this.roleList = r.body.list;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.user.userId == null ? "../sys/user/save" : "../sys/user/update";
			this.$http.post(url, vm.user).then((r) => {
				if(r.body.code === 0){
					alert('操作成功', function(index){
						vm.back();
					});
					
				}else{
					alert(r.body.msg);
				}
			});
		},
		back: function (event) {
			history.go(-1);
		}
	}
});