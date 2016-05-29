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
 *���Խӿ��޷���ֵ
 * Class:     util_NativeUtil
 * Method:    hello
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_util_NativeUtil_hello
  (JNIEnv *, jclass){
	printf("hello");
}
/*
 *���Խӿ�2������ֵ
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
 * ���ɷ�ҳ��ǩ
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
		//��ҳ��ť
		if (pageNo > 1) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,1, "��ҳ"));
			strcat(html,"</li>");
		}else{
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>��ҳ</a></li>");
		}
		//��һҳ��ť
		if (prev > 0) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,prev, "��һҳ"));
			strcat(html,"</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html, "\"><a>��һҳ</a></li>");
		}
		// ��ҳ��С�����ť��
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
			// �м���ʡ��
			// ��һҳ
			if (pageNo == 1) {
				strcat(html,"<li class=\"active\"><a>1</a></li>");
			} else {
				strcat(html,"<li>");
				strcat(html, wrapGoLink(env,1, 1));
				strcat(html,"</li>");
			}
			int harf = cutBtnNum / 2;
			// �м�
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
			// ���һҳ
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
		// ��һҳ��ť
		if (next > 0) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,next, "��һҳ"));
			strcat(html, "</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>��һҳ</a></li>");
		}
		// ĩҳ
		if (pageNo < totalPage) {
			strcat(html,"<li>");
			strcat(html,wrapGoLink(env,totalPage, "βҳ"));
			strcat(html,"</li>");
		} else {
			strcat(html,"<li class=\"");
			strcat(html,dcls);
			strcat(html,"\"><a>βҳ</a></li>");
		}
		(*env).ReleaseStringUTFChars(disableClass, dcls);//�ͷ���Դ
		(*env).ReleaseStringUTFChars(currentClass, ccls);
		return (*env).NewStringUTF(html);
}
/**
	* ��������
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
	//if(txt==NULL){//��Ҫ���Ǽ�⣬��������ڴ�ʧ�ܻ��׳��쳣
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
	//if(txt==NULL){//��Ҫ���Ǽ�⣬��������ڴ�ʧ�ܻ��׳��쳣
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