//병원 진료시간 관련

$("select[name=open]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=open] option:selected").text()); //text값 가져오기
});

$("select[name=close]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=close] option:selected").text()); //text값 가져오기
});

//
//병원 점심시간관련

$("select[name=lunch-st]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=lunch-st] option:selected").text()); //text값 가져오기
});

$("select[name=lunch-cl]").change(function(){
    console.log($(this).val()); //value값 가져오기
    console.log($("select[name=lunch-cl] option:selected").text()); //text값 가져오기
});

//진료과선택관련

function Init()
{
    document.form.allowList.options.add(new Option("마징가", "1"));
    document.form.allowList.options.add(new Option("울트라", "2"));
    document.form.allowList.options.add(new Option("베트맨", "3"));
    document.form.allowList.options.add(new Option("슈퍼맨", "4"));
    document.form.allowList.options.add(new Option("왕눈이", "5"));
    document.form.allowList.options.add(new Option("아로미", "6"));
    document.form.allowList.options.add(new Option("손오공", "7"));
    document.form.allowList.options.add(new Option("오로라", "8"));
}



function Add(sel)
{
    //복사
    var selectedItem = sel.options[sel.options.selectedIndex];
    document.form.denyList.options.add(new Option(selectedItem.text, selectedItem.value));



    //삭제
    sel.options.remove(sel.options.selectedIndex);
}



function Remove(sel)
{
    var selectedItem = sel.options[sel.options.selectedIndex];
    document.form.allowList.options.add(new Option(selectedItem.text, selectedItem.value));



    //삭제
    sel.options.remove(sel.options.selectedIndex);
}