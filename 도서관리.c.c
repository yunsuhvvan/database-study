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
	printf(":::: 도서등록 프로그램::::\n");
	printf("1.도서정보 등록\n"); 
	printf("2.도서정보 조회\n");
	printf("3.전체도서 목록\n");
	printf("0.프로그램 종료\n");
}

void addBook(){
	int bookNumber;
	char bookName[31];
	char writer[31];
	
		if (i == LENGTH){
		printf("저장 불가능.\n");
		return; 
	}
	
	printf("신규 책 번호 입력 >>>");
	scanf("%d" ,&bookNumber);
	if(bookNumber <= 1000 || bookNumber >= 10000){
		printf("등록할 수 없는 번호입니다.\n");
		return;
	}
	
	printf("신규 책 제목 입력 >>>");
	scanf("%s" , bookName);
	printf("신규 책 저자 입력 >>>");
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
		printf("도서가 없습니다.\n");
		return;
	}
	
	printf("조회할 책 번호 입력.>>>");
	scanf("%d" , &lookfor);
	for(idx = 0;  idx < i; idx++){
		if( lookfor == books[idx].bookNumber){
			printf("조회 결과 : %s, %s \n", books[idx].bookName , books[idx].writer );
			return;
		
		} 
			
	}
	printf(" 책 번호 : %d 은 존재하지 않는 도서 입니다.\n" , lookfor);
}

void printBook(){
	int idx;
	
	if(i == 0){
		printf("책이 없습니다.\n");
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
		printf("메뉴 선택 (1,2,3,0) >>> ");
		scanf("%d", &putnumber); 
		
		switch(putnumber){
			case 1: addBook(); break;
			case 2: queryBook(); break;
			case 3: printBook(); break;
			case 0: printf("프로그램을 종료합니다.\n" ); return 0;
			default : printf("접근할 수 없는  작업입니다. 다시 입력하세요\n");
		}
		
	}
	
}





















