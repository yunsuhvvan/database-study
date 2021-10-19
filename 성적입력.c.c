#include <stdio.h>


typedef struct std {
	char name[31];
	int korean;
	int english;
	int math;
	int total;
	double average;
} Std;


#define LENGTH 3

Std stds[LENGTH];


void inputInformation() {
	
 
	int idx; 
	
	printf("학생 3명의 정보를 차례대로 입력하세요\n\n");
	for (idx = 0; idx < LENGTH; idx++) {
		printf("학생 %d 이름 >>> ", idx + 1);
		gets(stds[idx].name);  
		
		do {
			printf("국어   >>>");
			scanf("%d", &stds[idx].korean);
			if (stds[idx].korean < 0 || stds[idx].korean > 100){
				printf("점수를 다시 입력하세요.\n");
			}
		} while (stds[idx].korean < 0 || stds[idx].korean > 100);
		
			do {
			printf("영어   >>>");
			scanf("%d", &stds[idx].english);
			if (stds[idx].english < 0 || stds[idx].english > 100){
				printf("점수를 다시 입력하세요.\n");
			}
		} while (stds[idx].english < 0 || stds[idx].english > 100);
			do {
			printf("수학   >>>");
			scanf("%d", &stds[idx].math);
			if (stds[idx].math < 0 || stds[idx].math > 100){
				printf("점수를 다시 입력하세요.\n");
			}
		} while (stds[idx].math < 0 || stds[idx].math > 100);
		
		fflush(stdin);
		
		
		stds[idx].total = stds[idx].korean + stds[idx].english + stds[idx].math;
		stds[idx].average = (double)stds[idx].total / LENGTH; 
		
	}
}

void generateFile() {
	int idx;
	FILE * fp = fopen("score.csv", "wt");
	if (fp == NULL) {
		fprintf(stderr, "file open error!");
		return;
	}
	fprintf(fp, "성명,국어,영어,수학,총점,평균\n");
	for (idx = 0; idx < LENGTH; idx++) {
		fprintf(fp, "%s,%d,%d,%d,%d,%.2f\n", stds[idx].name, stds[idx].korean, stds[idx].english, stds[idx].math, stds[idx].total, stds[idx].average);
	}
	printf("score.csv파일이 생성되었습니다.");
  
	 fclose(fp);

}
	
int main() {
	inputInformation();
	generateFile();
	return 0;
}
