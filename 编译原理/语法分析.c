#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
char Char;
char Token[10000];
char SIdenfr[10000];
int TokenLen;
int Num;
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
	CChar,
	FUNC,
	VFUNC,
	NONE 
}; 

struct node{
	enum symbol Symbol;
	char Token[10000];
}; 

struct iden{
	char Name[10000];
	enum type Type;
};

enum symbol Symbol;
struct node Symbols[10000];
struct iden Idenfrs[10000];

int SymbolsLen,IdenfrsLen;
int VAR;

void Factor();
void State();
void StateS();

void SAVEIDENFR(){
	strcpy(SIdenfr,Token);
}

void ADDIdenfrs(enum type TYPE){
	Idenfrs[IdenfrsLen].Type=TYPE;
	strcpy(Idenfrs[IdenfrsLen++].Name,SIdenfr);
}

enum type FINDIdendrs(char name[]){
	int i;
	for(i = 0;i < IdenfrsLen;i++){
		if(strcmp(Idenfrs[i].Name,name) == 0)
			return Idenfrs[i].Type;
	}
	return NONE;
}

void error()
{
	printf("error\n");
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
	CleanToken();
	Symbol = OTHER;
	Getchar();
	if(Char == -1)
		return 0;
	while(isspace(Char))
		Getchar();
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
		//Num = atoi(Token);
		Symbol = INTCON;
	}
	else if(issqm())//'
	{
		Getchar();
		CatToken();
		Getchar();
		if(issqm())
			Symbol = CHARCON;
	}
	else if(isdqm())//"
	{
		do{
			Getchar();
			CatToken();
		}while(!isdqm());
		Token[--TokenLen] = '\0';
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
	else 
		return 	OTHER;
	return Symbol;
}

void PRINT(enum symbol SYMBOL,char TOKEN[]){
	switch(SYMBOL) {
			case IDENFR: printf("IDENFR %s",TOKEN);
			break;
			case INTCON: printf("INTCON %s",TOKEN);
			break;
			case CHARCON: printf("CHARCON %s",TOKEN);
			break;
			case STRCON: printf("STRCON %s",TOKEN);
			break;
			case CONSTTK: printf("CONSTTK const");
			break;
			case INTTK: printf("INTTK int");
			break;
			case CHARTK: printf("CHARTK char");
			break;
			case VOIDTK: printf("VOIDTK void");
			break;
			case MAINTK: printf("MAINTK main");
			break;
			case IFTK: printf("IFTK if");
			break;
			case ELSETK: printf("ELSETK else");
			break;
			case DOTK: printf("DOTK do");
			break;
			case WHILETK: printf("WHILETK while");
			break;
			case FORTK: printf("FORTK for");
			break;
			case SCANFTK: printf("SCANFTK scanf");
			break;
			case PRINTFTK: printf("PRINTFTK printf");
			break;
			case RETURNTK: printf("RETURNTK return");
			break;
			case PLUS: printf("PLUS +");
			break;
			case MINU: printf("MINU -");
			break;
			case MULT: printf("MULT *");
			break;
			case DIV: printf("DIV /");
			break;
			case LSS: printf("LSS <");
			break;
			case LEQ: printf("LEQ <=");
			break;
			case GRE: printf("GRE >");
			break;
			case GEQ: printf("GEQ >=");
			break;
			case EQL: printf("EQL ==");
			break;
			case NEQ: printf("NEQ !=");
			break;
			case ASSIGN: printf("ASSIGN =");
			break;
			case SEMICN: printf("SEMICN ;");
			break;
			case COMMA: printf("COMMA ,");
			break;
			case LPARENT: printf("LPARENT (");
			break;
			case RPARENT: printf("RPARENT )");
			break;
			case LBRACK: printf("LBRACK [");
			break;
			case RBRACK: printf("RBRACK ]");
			break;
			case LBRACE: printf("LBRACE {");
			break;
			case RBRACE: printf("RBRACE }");
			break;
			case OTHER:
			break;
		}
		printf("\n");
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
			printf("<无符号整数>\n");
		}
		else
			error();
	}
}

void IntCON(){
	if(Symbol == PLUS || Symbol == MINU){
		PRINT(Symbol,Token);
		Getsym();
		UIntCon();
	}
	else{
		UIntCon();
	}
	printf("<整数>\n");
}

void IntTK(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == IDENFR){
		SAVEIDENFR();
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == SEMICN)
			return ;
		if(Symbol == COMMA)
			return ;
		if(Symbol == ASSIGN){
			PRINT(Symbol,Token);
			Getsym();
			if(Symbol == INTCON || Symbol == PLUS || Symbol == MINU)
			{
				IntCON();
			}
		}
	}
}

void CharCON(){

}

void CharTK(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == IDENFR){
		SAVEIDENFR();
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == SEMICN)
			return ;
		if(Symbol == COMMA)
			return ;
		if(Symbol == ASSIGN){
			PRINT(Symbol,Token);
			Getsym();
			if(Symbol == CHARCON)
			{
				PRINT(Symbol,Token);
				CharCON();
			}
		}
	}
}

void ConstTK(){
	PRINT(Symbol,Token);
	Getsym(); 
	if(Symbol == INTTK){
			IntTK();
			Getsym();
		while(Symbol == COMMA){
			IntTK();
			Getsym(); 
	}
	}
	else if(Symbol == CHARTK){ 
			CharTK();
			Getsym();
		while(Symbol == COMMA){
			CharTK();
			Getsym(); 
	}
	}
}

void ConstTKS(){
	while(Symbol == CONSTTK){
		ConstTK();
		printf("<常量定义>\n");
		PRINT(Symbol,Token);
		Getsym();
	}
	printf("<常量说明>\n");
}

void VarTK(){
	while(Symbol == INTTK || Symbol == CHARTK){
		ADDSymbols();
		Getsym();
		while(Symbol == IDENFR){
			SAVEIDENFR();
			ADDSymbols();
			Getsym();
			if(Symbol == LBRACK)
			{
				ADDSymbols();
				Getsym();
				RLSymbols();
				UIntCon();
				Getsym();
				ADDSymbols();
				Getsym();
			}
			else if(Symbol == LPARENT)
				return ;
			if(Symbol == COMMA || Symbol == SEMICN)
			{
				RLSymbols();
				VAR = 1;
				if(Symbol == SEMICN){
					printf("<变量定义>\n");
					PRINT(Symbol,Token);
					Getsym();
					break;
				}
				PRINT(Symbol,Token);
				Getsym();
			}
		}
	}
}

void  VarTKS(){
	VarTK();
	if(VAR == 1)
		printf("<变量说明>\n");
	VAR = 0;
}

void HeadTK(){
	RLSymbols();
	printf("<声明头部>\n");
	PRINT(Symbol,Token);
}

void Item(){
	do{
		if(Symbol == MULT || Symbol == DIV){
			PRINT(Symbol,Token);
			Getsym();
		}
		Factor();
	}while(Symbol == MULT || Symbol == DIV);
	printf("<项>\n");
}
int isExpr(){
	if(Symbol == PLUS || Symbol == MINU || Symbol == IDENFR || Symbol == LPARENT|| Symbol == INTCON || Symbol == CHARCON)
		return 1;
	else
		return 0;
} 

void Expr(){
	do{
		if(Symbol == PLUS || Symbol == MINU){
			PRINT(Symbol,Token);
			Getsym();
		}
		Item();
	}while(Symbol == PLUS || Symbol == MINU);
	printf("<表达式>\n"); 
}

void VPTable(){
	while(isExpr()){
		Expr();
		if(Symbol == COMMA)
			PRINT(Symbol,Token);
		else if(Symbol == RPARENT)
			break;
		Getsym();
	}
	printf("<值参数表>\n");
}

void Func(){
	RLSymbols();
	Getsym(); 
	VPTable();
	PRINT(Symbol,Token);
	printf("<有返回值函数调用语句>\n");
}

void VFunc(){
	RLSymbols();
	Getsym(); 
	VPTable();
	PRINT(Symbol,Token);
	printf("<无返回值函数调用语句>\n");
}

void Factor(){
	if(Symbol == IDENFR){
		ADDSymbols();
		Getsym();
		if(Symbol == LBRACK){
			ADDSymbols();
			RLSymbols();
			Getsym();
			Expr();
			if(Symbol == RBRACK){
				PRINT(Symbol,Token);
				Getsym();
			}
		}
		else if(Symbol == LPARENT){
			ADDSymbols();
			Func();
			Getsym(); 
		}
	}
	else if(Symbol == LPARENT){
		PRINT(Symbol,Token);
		Getsym();
		Expr();
		if(Symbol == RPARENT){
			PRINT(Symbol,Token);
			Getsym();
		} 
	}
	else if (Symbol == INTCON || Symbol == PLUS || Symbol == MINU)
	{
		IntCON();
		Getsym();
	}
	else
	{
		PRINT(Symbol,Token);
		Getsym();
	}
	RLSymbols();
	printf("<因子>\n"); 
}

int isRelation(){
	if(Symbol == LSS || Symbol == LEQ || Symbol == GRE || Symbol == EQL || Symbol == NEQ || Symbol == GEQ)
	return 1;
	else 
	return 0;
}

void Condition(){
	Expr();
	if(isRelation()){
		PRINT(Symbol,Token);
		Getsym();
		Expr();
	
	}
	printf("<条件>\n");
	if(Symbol == RPARENT)
		PRINT(Symbol,Token); 
}

void If(){
	PRINT(Symbol,Token);
	Getsym();
	PRINT(Symbol,Token);
	Getsym();
	Condition();
	Getsym();
	State();
	while(Symbol == ELSETK)
	{
		PRINT(Symbol,Token);
		Getsym();
		State();
	}
	printf("<条件语句>\n");
}

void Assign(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == ASSIGN)
	{
		PRINT(Symbol,Token);
		Getsym();
		Expr();
	}
	else if(Symbol == LBRACK)
	{
		PRINT(Symbol,Token);
		Getsym();
		Expr();
		if(Symbol == RBRACK)
		{
			PRINT(Symbol,Token);
			Getsym();
			if(Symbol == ASSIGN)
			{
				PRINT(Symbol,Token);
				Getsym();
				Expr();
			}
		}
	}
	printf("<赋值语句>\n");
	PRINT(Symbol,Token);
} 

void Return(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == SEMICN){ 
		printf("<返回语句>\n");
		PRINT(Symbol,Token);
		return ;
	}
	PRINT(Symbol,Token);
	while(Symbol == LPARENT){
		Getsym();
		if(isExpr()){
			Expr();	
		}
		if(Symbol == RPARENT){
			PRINT(Symbol,Token);
			printf("<返回语句>\n");
		}
		Getsym();
		PRINT(Symbol,Token);
	}
}

void Strcon(){
	PRINT(Symbol,Token);
	printf("<字符串>\n"); 
}

void Printf(){
	PRINT(Symbol,Token);
	Getsym();
	if(Symbol == LPARENT)
	{
		PRINT(Symbol,Token);
		Getsym();
		if(Symbol == STRCON)
		{
			Strcon();
			Getsym();
			if(Symbol == COMMA)
			{
				PRINT(Symbol,Token);
				Getsym();
				if(isExpr())
				{
					Expr();
				}
			}
		}
		else if(isExpr())
		{
			Expr();
		}
		PRINT(Symbol,Token);
		printf("<写语句>\n");
		Getsym();
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
			PRINT(Symbol,Token);
			Getsym();
			while(Symbol == COMMA){
				PRINT(Symbol,Token);
				Getsym();
				PRINT(Symbol,Token);
				Getsym();
			}
		} 
	}
	PRINT(Symbol,Token);
	printf("<读语句>\n");
	Getsym();
	PRINT(Symbol,Token);
}

void Step(){
	UIntCon(); 
	printf("<步长>\n");
}

void Cycle(){
	if(Symbol == WHILETK){
		PRINT(Symbol,Token);//while
		Getsym();
		PRINT(Symbol,Token);//(
		Getsym();
		Condition();//条件 
		Getsym();
		State();//语句
	}
	else if(Symbol == DOTK){
		PRINT(Symbol,Token);//do 
		Getsym();
		State();//语句 
		PRINT(Symbol,Token);//while 
		Getsym();
		PRINT(Symbol,Token);//( 
		Getsym();
		Condition();//条件
		Getsym();
	}
	else if(Symbol == FORTK){
		PRINT(Symbol,Token);//for 
		Getsym();
		PRINT(Symbol,Token);//(
		Getsym();
		PRINT(Symbol,Token);//标识符 
		Getsym();
		PRINT(Symbol,Token);// =
		Getsym();
		Expr();//表达式 
		PRINT(Symbol,Token);//;
		Getsym();
		Condition();//条件
		PRINT(Symbol,Token);//;
		Getsym();
		PRINT(Symbol,Token);//标识符
		Getsym();
		PRINT(Symbol,Token);//= 
		Getsym();
		PRINT(Symbol,Token);//标识符 
		Getsym();
		PRINT(Symbol,Token);//+/-
		Getsym();
		Step();//步长 
		Getsym();
		PRINT(Symbol,Token);//) 
		Getsym();
		State();//语句
	}
	printf("<循环语句>\n");
}

void State(){
	if(Symbol == IDENFR){
		if(FINDIdendrs(Token) == FUNC)
		{
			ADDSymbols();
			Getsym();
			ADDSymbols();
			Func();
			Getsym();
			PRINT(Symbol,Token);
		}
		else if(FINDIdendrs(Token) == VFUNC)
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
		Getsym();
	}
	else if(Symbol == IFTK){
		If();
	}
	else if(Symbol == RETURNTK){
		Return();
		Getsym();
	}
	else if(Symbol == PRINTFTK){
		Printf();
		Getsym();
	}
	else if(Symbol == SCANFTK){
		Scanf();
		Getsym();
	} 
	else if(Symbol == WHILETK || Symbol == DOTK || Symbol == FORTK){
		Cycle();
	}
	else if(Symbol == LBRACE)
	{
		PRINT(Symbol,Token);
		Getsym();
		StateS();
		PRINT(Symbol,Token);
		Getsym();
	}
	else if(Symbol == SEMICN)
	{
		PRINT(Symbol,Token);
		Getsym();
	}
	printf("<语句>\n");
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
	printf("<语句列>\n");
}

void Complex(){
	Getsym();
	while(Symbol == INTTK || Symbol == CHARTK || Symbol == CONSTTK){
		if(Symbol == CONSTTK){
			ConstTKS();//常量说明 
		}
		else if(Symbol == INTTK || Symbol == CHARTK){
			VarTKS();//变量说明 
		}
	}
	StateS();
	printf("<复合语句>\n");
	PRINT(Symbol,Token);
}

void PTable(){
	Getsym();
	while(Symbol == INTTK || Symbol == CHARTK){
		ADDSymbols();
		Getsym();
		if(Symbol == IDENFR)
		{
			ADDSymbols();
			Getsym();
			if(Symbol == COMMA)
			{
				ADDSymbols();
				Getsym();
			}
		}
	}
	RLSymbols();
	printf("<参数表>\n");
	PRINT(Symbol,Token);
	Getsym();
	PRINT(Symbol,Token);
}

void FuncTK(){
	if(Symbol == LPARENT){
		ADDIdenfrs(FUNC);
		HeadTK();
		PTable();
		Complex();
		printf("<有返回值函数定义>\n");
	}
} 

void Void(){
	PRINT(Symbol,Token);
	Getsym();
	ADDSymbols();
	if(Symbol == MAINTK)
		return;
	SAVEIDENFR();
	ADDIdenfrs(VFUNC);
	Getsym();
	RLSymbols();
	PRINT(Symbol,Token);
	PTable();
	Complex();
	printf("<无返回值函数定义>\n");
}

void FuncORVar(){
	if(Symbol == INTTK || Symbol == CHARTK)
	{
		VarTKS();
		FuncTK();
	}
	if(Symbol == VOIDTK)
	{
		Void();
	}
	Getsym();
}

void Main(){
	RLSymbols();
	PRINT(Symbol,Token);
	Getsym();
	PRINT(Symbol,Token);
	Getsym();
	PRINT(Symbol,Token);
	Complex(); 
	printf("<主函数>\n");
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
	printf("<程序>\n"); 
}

int main()
{
	freopen("testfile.txt","r",stdin);
	freopen("output.txt","w",stdout);
	Program();
	return 0;	
} 

