#include <stdio.h>
#include <string.h>

#define LENGTH 10


typedef struct book { 
	int bookNumber;
	char bookName[31];
	char writer[31];
	
} Book;

Book books[LENGTH];
int i = 0;

void menu(){
	printf(":::: ������� ���α׷�::::\n");
	printf("1.�������� ���\n"); 
	printf("2.�������� ��ȸ\n");
	printf("3.��ü���� ���\n");
	printf("0.���α׷� ����\n");
}

void addBook(){
	int bookNumber;
	char bookName[31];
	char writer[31];
	
		if (i == LENGTH){
		printf("���� �Ұ���.\n");
		return; 
	}
	
	printf("�ű� å ��ȣ �Է� >>>");
	scanf("%d" ,&bookNumber);
	if(bookNumber <= 1000 || bookNumber >= 10000){
		printf("����� �� ���� ��ȣ�Դϴ�.\n");
		return;
	}
	
	printf("�ű� å ���� �Է� >>>");
	scanf("%s" , bookName);
	printf("�ű� å ���� �Է� >>>");
	scanf("%s", writer);
	
	books[i].bookNumber = bookNumber;
	strcpy(books[i].bookName , bookName);
	strcpy(books[i].writer , writer);
	
	 
	
	
		
	i++;
} 

void queryBook(){
	int lookfor;
	int idx ;
	
	if(i ==0) {
		printf("������ �����ϴ�.\n");
		return;
	}
	
	printf("��ȸ�� å ��ȣ �Է�.>>>");
	scanf("%d" , &lookfor);
	for(idx = 0;  idx < i; idx++){
		if( lookfor == books[idx].bookNumber){
			printf("��ȸ ��� : %s, %s \n", books[idx].bookName , books[idx].writer );
			return;
		
		} 
			
	}
	printf(" å ��ȣ : %d �� �������� �ʴ� ���� �Դϴ�.\n" , lookfor);
}

void printBook(){
	int idx;
	
	if(i == 0){
		printf("å�� �����ϴ�.\n");
		return;
	}
	
	for (idx = 0; idx < i; idx ++){
		printf("%d, %s, %s \n", books[idx].bookNumber , books[idx].bookName, books[idx].writer);
		
		
	}
	
}


int main(){
	int putnumber;
	
	while(1){
		menu();
		printf("�޴� ���� (1,2,3,0) >>> ");
		scanf("%d", &putnumber); 
		
		switch(putnumber){
			case 1: addBook(); break;
			case 2: queryBook(); break;
			case 3: printBook(); break;
			case 0: printf("���α׷��� �����մϴ�.\n" ); return 0;
			default : printf("������ �� ����  �۾��Դϴ�. �ٽ� �Է��ϼ���\n");
		}
		
	}
	
}





















