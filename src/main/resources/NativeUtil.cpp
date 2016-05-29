// NativeUtil.cpp : Defines the exported functions for the DLL application.
//
#include "stdafx.h"
#include <jni.h>
#include "util_NativeUtil.h"
#include <string.h>
//function declare
char * wrapGoLink(JNIEnv * env, jint pageNo, char* text);
char * wrapGoLink(JNIEnv * env, jint pageNo, jint text);
char* long2char_pointer(long i);
/*
 *测试接口无返回值
 * Class:     util_NativeUtil
 * Method:    hello
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_util_NativeUtil_hello
  (JNIEnv *, jclass){
	printf("hello");
}
/*
 *测试接口2带返回值
 * Class:     util_NativeUtil
 * Method:    buildPaginationHtml
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_util_NativeUtil_buildPaginationHtml__(JNIEnv * env, jclass){
		jstring html;
		char body[]="<html>hello</html>";
		html=(*env).NewStringUTF(body);
		return (*env).NewStringUTF(body);
}

/*
 * 生成分页标签
 * Class:     util_NativeUtil
 * Method:    buildPaginationHtml
 * Signature: (IIIIIIIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_util_NativeUtil_buildPaginationHtml__IIIIIIIILjava_lang_String_2Ljava_lang_String_2
	(JNIEnv * env, jclass cls, jint pageNo, jint pageSize, jint totalCount, jint totalPage, 
		jint prev, jint next, jint cutBtnNum, jint rest, jstring currentClass, jstring disableClass){
		char * html = "<div class=\"pagination pagination-right\"><ul>";
		const char* dcls=(*env).GetStringUTFChars(disableClass,false);
		const char* ccls=(*env).GetStringUTFChars(currentClass,false);
		//首页按钮
		if (pageNo > 1) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,1, "首页"));
			strcat(html,"</li>");
		}else{
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>首页</a></li>");
		}
		//上一页按钮
		if (prev > 0) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,prev, "上一页"));
			strcat(html,"</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html, "\"><a>上一页</a></li>");
		}
		// 总页数小于最大按钮数
		if (totalPage <= cutBtnNum) {
			for (int i = 1; i <= totalPage; i++) {
				if (pageNo == i) {
					strcat(html,"<li class=\"active\"><a>");
					char* no;
					sprintf(no,"%ld",i); 
					strcat(html,no);
					strcat(html,"</a></li>");
				} else {
					strcat(html,"<li>");
					strcat(html,wrapGoLink(env,i, i));
					strcat(html,"</li>");
				}
			}
		} else {
			// 中间有省略
			// 第一页
			if (pageNo == 1) {
				strcat(html,"<li class=\"active\"><a>1</a></li>");
			} else {
				strcat(html,"<li>");
				strcat(html, wrapGoLink(env,1, 1));
				strcat(html,"</li>");
			}
			int harf = cutBtnNum / 2;
			// 中间
			if (pageNo > harf + cutBtnNum % 2 + 1) {
				strcat(html,"<li><a>...</a></li>");
			}
			int start = pageNo - harf;
			int end = pageNo + harf;
			if (pageNo - harf < 2) {
				start = 2;
				end = start + cutBtnNum - rest;
			}
			if (pageNo + harf > totalPage - 1) {
				end = totalPage - 1;
				start = end - cutBtnNum + rest;
			}
			for (int i = start; i <= end; i++) {
				if (pageNo == i) {
					strcat(html,"<li class=\"");
					strcat(html,ccls);
					strcat(html,"\"><a>");
					strcat(html,long2char_pointer(i));
					strcat(html,"</a></li>");
				} else {
					strcat(html,"<li>");
					strcat(html,wrapGoLink(env,i, i));
					strcat(html,"</li>");
				}
			}
			if (pageNo < totalPage - harf - cutBtnNum % 2) {
				strcat(html,"<li><a>...</a></li>");
			}
			// 最后一页
			if (pageNo == totalPage) {
				strcat(html,"<li class=\"");
				strcat(html,ccls);
				strcat(html,"\"><a>");
				char* no;
				sprintf(no,"%ld",totalPage);
				strcat(html,no);
				strcat(html,"</a></li>");
			} else {
				strcat(html,"<li>");
				strcat(html,wrapGoLink(env,totalPage, totalPage));
				strcat(html, "</li>");
			}
		}
		// 下一页按钮
		if (next > 0) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,next, "下一页"));
			strcat(html, "</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>下一页</a></li>");
		}
		// 末页
		if (pageNo < totalPage) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,totalPage, "尾页"));
			strcat(html,"</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>尾页</a></li>");
		}
		(*env).ReleaseStringUTFChars(disableClass, dcls);//释放资源
		(*env).ReleaseStringUTFChars(currentClass, ccls);
		return (*env).NewStringUTF(html);
}
/**
	* 生成连接
	* 
	* @param pageNo
	* @param text
	* @return
	*/
char * wrapGoLink(JNIEnv * env, jint pageNo, char* text) {
	char* builder="<a href=\"javascript:void(0);\" onclick=\"goPage(";
	char* no;
	sprintf(no,"%ld",pageNo);
	strcat(builder,no);
	strcat(builder,")\">");

	//const char* txt=(*env).GetStringUTFChars(text,false);
	//if(txt==NULL){//不要忘记检测，否则分配内存失败会抛出异常
	//	strcat(builder,txt);
	//}else{
	//	strcat(builder,"--");
	//}
	strcat(builder,text);
	strcat(builder,"</a>");
	return builder;
}

char * wrapGoLink(JNIEnv * env, jint pageNo, jint text) {
	char* builder="<a href=\"javascript:void(0);\" onclick=\"goPage(";
	char* no;
	sprintf(no,"%ld",pageNo);
	strcat(builder,no);
	strcat(builder,")\">");

	//const char* txt=(*env).GetStringUTFChars(text,false);
	//if(txt==NULL){//不要忘记检测，否则分配内存失败会抛出异常
	//	strcat(builder,txt);
	//}else{
	//	strcat(builder,"--");
	//}
	char* no2;
	sprintf(no,"%ld",text); 
	strcat(builder,no2);
	strcat(builder,"</a>");
	return builder;
}
//jint(long) to char pointer for string concat
char* long2char_pointer(long i){
	char* no;
	sprintf(no,"%ld",i); 
	return no;
}