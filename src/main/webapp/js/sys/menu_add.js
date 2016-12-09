var setting = {
	data: {
		simpleData: {
			enable: true,
			idKey: "menuId",
			pIdKey: "parentId",
			rootPId: -1
		},
		key: {
			url:"nourl"
		}
	}
};
var ztree;

//菜单ID
var menuId = T.p("menuId");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增菜单",
		menu:{
			parentName:"",
			parentId:0,
			type:1,
			orderNum:0
		}
	},
	created: function() {
		if(menuId != null){
			this.title = "修改菜单";
			this.getMenu(menuId)
		}
		
		//加载菜单树
		$.get("../sys/menu/select", function(r){
			ztree = $.fn.zTree.init($("#menuTree"), setting, r.menuList);
			var node = ztree.getNodeByParam("menuId", vm.menu.parentId);
			ztree.selectNode(node);
			
			vm.menu.parentName = node.name;
		})
    },
	methods: {
		getMenu: function(menuId){
			$.get("../sys/menu/info/"+menuId, function(r){
                vm.menu = r.menu;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.menu.menuId == null ? "../sys/menu/save" : "../sys/menu/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.menu),
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
		menuTree: function(){
			layer.open({
				type: 1,
				offset: '50px',
				skin: 'layui-layer-molv',
				title: "选择菜单",
				area: ['300px', '450px'],
				shade: 0,
				shadeClose: false,
				content: jQuery("#menuLayer"),
				btn: ['确定', '取消'],
				btn1: function (index) {
					var node = ztree.getSelectedNodes();
					//选择上级菜单
					vm.menu.parentId = node[0].menuId;
					vm.menu.parentName = node[0].name;
					
					layer.close(index);
	            }
			});
		},
		back: function (event) {
			history.go(-1);
		}
	}
});



