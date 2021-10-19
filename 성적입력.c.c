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
	
	printf("�л� 3���� ������ ���ʴ�� �Է��ϼ���\n\n");
	for (idx = 0; idx < LENGTH; idx++) {
		printf("�л� %d �̸� >>> ", idx + 1);
		gets(stds[idx].name);  
		
		do {
			printf("����   >>>");
			scanf("%d", &stds[idx].korean);
			if (stds[idx].korean < 0 || stds[idx].korean > 100){
				printf("������ �ٽ� �Է��ϼ���.\n");
			}
		} while (stds[idx].korean < 0 || stds[idx].korean > 100);
		
			do {
			printf("����   >>>");
			scanf("%d", &stds[idx].english);
			if (stds[idx].english < 0 || stds[idx].english > 100){
				printf("������ �ٽ� �Է��ϼ���.\n");
			}
		} while (stds[idx].english < 0 || stds[idx].english > 100);
			do {
			printf("����   >>>");
			scanf("%d", &stds[idx].math);
			if (stds[idx].math < 0 || stds[idx].math > 100){
				printf("������ �ٽ� �Է��ϼ���.\n");
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
	fprintf(fp, "����,����,����,����,����,���\n");
	for (idx = 0; idx < LENGTH; idx++) {
		fprintf(fp, "%s,%d,%d,%d,%d,%.2f\n", stds[idx].name, stds[idx].korean, stds[idx].english, stds[idx].math, stds[idx].total, stds[idx].average);
	}
	printf("score.csv������ �����Ǿ����ϴ�.");
  
	 fclose(fp);

}
	
int main() {
	inputInformation();
	generateFile();
	return 0;
}
