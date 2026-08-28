const base = {
    get() {
        return {
            url : "http://localhost:8080/Catering_Recruitment/",
            name: "Catering_Recruitment",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/Catering_Recruitment/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "餐饮人员招聘系统"
        } 
    }
}
export default base
