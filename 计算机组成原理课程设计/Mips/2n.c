#include<stdio.h>
int temp[8][8];
int result[8][8];
int m,n;

void sqrt()
{
	int i,j,k;
	for(i = 0;i < m;i++)
		for(j = 0;j < m;j++)
		{
			result[i][j] = 0;
			for(k = 0;k < m;k++)
			{
				result[i][j] += temp[i][k] * temp[k][j]; 
			}
	}
 }
void replace()
{
	int i,j;
	for(i = 0;i < m;i++)
		for(j = 0;j < m;j++)
			temp[i][j] = result[i][j];
}
void power()
{
	int i;
	for(i = 0;i < n;i++)
	{
		sqrt();
		replace();
	}
}
int main()
{
	int i,j;
	scanf("%d",&m);
	scanf("%d",&n);
	for(i = 0;i < m;i++)
		for(j = 0;j < m;j++)
			scanf("%d",&temp[i][j]);
	power();
	for(i = 0;i < m;i++)
	{
		for(j = 0;j < m;j++)
			printf("%d ",result[i][j]);
		printf("\n");
	}
}
