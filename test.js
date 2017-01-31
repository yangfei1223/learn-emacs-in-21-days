function sayHello(name){
    console.log("Hello" +name);
}

var obj={
    concatString:function(){
	for(var i=0;i<10;i++)
	    var s1="hello";
	var s2="world";
	var s3=s1+s2;
    },
    func1 : function(){
	this.concatString();
    },
    func2 : function(){
	add(1);
    }
};
var aa={1,2,3};
var sum=0;
for(var i = 0; i < aa.length; i++) {
    sum=aa[i];
}
console.log(sum);
