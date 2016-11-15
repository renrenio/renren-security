$(function () {
    $("#jqGrid").jqGrid({
        url: '../sys/role/list',
        datatype: "json",
        colModel: [			
			{ label: '角色ID', name: 'roleId', width: 45, key: true },
			{ label: '角色名称', name: 'roleName', width: 75 },
			{ label: '备注', name: 'remark', width: 100 },
			{ label: '创建时间', name: 'createTime', width: 80}                   
        ],
		viewrecords: true,
        height: 400,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		
	},
	methods: {
		update: function (event) {
			var roleId = getSelectedRow();
			if(roleId == null){
				return ;
			}
			
			location.href = "role_add.html?roleId="+roleId;
		},
		del: function (event) {
			var roleIds = getSelectedRows();
			if(roleIds == null){
				return ;
			}
			
			this.$http.post('../sys/role/delete', roleIds).then((r) => {
				if(r.body.code === 0){
					layer.alert('操作成功', {offset: '150px'}, function(index){
						location.reload();
					});
				}else{
					layer.alert(r.body.msg, {offset: '150px'});
				}
			}, (r) => {//响应错误回调
				layer.alert(r.body.msg, {offset: '150px'});
			});
		}
	}
});