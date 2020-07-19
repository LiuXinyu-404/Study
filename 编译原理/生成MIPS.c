#define _CRT_SECURE_NO_DEPRECATE
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#define MAX 1000
#define NHASH  291143
#define NMULT  31
#define HMAX 291200

enum symbol{
	OTHER=1,
	IDENFR,
	INTCON,
	CHARCON,
	STRCON,
	CONSTTK,
	INTTK,
	CHARTK,
	VOIDTK,
	MAINTK,
	IFTK,
	ELSETK,
	DOTK,
	WHILETK,
	FORTK,
	SCANFTK,
	PRINTFTK,
	RETURNTK,
	PLUS,
	MINU,
	MULT,
	DIV,
	LSS,
	LEQ,
	GRE,
	GEQ,
	EQL,
	NEQ,
	ASSIGN,
	SEMICN,
	COMMA,
	LPARENT,
	RPARENT,
	LBRACK,
	RBRACK,
	LBRACE,
	RBRACE
};

enum type{
	INT=50,
	CHAR,
	CINT,
	CCHAR,
	IFUNC,
	CFUNC,
	VFUNC,
	IARRAY,
	CARRAY,
	NONE 
}; 

enum code{
	TEXT = 100,
	DATA
};

struct node{
	enum symbol Symbol;
	char Token[MAX];
}; 

struct iden{
	char Name[MAX];
	enum type Type;
	int Value;
	struct iden *next;
	struct para *Para;
	int paras;
};

struct four{
	char op[10];
	char var1[200];
	char var2[200];
	char var3[200];
};

struct para{
	enum type Type;
	struct para *next;
};

struct hash{
	struct iden *next;
};

struct mips{
	char Name[200];
};

//定义 
char Char;
char Token[MAX];
char Nowitem[MAX];
char Names[MAX];
char Relop[10];
int TokenLen;
int Num;
int Sign;
int Line;
int SLINE;
int NFUNCLEN;
int PARAS;
int ITEMS;
int EXPRS;
int Varcnt;
int FOURcnt;
int MIPScnt;
enum symbol Symbol;
enum code Code;
int EXPR,EXPR1;
struct node Symbols[MAX];
struct iden Table[MAX];
struct hash HASH[HMAX];
struct four FOUR[MAX];
struct mips MIPS[MAX];
struct iden SID;
struct iden *NFUNC;
struct iden *UFUNC;

int RETURNFLAG;
int SymbolsLen,TableLen;
int VAR;
enum type EXPRTYPE;

void Factor();
void State();
void StateS();
int Getsym();
void PRINT(enum symbol SYMBOL,char TOKEN[]);
void ERROR(char EType,int LINE);
enum type FIND(char name[]);

void PrintMid(char *str1, char *str2, char *str3, char *str4){
	strcpy(FOUR[FOURcnt].op,str1);
	strcpy(FOUR[FOURcnt].var1,str2);
	strcpy(FOUR[FOURcnt].var2,str3);
	strcpy(FOUR[FOURcnt].var3,str4);
	FOURcnt++;
	//printf("%s %s %s %s\n",str1,str2,str3,str4);
}

char *Nextvar(){
	char *var = (char*)malloc(sizeof(char) * 20);
	sprintf(var, "t%d", Varcnt++);
	return var;
}

unsigned int hash(char *str){
    unsigned int h=0;
    char *p;
    for(p=str; *p!='\0'; p++)
        h = NMULT*h + *p;
    return h % NHASH;
}

void SLine(){
	SLINE = Line;
} 

void SID_NAME(){
	if(FIND(Token) != NONE)
		ERROR('b',Line);
	strcpy(SID.Name,Token);
}

void SID_TYPE(enum type Type){
	SID.Type = Type;
}

void SID_VALUE(){
	SID.Value = Num; 
}

void SID_CVALUE(){
	SID.Value = Token[0]; 
}

void ADDMIPS(char *str){
	strcpy(MIPS[MIPScnt++].Name,str);
}

int FINDMIPS(char *str){
	int i;
	for(i = 0; i < MIPScnt;i++){
		if(strcmp(MIPS[i].Name,str) == 0)
			return i;
	}
	return -1;
}

void ADDTable(){
	struct iden *p;
	if(FIND(SID.Name)==NONE)
	{
		Table[TableLen++] = SID;
		if(HASH[hash(SID.Name)].next != NULL)
		{
			p = (HASH[hash(SID.Name)].next -> next);
			while(p != NULL)
				p = p -> next;
			p = &Table[TableLen - 1];
		}
		else
		HASH[hash(SID.Name)].next = &Table[TableLen - 1];
	}
	if(SID.Type == IFUNC||SID.Type == CFUNC||SID.Type == VFUNC){
		if(SID.Type == IFUNC)
			PrintMid("func","int",SID.Name,"()");
		else if(SID.Type == CFUNC)
			PrintMid("func","char",SID.Name,"()");
		else if(SID.Type == VFUNC)
			PrintMid("func","void",SID.Name,"()");
		NFUNC = &Table[TableLen - 1];
		NFUNCLEN = TableLen - 1;
	}
	SID.Value = 0;
}

void POPTable(){
	struct iden *p,*q;
	for(;TableLen - 1> NFUNCLEN; TableLen--){
		for(p = HASH[hash(Table[TableLen - 1].Name)].next; p->next!=NULL;q = p,p = p->next){
			if(strcmp(p->Name,Table[TableLen - 1].Name)==0)
				q->next=p->next;
		}
		memset(Table[TableLen - 1].Name,0,sizeof(Table[TableLen - 1].Name));
		Table[TableLen - 1].Type = NONE;
		Table[TableLen - 1].Value = 0;
		Table[TableLen - 1].paras = 0;
	}
}

enum type FIND(char name[]){  
	struct iden *p;
	p = HASH[hash(name)].next;
		if(p != NULL){
			if(strcmp(p->Name,name) == 0){
				if(p->Type == IFUNC||p->Type == VFUNC||p->Type == CFUNC)
				{
					UFUNC = p;
				}
				return p->Type;
			}
				
			while(p->next != NULL){
				p = p->next;
				if(strcmp(p->Name,name) == 0){
					if(p->Type == IFUNC||p->Type == VFUNC||p->Type == CFUNC)
					{
						UFUNC = p;
					}
					return p->Type;
				}
			}	
		}
	return NONE;
}

void ERROR(char EType, int LINE)
{
	// switch (EType){
	// 	case 'a':printf("非法符号或不符合词法");
	// 	break;
	// 	case 'b':printf("名字重定义");
	// 	break;
	// 	case 'c':printf("未定义的名字");
	// 	break;
	// 	case 'd':printf("函数参数个数不匹配");
	// 	break;
	// 	case 'e':printf("函数参数类型不匹配");
	// 	break;
	// 	case 'f':printf("条件判断中出现不合法的类型");
	// 	break;
	// 	case 'g':printf("无返回值的函数存在不匹配的return语句");
	// 	break;
	// 	case 'h':printf("有返回值的函数缺少return语句或存在不匹配的return语句");
	// 	break;
	// 	case 'i':printf("数组元素的下标只能是整型表达式");
	// 	break;
	// 	case 'j':printf("不能改变常量的值");
	// 	break;
	// 	case 'k':printf("应为分号");
	// 	break;
	// 	case 'l':printf("应为右小括号')'");
	// 	break;
	// 	case 'm':printf("应为右中括号']'");
	// 	break;
	// 	case 'n':printf("do-while应为语句中缺少while");
	// 	break;
	// 	case 'o':printf("常量定义中=后面只能是整型或字符型常量");
	// 	break;
	// }
//	if(EType != 'c')
//	printf("%d %c\n",LINE,EType);
}

void E_SEMICN(){
	if(Symbol == SEMICN){
		Getsym();
	} 
	else 
		ERROR('k',SLINE);
} 

void E_RPARENT(){
	if(Symbol == RPARENT){
		PRINT(Symbol,Token);
		Getsym();
	} 
	else
	{
		ERROR('l',Line);
	}
}

void Getchar()
{
	Char = getchar();
}

void CleanToken()
{
	memset(Token,0,sizeof(Token));
	TokenLen = 0;
}

void CatToken()
{
	Token[TokenLen++] = Char;
}

void Retract()
{
	ungetc(Char,stdin);
}

//is判断 
int isconst()
{
	if(strcmp(Token,"const")==0)
		return 1;
	else
		return 0;
}

int isint()
{
	if(strcmp(Token,"int")==0)
		return 1;
	else
		return 0;
}

int ischar()
{
	if(strcmp(Token,"char")==0)
		return 1;
	else
		return 0;
}

int isvoid()
{
	if(strcmp(Token,"void")==0)
		return 1;
	else
		return 0;
}

int ismain()
{
	if(strcmp(Token,"main")==0)
		return 1;
	else
		return 0;
}

int isif()
{
	if(strcmp(Token,"if")==0)
		return 1;
	else
		return 0;
}

int iselse()
{
	if(strcmp(Token,"else")==0)
		return 1;
	else
		return 0;
}

int isdo()
{
	if(strcmp(Token,"do")==0)
		return 1;
	else
		return 0;
}

int iswhile()
{
	if(strcmp(Token,"while")==0)
		return 1;
	else
		return 0;
}

int isfor()
{
	if(strcmp(Token,"for")==0)
		return 1;
	else
		return 0;
}

int isscanf()
{
	if(strcmp(Token,"scanf")==0)
		return 1;
	else
		return 0;
}

int isprintf()
{
	if(strcmp(Token,"printf")==0)
		return 1;
	else
		return 0;
}

int isreturn()
{
	if(strcmp(Token,"return")==0)
		return 1;
	else
		return 0;
}

int isplus()
{
	if(Char == '+')
		return 1;
	else
		return 0;
}

int isminu()
{
	if(Char == '-')
		return 1;
	else
		return 0;
}

int ismult()
{
	if(Char == '*')
		return 1;
	else
		return 0;
}

int isdiv()
{
	if(Char == '/')
		return 1;
	else
		return 0;
}

int islss()
{
	if(Char == '<')
		return 1;
	else
		return 0;
}

int isgre()
{
	if(Char == '>')
		return 1;
	else
		return 0;
}

int isalso()
{
	if(Char == '!')
		return 1;
	else
		return 0;
}

int isassign()
{
	if(Char == '=')
		return 1;
	else
		return 0;
}

int issemicn()
{
	if(Char == ';')
		return 1;
	else
		return 0;
}

int iscomma()
{
	if(Char == ',')
		return 1;
	else
		return 0;
}

int islparent()
{
	if(Char == '(')
		return 1;
	else
		return 0;
}

int isrparent()
{
	if(Char == ')')
		return 1;
	else
		return 0;
}

int islbrack()
{
	if(Char == '[')
		return 1;
	else
		return 0;
}

int isrbrack()
{
	if(Char == ']')
		return 1;
	else
		return 0;
}

int islbrace()
{
	if(Char == '{')
		return 1;
	else
		return 0;
}

int isrbrace()
{
	if(Char == '}')
		return 1;
	else
		return 0;
}

int isdqm()
{
    if(Char == '"')
		return 1;
	else
		return 0;
}

int issqm()
{
	if(Char == '\'')
		return 1;
	else
		return 0;
}

enum symbol Reserver()
{
	if(isconst())
		return  CONSTTK;
	else if(isint())
		return INTTK;
	else if(ischar())
		return CHARTK;
	else if(isvoid())
		return VOIDTK;
	else if(ismain())
		return MAINTK;
	else if(isif())
		return IFTK;
	else if(iselse())
		return ELSETK;
	else if(isdo())
		return DOTK;
	else if(iswhile())
		return WHILETK;
	else if(isfor())
		return FORTK;
	else if(isscanf())
		return SCANFTK;
	else if(isprintf())
		return PRINTFTK;
	else if(isreturn())
		return RETURNTK;
	else
		return OTHER;
} 

int istk()
{
	if(Char == '_' || isalpha(Char))
		return 1;
	else
		return 0;
}

int Getsym()
{
	SLine();//分号行号 
	CleanToken();
	Symbol = OTHER;
	Getchar();
	if(Char == -1)
		return 0;
	while(isspace(Char)){
		if(Char == '\n')
			Line++;
		Getchar();
	}
	if(istk())//标识符 
	{
		while(istk()||isdigit(Char))
		{
			CatToken();
			Getchar();
		}
		Retract();
		enum symbol ResultValue = Reserver();
		
		if(ResultValue == OTHER)
			Symbol = IDENFR;
		else
			Symbol = ResultValue;
	}
	else if(isdigit(Char))//整型 
	{
		while(isdigit(Char))
		{
			CatToken();
			Getchar();
		}
		Retract();
		Num = Sign*atoi(Token);
		Sign = 1;
		Symbol = INTCON;
	}
	else if(issqm())//'
	{
		Getchar();
		if(isplus()||isminu()||ismult()||isdiv()||istk()||isdigit(Char))
				CatToken();
		else
			ERROR('a',Line);
		Getchar();
		if(issqm())
			Symbol = CHARCON;
	}
	else if(isdqm())//"
	{
		do{
			Getchar();
			if(Char == 32 || Char == 33 ||(Char >= 35 && Char <=126))
				CatToken();
			else if(Char != 34 && Char != 10)
				ERROR('a',Line);
		}while(!isdqm() && Char!='\n');
		if(Char == '\n'){
			ERROR('a',Line);
			Line++;
		}
		if(TokenLen <= 0)
			Symbol = OTHER;
		else
			Symbol = STRCON;
	}
	else if(isplus())//+ 
		Symbol = PLUS;
	else if(isminu())//- 
		Symbol = MINU;
	else if(ismult())//* 
		Symbol = MULT;
	else if(islss())//< 
	{
		Getchar();
		if(isassign())
			Symbol = LEQ;//<=
		else{
			Retract();
			Symbol = LSS;
		}
	}	
	else if(isgre())//>
	{
		Getchar();
		if(isassign())//>=
			Symbol = GEQ;
		else{
			Retract();
			Symbol = GRE;
		}
	}	
	else if(isassign())//=
	{
		Getchar();
		if(isassign())//==
			Symbol = EQL;
		else{
			Retract();
			Symbol = ASSIGN;
		}
	}
	else if(isalso())//!
	{
		Getchar();
		if(isassign())//!=
			Symbol = NEQ;
		else{
			Retract();
			Symbol = OTHER;
		}
	}
	else if(issemicn())//;
		Symbol = SEMICN;
	else if(iscomma())//,
		Symbol = COMMA;
	else if(islparent())//(
		Symbol = LPARENT;
	else if(isrparent())//)
		Symbol = RPARENT;
	else if(islbrack())//[
		Symbol = LBRACK;
	else if(isrbrack())//]
		Symbol = RBRACK;
	else if(islbrace())//{
		Symbol = LBRACE;
	else if(isrbrace())//}
		Symbol = RBRACE;
	else if(isdiv())///
	{
		Getchar();///?
		if(ismult())///*
		{ 
			do{
				Getchar();///*?
			}while(!ismult());///* */ 123123
			do{
				Getchar();
				if(isdiv()) 
				{
					Symbol = OTHER;///*1234*/
					return Symbol;
				}
			}while(!isdiv());
		}
		Retract();
		Symbol = DIV;
	}
	else {
		ERROR('a',Line);
		return OTHER;
	}
	return Symbol;
}

void PRINT(enum symbol SYMBOL,char TOKEN[]){
//	 switch(SYMBOL) {
//	 		case IDENFR: printf("IDENFR %s",TOKEN);
//	 		break;
//	 		case INTCON: printf("INTCON %s",TOKEN);
//	 		break;
//	 		case CHARCON: printf("CHARCON %s",TOKEN);
//	 		break;
//	 		case STRCON: printf("STRCON %s",TOKEN);
//	 		break;
//	 		case CONSTTK: printf("CONSTTK const");
//	 		break;
//	 		case INTTK: printf("INTTK int");
//	 		break;
//	 		case CHARTK: printf("CHARTK char");
//	 		break;
//	 		case VOIDTK: printf("VOIDTK void");
//	 		break;
//	 		case MAINTK: printf("MAINTK main");
//	 		break;
//	 		case IFTK: printf("IFTK if");
//	 		break;
//	 		case ELSETK: printf("ELSETK else");
//	 		break;
//	 		case DOTK: printf("DOTK do");
//	 		break;
//	 		case WHILETK: printf("WHILETK while");
//	 		break;
//	 		case FORTK: printf("FORTK for");
//	 		break;
//	 		case SCANFTK: printf("SCANFTK scanf");
//	 		break;
//	 		case PRINTFTK: printf("PRINTFTK printf");
//	 		break;
//	 		case RETURNTK: printf("RETURNTK return");
//	 		break;
//	 		case PLUS: printf("PLUS +");
//	 		break;
//	 		case MINU: printf("MINU -");
//	 		break;
//	 		case MULT: printf("MULT *");
//	 		break;
//	 		case DIV: printf("DIV /");
//	 		break;
//	 		case LSS: printf("LSS <");
//	 		break;
//	 		case LEQ: printf("LEQ <=");
//	 		break;
//	 		case GRE: printf("GRE >");
//	 		break;
//	 		case GEQ: printf("GEQ >=");
//	 		break;
//	 		case EQL: printf("EQL ==");
//	 		break;
//	 		case NEQ: printf("NEQ !=");
//	 		break;
//	 		case ASSIGN: printf("ASSIGN =");
//	 		break;
//	 		case SEMICN: printf("SEMICN ;");
//	 		break;
//	 		case COMMA: printf("COMMA ,");
//	 		break;
//	 		case LPARENT: printf("LPARENT (");
//	 		break;
//	 		case RPARENT: printf("RPARENT )");
//	 		break;
//	 		case LBRACK: printf("LBRACK [");
//	 		break;
//	 		case RBRACK: printf("RBRACK ]");
//	 		break;
//	 		case LBRACE: printf("LBRACE {");
//	 		break;
//	 		case RBRACE: printf("RBRACE }");
//	 		break;
//	 		case OTHER:
//	 		break;
//	 	}
//	 	printf("\n");
} 

void ADDSymbols()
{
	Symbols[SymbolsLen].Symbol = Symbol;
	strcpy(Symbols[SymbolsLen++].Token,Token);
}

void RMSymbols()
{
	SymbolsLen--;
}

void RLSymbols()
{
	int i;
	for(i = 0;i < SymbolsLen;i++)
	{
		PRINT(Symbols[i].Symbol,Symbols[i].Token);
	}
	SymbolsLen = 0;
}

void UIntCon(){
	if(Symbol == INTCON){
		PRINT(Symbol,Token);
		if(TokenLen == 1||(Token[0] != '0' && TokenLen > 1)){
			//printf("<无符号整数>\n");
		}
//		else
//			ERROR('z',Line);
	}

}

void IntCON(){
	if(Symbol == PLUS || Symbol == MINU){
		if(Symbol == PLUS)
			Sign = 1;
		else if(Symbol == MINU)
			Sign = -1; 
		PRINT(Symbol,Token);
		Getsym();
		UIntCon();
	}
	else if(Symbol == INTCON){
		Sign = 1;
		UIntCon();
	}
	else
		ERROR('o',Line);
	//printf("<整数>\n");
}

void IntTK(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == IDENFR){
		SID_NAME();
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == ASSIGN){
			PRINT(Symbol,Token);
			Getsym();
			if(Symbol == INTCON || Symbol == PLUS || Symbol == MINU)
			{
				IntCON();
				SID_VALUE();
			}
			else
				ERROR('o',Line);
		}
	}
}

void CharCON(){
}

void CharTK(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == IDENFR){
		SID_NAME(); 
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == ASSIGN){
			PRINT(Symbol,Token);
			Getsym();
			if(Symbol == CHARCON)
			{
				PRINT(Symbol,Token);
				SID_CVALUE();
				CharCON();
			}
			else
				ERROR('o',Line);
		}
	}
}

void ConstTK(){
	char place1[ 30 ], place2[ 30 ];
	PRINT(Symbol,Token);
	Getsym(); 
	if(Symbol == INTTK){
			SID_TYPE(CINT); 
			IntTK();
			sprintf(place1,"%d",SID.Value);
			strcpy(place2,SID.Name);
			ADDTable();
			PrintMid("const","int",place1,place2);
			Getsym();
		while(Symbol == COMMA){
			IntTK();
			sprintf(place1,"%d",SID.Value);
			strcpy(place2,SID.Name);
			ADDTable();
			PrintMid("const","int",place1,place2);
			Getsym(); 
	}
	}
	else if(Symbol == CHARTK){ 
			SID_TYPE(CCHAR); 
			CharTK();
			sprintf(place1,"%c",SID.Value);
			strcpy(place2,SID.Name);
			ADDTable();
			PrintMid("const","char",place1,place2);
			Getsym();
		while(Symbol == COMMA){
			CharTK();
			sprintf(place1,"%c",SID.Value);
			strcpy(place2,SID.Name);
			ADDTable();
			PrintMid("const","char",place1,place2);
			Getsym(); 
	}
	}
}


void ConstTKS(){
	while(Symbol == CONSTTK){
		ConstTK();
		//printf("<常量定义>\n");
		PRINT(Symbol,Token);
		E_SEMICN();
	}
	//printf("<常量说明>\n");
}

void VarTK(){
	char space1[200], space2[200];
	while(Symbol == INTTK || Symbol == CHARTK){
		if(Symbol == INTTK)
			SID_TYPE(INT);
		else if(Symbol == CHARTK)
			SID_TYPE(CHAR);
		ADDSymbols();//int/char
		Getsym();
		while(Symbol == IDENFR){//a
			SID_NAME();
			sprintf(space2, "%s", SID.Name);
			ADDSymbols();
			Getsym();
			if(Symbol == LBRACK){//[ 
				if(SID.Type == INT)
					SID_TYPE(IARRAY);
				else if(SID.Type == CHAR)
					SID_TYPE(CARRAY);
				ADDSymbols();
				Getsym();
				RLSymbols();
				if(Symbol == INTCON){//10
					UIntCon();//数字
				}
//				else
//				 	ERROR('i',Line);
				sprintf(space1, "%d", Num);
				PrintMid("var", "array", space1, space2);
				Getsym();
				if(Symbol == RBRACK){//]
					PRINT(Symbol,Token);
					Getsym();
				}
				else
					ERROR('m',Line);
				
			}
			else if(Symbol == LPARENT)
				return ;
			if(Symbol == COMMA || Symbol == SEMICN){
				ADDTable();
				if(SID.Type == INT){
					PrintMid("var", "int", "  ",space2);
				}
				else if (SID.Type == CHAR)
				{
					PrintMid("var", "char", "  ",space2);
				}
				RLSymbols();
				VAR = 1;
				if(Symbol == SEMICN){
					//printf("<变量定义>\n");
					PRINT(Symbol,Token);
					Getsym();
					break;
				}
				PRINT(Symbol,Token);
				Getsym();
			}
			else
				ERROR('k',SLINE); 
		}
	}
}

void  VarTKS(){
	VarTK();
	if(VAR == 1){
		//printf("<变量说明>\n");
	}
	VAR = 0;
}

void HeadTK(){
	RLSymbols();
	//printf("<声明头部>\n");
	PRINT(Symbol,Token);
}

void Item(){
	char place1[ 200 ], place2[ 200 ], place3[ 200 ];
	Factor();
	strcpy(place3, Nowitem);
	while(Symbol == MULT || Symbol == DIV){
		ITEMS++;
		strcpy(place1, place3);
		if(Symbol == MULT){
			EXPR++;//出现运算
			EXPRTYPE = INT;
			PRINT(Symbol,Token);
			Getsym();
			Factor();
			strcpy(place2, Nowitem);
            strcpy(place3, Nextvar());//申请临时变量
            PrintMid("*", place1, place2, place3);
		}
		else if(Symbol == DIV){
			Getsym();
            Factor();
            strcpy(place2, Nowitem);
            strcpy(place3, Nextvar());
            PrintMid("/", place1, place2, place3);
		}
		Factor();
	}
	strcpy(Nowitem, place3);
	//printf("<项>\n");
}

int isExpr(){
	if(Symbol == PLUS || Symbol == MINU || Symbol == IDENFR || Symbol == LPARENT|| Symbol == INTCON || Symbol == CHARCON)
		return 1;
	else
		return 0;
} 

void Expr(){
		char place1[ 30 ], place2[ 30 ], place3[ 30 ];
		if(Symbol == PLUS || Symbol == MINU){
			EXPR++;//出现运算 
			EXPRTYPE = INT;
			PRINT(Symbol,Token);
			if(Symbol == PLUS){
				Getsym();
             	Item();
				strcpy(place3, Nowitem);
			}
			else if(Symbol == MINU){
				Getsym();
	            Item();
				strcpy(place1, Nowitem);
	            strcpy(place3, Nextvar());
				PrintMid("-","0",place1, place3);
			}
			Getsym();
		}
		else{
			Item();
			strcpy(place3, Nowitem);
		}
	while(Symbol == PLUS || Symbol == MINU){
		EXPRS++;
		EXPRTYPE = INT;
		strcpy(place1, place3);
		if(Symbol == PLUS){
			EXPR++;//出现运算 
			EXPRTYPE = INT;
			PRINT(Symbol,Token);
			Getsym();
			Item();
			strcpy(place2, Nowitem);
            strcpy(place3, Nextvar());
            PrintMid("+", place1, place2, place3);
		}
		else if(Symbol == MINU){
			EXPR++;//出现运算 
			EXPRTYPE = INT;
			PRINT(Symbol,Token);
			Getsym();
			Item();
			strcpy(place2, Nowitem);
	        strcpy(place3, Nextvar());
			PrintMid("-", place1, place2, place3);
		}
	}
	strcpy(Nowitem,place3);
	//printf("<表达式>\n"); 
}

void VPTable(){
		struct para *NPANA;
		PARAS = 0;
		for(NPANA = UFUNC -> Para ;NPANA != NULL;)
		{
			int EXPR1;
			EXPR1=EXPR;
			EXPR = 0;
			Expr();
			PrintMid("push", "  ", "  ", Nowitem);
			if(((NPANA->Type == INT || NPANA->Type == IARRAY || NPANA->Type == IFUNC) && EXPR > 0)||((NPANA->Type == CHAR || NPANA->Type == CARRAY || NPANA->Type == CFUNC) && EXPR == 0)){
			}
			else
				ERROR('e',Line);
			EXPR=EXPR1;
			PARAS++;
			if(Symbol == COMMA){
				PRINT(Symbol,Token);
				Getsym();
			}
			else 
				break;
			if(NPANA -> next == NULL)
				break;
			NPANA = NPANA -> next;
		}
		if(UFUNC->paras != PARAS ){
			ERROR('d',Line);
			while(Symbol != RPARENT && SLINE == Line){
				Getsym(); 
			}
		}
		E_RPARENT();
	//printf("<值参数表>\n");
}

void Func(){
	RLSymbols();
	Getsym();
	VPTable();
	//printf("<有返回值函数调用语句>\n");
}

void VFunc(){
	RLSymbols();
	Getsym(); 
	VPTable();
	PRINT(Symbol,Token);
	//printf("<无返回值函数调用语句>\n");
}

void Factor(){
	char names[30], place3[30];
	if(Symbol == IDENFR){
		if(FIND(Token) == NONE)
			ERROR('c',Line);
		else if(FIND(Token) == INT || FIND(Token) == IARRAY || FIND(Token) == IFUNC || FIND(Token) == CINT){
			EXPR++;
			EXPRTYPE = INT;
		}
		else if(FIND(Token) == CHAR || FIND(Token) == CARRAY || FIND(Token) == CFUNC || FIND(Token) == CCHAR){
			
		}
		strcpy(names,Token);
		ADDSymbols();
		Getsym();
		if(Symbol == LBRACK){
			ADDSymbols();
			RLSymbols();
			Getsym();
			Expr();
			strcpy(place3, Nextvar());//生成临时变量
            PrintMid("[]", names, Nowitem, place3);
			strcpy(Nowitem, place3);
			if(Symbol == RBRACK){
				PRINT(Symbol,Token);
				Getsym();
			}
			else
			{
				ERROR('m',Line);
			}
		}
		else if(Symbol == LPARENT){
			ADDSymbols();
			enum type EXPRTEMP1 = EXPRTYPE;
			int EXPRSTEMP1 = EXPRS;
			int ITEMSTEMP1 = ITEMS;
			Func();
			strcpy(place3, Nextvar());//生成临时变量
            PrintMid("call", names, "  ", place3);
			strcpy(Nowitem, place3);
			EXPRTYPE = EXPRTEMP1;
			EXPRS = EXPRSTEMP1;
			ITEMS = ITEMSTEMP1;
			EXPR = EXPR1;
		}
		else{
			strcpy(Nowitem, names);
		}
	}
	else if(Symbol == LPARENT){
		PRINT(Symbol,Token);
		Getsym();
		enum type EXPRTEMP1 = EXPRTYPE;
		int EXPRSTEMP1 = EXPRS;
		int ITEMSTEMP1 = ITEMS;
		Expr();
		EXPRS = EXPRSTEMP1;
		ITEMS = ITEMSTEMP1;
		EXPRTYPE = EXPRTEMP1;
		E_RPARENT();
	}
	else if (Symbol == INTCON || Symbol == PLUS || Symbol == MINU)
	{
		EXPR++;
		EXPRTYPE = INT;
		IntCON();
		sprintf(Nowitem, "%d", Num);
		Getsym();
	}
	else if (Symbol == CHARCON)
	{
		PRINT(Symbol,Token);
		sprintf(Nowitem, "%d", Token[0]);
		Getsym();
	}
	RLSymbols();
	//printf("<因子>\n"); 
}

int isRelation(){
	if(Symbol == LSS || Symbol == LEQ || Symbol == GRE || Symbol == EQL || Symbol == NEQ || Symbol == GEQ)
	return 1;
	else 
	return 0;
}

void Condition(){
	char place1[ 30 ], place2[ 30 ];
	int EXPR1;
	EXPR1 = EXPR; 
	EXPR = 0;
	Expr();
	if(EXPR == 0)
		ERROR('f',Line);
	EXPR = EXPR1;
	strcpy(place1, Nowitem);
	if(isRelation()){
		strcpy(Relop, Token);
		PRINT(Symbol,Token);
		Getsym();
		int EXPR2; 
		EXPR2 = EXPR; 
		EXPR = 0;
		Expr();
		if(EXPR == 0)
			ERROR('f',Line);
		EXPR =EXPR2;
		strcpy(place2, Nowitem);
		PrintMid(Relop, place1, place2, "  ");
		return;
	}
	strcpy(place2, "0");
	PrintMid("!=", place1, place2, "  ");
	//printf("<条件>\n");
}

void If(){
	PRINT(Symbol,Token);//if
	Getsym();
	PRINT(Symbol,Token);//(
	Getsym();
	Condition();
	E_RPARENT();
	State();
	while(Symbol == ELSETK)
	{
		PRINT(Symbol,Token);
		Getsym();
		State();
	}
	//printf("<条件语句>\n");
}

void Assign(){
	char place2[ 100 ];
	if(FIND(Token) == CINT||FIND(Token) == CCHAR)
	{
		ERROR('j',Line); 
	}
	 else if(FIND(Token) == NONE)
	{
		ERROR('c',Line);
	}
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == ASSIGN)
	{
		PRINT(Symbol,Token);
		Getsym();
		Expr();
		PrintMid("=", Nowitem, "  ", Names);
	}
	else if(Symbol == LBRACK)
	{
		PRINT(Symbol,Token);
		Getsym();
		EXPRTYPE = CHAR;
		ITEMS = 0;
		EXPRS = 0;
		Expr();
		if(EXPRTYPE != INT && ITEMS == 0 && EXPRS == 0)
			ERROR('i',Line);
		strcpy(place2, Nowitem);//存当前item
		if(Symbol == RBRACK)
		{
			PRINT(Symbol,Token);
			Getsym();
		}
		else
		{
			ERROR('m',Line);
		}
		if(Symbol == ASSIGN)
		{
			PRINT(Symbol,Token);
			Getsym();
			Expr();
			PrintMid("[]=", Nowitem, place2, Names);
		}
	}
	//printf("<赋值语句>\n");
	PRINT(Symbol,Token);
} 

void Return(){
	RETURNFLAG++;
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == SEMICN){ 
	//	printf("<返回语句>\n");
		PRINT(Symbol,Token);
		return ;
	}
	else if(Symbol == LPARENT){
		PRINT(Symbol,Token);
		if(NFUNC->Type == VFUNC)
			ERROR('g',Line);
		Getsym();
		if(isExpr()){
			EXPR = 0;
			Expr();
			if((EXPR == 0 && NFUNC->Type == CFUNC)||(EXPR != 0 && NFUNC -> Type == IFUNC)){
			}
			else
				ERROR('h',Line);
		}
		else
			if(NFUNC->Type != VFUNC)
			{
				ERROR('h',Line);
			}
		if(Symbol == RPARENT){
			PRINT(Symbol,Token);
	//		printf("<返回语句>\n");
			Getsym();
		}
		else 
			ERROR('l',Line);
	}
}

void Strcon(){
	PRINT(Symbol,Token);
	//printf("<字符串>\n"); 
}

void Printf(){
	char place1[200] = "", place2[200] = "", place3[10] = "";
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == LPARENT)
	{
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == STRCON)
		{
			Strcon();
			strcpy(place1, Token);
			Getsym();
			if(Symbol == COMMA)
			{
				PRINT(Symbol,Token);
				Getsym();
				if(isExpr())
				{
					EXPRTYPE = CHAR;
					ITEMS = 0;
					EXPRS = 0;
					Expr();
					strcpy(place2, Nowitem);
					if(EXPRTYPE != INT && ITEMS == 0 && EXPRS == 0)
						strcpy(place3, "char");
					else
						strcpy(place3, "int");
				}
			}
		}
		else if(isExpr())
		{
			EXPRTYPE = CHAR;
			ITEMS = 0;
			EXPRS = 0;
			Expr();
			strcpy(place2, Nowitem);
			if(EXPRTYPE != INT && ITEMS == 0 && EXPRS == 0)
				strcpy(place3, "char");
			else
				strcpy(place3, "int");
		}
		PrintMid("prt",place1, place2, place3);
		E_RPARENT();
	//	printf("<写语句>\n");
		PRINT(Symbol,Token);
	}
	
} 

void Scanf(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == LPARENT)
	{
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == IDENFR)
		{
			if(FIND(Token) == NONE)
				ERROR('c',Line);
			PRINT(Symbol,Token);
			if(FIND(Token) == INT)
				PrintMid("scf","int"," ",Token);
			else if(FIND(Token) == CHAR)
				PrintMid("scf","char"," ",Token);
			Getsym();
			while(Symbol == COMMA){
				PRINT(Symbol,Token);
				Getsym();
				if(FIND(Token) == INT)
					PrintMid("scf","int"," ",Token);
				else if(FIND(Token) == CHAR)
					PrintMid("scf","char"," ",Token);
				PRINT(Symbol,Token);
				Getsym();
			}
		} 
	}
	PRINT(Symbol,Token);
	//printf("<读语句>\n");
	E_RPARENT();
	PRINT(Symbol,Token);
}

void Step(){
	UIntCon(); 
	//printf("<步长>\n");
}

void Cycle(){
	if(Symbol == WHILETK){
		PRINT(Symbol,Token);//while
		Getsym();
		PRINT(Symbol,Token);//(
		Getsym();
		Condition();//条件 
		E_RPARENT();
		State();//语句
	}
	else if(Symbol == DOTK){
		PRINT(Symbol,Token);//do 
		Getsym();
		State();//语句 
		PRINT(Symbol,Token);//while 
		if(Symbol == WHILETK){
			Getsym();
		}
		else {
			ERROR('n',Line);
		}	
		PRINT(Symbol,Token);//( 
		Getsym();
		Condition();//条件
		E_RPARENT();
	}
	else if(Symbol == FORTK){
		PRINT(Symbol,Token);//for 
		Getsym();
		PRINT(Symbol,Token);//(
		Getsym();
		PRINT(Symbol,Token);//标识符 
		if(FIND(Token) == CINT || FIND(Token) == CCHAR)
			ERROR('j',Line);
		else if(FIND(Token) == NONE)
			ERROR('c',Line);
		Getsym();
		PRINT(Symbol,Token);// =
		Getsym();
		Expr();//表达式
		PRINT(Symbol,Token);
		E_SEMICN();//;
		Condition();//条件
		PRINT(Symbol,Token);
		E_SEMICN();//;
		PRINT(Symbol,Token);//标识符
		if(FIND(Token) == CINT || FIND(Token) == CCHAR)
			ERROR('j',Line);
		else if(FIND(Token) == NONE)
			ERROR('c',SLINE);
		Getsym();
		PRINT(Symbol,Token);//= 
		Getsym();
		PRINT(Symbol,Token);//标识符 
		if(FIND(Token) == NONE){
			ERROR('c',Line);
		}
			Getsym();
		PRINT(Symbol,Token);//+/-
		Getsym();
		Step();//步长 
		Getsym();
		E_RPARENT();
		State();//语句
	}
	//printf("<循环语句>\n");
}

void State(){
	if(Symbol == IDENFR){
		strcpy(Names,Token);
		if(FIND(Token) == IFUNC || FIND(Token) == CFUNC)
		{
			ADDSymbols();//gets
			Getsym();
			ADDSymbols();//(
			Func();
			Getsym(); 
			PRINT(Symbol,Token);
		}
		else if(FIND(Token) == VFUNC)
		{
			ADDSymbols();
			Getsym();
			ADDSymbols();
			VFunc();
			Getsym();
			PRINT(Symbol,Token);
		}
		else
			Assign();
		E_SEMICN();
	}
	else if(Symbol == IFTK){
		If();
	}
	else if(Symbol == RETURNTK){
		Return();
		E_SEMICN();
	}
	else if(Symbol == PRINTFTK){
		Printf();
		E_SEMICN();
	}
	else if(Symbol == SCANFTK){
		Scanf();
		E_SEMICN();
	} 
	else if(Symbol == WHILETK || Symbol == DOTK || Symbol == FORTK){
		Cycle();
	}
	else if(Symbol == LBRACE){//语句列
		PRINT(Symbol,Token);
		Getsym();
		StateS();
		PRINT(Symbol,Token);
		Getsym();
	}
	else if(Symbol == SEMICN){
		PRINT(Symbol,Token);
		Getsym();
	}
	//printf("<语句>\n");
}

int isState(){
	if(Symbol == CONSTTK || Symbol == IDENFR || Symbol == IFTK || Symbol == RETURNTK || Symbol == PRINTFTK || Symbol == WHILETK || Symbol == DOTK || Symbol == FORTK || Symbol == LBRACE || Symbol == LBRACE || Symbol == SEMICN || Symbol == SCANFTK)
		return 1;
	else
		return 0; 
}

void StateS(){
	while(isState()){
		State();
	}
	//printf("<语句列>\n");
}

void Complex(){
	while(Symbol == INTTK || Symbol == CHARTK || Symbol == CONSTTK){
		if(Symbol == CONSTTK){
			ConstTKS();//常量说明 
		}
		else if(Symbol == INTTK || Symbol == CHARTK){
			VarTKS();//变量说明 
		}
	}
	StateS();
	//printf("<复合语句>\n");
	PRINT(Symbol,Token);
}

void PTable(){
	Getsym();
	struct para *NPARA,*p,*q;
	NPARA =(struct para*)malloc(sizeof(struct para));
	p = NPARA; 
	if (Symbol == INTTK || Symbol == CHARTK){
	while(Symbol == INTTK || Symbol == CHARTK){//int
		NFUNC->paras++;
		q =(struct para*)malloc(sizeof(struct para));
		q->next = NULL;
		if(Symbol == INTTK){
			SID_TYPE(INT);
			q->Type = INT;
		}
		else if(Symbol == CHARTK){
			SID_TYPE(CHAR);
			q->Type = CHAR;
		}
		ADDSymbols();
		Getsym();
		if(Symbol == IDENFR)//a
		{
			SID_NAME();
			ADDTable();
			if(SID.Type == INT)
				PrintMid("para","int","  ",SID.Name);
			else if(SID.Type == CHAR)
				PrintMid("para","char","  ",SID.Name);
			p -> next = q;
			p = p -> next;
			ADDSymbols();
			Getsym();
			if(Symbol == COMMA)//,
			{
				ADDSymbols();
				Getsym();
			}
		}
	}
	NFUNC -> Para = NPARA -> next;
	}
	RLSymbols();
	//printf("<参数表>\n");
	E_RPARENT();
	PRINT(Symbol,Token);
	Getsym();
}

void FuncTK(){
	RETURNFLAG = 0;
	if(Symbol == LPARENT){
		if(SID.Type == INT)
			SID_TYPE(IFUNC);
		else if(SID.Type == CHAR)
			SID_TYPE(CFUNC);
		ADDTable();
		HeadTK();
		PTable();
		Complex();
	//	printf("<有返回值函数定义>\n");
		if(RETURNFLAG == 0)
			ERROR('h',Line);
		POPTable();
	}
} 

void Void(){
	PRINT(Symbol,Token);//VOID
	Getsym();
	ADDSymbols();
	if(Symbol == MAINTK)//main
		return;
	else if(Symbol == IDENFR)//get
		SID_NAME();
	SID_TYPE(VFUNC);
	ADDTable();
	RLSymbols();
	Getsym();
	PRINT(Symbol,Token);//(
	PTable();
	Complex();
	//printf("<无返回值函数定义>\n");
}

void FuncORVar(){
	if(Symbol == INTTK || Symbol == CHARTK){
		VarTKS();
		FuncTK();
	}
	if(Symbol == VOIDTK){
		Void();
	}
	Getsym();
}

void Main(){
	PrintMid("func","void","main","()");
	RLSymbols();//void main
	PRINT(Symbol,Token);//(
	Getsym();//)
	E_RPARENT();
	Getsym();
	PRINT(Symbol,Token);
	Complex(); 
	PrintMid("end","  ","  ","main");
	//printf("<主函数>\n");
}

void Program(){
	Getsym();
	if(Symbol == CONSTTK){
		ConstTKS();
	}
	while(Symbol == INTTK || Symbol == CHARTK || Symbol == VOIDTK){
		FuncORVar();
	}
	Main();
	//printf("<程序>\n"); 
}

void Mid2Mips(){
	int FLine;
	printf(".data\n");
	printf("huiche:.asciiz \"\\n\"\n");
	Code = DATA;
	for(FLine = 0;FLine < FOURcnt;FLine++)
	{
		if(strcmp(FOUR[FLine].op, "const") == 0){
			if(Code != DATA)
				printf(".data\n");
			if(strcmp(FOUR[FLine].var1, "int") == 0)
				printf("%s: .word %d\n",FOUR[FLine].var3,atoi(FOUR[FLine].var2));
			else if(strcmp(FOUR[FLine].var1, "char") == 0)
				printf("%s: .word %d\n",FOUR[FLine].var3,FOUR[FLine].var2[0]);
			ADDMIPS(FOUR[FLine].var3);
			Code = DATA;
		}
		else if(strcmp(FOUR[FLine].op, "var") == 0 || strcmp(FOUR[FLine].op, "para") == 0){
			if(Code != DATA)
				printf(".data\n");
			if(strcmp(FOUR[FLine].var1, "int") == 0)
				printf("%s: .word 0\n",FOUR[FLine].var3);
			else if(strcmp(FOUR[FLine].var1, "char") == 0)
				printf("%s: .word 0\n",FOUR[FLine].var3);
			else if(strcmp(FOUR[FLine].var1, "array") == 0)
				printf("%s: .array %d\n",FOUR[FLine].var3,atoi(FOUR[FLine].var2)*4);
			ADDMIPS(FOUR[FLine].var3);
			Code = DATA;
		}
		else if(strcmp(FOUR[FLine].op, "scf") == 0){
			if(Code != TEXT)
				printf(".text\n");
			if(strcmp(FOUR[FLine].var1, "int") == 0){
				printf("li $v0,5\n");
				printf("syscall\n");
				printf("sw $v0,%s\n",FOUR[FLine].var3);
			}
			else if(strcmp(FOUR[FLine].var1, "char") == 0){
				printf("li $v0,12\n");
				printf("syscall\n");
				printf("sw $v0,%s\n",FOUR[FLine].var3);
			}
			Code = TEXT;
		}
		else if(strcmp(FOUR[FLine].op, "prt") == 0){
			if(Code != TEXT)
				printf(".text\n");
			for(int i = 0; i < strlen(FOUR[FLine].var1);i++){
				printf("li $a0,%d\n",FOUR[FLine].var1[i]);
				printf("li $v0,11\n");
				printf("syscall\n");
			}
			if(strcmp(FOUR[FLine].var3, "int") == 0){
				if(FINDMIPS(FOUR[FLine].var2) > 0)
					printf("lw $a0,%s\n",FOUR[FLine].var2);
				else
					printf("lw $a0,%s\n",FOUR[FLine].var2);
				printf("li $v0,1\n");
				printf("syscall\n");

			}
			else if(strcmp(FOUR[FLine].var3, "char") == 0){
				if(FINDMIPS(FOUR[FLine].var2) > 0)
					printf("lw $a0,%s\n",FOUR[FLine].var2);
				else if(isdigit(FOUR[FLine].var2[0]))
					printf("li $a0,%s\n",FOUR[FLine].var2);
				else
					printf("lw $a0,%s\n",FOUR[FLine].var2);
				printf("li $v0,11\n");
				printf("syscall\n");
			}
			printf("li $t0,0\n");
			printf("la $a0,huiche\n");
			printf("li $v0,4\n");
			printf("syscall\n");
			Code = TEXT;
		}
		else if(FOUR[FLine].op[0] == '+'||FOUR[FLine].op[0] == '-'||FOUR[FLine].op[0] == '*'||FOUR[FLine].op[0] == '/'||FOUR[FLine].op[0] == '='){
			if(Code != TEXT)
				printf(".text\n");
			if(isdigit(FOUR[FLine].var1[0])||(FOUR[FLine].var1[0] == '+') || (FOUR[FLine].var1[0] == '-')){
				printf("li $t0,%s\n",FOUR[FLine].var1);
			}
			else {
				printf("lw $t0,%s\n",FOUR[FLine].var1);
			}
			if(FOUR[FLine].op[0] == '+'||FOUR[FLine].op[0] == '-'||FOUR[FLine].op[0] == '*'||FOUR[FLine].op[0] == '/'){
				if(isdigit(FOUR[FLine].var2[0])||(FOUR[FLine].var2[0] == '+') || (FOUR[FLine].var2[0] == '-')){
					printf("li $t1,%s\n",FOUR[FLine].var2);
				}
				else {
					printf("lw $t1,%s\n",FOUR[FLine].var2);
				}
			}
			if(FOUR[FLine].op[0] == '+')
				printf("add $t0,$t0,$t1\n");
			else if(FOUR[FLine].op[0] == '-')
				printf("sub $t0,$t0,$t1\n");
			else if(FOUR[FLine].op[0] == '*')
				printf("mul $t0,$t0,$t1\n");
			else if(FOUR[FLine].op[0] == '/')
				printf("div $t0,$t0,$t1\n");
			if(FINDMIPS(FOUR[FLine].var3) <0){
				printf(".data\n");
				printf("%s: .word 0\n",FOUR[FLine].var3);
				printf(".text\n");
			}
			printf("sw $t0,%s\n",FOUR[FLine].var3);
			Code = TEXT;
		}
		else if(strcmp(FOUR[FLine].op,"[]=") == 0){
			if(Code != TEXT)
				printf(".text\n");
			if(isdigit(FOUR[FLine].var1[0])||(FOUR[FLine].var1[0] == '+') || (FOUR[FLine].var1[0] == '-')){
				printf("li $t0,%s\n",FOUR[FLine].var1);
			}
			else {
				printf("lw $t0,%s\n",FOUR[FLine].var1);
			}
			if(isdigit(FOUR[FLine].var2[0])||(FOUR[FLine].var2[0] == '+') || (FOUR[FLine].var2[0] == '-')){
				printf("li $t1,%s\n",FOUR[FLine].var2);
			}
			else {
				printf("lw $t1,%s\n",FOUR[FLine].var2);
			}
			printf("mul $t1,$t1,4\n");
			printf("sw $t0,%s($t1)\n",FOUR[FLine].var3);
			Code = TEXT;
		}
		else if(strcmp(FOUR[FLine].op,"[]") == 0){
			if(Code != TEXT)
				printf(".text\n");
			if(isdigit(FOUR[FLine].var2[0])||(FOUR[FLine].var2[0] == '+') || (FOUR[FLine].var2[0] == '-')){
				printf("li $t0,%s\n",FOUR[FLine].var2);
			}
			else {
				printf("lw $t0,%s\n",FOUR[FLine].var2);
			}
			printf("mul $t0,$t0,4\n");
			printf("lw $t1,%s($t0)\n",FOUR[FLine].var1);
			if(FINDMIPS(FOUR[FLine].var3) <0){
				printf(".data\n");
				printf("%s: .word 0\n",FOUR[FLine].var3);
				printf(".text\n");
			}
			printf("sw $t1,%s\n",FOUR[FLine].var3);
			Code = TEXT;
		}
	}
	
}

int main()
{
	freopen("testfile.txt","r",stdin);
	freopen("mips.txt","w",stdout);
	Line = 1;
	Sign = 1;
	Program();
	Mid2Mips();
	return 0;	
} 