#define _CRT_SECURE_NO_DEPRECATE
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
char Char;
char Token[10000];
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

enum symbol Symbol;

void error()
{
	//printf("error");
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

int main()
{
	freopen("testfile.txt","r",stdin);
	freopen("output.txt","w",stdout);
	while(Getsym()!=0)
	{
		switch(Symbol) {
			case IDENFR: printf("IDENFR %s",Token);
			break;
			case INTCON: printf("INTCON %s",Token);
			break;
			case CHARCON: printf("CHARCON %s",Token);
			break;
			case STRCON: printf("STRCON %s",Token);
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
} 

