

$.ajax({
    url:"https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=xxxxxx",
    type:"post",
    data:JSON.stringify(data),
    dataType:"JSON",
    contentType:"application/json",
    accept:"application/json",
    success:function(result){
        console.log(result);
    },
    error:function(result){
        console.log(result.responseText);
    }
})