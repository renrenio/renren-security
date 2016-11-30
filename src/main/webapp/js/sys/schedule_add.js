//任务ID
var jobId = T.p("jobId");
var vm = new Vue({
	el:'#rrapp',
	data:{
		title:"新增定时任务",
		schedule:{}
	},
	created: function() {
		if(jobId != null){
			this.title = "修改定时任务";
			this.getScheduleJob(jobId)
		}
    },
	methods: {
		getScheduleJob: function(jobId){
			this.$http.get("../sys/schedule/info/"+jobId).then((r) => {
                this.schedule = r.body.schedule;
            });
		},
		saveOrUpdate: function (event) {
			var url = vm.schedule.jobId == null ? "../sys/schedule/save" : "../sys/schedule/update";
			this.$http.post(url, vm.schedule).then((r) => {
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